import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/widgets.dart';

import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: GeometricalBackground(
              child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            // Icon Banner
            const Icon(
              Icons.production_quantity_limits_rounded,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 80),

            Container(
              height: size.height - 260, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: _LoginForm(),
            )
          ],
        ),
      ))),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final AuthController authController = AuthController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text('Login', style: textStyles.titleLarge),
            const SizedBox(height: 90),
            CustomTextFormField(
              label: 'Correo',
              controller: controllerEmail,
              validator: (value){
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                if (!value.contains('@')) return "El correo no tiene formato válido.";
                if (!value.contains('.')) return "El correo no tiene formato válido.";
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              controller: controllerPassword,
              validator: (value){
              if (value == null || value.trim().isEmpty) return "Campo obligatorio";
              if (value.length<6) return "La contraseña es poco segura";
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: 'Iniciar sesión',
                  buttonColor: Colors.black,
                  onPressed: () {
                    authController.login(controllerEmail.text, controllerPassword.text);
                    context.push('/home-screen');
                  },
            )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta?'),
                TextButton(
                    onPressed: () => context.push('/register-screen'),
                    child: const Text('Crea una aquí'))
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
