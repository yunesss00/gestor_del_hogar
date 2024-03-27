import 'package:gestor_del_hogar/core/states_managment/state_manager.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';


class TaskStatus {
  final tasksStatus = StateManager.getListenableBean<Map<String, bool>>({});

  // Método para actualizar el estado de un usuario
  void updaTasksStatus(String user, bool isSelected) {
    tasksStatus.value[user] = isSelected;
    tasksStatus.notifyListeners();
  }

  void clearTasksStatus() {
    tasksStatus.value = {};
  }

  void addTasksStatus(List<Task> tasks) {
    for (Task task in tasks) {
      tasksStatus.value.addEntries([MapEntry(task.id.toString(), false)]);
      tasksStatus.notifyListeners();
    }
  }
}


