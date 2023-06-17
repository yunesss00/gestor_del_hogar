import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity userJsonToEntity(Map<String, dynamic> json) => UserEntity(
      id: json['id'],
      firstName: json['firstName'],
      lastName1: json['lastName1'],
      lastName2: json['lastName2'],
      email: json['email']);
}
