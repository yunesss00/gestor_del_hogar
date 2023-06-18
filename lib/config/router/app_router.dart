import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/config/router/app_router_notifier.dart';
import 'package:gestor_del_hogar/presentation/providers/auth/auth_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:gestor_del_hogar/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login-screen',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register-screen',
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home-screen',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.cheking) return null;

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;
        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register' || isGoingTo == '/splash') return '/home-screen';
      }

      return null;
    },
  );
});
