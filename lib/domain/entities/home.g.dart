// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      id: json['id'] as int?,
      name: json['name'] as String?,
      creator: json['creator'] as int?,
      description: json['description'],
      lstUsers: (json['lstUsers'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      lstShoppingList: (json['lstShoppingList'] as List<dynamic>?)
          ?.map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
          .toList(),
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creator': instance.creator,
      'description': instance.description,
      'lstUsers': instance.lstUsers,
      'lstShoppingList': instance.lstShoppingList,
      'lstTasks': instance.lstTasks,
    };

LstUsers _$LstUsersFromJson(Map<String, dynamic> json) => LstUsers(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName1: json['lastName1'] as String?,
      lastName2: json['lastName2'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      lstItineraries: (json['lstItineraries'] as List<dynamic>?)
          ?.map((e) => LstItineraries.fromJson(e as Map<String, dynamic>))
          .toList(),
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => LstTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LstUsersToJson(LstUsers instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName1': instance.lastName1,
      'lastName2': instance.lastName2,
      'email': instance.email,
      'photo': instance.photo,
      'lstItineraries': instance.lstItineraries,
      'lstTasks': instance.lstTasks,
    };

LstItineraries _$LstItinerariesFromJson(Map<String, dynamic> json) =>
    LstItineraries(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => LstTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LstItinerariesToJson(LstItineraries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'lstTasks': instance.lstTasks,
    };

LstTasks _$LstTasksFromJson(Map<String, dynamic> json) => LstTasks(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      creator: json['creator'] as int?,
      done: json['done'] as int?,
    );

Map<String, dynamic> _$LstTasksToJson(LstTasks instance) => <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'creator': instance.creator,
      'done': instance.done,
    };

LstShoppingList _$LstShoppingListFromJson(Map<String, dynamic> json) =>
    LstShoppingList(
      id: json['id'] as int?,
      totalPrice: json['totalPrice'] as int?,
      userId: json['userId'] as int?,
      homeShoppingList: json['homeShoppingList'] as int?,
      lsProducts: (json['lsProducts'] as List<dynamic>?)
          ?.map((e) => LsProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] as int?,
    );

Map<String, dynamic> _$LstShoppingListToJson(LstShoppingList instance) =>
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
