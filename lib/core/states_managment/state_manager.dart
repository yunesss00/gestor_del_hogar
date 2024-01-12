import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../modulos/home/screens/home_controller.dart';
import '../../modulos/auth/screens/auth_controller.dart';
import '../../modulos/tasks/screens/task_controller.dart';


class StateManager{
  static final _instance = StateManager._internal();
  StateManager._internal();

  static void initializeApp() {
   GetIt.instance.registerLazySingleton<HomeController>(() => HomeController());
   GetIt.instance.registerLazySingleton<AuthController>(() => AuthController());
   GetIt.instance.registerLazySingleton<TaskController>(() => TaskController());



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
