import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';
import 'package:gestor_del_hogar/infractrusture/repositories/auth_repository_impl.dart';

enum AuthStatus { cheking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final UserEntity? userEntity;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.cheking,
    this.userEntity,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    UserEntity? userEntity,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          userEntity: userEntity ?? this.userEntity,
          errorMessage: errorMessage ?? this.errorMessage);
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    try {
      await authRepository.firebaseLogin(email, password);
    } on WrongCredentials catch (e) {
      await authRepository.firebaseLogout();
    } catch (e) {
      await authRepository.firebaseLogout();
    }
  }

  void registerUser(String email, String password, String name,
      String lastName1, String lastName2) async {
    try {
      await authRepository.firebaseCreate(email, password);
      await authRepository.register(name, lastName1, lastName2, email);
      await authRepository.firebaseLogin(email, password);
    } on WrongCredentials catch (e) {
      await authRepository.firebaseLogout();
      print(e);
    } catch (e) {
      await authRepository.firebaseLogout();
       print(e);}
  }

  void checkAuthStatus() async {}
}
