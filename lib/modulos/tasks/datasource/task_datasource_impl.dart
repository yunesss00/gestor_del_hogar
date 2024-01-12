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
    String date_str =
    currentDay.toString().substring(0, 10);
    try {
      var url = '/task/assigned/home';
      var parameters = {
        'homeId': home.id,
        'date': date_str
      };

      var response = await dio.get(url, queryParameters: parameters);
      tasks = (response.data as List<dynamic>)
          .map((jsonItem) => AssignedTask.fromJson(jsonItem))
          .toList();
      //tasks = AssignedTask.fromJson(response.data) as List<AssignedTask>?;
    } catch (e) {
      print(e);
    }

    return tasks;
  }



}
