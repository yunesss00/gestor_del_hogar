import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/config/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'auth_datasource.dart';

class AuthDataSourceImpl extends AuthDataSource {
  static final _instance = AuthDataSourceImpl._internal();
  AuthDataSourceImpl._internal();

  static AuthDataSource getInstance() {
    return _instance;
  }

  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserEntity?> register(String firstName, String lastName1,
      String lastName2, String email) async {
    UserEntity? user;
    try {
      final response = await dio.post('/user', data: {
        'firstName': firstName,
        'lastName1': lastName1,
        'lastName2': lastName2,
        'email': email
      });

     user = UserEntity.fromJson(response.data);

    } catch (e) {
      print(e);
    }
    return user;

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
  Future<void> firebaseLogout() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<User?> firebaseCheckAuth() async {
    try {
      final user = _auth.currentUser;
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    UserEntity? user ;

    try {
      final firebaseUser = _auth.currentUser;
      var url = '/user/find';
      var parameters = {'email': firebaseUser!.email};

      var response = await dio.get(url, queryParameters: parameters);

      user = UserEntity.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return user;
  }
}
