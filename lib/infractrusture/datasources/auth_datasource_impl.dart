import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/config/config.dart';
import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserEntity> register(String firstName, String lastName1,
      String lastName2, String email) async {
    try {
      final response = await dio.post('/user', data: {
        'firstName': firstName,
        'lastName1': lastName1,
        'lastName2': lastName2,
        'email': email
      });

      final user = UserMapper.userJsonToEntity(response.data);

      return user;
    } catch (e) {
      print(e);
      throw WrongCredentials();
    }
  }

  @override
  Future<User?> firebaseCreate(String email, String password) async {
    User? user;
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<User?> firebaseLogin(String email, String password) async {
    User? user;

    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return user;
  }

  @override
  Future<void> firebaseLogout() {
    // TODO: implement firebaseLogout
    throw UnimplementedError();
  }
}
