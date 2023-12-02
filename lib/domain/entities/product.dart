import 'package:gestor_del_hogar/domain/domain.dart';

class Product {
  int id;
  String name;
  double productPrice;
  List<ShoppingList> lstShoppingLists;

  Product({
    required this.id,
    required this.name,
    required this.productPrice,
    required this.lstShoppingLists,
  });
}
