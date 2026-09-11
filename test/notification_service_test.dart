import 'package:flutter_test/flutter_test.dart';
import 'package:pooja_pundit/core/notifications/notification_service.dart';

void main() {
  group('NotificationService.extractRoute', () {
    test('maps accepted, completed, and test notifications to activity', () {
      for (final type in ['booking_accepted', 'booking_completed', 'test']) {
        expect(
          NotificationService.extractRoute({'type': type}),
          '/?tab=activity',
        );
      }
    });

    test('maps expired notifications to bookings', () {
      expect(
        NotificationService.extractRoute({'type': 'booking_expired'}),
        '/?tab=bookings',
      );
    });

    test('prefers an explicit backend route over the notification type', () {
      expect(
        NotificationService.extractRoute({
          'type': 'booking_expired',
          'route': '/custom-destination',
        }),
        '/custom-destination',
      );
    });
  });
}
