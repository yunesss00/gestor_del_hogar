import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

import '../../config/constants/environment.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  

  @override
  Future<Home> create(String name, int creator) async {
    AuthDataSourceImpl? authDataSource = AuthDataSourceImpl();
    try {
      final UserEntity? currentUser = await authDataSource.getCurrentUser();

      final response =
          await dio.post('/home', data: {'name': name, 'creator': currentUser?.getId});

      final home = HomeMapper.homeJsonToEntity(response.data);
      return home;
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
