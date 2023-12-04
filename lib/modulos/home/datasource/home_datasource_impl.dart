import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

import '../../../config/constants/environment.dart';
import '../../../domain/entities/home.dart';
import 'home_datasource.dart';


class HomeDataSourceImpl implements HomeDataSource {

  static final _instance = HomeDataSourceImpl._internal();
  HomeDataSourceImpl._internal();

  static HomeDataSource getInstance() {
    return _instance;
  }
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<Home?> create(String name, UserEntity currentUser) async {
    Home? home;
    try {
      final response = await dio
          .post('/home', data: {'name': name, 'creator': currentUser.id});

      home = Home.fromJson(response.data);

    } catch (e) {
      print(e);
    }
    return home;
  }

  @override
  Future<void> addParticipants(int? homeId, int? participant) async {
    try {
      await dio.post('/home/participants',
          data: {'userId': participant, 'homeId': homeId, 'deleted': 0});
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Home?> findMyHome(UserEntity? currentUser) async{
    Home? home;
    try {
      var url = '/home/myHome';
      var parameters = {'user': currentUser?.id};

      var response = await dio.get(url, queryParameters: parameters);

      home = Home.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return home;
  }

}
