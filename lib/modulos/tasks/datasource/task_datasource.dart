import 'package:gestor_del_hogar/domain/entities/home.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

import '../../../domain/entities/assigned_task.dart';
import '../../../domain/entities/itinerary.dart';
import '../../../domain/entities/task.dart' as task;

abstract class TaskDataSource {
  Future<List<AssignedTask>?> getDayTasks(Home home, DateTime currentDay);
  Future<List<AssignedTask>?> getMyDayTasks(
      Home home, DateTime currentDay, UserEntity currentUser);
  Future<List<int>?> getDotListTasks(
      Home home, DateTime initDay, DateTime endDay);
  Future<bool> updateAssignedTask(AssignedTask task);
  Future<List<task.Task>?> getTasks(Home home);
  Future<List<Itinerary>?> getItineraries(Home home);
  void updateTask(Task task);
  Future<bool> createTask(Task task, Home home, UserEntity currentUser);
}
