import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';


abstract class AuthDataSource {
  Future<UserEntity?> register(String firstName, String lastName1, String lastName2, String email);
  Future<User?> firebaseCreate(String email, String password);
  Future<User?> firebaseLogin(String email, String password);
  Future<void> firebaseLogout();
  Future<User?> firebaseCheckAuth();
  Future<UserEntity?> getCurrentUser();
}
