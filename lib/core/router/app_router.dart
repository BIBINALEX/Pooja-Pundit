import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../../services/api/backend_models.dart';
import '../../screens/auth/login_page.dart';
import '../../screens/auth/registration_page.dart';
import '../../screens/main_tabs.dart';

PanditSignInResult? pendingRegistrationProfile;

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final isLoginRoute = state.matchedLocation == '/login';
    final isRegisterRoute = state.matchedLocation == '/register';

    if (isLoggedIn && pendingRegistrationProfile != null && !isRegisterRoute) {
      return '/register';
    }

    if (!isLoggedIn && !isLoginRoute && !isRegisterRoute) {
      return '/login';
    }
    if (isLoggedIn && isLoginRoute) {
      return '/';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const PhoneLoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegistrationPage(
        initialProfile: state.extra is PanditSignInResult
            ? state.extra as PanditSignInResult
            : pendingRegistrationProfile,
      ),
    ),
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => MainTabs(
        initialTab: switch (Uri.parse(state.location).queryParameters['tab']) {
          'activity' => 1,
          'bookings' => 0,
          _ => 0,
        },
      ),
    ),
  ],
);
