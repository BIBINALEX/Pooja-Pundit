import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pooja_pundit/core/config/env_config.dart';
import 'package:pooja_pundit/services/api/endpoints.dart';

void main() {
  group('socket URL config', () {
    test('uses SOCKET_URL and strips socket.io suffix', () {
      dotenv.loadFromString(
        envString: '''
API_URL=http://localhost:4000
SOCKET_URL=http://localhost:4000/socket.io
''',
      );

      expect(EnvConfig.socketUrl, 'ws://localhost:4000');
      expect(Endpoints.socketUrl, 'ws://localhost:4000');
    });
  });
}
