import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/config/config.dart';
import 'package:gestor_del_hogar/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:gestor_del_hogar/presentation/shared/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const name = 'register-screen';

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
              Icons.app_registration_rounded,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 80),

            Container(
              height: size.height - 160, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: const _RegisterForm(),
            )
          ],
        ),
      ))),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerForm = ref.watch(registerFormProvider);
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('Registro', style: textStyles.titleLarge),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: 'Nombre',
            keyboardType: TextInputType.name,
            onChanged: (value) =>
                ref.read(registerFormProvider.notifier).onNameChanged(value),
            errorMessage: registerForm.isFormPosted
                ? registerForm.name.errorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Primer apellido',
            keyboardType: TextInputType.name,
            onChanged: (value) => ref
                .read(registerFormProvider.notifier)
                .onLastName1Changed(value),
            errorMessage: registerForm.isFormPosted
                ? registerForm.lastName1.errorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Segundo apellido',
            keyboardType: TextInputType.name,
            onChanged: (value) => ref
                .read(registerFormProvider.notifier)
                .onLastName2Changed(value),
            errorMessage: registerForm.isFormPosted
                ? registerForm.lastName2.errorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) =>
                ref.read(registerFormProvider.notifier).onEmailChanged(value),
            errorMessage: registerForm.isFormPosted
                ? registerForm.email.errorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => ref
                .read(registerFormProvider.notifier)
                .onPassword1Changed(value),
            errorMessage: registerForm.isFormPosted
                ? registerForm.password1.errorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Repita contraseña',
            obscureText: true,
            onChanged: (value) => ref
                .read(registerFormProvider.notifier)
                .onPassword2Changed(value),
            errorMessage: registerForm.isFormPosted
                ? registerForm.password2.errorMessage
                : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Registrarse',
                buttonColor: Colors.black,
                onPressed: () {
                  ref.read(registerFormProvider.notifier).onFormSubmit();
                },
              )),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes una cuenta?'),
              TextButton(
                  onPressed: () => context.push('/login-screen'),
                  child: const Text('Inicia sesión aquí'))
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
