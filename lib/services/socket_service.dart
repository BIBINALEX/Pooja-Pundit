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

  Stream<String> get onStatusChanged => _statusController.stream;
  Stream<PoojaRequest> get onBookingReceived => _bookingController.stream;
  Stream<bool> get onConnectionChanged => _connectionController.stream;

  bool get isConnected => _isConnected;

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
    return result is Map && result['ok'] == true;
  }

  Future<bool> leavePandit() async {
    if (!_isConnected || _socket == null) return false;
    final result = await _emitWithAck('pandit:leave');
    return result is Map && result['ok'] == true;
  }

  Future<dynamic> _emitWithAck(String event) {
    final completer = Completer<dynamic>();
    _socket!.emitWithAck(event, null, ack: (data) => completer.complete(data));
    return completer.future.timeout(
      const Duration(seconds: 10),
      onTimeout: () => {'ok': false, 'error': 'Request timed out'},
    );
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
