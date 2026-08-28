class Endpoints {
  const Endpoints._();

  static const baseUrl = 'http://localhost:3000/api/v1';
  static const panditSignIn = '/auth/pandit-signin';
  static const me = '/auth/me';
  static const panditMe = '/pandits/me';
  static const panditRegister = '/pandits/register';
  static String bookingById(int id) => '/bookings/$id';
  static String acceptBooking(int id) => '/bookings/$id/accept';
  static String rejectBooking(int id) => '/bookings/$id/reject';
}
