import 'package:gestor_del_hogar/core/states_managment/state_manager.dart';

import '../../../domain/entities/user_entity.dart';

class UserStatus {
  final usersStatus = StateManager.getListenableBean<Map<String, bool>>({});

  // Método para actualizar el estado de un usuario
  void updateUserStatus(String user, bool isSelected) {
    usersStatus.value[user] = isSelected;
    usersStatus.notifyListeners();
  }

  void clearUsersStatus() {
    usersStatus.value = {};
  }

  void addUsersStatus(List<UserEntity> users) {
    for (UserEntity user in users) {
      usersStatus.value.addEntries([MapEntry(user.id.toString(), false)]);
      usersStatus.notifyListeners();
    }
  }
}