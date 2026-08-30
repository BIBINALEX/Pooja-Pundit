import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiUrl {
    try {
      return dotenv.env['API_URL'] ?? 'http://3.105.226.34';
    } catch (_) {
      return 'http://3.105.226.34';
    }
  }

  static String get socketUrl {
    try {
      final socketUrl = dotenv.env['SOCKET_URL'] ?? 'http://3.105.226.34:80';
      return socketUrl;
    } catch (_) {
      return 'http://3.105.226.34:80';
    }
  }
}
