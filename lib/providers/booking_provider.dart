import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/providers/booking_message.dart';
import 'package:pooja_pundit/services/api/backend_models.dart';
import 'package:pooja_pundit/services/api/endpoints.dart';
import 'package:pooja_pundit/services/socket_service.dart';
import 'package:pooja_pundit/services/api/backend_api_service.dart';

export 'package:pooja_pundit/providers/booking_message.dart';

enum BookingAction { accepting, rejecting, completing }

class BookingState {
  BookingState({
    required this.available,
    required this.past,
    this.active,
    this.pendingBookingId,
    this.pendingAction,
    this.connectionMessage = const BookingMessage(
      BookingMessageKey.waitingForBookings,
    ),
    this.isConnected = false,
    this.status = PanditStatus.offline,
    this.pastPage = 1,
    this.pastTotalPages = 1,
    this.isLoadingPast = false,
    this.alertMessage,
  });

  final List<PoojaRequest> available;
  final List<PoojaRequest> past;
  final PoojaRequest? active;
  final int? pendingBookingId;
  final BookingAction? pendingAction;
  final BookingMessage connectionMessage;
  final bool isConnected;
  final PanditStatus status;
  final int pastPage;
  final int pastTotalPages;
  final bool isLoadingPast;
  final BookingMessage? alertMessage;

  bool get isBusy => active != null || pendingBookingId != null;

  BookingState copyWith({
    List<PoojaRequest>? available,
    List<PoojaRequest>? past,
    PoojaRequest? active,
    bool clearActive = false,
    int? pendingBookingId,
    bool clearPendingBooking = false,
    BookingAction? pendingAction,
    BookingMessage? connectionMessage,
    bool? isConnected,
    PanditStatus? status,
    int? pastPage,
    int? pastTotalPages,
    bool? isLoadingPast,
    BookingMessage? alertMessage,
  }) {
    return BookingState(
      available: available ?? this.available,
      past: past ?? this.past,
      active: clearActive ? null : active ?? this.active,
      pendingBookingId: clearPendingBooking
          ? null
          : pendingBookingId ?? this.pendingBookingId,
      pendingAction: clearPendingBooking
          ? null
          : pendingAction ?? this.pendingAction,
      connectionMessage: connectionMessage ?? this.connectionMessage,
      isConnected: isConnected ?? this.isConnected,
      status: status ?? this.status,
      pastPage: pastPage ?? this.pastPage,
      pastTotalPages: pastTotalPages ?? this.pastTotalPages,
      isLoadingPast: isLoadingPast ?? this.isLoadingPast,
      alertMessage: alertMessage ?? this.alertMessage,
    );
  }
}

final socketServiceProvider = Provider<SocketService>((ref) {
  return SocketService();
});

final bookingProvider = NotifierProvider<BookingController, BookingState>(
  BookingController.new,
);

