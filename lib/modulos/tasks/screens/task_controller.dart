

import 'dart:ffi';

import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/assigned_task.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:gestor_del_hogar/modulos/home/screens/home_controller.dart';

import '../../../domain/entities/home.dart';
import '../../../domain/entities/task.dart';

class TaskController {

  TaskController();

  Future<List<AssignedTask>?> getDayTasks(DateTime currentDay) async {
    HomeController homeController = HomeController();
    final home = await homeController.findMyHome();

    return await WebServicesManager.getTaskdataSource().getDayTasks(home!,currentDay);
  }



}