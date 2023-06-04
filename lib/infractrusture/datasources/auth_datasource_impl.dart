import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/config/config.dart';
import 'package:gestor_del_hogar/domain/domain.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl
    )
  );

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async{
    
   throw UnimplementedError();
  }

  @override
  Future<User> register(String firstName, String lastName1, String lastName2,
      String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
