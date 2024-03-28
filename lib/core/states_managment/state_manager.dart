import 'package:flutter/foundation.dart';
import 'package:gestor_del_hogar/modulos/auth/controller/user_status.dart';
import 'package:gestor_del_hogar/modulos/tasks/controller/datepicker_controller.dart';
import 'package:gestor_del_hogar/modulos/tasks/controller/task_status.dart';
import 'package:get_it/get_it.dart';

import '../../modulos/home/controller/home_controller.dart';
import '../../modulos/auth/controller/auth_controller.dart';
import '../../modulos/tasks/controller/task_controller.dart';


class StateManager{
  static final _instance = StateManager._internal();
  StateManager._internal();

  static void initializeApp() {
    GetIt.instance.registerLazySingleton<HomeController>(() => HomeController());
    GetIt.instance.registerLazySingleton<AuthController>(() => AuthController());
    GetIt.instance.registerLazySingleton<TaskController>(() => TaskController());
    GetIt.instance.registerLazySingleton<UserStatus>(() => UserStatus());
    GetIt.instance.registerLazySingleton<TaskStatus>(() => TaskStatus());
    GetIt.instance.registerLazySingleton<DatePickerController>(() => DatePickerController());

    


  }

  static StateManager getInstance() {
    return _instance;
  }

  T get<T extends Object>(){
    final stateManager = GetIt.instance<T>();
    return stateManager;
  }

  static ValueNotifier<T> getListenableBean<T>(T obj){
    return ValueNotifier<T>(obj);
  }

}
