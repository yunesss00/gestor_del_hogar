import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/modulos/auth/controller/auth_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RegisterScreen({Key? key});

  static const name = 'register-screen';

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
              const SizedBox(height: 80),
              // Icon Banner
              const Icon(
                Icons.app_registration_rounded,
                color: Colors.white,
                size: 100,
              ),
              const SizedBox(height: 80),

              Container(
                height: size.height + 100, // 80 los dos sizebox y 100 el ícono
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black, // Fondo negro
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: const _RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final textStyles = Theme.of(context).textTheme;
    final AuthController authController = AuthController();
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerLastName1 = TextEditingController();
    final TextEditingController controllerLastName2 = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    final TextEditingController controllerPassword2 = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text('Registro', style: textStyles.titleLarge),
            const SizedBox(height: 40),
            CustomTextFormField(
              label: 'Nombre',
              keyboardType: TextInputType.name,
              controller: controllerName,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Primer apellido',
              keyboardType: TextInputType.name,
              controller: controllerLastName1,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Segundo apellido',
              keyboardType: TextInputType.name,
              controller: controllerLastName2,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Correo',
              keyboardType: TextInputType.emailAddress,
              controller: controllerEmail,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                if (!value.contains('@')) return "El correo no tiene formato válido.";
                if (!value.contains('.')) return "El correo no tiene formato válido.";
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              controller: controllerPassword,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                if (value.length < 6) return "La contraseña es poco segura";
                return null;
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Repita contraseña',
              obscureText: true,
              controller: controllerPassword2,
              validator: (value) {
                if (value == null || value.trim().isEmpty) return "Campo obligatorio";
                if (value.length < 6) return "La contraseña es poco segura";
                if (value != controllerPassword.text) return "Las contraseñas no coinciden";
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Registrarse',
                buttonColor: Colors.black,
                onPressed: () async {
                  if (_formKey.currentState!.validate()){
                    if (await authController.register(
                        controllerName.text,
                        controllerLastName1.text,
                        controllerLastName2.text,
                        controllerEmail.text,
                        controllerPassword2.text)) {
                      // ignore: use_build_context_synchronously
                      context.go('/home-screen');
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Error al crear el usuario'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }



                },
              ),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes una cuenta?'),
                TextButton(
                  onPressed: () => context.push('/login-screen'),
                  child: const Text('Inicia sesión aquí'),
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
