import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<UserEntity> register(
      String firstName, String lastName1, String lastName2, String email) {
    return dataSource.register(firstName, lastName1, lastName2, email);
  }

  @override
  Future<User?> firebaseCreate(String email, String password) {
    return dataSource.firebaseCreate(email, password);
  }

  @override
  Future<User?> firebaseLogin(String email, String password) {
    return dataSource.firebaseLogin(email, password);
  }

  @override
  Future<void> firebaseLogout() {
    return dataSource.firebaseLogout();
  }
}
