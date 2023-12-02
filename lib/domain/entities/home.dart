import 'package:gestor_del_hogar/domain/domain.dart';

class Home {
  int id;
  String name;
  int creator;
  List<ShoppingList> lstShoppingLists;
  List<UserEntity> lstUsers;

  Home({
    required this.id,
    required this.name,
    required this.creator,
    required this.lstShoppingLists,
    required this.lstUsers,
  });
}
