import 'package:go_router/go_router.dart';

import 'package:gestor_del_hogar/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/login-screen',
  routes: [

    GoRoute(
      path: '/login-screen',
      name: LoginScreen.name,
      builder: (context,state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/register-screen',
      name: RegisterScreen.name,
      builder: (context,state) => const RegisterScreen(),
    ),
    
    GoRoute(
      path: '/home-screen',
      name: HomeScreen.name,
      builder: (context,state) => const HomeScreen(),
    ),

     GoRoute(
      path: '/',
      name: '/',
      builder: (context,state) => const LoginScreen(),
    )


  ]
);