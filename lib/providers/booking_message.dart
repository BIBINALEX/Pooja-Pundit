/// Structured, localizable message emitted by [SocketService] and
/// [BookingController]. UI layers resolve [key] + [params] into localized
/// text using [AppLocalizations] at display time.
enum BookingMessageKey {
  waitingForBookings,
  socketConnected,
  socketDisconnected,
  socketUnavailable,
  onlineAndReadyForBookings,
  busyWithActiveBooking,
  offline,
  unableToGoOnline,
  unableToStayOnline,
  couldNotLoadPastBookings,
  acceptedBooking,
  couldNotAcceptBooking,
  bookingTakenByAnother,
  bookingOfferExpired,
  bookingNoLongerAvailable,
  rejectedBooking,
  couldNotRejectBooking,
  completedBooking,
  couldNotCompleteBooking,
}

class BookingMessage {
  const BookingMessage(this.key, {this.params = const {}});

  final BookingMessageKey key;
  final Map<String, String> params;
}
