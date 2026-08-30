import 'package:flutter_test/flutter_test.dart';
import 'package:pooja_pundit/services/auth/token_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AuthTokenStore', () {
    test('stores and reads a backend session', () async {
      final store = AuthTokenStore();

      await store.saveSession(
        accessToken: 'persisted-access-token',
        refreshToken: 'persisted-refresh-token',
      );
      final session = await store.readSession();

      expect(session?.accessToken, 'persisted-access-token');
      expect(session?.refreshToken, 'persisted-refresh-token');

      await store.clearTokens();
      expect(await store.readSession(), isNull);
    });
  });
}
