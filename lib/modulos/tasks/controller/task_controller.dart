import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart' as task;
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:gestor_del_hogar/modulos/home/controller/home_controller.dart';

class TaskController {

  HomeController homeController = HomeController();


  TaskController();

  Future<List<AssignedTask>?> getDayTasks(DateTime currentDay) async {
    final home = await homeController.findMyHome();

    return await WebServicesManager.getTaskdataSource()
        .getDayTasks(home!, currentDay);
  }

  Future<List<AssignedTask>?> getMyDayTasks(DateTime currentDay) async {
    final home = await homeController.findMyHome();
    UserEntity? currentUser =
        await WebServicesManager.getAuthdataSource().getCurrentUser();

    return await WebServicesManager.getTaskdataSource()
        .getMyDayTasks(home!, currentDay, currentUser!);
  }

  Future<List<int>?> getDotListTasks() async {
    final home = await homeController.findMyHome();
    final week = homeController.getWeekDays();

    return await WebServicesManager.getTaskdataSource()
        .getDotListTasks(home!, week[0], week[week.length - 1]);
  }

  Future<bool> updateAssignedTask(AssignedTask task) {
    return WebServicesManager.getTaskdataSource().updateAssignedTask(task);
  }

  Future<List<task.Task>?> getTasks() async{
    final home = await homeController.findMyHome();

    return await WebServicesManager.getTaskdataSource().getTasks(home!);
  }

  Future<List<Itinerary>?>getItineraries() async {
    final home = await homeController.findMyHome();

    return WebServicesManager.getTaskdataSource().getItineraries(home!);
  }

  void updateTask(int taskId, String name, String description) {
    Task task = Task(id: taskId, name: name, description: description);
    WebServicesManager.getTaskdataSource().updateTask(task);
  }

  Future<bool> createTask(Task task) async {
    final home = await homeController.findMyHome();
    final currentUser = await WebServicesManager.getAuthdataSource().getCurrentUser();
    return WebServicesManager.getTaskdataSource().createTask(task, home!, currentUser!);
  }
}
