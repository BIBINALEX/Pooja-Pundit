import '../auth/token_store.dart';
import 'api_client.dart';
import 'backend_models.dart';
import 'endpoints.dart';

class BackendApiService {
  BackendApiService({required ApiClient apiClient, AuthTokenStore? tokenStore})
    : _client = apiClient,
      _tokenStore = tokenStore ?? AuthTokenStore();

  final ApiClient _client;
  final AuthTokenStore _tokenStore;
  String? _firebaseIdToken;

  Future<void> saveSession(TokenPair tokens) async {
    if (tokens.accessToken.isEmpty || tokens.refreshToken.isEmpty) {
      throw const ApiException('API returned an incomplete session', 500);
    }
    await _tokenStore.saveSession(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );
    _firebaseIdToken = null;
    _client.setToken(tokens.accessToken);
  }

  Future<AuthSession?> restoreSession() async {
    final session = await _tokenStore.readSession();
    if (session != null) {
      _client.setToken(session.accessToken);
    }
    return session;
  }

  String? get accessToken => _client.currentToken;

  void useFirebaseToken(String token) {
    _firebaseIdToken = token;
    _client.setToken(token);
  }

  String? get authenticationToken => _firebaseIdToken ?? _client.currentToken;

  Future<PanditSignInResult> panditSignIn({required String idToken}) async {
    final payload = <String, dynamic>{'idToken': idToken};

    final response = await _client.post(Endpoints.panditSignIn, data: payload);
    final data = jsonMap(response.data);
    final result = PanditSignInResult.fromJson(data);
    print(
      'Pandit sign-in result: ${result.accessToken.isEmpty}, ${result.refreshToken.isEmpty}, requiresProfileCompletion: ${result.requiresProfileCompletion}',
    );
    if (result.accessToken.isNotEmpty && result.refreshToken.isNotEmpty) {
      await saveSession(
        TokenPair(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
          expiresIn: result.expiresIn,
          tokenType: result.tokenType,
        ),
      );
    } else {
      useFirebaseToken(idToken);
    }
    return result;
  }

  Future<User> fetchMe() async {
    final response = await _client.get(Endpoints.me, requireAuth: true);
    return User.fromJson(jsonMap(jsonMap(response.data)['user']));
  }

  Future<Pandit?> fetchPanditMe() async {
    final response = await _client.get(Endpoints.panditMe, requireAuth: true);
    final pandit = jsonMap(response.data)['pandit'];
    return pandit is Map ? Pandit.fromJson(jsonMap(pandit)) : null;
  }

  Future<TokenPair> registerPandit({
    required String name,
    required String dob,
    required String email,
    required String phone,
    required String gender,
    required String bio,
    required String specialization,
    required String language,
  }) async {
    final response = await _client.post(
      Endpoints.panditProfile,
      requireAuth: false,
      data: {
        'name': name,
        'dob': dob,
        'email': email,
        'phone': phone,
        'gender': gender,
        'bio': bio,
        'specialization': specialization,
        'language': language,
      },
    );
    final tokens = TokenPair.fromJson(jsonMap(response.data));
    await saveSession(tokens);
    return tokens;
  }

  Future<PoojaRequest> createBooking(PoojaRequest request) async {
    final response = await _client.post(
      Endpoints.newBooking,
      data: request.toJson(),
    );
    return bookingFromJson(jsonMap(response.data)['booking']);
  }

  Future<List<PoojaRequest>> fetchBookingActivity() async {
    final response = await _client.post(
      Endpoints.bookingActivity,
      requireAuth: true,
    );
    final bookings = jsonMap(response.data)['bookings'];
    if (bookings is! List) return const [];
    return bookings.map(bookingFromJson).toList();
  }

  Future<List<Diety>> fetchDieties() async {
    final response = await _client.get(Endpoints.dieties);
    return _listOf<Diety>(jsonMap(response.data)['dieties'], Diety.fromJson);
  }

  Future<List<ServiceItem>> fetchServices() async {
    final response = await _client.get(Endpoints.services);
    return _listOf<ServiceItem>(
      jsonMap(response.data)['services'],
      ServiceItem.fromJson,
    );
  }

  Future<List<BirthStar>> fetchBirthStars() async {
    final response = await _client.get(Endpoints.stars);
    return _listOf<BirthStar>(
      jsonMap(response.data)['stars'],
      BirthStar.fromJson,
    );
  }

  Future<TokenPair> refreshSession() async {
    final session = await _tokenStore.readSession();
    if (session == null) {
      throw const ApiException('Refresh token is required', 401);
    }
    final response = await _client.post(
      Endpoints.refresh,
      data: {'refreshToken': session.refreshToken},
    );
    final tokens = TokenPair.fromJson(jsonMap(response.data));
    await saveSession(tokens);
    return tokens;
  }

  Future<void> logout() async {
    final accessToken = _client.currentToken;
    Object? requestError;

    try {
      if (accessToken != null && accessToken.isNotEmpty) {
        _client.setToken(accessToken);
        await _client.post(Endpoints.logout, requireAuth: true);
      }
    } catch (error) {
      requestError = error;
      print('Error during logout request: $error');
    } finally {
      await _tokenStore.clearTokens();
      _client.setToken(null);
      _firebaseIdToken = null;
    }

    if (requestError != null) {
      throw requestError;
    }
  }

  Future<PoojaRequest> acceptBooking(int id) async {
    final response = await _client.post(
      Endpoints.acceptBooking(id),
      requireAuth: true,
    );
    return bookingFromJson(jsonMap(response.data)['booking']);
  }

  Future<PoojaRequest> fetchBooking(int id) async {
    final response = await _client.get(Endpoints.bookingById(id));
    return bookingFromJson(jsonMap(response.data)['booking']);
  }

  Future<void> rejectBooking(int id) async {
    await _client.post(Endpoints.rejectBooking(id), requireAuth: true);
  }

  Future<User> fetchUserProfile() async {
    final response = await _client.get(
      Endpoints.usersProfile,
      requireAuth: true,
    );
    return User.fromJson(jsonMap(jsonMap(response.data)['user']));
  }

  Future<ServiceItem?> fetchService(int id) async {
    final response = await _client.get(Endpoints.serviceById(id));
    final service = jsonMap(response.data)['service'];
    return service is Map ? ServiceItem.fromJson(jsonMap(service)) : null;
  }

  Future<List<Pandit>> fetchPandits() async {
    final response = await _client.get(Endpoints.pandits);
    return _listOf<Pandit>(jsonMap(response.data)['pandits'], Pandit.fromJson);
  }

  Future<Pandit?> fetchPandit(int id) async {
    final response = await _client.get(Endpoints.panditById(id));
    final pandit = jsonMap(response.data)['pandit'];
    return pandit is Map ? Pandit.fromJson(jsonMap(pandit)) : null;
  }

  static List<T> _listOf<T>(
    Object? value,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (value is! List) return const [];
    return value.map((item) => fromJson(jsonMap(item))).toList();
  }
}
