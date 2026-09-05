import 'dart:async';
import 'package:pooja_pundit/services/api/backend_models.dart';
import 'package:pooja_pundit/services/api/endpoints.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  SocketService();

  io.Socket? _socket;
  final _statusController = StreamController<String>.broadcast();
  final _bookingController = StreamController<PoojaRequest>.broadcast();
  final _connectionController = StreamController<bool>.broadcast();
  bool _isConnected = false;
  Completer<void>? _connectionCompleter;
  String? _lastActionError;

  Stream<String> get onStatusChanged => _statusController.stream;
  Stream<PoojaRequest> get onBookingReceived => _bookingController.stream;
  Stream<bool> get onConnectionChanged => _connectionController.stream;

  bool get isConnected => _isConnected;
  String? get lastActionError => _lastActionError;

  Future<void> connect({String? url, String? token}) {
    final socketUrl = url ?? Endpoints.socketUrl;
    _connectionCompleter = Completer<void>();
    _socket = io.io(socketUrl, <String, dynamic>{
      'transports': ['websocket', 'polling'],
      'autoConnect': false,
      'forceNew': true,
      if (token != null) 'auth': {'token': token},
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

    _socket!.connect();
    return _connectionCompleter!.future.timeout(const Duration(seconds: 10));
  }

  Future<bool> joinPandit() async {
    if (!_isConnected || _socket == null) return false;
    final result = await _emitWithAck('pandit:join');
    _lastActionError = result is Map ? result['error']?.toString() : null;
    return result is Map && result['ok'] == true;
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
  }
}
