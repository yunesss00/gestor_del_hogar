


import 'package:gestor_del_hogar/modulos/home/datasource/home_datasource.dart';
import 'package:gestor_del_hogar/modulos/home/datasource/home_datasource_impl.dart';
import 'package:gestor_del_hogar/modulos/auth/datasource/auth_datasource_impl.dart';
import 'package:gestor_del_hogar/modulos/auth/datasource/auth_datasource.dart';

import '../../modulos/tasks/datasource/task_datasource.dart';
import '../../modulos/tasks/datasource/task_datasource_impl.dart';

class WebServicesManager {

  static HomeDataSource getHomedataSource(){
    return HomeDataSourceImpl.getInstance();
  }

  static AuthDataSource getAuthdataSource(){
    return AuthDataSourceImpl.getInstance();
  }

  static TaskDataSource getTaskdataSource(){
    return TaskDataSourceImpl.getInstance();
  }
}