import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestor_del_hogar/core/web_services/web_services_manager.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';


class AuthController {



  AuthController();


  void register (String firstName, String lastName1, String lastName2, String email, String password){
    WebServicesManager.getAuthdataSource().register(firstName, lastName1, lastName2, email);
    WebServicesManager.getAuthdataSource().firebaseCreate(email,password);
  }

  void login(String email, String password) {
    WebServicesManager.getAuthdataSource().firebaseLogin(email, password);
  }

  void logout() {
    WebServicesManager.getAuthdataSource().firebaseLogout();
  }
}