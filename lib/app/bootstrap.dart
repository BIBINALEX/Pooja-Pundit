import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_pundit/core/di/providers.dart' as di;
import 'package:pooja_pundit/core/router/app_router.dart';
import 'package:pooja_pundit/core/notifications/notification_service.dart';
import 'package:pooja_pundit/firebase_options.dart';
import 'package:pooja_pundit/services/app/first_launch_reset_service.dart';
import 'app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    debugPrint(
      'No .env file is available in this build; continuing without env vars.',
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
  return ProviderContainer();
}
