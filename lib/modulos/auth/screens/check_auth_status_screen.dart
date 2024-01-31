import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/modulos/auth/controller/auth_controller.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/home.dart';
import '../../home/controller/home_controller.dart';

class CheckAuthStatusScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CheckAuthStatusScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        } else {
          // Utilizamos addPostFrameCallback para ejecutar la lógica después de construir los widgets
          WidgetsBinding.instance!.addPostFrameCallback((_) async {
            if (snapshot.data == true) {
              if (await _haveHome()!=null){
                // ignore: use_build_context_synchronously
                context.go('/my-home-screen');
              }else{
                // ignore: use_build_context_synchronously
                context.go('/home-screen');
              }
            } else {
              context.go('/login-screen');
            }
          });

          // Puedes devolver cualquier widget aquí si no deseas redirigir inmediatamente
          return Container();
        }
      },
    );
  }

  Future<bool> _isLoggedIn() async {
    final AuthController authController = AuthController();
    return await authController.checkStatus();
  }

  Future<Home?> _haveHome() async {
    final HomeController homeController = HomeController();
    return await homeController.findMyHome();
  }
}
