import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';
import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart' as task;
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:gestor_del_hogar/modulos/home/controller/home_controller.dart';

class TaskController {
  TaskController();

  Future<List<AssignedTask>?> getDayTasks(DateTime currentDay) async {
    HomeController homeController = HomeController();
    final home = await homeController.findMyHome();

    return await WebServicesManager.getTaskdataSource()
        .getDayTasks(home!, currentDay);
  }

  Future<List<AssignedTask>?> getMyDayTasks(DateTime currentDay) async {
    HomeController homeController = HomeController();
    final home = await homeController.findMyHome();
    UserEntity? currentUser =
        await WebServicesManager.getAuthdataSource().getCurrentUser();

    return await WebServicesManager.getTaskdataSource()
        .getMyDayTasks(home!, currentDay, currentUser!);
  }

  Future<List<int>?> getDotListTasks() async {
    HomeController homeController = HomeController();
    final home = await homeController.findMyHome();
    final week = homeController.getWeekDays();

    return await WebServicesManager.getTaskdataSource()
        .getDotListTasks(home!, week[0], week[week.length - 1]);
  }

  void updateTask(AssignedTask task) {
    WebServicesManager.getTaskdataSource().updateTask(task);
  }

  Future<List<task.Task>?> getTasks() async{
    HomeController homeController = HomeController();
    final home = await homeController.findMyHome();

    return await WebServicesManager.getTaskdataSource().getTasks(home!);
  }

  Future<List<Itinerary>?>getItineraries() async {
    HomeController homeController = HomeController();
    final home = await homeController.findMyHome();

    return WebServicesManager.getTaskdataSource().getItineraries(home!);
  }
}
