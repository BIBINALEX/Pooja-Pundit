import 'package:pooja_pundit/core/config/env_config.dart';

class Endpoints {
  const Endpoints._();

  static String get domain => EnvConfig.apiUrl;
  static String get socketUrl => EnvConfig.socketUrl;
  static String get baseUrl => '$domain/api/v1';
  static const panditSignIn = '/auth/pandit-signin';
  static const me = '/auth/me';
  static const usersProfile = '/users/profile';
  static const refresh = '/auth/refresh';
  static const logout = '/auth/logout';
  static const panditProfile = '/pandits/profile';
  static const panditRegister = panditProfile;
  static const panditMe = '/pandits/me';
  static const dieties = '/dieties/list';
  static const stars = '/stars';
  static const services = '/services/list';
  static const bookingActivity = '/bookings/activity';
  static const newBooking = '/bookings/new';
  static String bookingById(int id) => '/bookings/$id';
  static String acceptBooking(int id) => '/bookings/$id/pandit/accept';
  static String rejectBooking(int id) => '/bookings/$id/pandit/reject';
  static String serviceById(int id) => '/services/$id';
  static const pandits = '/pandits/list';
  static String panditById(int id) => '/pandits/$id';
}
