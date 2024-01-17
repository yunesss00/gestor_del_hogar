import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/home.dart';
import '../../modulos/auth/controller/auth_controller.dart';
import '../../modulos/auth/screens/check_auth_status_screen.dart';
import '../../modulos/auth/screens/login_screen.dart';
import '../../modulos/auth/screens/register_screen.dart';
import '../../modulos/home/controller/home_controller.dart';
import '../../modulos/home/screens/home_screen.dart';
import '../../modulos/home/screens/my_home_screen.dart';
import '../../modulos/tasks/screens/tasks_screen.dart';

final isLogged = _isLoggedIn();
final haveHome = _haveHome();

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const CheckAuthStatusScreen(),
    ),
    GoRoute(
      path: '/login-screen',
      name: LoginScreen.name,
      builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register-screen',
      name: RegisterScreen.name,
      builder: (BuildContext context, GoRouterState state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home-screen',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/my-home-screen',
      name: MyHomeScreen.name,
      builder: (BuildContext context, GoRouterState state) => const MyHomeScreen(),
    ),
    GoRoute(
      path: '/tasks-screen',
      name: TasksScreen.name,
      builder: (BuildContext context, GoRouterState state) => const TasksScreen(),
    ),
  ],
  
);

Future<bool> _isLoggedIn() async {
  final AuthController authController = AuthController();
  return await authController.checkStatus();
}

Future<Home?> _haveHome() async {
  final HomeController homeController = HomeController();
  return await homeController.findMyHome();
}
