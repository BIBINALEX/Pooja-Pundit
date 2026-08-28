import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pooja_request.dart';
import '../services/socket_service.dart';
import '../services/api/api_client.dart';
import '../services/api/backend_api_service.dart';

class BookingState {
  BookingState({
    required this.available,
    required this.past,
    this.active,
    this.connectionMessage = 'Waiting for bookings',
    this.isConnected = false,
  });

  final List<PoojaRequest> available;
  final List<PoojaRequest> past;
  final PoojaRequest? active;
  final String connectionMessage;
  final bool isConnected;

  BookingState copyWith({
    List<PoojaRequest>? available,
    List<PoojaRequest>? past,
    PoojaRequest? active,
    bool clearActive = false,
    String? connectionMessage,
    bool? isConnected,
  }) {
    return BookingState(
      available: available ?? this.available,
      past: past ?? this.past,
      active: clearActive ? null : active ?? this.active,
      connectionMessage: connectionMessage ?? this.connectionMessage,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}

final socketServiceProvider = Provider<SocketService>((ref) {
  return SocketService();
});

final apiServiceProvider = Provider<BackendApiService>((ref) {
  return BackendApiService(apiClient: ApiClient());
});

final bookingProvider = NotifierProvider<BookingController, BookingState>(
  BookingController.new,
);

class BookingController extends Notifier<BookingState> {
  late final SocketService _socketService;
  late final BackendApiService _apiService;

  @override
  BookingState build() {
    _socketService = ref.read(socketServiceProvider);
    _apiService = ref.read(apiServiceProvider);

    _socketService.onStatusChanged.listen((message) {
      state = state.copyWith(connectionMessage: message);
    });

    _socketService.onBookingReceived.listen((request) {
      final exists = state.available.any((item) => item.id == request.id);
      if (!exists) {
        state = state.copyWith(available: [...state.available, request]);
      }
    });

    _socketService.onConnectionChanged.listen((connected) {
      state = state.copyWith(isConnected: connected);
    });

    ref.onDispose(() => _socketService.dispose());

    return BookingState(available: const [], past: const []);
  }

  Future<void> connect({String? token}) async {
    _apiService.setToken(token);
    try {
      await _socketService.connect(token: token);
      final joined = await _socketService.joinPandit();
      state = state.copyWith(
        connectionMessage: joined
            ? 'Online and ready for bookings'
            : 'Unable to go online',
        isConnected: joined,
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: 'Socket unavailable: $error',
        isConnected: false,
      );
    }
  }

  void toggleConnection() {
    if (state.isConnected) {
      disconnect();
    } else {
      connect();
    }
  }

  Future<void> acceptRequest(PoojaRequest request) async {
    if (state.active != null) {
      return;
    }

    if (request.id == null) return;

    try {
      final accepted = await _apiService.acceptBooking(request.id!);
      state = state.copyWith(
        active: accepted,
        available: state.available
            .where((item) => item.id != request.id)
            .toList(),
        connectionMessage: 'Accepted ${accepted.fullname}',
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: 'Could not accept booking: $error',
      );
    }
  }

  Future<void> rejectRequest(PoojaRequest request) async {
    if (request.id == null) return;

    try {
      await _apiService.rejectBooking(request.id!);
      state = state.copyWith(
        available: state.available
            .where((item) => item.id != request.id)
            .toList(),
        connectionMessage: 'Rejected ${request.fullname}',
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: 'Could not reject booking: $error',
      );
    }
  }

  void completeActiveBooking() {
    if (state.active == null) {
      return;
    }

    final completed = state.active!;
    state = state.copyWith(
      active: null,
      clearActive: true,
      past: [completed, ...state.past],
      connectionMessage: 'Completed ${completed.fullname}',
      isConnected: _socketService.isConnected,
    );
  }

  Future<void> disconnect() async {
    await _socketService.leavePandit();
    _socketService.disconnect();
    state = state.copyWith(isConnected: _socketService.isConnected);
  }
}
