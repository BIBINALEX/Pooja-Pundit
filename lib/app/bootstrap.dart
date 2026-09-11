import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/core/router/app_router.dart';
import 'package:pooja_pundit/core/notifications/notification_service.dart';
import 'package:pooja_pundit/firebase_options.dart';
import 'package:pooja_pundit/services/app/first_launch_reset_service.dart';
import 'package:pooja_pundit/services/localization/locale_service.dart';
import 'app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'production');
  final envFile = switch (flavor) {
    'development' => 'env/.env.development',
    'production' => 'env/.env.production',
    _ => throw StateError(
      'Unsupported FLAVOR "$flavor". Use development or production.',
    ),
  };

  try {
    await dotenv.load(fileName: envFile);
  } catch (_) {
    debugPrint(
      'No environment file was found at $envFile; continuing without env vars.',
    );
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await const FirstLaunchResetService().resetIfNeeded();

  final container = await _initServices();
  await _hydrateAuthenticatedUser(container);

  await NotificationService.initialize(appRouter);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const PoojaPunditApp(),
    ),
  );
}

Future<void> _hydrateAuthenticatedUser(ProviderContainer container) async {
  final backendApiService = container.read(di.backendApiServiceProvider);
  final session = await backendApiService.restoreSession();

  if (session != null && backendApiService.shouldRefreshSession(session)) {
    try {
      await backendApiService.refreshSession();
      return;
    } catch (error) {
      debugPrint('Stored session could not be refreshed: $error');
      await backendApiService.clearSession();
    }
  }

  if (session != null) return;

  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final idToken = await user.getIdToken();
  if (idToken == null || idToken.isEmpty) return;

  final result = await backendApiService.panditSignIn(idToken: idToken);

  if (result.requiresProfileCompletion) {
    pendingRegistrationProfile = result;
  }
}

Future<ProviderContainer> _initServices() async {
  final prefs = await SharedPreferences.getInstance();
  final localeService = LocaleService(prefs: prefs);
  await localeService.loadLocale();

  return ProviderContainer(
    overrides: [
      di.preferencesServiceProvider.overrideWithValue(prefs),
      di.localeServiceProvider.overrideWithValue(localeService),
    ],
  );
}
