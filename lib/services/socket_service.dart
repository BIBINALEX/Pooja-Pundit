import 'dart:async';
import 'package:pooja_pundit/services/api/backend_models.dart';
import 'package:pooja_pundit/services/api/endpoints.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

enum PanditStatus { offline, online, busy }

class PanditJoinResult {
  const PanditJoinResult({required this.status, required this.activeBookings});

  final PanditStatus status;
  final List<PoojaRequest> activeBookings;
}

class BookingOfferClosed {
  const BookingOfferClosed({required this.bookingId, this.reason});

  final int bookingId;
  final String? reason;
}

class SocketService {
  SocketService();

  io.Socket? _socket;
  final _statusController = StreamController<String>.broadcast();
  final _bookingController = StreamController<PoojaRequest>.broadcast();
  final _connectionController = StreamController<bool>.broadcast();
  final _panditStatusController = StreamController<PanditStatus>.broadcast();
  final _bookingOfferClosedController =
      StreamController<BookingOfferClosed>.broadcast();
  bool _isConnected = false;
  Completer<void>? _connectionCompleter;
  String? _lastActionError;
  String? _token;

  Stream<String> get onStatusChanged => _statusController.stream;
  Stream<PoojaRequest> get onBookingReceived => _bookingController.stream;
  Stream<bool> get onConnectionChanged => _connectionController.stream;
  Stream<PanditStatus> get onPanditStatusChanged =>
      _panditStatusController.stream;
  Stream<BookingOfferClosed> get onBookingOfferClosed =>
      _bookingOfferClosedController.stream;

  bool get isConnected => _isConnected;
  String? get lastActionError => _lastActionError;

  Future<void> connect({String? url, String? token}) {
    final socketUrl = url ?? Endpoints.socketUrl;
    _token = token;

    if (_isConnected && _socket != null) {
      return Future.value();
    }

    _connectionCompleter = Completer<void>();
    _socket = io.io(socketUrl, <String, dynamic>{
      'transports': ['websocket', 'polling'],
      'autoConnect': false,
      'forceNew': true,
      'reconnection': true,
      'reconnectionAttempts': double.infinity,
      'reconnectionDelay': 1000,
      'reconnectionDelayMax': 10000,
      if (_token != null) 'auth': {'token': _token},
    });
    _socket!.onConnect((_) {
      _isConnected = true;
      _connectionController.add(true);
      _statusController.add('Socket connected');
      if (!(_connectionCompleter?.isCompleted ?? true)) {
        _connectionCompleter!.complete();
      }
    });

    _socket!.onConnectError((data) {
      _isConnected = false;
      _connectionController.add(false);
      _statusController.add('Socket unavailable: $data');
    });

    _socket!.onDisconnect((_) {
      _isConnected = false;
      _connectionController.add(false);
      _statusController.add('Socket disconnected');
    });

    _socket!.on('pandit:status', (data) {
      if (data is Map) {
        _panditStatusController.add(
          _parseStatus(Map<String, dynamic>.from(data)),
        );
      }
    });

    _socket!.on('booking:request', (data) {
      if (data is Map) {
        final payload = Map<String, dynamic>.from(data);
        final booking = payload['booking'];
        if (booking is Map) {
          _bookingController.add(
            PoojaRequest.fromJson(Map<String, dynamic>.from(booking)),
          );
        }
      }
    });

    _socket!.on('booking:offer-closed', (data) {
      if (data is! Map) return;
      final payload = Map<String, dynamic>.from(data);
      final bookingId = int.tryParse(payload['bookingId']?.toString() ?? '');
      if (bookingId == null) return;
      _bookingOfferClosedController.add(
        BookingOfferClosed(
          bookingId: bookingId,
          reason: payload['reason']?.toString(),
        ),
      );
    });

    _socket!.connect();
    return _connectionCompleter!.future.timeout(const Duration(seconds: 10));
  }

