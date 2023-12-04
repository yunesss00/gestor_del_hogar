import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/config/router/app_router_notifier.dart';
import 'package:go_router/go_router.dart';

import '../../modulos/auth/screens/check_auth_status_screen.dart';
import '../../modulos/auth/screens/login_screen.dart';
import '../../modulos/auth/screens/register_screen.dart';
import '../../modulos/home/screens/home_screen.dart';
import '../../modulos/home/screens/my_home_screen.dart';


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
      GoRoute(
        path: '/my-home-screen',
        name: MyHomeScreen.name,
        builder: (context, state) => const MyHomeScreen(),
      ),
    ],
    redirect: (context, state) {

      return null;
    },
  );
});
