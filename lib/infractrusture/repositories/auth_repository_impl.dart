import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(AuthDataSource? dataSource)
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return login(email, password);
  }

  @override
  Future<User> register(String firstName, String lastName1, String lastName2,
      String email, String password) {
    return register(firstName, lastName1, lastName2, email, password);
  }
}
