import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';


class AuthController {



  AuthController();


  Future<bool> register (String firstName, String lastName1, String lastName2, String email, String password) async {
    final userEntity = await WebServicesManager.getAuthdataSource().register(firstName, lastName1, lastName2, email);
    final user = await WebServicesManager.getAuthdataSource().firebaseCreate(email,password);
    return (user==null || userEntity== null) ? false : true;

  }

  Future<bool> login(String email, String password) async {
    final user = await WebServicesManager.getAuthdataSource().firebaseLogin(email, password);
    return user==null ? false : true;
  }

  Future<void> logout()  async {
    WebServicesManager.getAuthdataSource().firebaseLogout();
  }

  Future<bool> checkStatus() async {
    final user = await WebServicesManager.getAuthdataSource().firebaseCheckAuth();
    if (user!=null) {
      return true;
    }else{
      return false;
    }
  }


}