import 'package:gestor_del_hogar/domain/domain.dart';

class HomeMapper {
  static Home homeJsonToEntity(Map<String, dynamic> json) => Home(
      id: json['id'],
      name: json['name'],
      creator: json['creator']);
}