class BookingController extends Notifier<BookingState>
    with WidgetsBindingObserver {
  late final SocketService _socketService;
  late final BackendApiService _apiService;
  bool _wantsToBeOnline = true;
  bool _isConnecting = false;
  bool _hasLoadedPastBookings = false;

  @override
  BookingState build() {
    _socketService = ref.read(socketServiceProvider);
    _apiService = ref.read(di.backendApiServiceProvider);
    WidgetsBinding.instance.addObserver(this);

    _socketService.onStatusChanged.listen((message) {
      state = state.copyWith(connectionMessage: message);
    });

    _socketService.onBookingReceived.listen((request) {
      final exists = state.available.any((item) => item.id == request.id);
      if (!exists) {
        state = state.copyWith(available: [...state.available, request]);
      }
    });

    _socketService.onBookingOfferClosed.listen((offer) {
      final message = _offerClosedMessage(offer.bookingId, offer.reason);
      state = state.copyWith(
        available: state.available
            .where((item) => item.id != offer.bookingId)
            .toList(),
        connectionMessage: message,
        alertMessage: message,
      );
    });

    _socketService.onConnectionChanged.listen((connected) {
      state = state.copyWith(
        isConnected: connected,
        status: connected ? state.status : PanditStatus.offline,
      );
      if (connected && _wantsToBeOnline && !_isConnecting) {
        unawaited(_rejoinAfterReconnect());
      }
    });

    _socketService.onPanditStatusChanged.listen((status) {
      state = state.copyWith(
        status: status,
        connectionMessage: _statusMessage(status),
      );
    });

    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _socketService.dispose();
    });

    return BookingState(available: const [], past: const []);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        _wantsToBeOnline &&
        !_socketService.isConnected) {
      connect();
    }
  }

  Future<void> connect() async {
    if (_isConnecting || _socketService.isConnected) return;

    _wantsToBeOnline = true;
    _isConnecting = true;
    final effectiveToken = _apiService.accessToken;
    try {
      await _socketService.connect(
        url: Endpoints.socketUrl,
        token: effectiveToken,
      );
      final joined = await _socketService.joinPandit();
      state = state.copyWith(
        active: joined != null && joined.activeBookings.isNotEmpty
            ? joined.activeBookings.first
            : null,
        connectionMessage: joined != null
            ? _statusMessage(joined.status)
            : BookingMessage(
                BookingMessageKey.unableToGoOnline,
                params: {'error': _socketService.lastActionError ?? ''},
              ),
        isConnected: joined != null,
        status: joined?.status ?? PanditStatus.offline,
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: BookingMessage(
          BookingMessageKey.socketUnavailable,
          params: {'error': '$error'},
        ),
        isConnected: false,
      );
    } finally {
      _isConnecting = false;
    }
  }

  Future<void> _rejoinAfterReconnect() async {
    final joined = await _socketService.joinPandit();
    if (joined == null && _wantsToBeOnline) {
      state = state.copyWith(
        connectionMessage: BookingMessage(
          BookingMessageKey.unableToStayOnline,
          params: {'error': _socketService.lastActionError ?? ''},
        ),
        isConnected: false,
        status: PanditStatus.offline,
      );
    } else if (joined != null) {
      state = state.copyWith(
        active: joined.activeBookings.isNotEmpty
            ? joined.activeBookings.first
            : null,
        connectionMessage: _statusMessage(joined.status),
        status: joined.status,
      );
    }
  }

  BookingMessage _statusMessage(PanditStatus status) {
    switch (status) {
      case PanditStatus.online:
        return const BookingMessage(
          BookingMessageKey.onlineAndReadyForBookings,
        );
      case PanditStatus.busy:
        return const BookingMessage(BookingMessageKey.busyWithActiveBooking);
      case PanditStatus.offline:
        return const BookingMessage(BookingMessageKey.offline);
    }
  }

  void toggleConnection() {
    if (state.isConnected) {
      disconnect();
    } else {
      connect();
    }
  }

  Future<void> loadPastBookings({int page = 1}) async {
    if (state.isLoadingPast || page < 1) return;
    if (_hasLoadedPastBookings && page == 1) return;

    state = state.copyWith(isLoadingPast: true);
    try {
      final result = await _apiService.fetchPanditBookings(page: page);
      final merged = _mergeBookings(state.past, result.bookings);
      _hasLoadedPastBookings = true;
      state = state.copyWith(
        past: merged,
        pastPage: result.pagination.page,
        pastTotalPages: result.pagination.totalPages,
        isLoadingPast: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoadingPast: false,
        connectionMessage: BookingMessage(
          BookingMessageKey.couldNotLoadPastBookings,
          params: {'error': '$error'},
        ),
      );
    }
  }

  List<PoojaRequest> _mergeBookings(
    List<PoojaRequest> existing,
    List<PoojaRequest> incoming,
  ) {
    final byId = <int, PoojaRequest>{};
    final withoutIds = <PoojaRequest>[];
    for (final booking in [...incoming, ...existing]) {
      if (booking.id != null) {
        byId.putIfAbsent(booking.id!, () => booking);
      } else {
        withoutIds.add(booking);
      }
    }
    final merged = [...byId.values, ...withoutIds];
    merged.sort((left, right) {
      final leftDate = DateTime.tryParse(
        left.completedAt ?? left.updatedAt ?? left.createdAt ?? '',
      );
      final rightDate = DateTime.tryParse(
        right.completedAt ?? right.updatedAt ?? right.createdAt ?? '',
      );
      if (leftDate == null || rightDate == null) return 0;
      return rightDate.compareTo(leftDate);
    });
    return merged;
  }

  Future<void> acceptRequest(PoojaRequest request) async {
    if (state.isBusy) {
      return;
    }

    if (request.id == null) return;

    state = state.copyWith(
      pendingBookingId: request.id,
      pendingAction: BookingAction.accepting,
    );
    try {
      final accepted = await _socketService.acceptBooking(request.id!);
      if (accepted == null) {
        final closedMessage = _closedAcceptError(request.id!);
        if (closedMessage != null) {
          state = state.copyWith(
            available: state.available
                .where((item) => item.id != request.id)
                .toList(),
            connectionMessage: closedMessage,
            alertMessage: closedMessage,
          );
        }
        throw StateError(
          _socketService.lastActionError ?? 'Unable to accept booking',
        );
      }
      state = state.copyWith(
        active: accepted,
        available: state.available
            .where((item) => item.id != request.id)
            .toList(),
        connectionMessage: BookingMessage(
          BookingMessageKey.acceptedBooking,
          params: {'name': accepted.fullname},
        ),
        status: PanditStatus.busy,
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: BookingMessage(
          BookingMessageKey.couldNotAcceptBooking,
          params: {'error': '$error'},
        ),
      );
    } finally {
      state = state.copyWith(clearPendingBooking: true);
    }
  }

  BookingMessage _offerClosedMessage(int bookingId, String? reason) {
    if (reason == 'taken') {
      return BookingMessage(
        BookingMessageKey.bookingTakenByAnother,
        params: {'id': '$bookingId'},
      );
    }
    if (reason == 'expired') {
      return BookingMessage(
        BookingMessageKey.bookingOfferExpired,
        params: {'id': '$bookingId'},
      );
    }
    return BookingMessage(
      BookingMessageKey.bookingNoLongerAvailable,
      params: {'id': '$bookingId'},
    );
  }

  BookingMessage? _closedAcceptError(int bookingId) {
    final error = _socketService.lastActionError?.toLowerCase();
    if (error == null) return null;
    if (error.contains('taken') || error.contains('another pandit')) {
      return _offerClosedMessage(bookingId, 'taken');
    }
    if (error.contains('expired')) {
      return _offerClosedMessage(bookingId, 'expired');
    }
    if (error.contains('closed') || error.contains('no longer available')) {
      return _offerClosedMessage(bookingId, null);
    }
    return null;
  }

  Future<void> rejectRequest(PoojaRequest request) async {
    if (state.isBusy || request.id == null) return;

    state = state.copyWith(
      pendingBookingId: request.id,
      pendingAction: BookingAction.rejecting,
    );
    try {
      final rejected = await _socketService.rejectBooking(request.id!);
      if (!rejected) {
        throw StateError(
          _socketService.lastActionError ?? 'Unable to reject booking',
        );
      }
      state = state.copyWith(
        available: state.available
            .where((item) => item.id != request.id)
            .toList(),
        connectionMessage: BookingMessage(
          BookingMessageKey.rejectedBooking,
          params: {'name': request.fullname},
        ),
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: BookingMessage(
          BookingMessageKey.couldNotRejectBooking,
          params: {'error': '$error'},
        ),
      );
    } finally {
      state = state.copyWith(clearPendingBooking: true);
    }
  }

  Future<void> completeActiveBooking() async {
    if (state.active == null) {
      return;
    }

    final completed = state.active!;
    if (completed.id == null || state.pendingBookingId != null) return;

    state = state.copyWith(
      pendingBookingId: completed.id,
      pendingAction: BookingAction.completing,
    );
    try {
      final result = await _socketService.completeBooking(completed.id!);
      if (result == null) {
        throw StateError(
          _socketService.lastActionError ?? 'Unable to complete booking',
        );
      }
      state = state.copyWith(
        active: null,
        clearActive: true,
        past: _mergeBookings([result, ...state.past], const []),
        connectionMessage: BookingMessage(
          BookingMessageKey.completedBooking,
          params: {'name': completed.fullname},
        ),
        status: PanditStatus.online,
      );
    } catch (error) {
      state = state.copyWith(
        connectionMessage: BookingMessage(
          BookingMessageKey.couldNotCompleteBooking,
          params: {'error': '$error'},
        ),
      );
    } finally {
      state = state.copyWith(clearPendingBooking: true);
    }
  }

  Future<void> disconnect() async {
    _wantsToBeOnline = false;
    await _socketService.leavePandit();
    _socketService.disconnect();
    state = state.copyWith(
      isConnected: _socketService.isConnected,
      status: PanditStatus.offline,
    );
  }
}
