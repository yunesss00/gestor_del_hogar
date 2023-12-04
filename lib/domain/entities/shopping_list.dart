import 'package:gestor_del_hogar/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_list.g.dart';

@JsonSerializable()
class ShoppingList {
  final int? id;
  final int? totalPrice;
  final int? userId;
  final int? homeShoppingList;
  final List<Product>? lsProducts;
  final int? user;

  const ShoppingList({
    this.id,
    this.totalPrice,
    this.userId,
    this.homeShoppingList,
    this.lsProducts,
    this.user,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);
}

@JsonSerializable()
class LsProducts {
  final int? id;
  final String? name;
  final double? productPrice;

  const LsProducts({
    this.id,
    this.name,
    this.productPrice,
  });

  factory LsProducts.fromJson(Map<String, dynamic> json) =>
      _$LsProductsFromJson(json);

  Map<String, dynamic> toJson() => _$LsProductsToJson(this);
}
