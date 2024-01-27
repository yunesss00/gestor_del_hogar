import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/widgets.dart';

import '../../home/controller/home_controller.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginScreen({Key? key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              // Icon Banner
              const Icon(
                Icons.production_quantity_limits_rounded,
                color: Colors.white,
                size: 100,
              ),
              const SizedBox(height: 40),
              Container(
                height: size.height - 180, // 80 los dos sizebox y 100 el ícono
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black, // Fondo negro
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: const _LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final AuthController authController = AuthController();
    final HomeController homeController = HomeController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text('Login', style: textStyles.titleLarge),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Correo',
              controller: controllerEmail,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                if (!value.contains('@')) return "El correo no tiene formato válido.";
                if (!value.contains('.')) return "El correo no tiene formato válido.";
                return null;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              controller: controllerPassword,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                if (value.length < 6) return "La contraseña es demasiado corta";
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Iniciar sesión',
                buttonColor: Colors.black,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (await authController.login(controllerEmail.text, controllerPassword.text)) {
                      if (await homeController.findMyHome() !=null){
                        // ignore: use_build_context_synchronously
                        context.go('/my-home-screen');
                      }else{
                        // ignore: use_build_context_synchronously
                        context.go('/home-screen');
                      }


                    }else{
                      const snackBar = SnackBar(
                          content: Text('Usuario no encontrado'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                  onPressed: () => context.push('/register-screen'),
                  child: const Text('Crea una aquí'),
                ),
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
