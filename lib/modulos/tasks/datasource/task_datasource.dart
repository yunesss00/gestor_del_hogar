import 'package:gestor_del_hogar/domain/entities/home.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

import '../../../domain/entities/assigned_task.dart';
import '../../../domain/entities/task.dart';


abstract class TaskDataSource {


  Future<List<AssignedTask>?> getDayTasks(Home home,DateTime currentDay) ;
}
