

import 'dart:ffi';

import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:gestor_del_hogar/modulos/home/datasource/home_datasource.dart';
import 'package:gestor_del_hogar/modulos/home/datasource/home_datasource_impl.dart';

import '../../../domain/entities/home.dart';

class HomeController {



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



}