  Future<PanditJoinResult?> joinPandit() async {
    if (!_isConnected || _socket == null) return null;
    final result = await _emitWithAck('pandit:join');
    _lastActionError = result is Map ? result['error']?.toString() : null;
    if (result is! Map || result['ok'] != true) return null;

    final pandit = result['pandit'];
    final panditData = pandit is Map
        ? Map<String, dynamic>.from(pandit)
        : <String, dynamic>{};
    final activeBookings = result['activeBookings'];
    return PanditJoinResult(
      status: _parseStatus(panditData),
      activeBookings: activeBookings is List
          ? activeBookings
                .whereType<Map>()
                .map(
                  (booking) =>
                      PoojaRequest.fromJson(Map<String, dynamic>.from(booking)),
                )
                .toList()
          : const [],
    );
  }

  PanditStatus _parseStatus(Map<String, dynamic> data) {
    final rawStatus = data['status'];
    switch (rawStatus?.toString().trim().toUpperCase()) {
      case 'ONLINE':
        return PanditStatus.online;
      case 'BUSY':
        return PanditStatus.busy;
      case 'OFFLINE':
        return PanditStatus.offline;
      default:
        if (data['isBusy'] == true) return PanditStatus.busy;
        if (data['isOnline'] == true) return PanditStatus.online;
        return PanditStatus.offline;
    }
  }

  Future<bool> leavePandit() async {
    if (!_isConnected || _socket == null) return false;
    final result = await _emitWithAck('pandit:leave');
    _lastActionError = result is Map ? result['error']?.toString() : null;
    return result is Map && result['ok'] == true;
  }

  Future<dynamic> _emitWithAck(
    String event, {
    Map<String, dynamic> data = const {},
  }) {
    final completer = Completer<dynamic>();
    _socket!.emitWithAck(
      event,
      data,
      ack: (error, [data]) {
        if (!completer.isCompleted) {
          completer.complete(data ?? error);
        }
      },
    );
    return completer.future.timeout(
      const Duration(seconds: 2),
      onTimeout: () => {'ok': false, 'error': 'Request timed out'},
    );
  }

  Future<PoojaRequest?> acceptBooking(int bookingId) async {
    if (!_isConnected || _socket == null) return null;

    final result = await _emitWithAck(
      'booking:accept',
      data: {'bookingId': bookingId},
    );
    _lastActionError = result is Map
        ? result['error']?.toString()
        : 'Unable to accept booking';

    final booking = result is Map ? result['booking'] : null;
    if (result is Map && result['ok'] == true && booking is Map) {
      _lastActionError = null;
      return PoojaRequest.fromJson(Map<String, dynamic>.from(booking));
    }
    return null;
  }

  Future<PoojaRequest?> completeBooking(int bookingId) async {
    if (!_isConnected || _socket == null) return null;

    final result = await _emitWithAck(
      'booking:complete',
      data: {'bookingId': bookingId},
    );
    _lastActionError = result is Map
        ? result['error']?.toString()
        : 'Unable to complete booking';

    final booking = result is Map ? result['booking'] : null;
    if (result is Map && result['ok'] == true && booking is Map) {
      _lastActionError = null;
      return PoojaRequest.fromJson(Map<String, dynamic>.from(booking));
    }
    return null;
  }

  Future<bool> rejectBooking(int bookingId) async {
    if (!_isConnected || _socket == null) return false;

    final result = await _emitWithAck(
      'booking:reject',
      data: {'bookingId': bookingId},
    );
    _lastActionError = result is Map
        ? result['error']?.toString()
        : 'Unable to reject booking';
    final succeeded = result is Map && result['ok'] == true;
    if (succeeded) _lastActionError = null;
    return succeeded;
  }

  void disconnect() {
    _socket?.disconnect();
    _isConnected = false;
    _connectionController.add(false);
  }

  void dispose() {
    _statusController.close();
    _bookingController.close();
    _connectionController.close();
    _panditStatusController.close();
    _bookingOfferClosedController.close();
  }
}
