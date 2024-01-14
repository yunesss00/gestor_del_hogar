import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

import '../../../config/constants/environment.dart';
import '../../../domain/entities/assigned_task.dart';
import '../../../domain/entities/home.dart';
import '../../../domain/entities/task.dart';
import 'task_datasource.dart';


class TaskDataSourceImpl implements TaskDataSource {

  static final _instance = TaskDataSourceImpl._internal();
  TaskDataSourceImpl._internal();

  static TaskDataSource getInstance() {
    return _instance;
  }
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));


  @override
  Future<List<AssignedTask>?> getDayTasks(Home home,DateTime currentDay) async {

    List<AssignedTask>? tasks;
    String dateStr =
    currentDay.toString().substring(0, 10);
    try {
      var url = '/task/assigned/home';
      var parameters = {
        'homeId': home.id,
        'date': dateStr
      };

      var response = await dio.get(url, queryParameters: parameters);
      tasks = (response.data as List<dynamic>)
          .map((jsonItem) => AssignedTask.fromJson(jsonItem))
          .toList();
    } catch (e) {
      print(e);
    }

    return tasks;
  }
  
  @override
  Future<List<AssignedTask>?> getMyDayTasks(Home home, DateTime currentDay, UserEntity currentUser) async {
    List<AssignedTask>? tasks;
    String dateStr = currentDay.toString().substring(0, 10);
    try {
      var url = '/task/assigned/home/myTasks';
      var parameters = {
        'homeId': home.id,
        'userId': currentUser.id,
        'date': dateStr
      };

      var response = await dio.get(url, queryParameters: parameters);
      tasks = (response.data as List<dynamic>)
          .map((jsonItem) => AssignedTask.fromJson(jsonItem))
          .toList();
    } catch (e) {
      print(e);
    }

    return tasks;
  }
  
  @override
  Future<List<int>?> getDotListTasks(Home home, DateTime initDate, DateTime endDate) async{
    List<int>? dotList;
    try {
      var url = '/task/assigned/home/dotList';
      var parameters = {
        'homeId': home.id,
        'initDate': initDate.toString().substring(0, 10),
        'endDate': endDate.toString().substring(0, 10) 
      };

      var response = await dio.get(url, queryParameters: parameters);
      dotList = (response.data as List<dynamic>)
        .map((jsonItem) => int.parse(jsonItem.toString()))
        .toList();
    } catch (e) {
      print(e);
    }
    return dotList;
  }



}
