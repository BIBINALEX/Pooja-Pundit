import 'package:pooja_pundit/l10n/generated/app_localizations.dart';
import 'package:pooja_pundit/providers/booking_message.dart';

/// Resolves a [BookingMessage] into localized display text.
String localizeBookingMessage(AppLocalizations l10n, BookingMessage message) {
  final error = message.params['error'];
  final resolvedError = (error == null || error.isEmpty)
      ? l10n.unknownError
      : error;
  final name = message.params['name'] ?? '';
  final id = message.params['id'] ?? '';

  switch (message.key) {
    case BookingMessageKey.waitingForBookings:
      return l10n.waitingForBookings;
    case BookingMessageKey.socketConnected:
      return l10n.socketConnected;
    case BookingMessageKey.socketDisconnected:
      return l10n.socketDisconnected;
    case BookingMessageKey.socketUnavailable:
      return l10n.socketUnavailable(resolvedError);
    case BookingMessageKey.onlineAndReadyForBookings:
      return l10n.onlineAndReadyForBookings;
    case BookingMessageKey.busyWithActiveBooking:
      return l10n.busyWithActiveBooking;
    case BookingMessageKey.offline:
      return l10n.statusOffline;
    case BookingMessageKey.unableToGoOnline:
      return l10n.unableToGoOnline(resolvedError);
    case BookingMessageKey.unableToStayOnline:
      return l10n.unableToStayOnline(resolvedError);
    case BookingMessageKey.couldNotLoadPastBookings:
      return l10n.couldNotLoadPastBookings(resolvedError);
    case BookingMessageKey.acceptedBooking:
      return l10n.acceptedBooking(name);
    case BookingMessageKey.couldNotAcceptBooking:
      return l10n.couldNotAcceptBooking(resolvedError);
    case BookingMessageKey.bookingTakenByAnother:
      return l10n.bookingTakenByAnother(id);
    case BookingMessageKey.bookingOfferExpired:
      return l10n.bookingOfferExpired(id);
    case BookingMessageKey.bookingNoLongerAvailable:
      return l10n.bookingNoLongerAvailable(id);
    case BookingMessageKey.rejectedBooking:
      return l10n.rejectedBooking(name);
    case BookingMessageKey.couldNotRejectBooking:
      return l10n.couldNotRejectBooking(resolvedError);
    case BookingMessageKey.completedBooking:
      return l10n.completedBooking(name);
    case BookingMessageKey.couldNotCompleteBooking:
      return l10n.couldNotCompleteBooking(resolvedError);
    case BookingMessageKey.couldNotStartBooking:
      return l10n.couldNotStartBooking(resolvedError);
  }
}
