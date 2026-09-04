import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthTokenStore {
  AuthTokenStore({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const _tokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';
  static const _expiresInKey = 'auth_expires_in';

  final FlutterSecureStorage _secureStorage;

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    String? expiresIn,
  }) async {
    await _secureStorage.write(key: _tokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
    if (expiresIn == null || expiresIn.isEmpty) {
      await _secureStorage.delete(key: _expiresInKey);
    } else {
      await _secureStorage.write(key: _expiresInKey, value: expiresIn);
    }
  }

  Future<AuthSession?> readSession() async {
    final accessToken = await _secureStorage.read(key: _tokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    final expiresIn = await _secureStorage.read(key: _expiresInKey);
    if (accessToken == null ||
        accessToken.isEmpty ||
        refreshToken == null ||
        refreshToken.isEmpty) {
      return null;
    }
    return AuthSession(accessToken, refreshToken, expiresIn: expiresIn);
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _secureStorage.delete(key: _expiresInKey);
  }
}

class AuthSession {
  const AuthSession(this.accessToken, this.refreshToken, {this.expiresIn});

  final String accessToken;
  final String refreshToken;
  final String? expiresIn;
}
