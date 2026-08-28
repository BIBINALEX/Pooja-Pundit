import '../../models/pooja_request.dart';
import 'api_client.dart';
import 'backend_models.dart';
import 'endpoints.dart';

class BackendApiService {
  BackendApiService({required ApiClient apiClient}) : _client = apiClient;

  final ApiClient _client;

  void setToken(String? token) => _client.setToken(token);

  Future<PanditSignInResult> panditSignIn({
    required String idToken,
    String? name,
    String? specialization,
  }) async {
    final response = await _client.post(
      Endpoints.panditSignIn,
      data: {
        'idToken': idToken,
        'name': ?name,
        'specialization': ?specialization,
      },
    );
    final data = jsonMap(response.data);
    return PanditSignInResult(
      user: User.fromJson(jsonMap(data['user'])),
      pandit: Pandit.fromJson(jsonMap(data['pandit'])),
    );
  }

  Future<User> fetchMe() async {
    final response = await _client.get(Endpoints.me, requireAuth: true);
    return User.fromJson(jsonMap(jsonMap(response.data)['user']));
  }

  Future<Pandit> fetchPanditMe() async {
    final response = await _client.get(Endpoints.panditMe, requireAuth: true);
    return Pandit.fromJson(jsonMap(jsonMap(response.data)['pandit']));
  }

  Future<Pandit> registerPandit({String? name, String? specialization}) async {
    final response = await _client.post(
      Endpoints.panditRegister,
      requireAuth: true,
      data: {'name': ?name, 'specialization': ?specialization},
    );
    return Pandit.fromJson(jsonMap(jsonMap(response.data)['pandit']));
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
}
