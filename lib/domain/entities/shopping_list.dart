import 'package:gestor_del_hogar/domain/domain.dart';

class ShoppingList {
  int id;
  double totalPrice;
  int userId;
  int homeShoppingList; //si es una lista de hogar 1, si no 0
  Home home;
  List<UserEntity> lstUsers;
  List<Product> lstProducts;

  
ShoppingList ({
  required this.id,
  required this.totalPrice,
  required this.userId,
  required this.homeShoppingList,
  required this.home,
  required this.lstUsers,
  required this.lstProducts,
});
}
