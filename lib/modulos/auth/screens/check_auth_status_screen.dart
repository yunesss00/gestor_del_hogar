import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/modulos/auth/screens/auth_controller.dart';
import 'package:go_router/go_router.dart';

class CheckAuthStatusScreen extends StatelessWidget {
  const CheckAuthStatusScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        } else {
          // Utilizamos addPostFrameCallback para ejecutar la lógica después de construir los widgets
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (snapshot.data == true) {
              context.go('/login-screen');
              //TODO
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
}
