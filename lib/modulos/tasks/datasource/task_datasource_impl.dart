import 'package:dio/dio.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

import '../../../config/constants/environment.dart';
import '../../../domain/entities/assigned_task.dart';
import '../../../domain/entities/home.dart';
import '../../../domain/entities/task.dart' as task;
import 'task_datasource.dart';

class TaskDataSourceImpl implements TaskDataSource {
  static final _instance = TaskDataSourceImpl._internal();
  TaskDataSourceImpl._internal();

  static TaskDataSource getInstance() {
    return _instance;
  }

  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<List<AssignedTask>?> getDayTasks(
      Home home, DateTime currentDay) async {
    List<AssignedTask>? tasks;
    String dateStr = currentDay.toString().substring(0, 10);
    try {
      var url = '/task/assigned/home';
      var parameters = {'homeId': home.id, 'date': dateStr};

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
  Future<List<AssignedTask>?> getMyDayTasks(
      Home home, DateTime currentDay, UserEntity currentUser) async {
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
  Future<List<int>?> getDotListTasks(
      Home home, DateTime initDate, DateTime endDate) async {
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

  @override
  Future<bool> updateAssignedTask(AssignedTask task) async{
    try {
      var url = '/assignedTasks/update/${task.id}';
      var parameters = { 
        'id': task.id, 
        'userId': task.userId, 
        'task': task.task, 
        'date': task.date.toString().substring(0, 10), 
        'done': task.done,
        'priority': task.priority,
        'dayOfWeek': task.dayOfWeek,
        'homeId': task.homeId,
      };
          await dio.put(url, data: parameters);
          return true;
        } catch (e) {
          print(e);
          return false;
        }
    }
 


@override
Future<List<Itinerary>?> getItineraries(Home home) async {
  List<Itinerary>? itineraries;
  try {
    var url = '/itinerary/home/${home.id}';
    var response = await dio.get(url);
    
    itineraries = ((response.data as List<dynamic>)
        .map((jsonItem) => Itinerary.fromJson(jsonItem))
        .toList());
  } catch (e) {
    print(e);
  }
  return itineraries;
}

  @override
  Future<List<task.Task>?> getTasks(Home home) async {
    List<task.Task>? tasks;
    try {
      var url = '/task/home/${home.id}';
      var response = await dio.get(url);
      
      tasks = ((response.data as List<dynamic>)
          .map((jsonItem) => task.Task.fromJson(jsonItem))
          .toList());
    } catch (e) {
      print(e);
    }
    return tasks;
  }
  
  @override
  void updateTask(Task task) {
    try {
      var url = '/task';
      var parameters = {'id': task.id, 'name': task.name, 'description': task.description};
      dio.put(url, data: parameters);
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Future<bool> createTask(Task task, Home home, UserEntity currentUser) {
    try {
      var url = '/task';
      var parameters = {
        'name': task.name,
        'description': task.description,
        'homeId': home.id,
        'creator': currentUser.id
      };
      dio.post(url, data: parameters);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
  
  @override
  void deleteTask(Task task) {
    try {
      final taskId = task.id;
      var url = '/task';
      var parameters = {'id': taskId};
      dio.delete(url, data: parameters);
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Future<bool> assignTask(AssignedTask task) {
    try {
      var url = '/assignedTasks/create';
      var parameters = {
        'userId': task.userId,
        'task': task.task,
        'date': task.date.toString().substring(0, 10),
        'done': task.done,
        'priority': task.priority,
        'dayOfWeek': task.dayOfWeek,
        'homeId': task.homeId,
      };
      dio.post(url, data: parameters);
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }


}
