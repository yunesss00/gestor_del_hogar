import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:gestor_del_hogar/presentation/providers/auth/auth_provider.dart';
import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/shared/infractrusture/inputs/inputs.dart';

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password1;
  final Password password2;
  final Name name;
  final LastName lastName1;
  final LastName lastName2;

  RegisterFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password1 = const Password.pure(),
      this.password2 = const Password.pure(),
      this.name = const Name.pure(),
      this.lastName1 = const LastName.pure(),
      this.lastName2 = const LastName.pure()});

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password1,
    Password? password2,
    Name? name,
    LastName? lastName1,
    LastName? lastName2,
  }) =>
      RegisterFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          email: email ?? this.email,
          password1: password1 ?? this.password1,
          password2: password2 ?? this.password2,
          name: name ?? this.name,
          lastName1: lastName1 ?? this.lastName1,
          lastName2: lastName2 ?? this.lastName2);

  @override
  String toString() {
    return '''
    LoginFormState:
      isPosting: $isPosting
      isFormPosted: $isFormPosted
      isValid: $isValid
      email: $email
      password1: $password1
      password2: $password2
      name: $name
      lastname: $lastName1 $lastName2
  ''';
  }
}

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final registerUserCallBack = ref.watch(authProvider.notifier).registerUser;

  return RegisterFormNotifier(
    registerUserCallBack: registerUserCallBack,
  );
});

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String, String, String) registerUserCallBack;

  RegisterFormNotifier({
    required this.registerUserCallBack,
  }) : super(RegisterFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate([
          newEmail,
          state.password1,
          state.password2,
          state.name,
          state.lastName1,
          state.lastName2
        ]));
  }

  onPassword1Changed(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password1: newPassword,
        isValid: Formz.validate([
          newPassword,
          state.email,
          state.password2,
          state.lastName1,
          state.lastName2,
          state.name
        ]));
  }

  onPassword2Changed(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password2: newPassword,
        isValid: Formz.validate([
          newPassword,
          state.email,
          state.password1,
          state.lastName1,
          state.lastName2,
          state.name
        ]));
  }

  onNameChanged(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid: Formz.validate([
          newName,
          state.email,
          state.password1,
          state.password2,
          state.lastName1,
          state.lastName2
        ]));
  }

  onLastName1Changed(String value) {
    final newLastName = LastName.dirty(value);
    state = state.copyWith(
        lastName1: newLastName,
        isValid: Formz.validate([
          newLastName,
          state.email,
          state.lastName2,
          state.name,
          state.password1,
          state.password2
        ]));
  }

  onLastName2Changed(String value) {
    final newLastName = LastName.dirty(value);
    state = state.copyWith(
        lastName2: newLastName,
        isValid: Formz.validate([
          newLastName,
          state.email,
          state.lastName1,
          state.name,
          state.password1,
          state.password2
        ]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    if (state.password1.value != state.password2.value) return;

    await registerUserCallBack(state.email.value, state.password1.value,
        state.name.value, state.lastName1.value, state.lastName2.value);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password1 = Password.dirty(state.password1.value);
    final password2 = Password.dirty(state.password2.value);
    final name = Name.dirty(state.name.value);
    final lastName1 = LastName.dirty(state.lastName1.value);
    final lastName2 = LastName.dirty(state.lastName2.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password1: password1,
        password2: password2,
        name: name,
        lastName1: lastName1,
        lastName2: lastName2,
        isValid: Formz.validate(
            [email, password1, password2, name, lastName1, lastName2]));
  }
}
