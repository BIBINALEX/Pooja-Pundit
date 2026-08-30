import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthTokenStore {
  AuthTokenStore({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const _tokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  final FlutterSecureStorage _secureStorage;

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: _tokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<AuthSession?> readSession() async {
    final accessToken = await _secureStorage.read(key: _tokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    if (accessToken == null ||
        accessToken.isEmpty ||
        refreshToken == null ||
        refreshToken.isEmpty) {
      return null;
    }
    return AuthSession(accessToken, refreshToken);
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}

class AuthSession {
  const AuthSession(this.accessToken, this.refreshToken);

  final String accessToken;
  final String refreshToken;
}
