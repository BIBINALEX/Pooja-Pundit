import 'package:go_router/go_router.dart';
import '../../screens/main_tabs.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => const MainTabs(),
    ),
  ],
);
