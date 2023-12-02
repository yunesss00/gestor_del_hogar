import 'package:gestor_del_hogar/domain/domain.dart';

class Itinerary {
  int id;
  int homeId;
  String name;
  List<UserEntity> lstUsers;
  List<Task> lstTasks;

  Itinerary({
    required this.id,
    required this.homeId,
    required this.name,
    required this.lstUsers,
    required this.lstTasks,
  });
}
