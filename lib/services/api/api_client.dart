import 'package:dio/dio.dart';
import 'endpoints.dart';

typedef AuthTokenProvider = Future<String?> Function();

class ApiClient {
  ApiClient({String? baseUrl, this.authTokenProvider, Dio? dio})
    : dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl ?? Endpoints.baseUrl));

  final Dio dio;
  final AuthTokenProvider? authTokenProvider;
  String? _token;

  String? get currentToken => _token;

  void setToken(String? token) => _token = token;

  Future<Response<dynamic>> get(String path, {bool requireAuth = false}) {
    return _request('GET', path, requireAuth: requireAuth);
  }

  Future<Response<dynamic>> post(
    String path, {
    Object? data,
    bool requireAuth = false,
  }) {
    return _request('POST', path, data: data, requireAuth: requireAuth);
  }

  Future<Response<dynamic>> _request(
    String method,
    String path, {
    Object? data,
    required bool requireAuth,
  }) async {
    final token = _token ?? await authTokenProvider?.call();
    if (requireAuth && (token == null || token.trim().isEmpty)) {
      throw const ApiException('Authentication token is required', 401);
    }
    print('Making $method request to $path with token: $token and data: $data');
    return dio.request(
      path,
      data: data,
      options: Options(
        method: method,
        headers: token == null ? null : {'Authorization': 'Bearer $token'},
      ),
    );
  }
}

class ApiException implements Exception {
  const ApiException(this.message, this.statusCode);

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}
