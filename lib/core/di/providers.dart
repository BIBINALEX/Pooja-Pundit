import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_pundit/providers/booking_provider.dart'
    as booking_providers;
import 'package:pooja_pundit/providers/tab_index_provider.dart'
    as tab_index_providers;
import 'package:pooja_pundit/services/api/api_client.dart';
import 'package:pooja_pundit/services/api/backend_api_service.dart';
import 'package:pooja_pundit/services/auth/token_store.dart';
import 'package:pooja_pundit/services/socket_service.dart';

final tokenStoreProvider = Provider<AuthTokenStore>((ref) => AuthTokenStore());

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final backendApiServiceProvider = Provider<BackendApiService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final tokenStore = ref.watch(tokenStoreProvider);

  return BackendApiService(apiClient: apiClient, tokenStore: tokenStore);
});

final apiServiceProvider = backendApiServiceProvider;

final socketServiceProvider = Provider<SocketService>((ref) => SocketService());

final bookingProvider = booking_providers.bookingProvider;
final tabIndexProvider = tab_index_providers.tabIndexProvider;
