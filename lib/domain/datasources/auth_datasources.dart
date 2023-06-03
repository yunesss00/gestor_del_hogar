import '../domain.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String firstName, String lastName1, String lastName2, String email, String password);
  Future<User> checkAuthStatus(String token);
}
