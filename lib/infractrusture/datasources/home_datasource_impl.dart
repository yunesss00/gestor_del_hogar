import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

import '../../config/constants/environment.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<Home?> create(String name, int creator) async {
    AuthDataSourceImpl? authDataSource = AuthDataSourceImpl();
    Home? home;
    try {
      final UserEntity? currentUser = await authDataSource.getCurrentUser();

      final response = await dio
          .post('/home', data: {'name': name, 'creator': currentUser?.getId});

      home = HomeMapper.homeJsonToEntity(response.data);

      addParticipants(home.id, currentUser!.getId);
    } catch (e) {
      print(e);
    }
    return home;
  }

  @override
  Future<void> addParticipants(int homeId, int participant) async {
    try {
      await dio.post('/home/participants',
          data: {'userId': participant, 'homeId': homeId, 'deleted': 0});
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Home?> findMyHome(int user) async {
    AuthDataSourceImpl? authDataSource = AuthDataSourceImpl();
    Home? home;
    try {
      final currentUser = await authDataSource.getCurrentUser();
      var url = '/home/myHome';
      var parameters = {'user': currentUser!.getId};

      var response = await dio.get(url, queryParameters: parameters);

      home = HomeMapper.homeJsonToEntity(response.data);
    } catch (e) {
      print(e);
    }
    return home;
  }
}
