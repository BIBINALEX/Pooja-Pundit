import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get appName {
    try {
      return dotenv.env['APP_NAME'] ?? 'Acharya';
    } catch (_) {
      return 'Acharya';
    }
  }

  static String get apiUrl {
    try {
      return dotenv.env['API_URL'] ?? 'https://api-mypooja.com';
    } catch (_) {
      return 'https://api-mypooja.com';
    }
  }

  static String get socketUrl {
    try {
      final configuredUrl =
          dotenv.env['SOCKET_URL'] ?? 'https://api-mypooja.com';
      final uri = Uri.parse(configuredUrl);
      final path = uri.path.replaceFirst(RegExp(r'/socket\.io/?$'), '');
      final normalizedUri = uri.replace(
        scheme: uri.scheme == 'https' ? 'wss' : 'ws',
        path: path,
      );
      return normalizedUri.toString().replaceFirst(RegExp(r'/$'), '');
    } catch (_) {
      return 'https://api-mypooja.com';
    }
  }
}
