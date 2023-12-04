// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) => ShoppingList(
      id: json['id'] as int?,
      totalPrice: json['totalPrice'] as int?,
      userId: json['userId'] as int?,
      homeShoppingList: json['homeShoppingList'] as int?,
      lsProducts: (json['lsProducts'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as int?,
    );

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalPrice': instance.totalPrice,
      'userId': instance.userId,
      'homeShoppingList': instance.homeShoppingList,
      'lsProducts': instance.lsProducts,
      'user': instance.user,
    };

LsProducts _$LsProductsFromJson(Map<String, dynamic> json) => LsProducts(
      id: json['id'] as int?,
      name: json['name'] as String?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LsProductsToJson(LsProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productPrice': instance.productPrice,
    };
