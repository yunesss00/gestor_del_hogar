import 'package:firebase_auth/firebase_auth.dart';

import '../domain.dart';

abstract class AuthDataSource {
  Future<UserEntity> register(String firstName, String lastName1, String lastName2, String email);
  
  Future<User?> firebaseCreate(String email, String password);
  Future<User?> firebaseLogin(String email, String password);
  Future<void> firebaseLogout();
}
