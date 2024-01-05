import 'package:gestor_del_hogar/domain/entities/home.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';


abstract class HomeDataSource {


  Future<Home?> create(String name, UserEntity currentUser);
  Future<void> addParticipants(int? homeId, int? participant);
  Future<Home?> findMyHome(UserEntity? currentUser);
  List<int> getWeekDays();
}
