import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';
import 'package:gestor_del_hogar/shared/infractrusture/services/key_value_storage_service.dart';
import 'package:gestor_del_hogar/shared/infractrusture/services/key_value_storage_service_impl.dart';

enum AuthStatus { cheking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.cheking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
    authRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final user = await authRepository.firebaseLogin(email, password);
      _setLoggedUser(user);
    } on WrongCredentials catch (e) {
      print(e);
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
      final user = await authRepository.firebaseLogin(email, password);
      _setLoggedUser(user);
    } on WrongCredentials catch (e) {
      await authRepository.firebaseLogout();
      print(e);
    } catch (e) {
      await authRepository.firebaseLogout();
      print(e);
    }
  }

  void _setLoggedUser(User? user) async {
    await keyValueStorageService.setKeyValue('token', user?.uid);

    state = state.copyWith(
        user: user, authStatus: AuthStatus.authenticated, errorMessage: '');
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');
    if (token == null) return logout();

    try {
      final user = await authRepository.firebaseCheckAuth();
      _setLoggedUser(user);
    } catch (e) {
      print(e);
    }
  }
}
