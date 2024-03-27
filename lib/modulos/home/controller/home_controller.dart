


import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';

import '../../../core/states_managment/state_manager.dart';
import '../../../domain/entities/home.dart';

class HomeController {

  final participantsList = StateManager.getListenableBean<List<UserEntity>?>([]);

  HomeController();


  Future<void> create(String name) async {
    UserEntity? currentUser  = await WebServicesManager.getAuthdataSource().getCurrentUser();
    Home? home = await WebServicesManager.getHomedataSource().create(name, currentUser!);
    WebServicesManager.getHomedataSource().addParticipants(home?.id, currentUser.id);
  }

  Future<Home?> findMyHome() async {
    UserEntity? currentUser  = await WebServicesManager.getAuthdataSource().getCurrentUser();
    return await WebServicesManager.getHomedataSource().findMyHome(currentUser);
  }

  Future<void> addParticipants(int userId, int homeId) async {
    WebServicesManager.getHomedataSource().addParticipants(homeId, userId);
  }

  List<DateTime> getWeekDays(){
    DateTime now = DateTime.now();

    // Obtener el primer día de la semana (lunes)
    DateTime firsDay = now.subtract(Duration(days: now.weekday - 1));

    // Crear un array de 7 días desde el lunes hasta el domingo
    List<DateTime> weekDays = [];
    for (int i = 0; i < 7; i++) {
      DateTime day = firsDay.add(Duration(days: i));
      weekDays.add(day);
    }

    return weekDays;
  }

  Future<void> getAllParticipants() async {
    Home? home = await findMyHome();
    participantsList.value = await WebServicesManager.getHomedataSource().getAllParticipants(home);
    participantsList.notifyListeners();
  }

}