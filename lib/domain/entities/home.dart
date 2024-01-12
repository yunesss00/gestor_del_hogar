import 'package:gestor_del_hogar/domain/entities/shopping_list.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:gestor_del_hogar/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  final int? id;
  final String? name;
  final int? creator;
  final dynamic description;
  final List<UserEntity>? lstUsers;
  final List<ShoppingList>? lstShoppingList;
  final List<Task>? lstTasks;

  const Home({
    this.id,
    this.name,
    this.creator,
    this.description,
    this.lstUsers,
    this.lstShoppingList,
    this.lstTasks,
  });

  factory Home.fromJson(Map<String, dynamic> json) =>
      _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable()
class LstUsers {
  final int? id;
  final String? firstName;
  final String? lastName1;
  final String? lastName2;
  final String? email;
  final String? photo;
  final List<LstItineraries>? lstItineraries;
  final List<LstTasks>? lstTasks;

  const LstUsers({
    this.id,
    this.firstName,
    this.lastName1,
    this.lastName2,
    this.email,
    this.photo,
    this.lstItineraries,
    this.lstTasks,
  });

  factory LstUsers.fromJson(Map<String, dynamic> json) =>
      _$LstUsersFromJson(json);

  Map<String, dynamic> toJson() => _$LstUsersToJson(this);
}

@JsonSerializable()
class LstItineraries {
  final int? id;
  final int? homeId;
  final String? name;
  final List<LstTasks>? lstTasks;

  const LstItineraries({
    this.id,
    this.homeId,
    this.name,
    this.lstTasks,
  });

  factory LstItineraries.fromJson(Map<String, dynamic> json) =>
      _$LstItinerariesFromJson(json);

  Map<String, dynamic> toJson() => _$LstItinerariesToJson(this);
}

@JsonSerializable()
class LstTasks {
  final int? id;
  final int? homeId;
  final String? name;
  final int? creator;
  final int? done;

  const LstTasks({
    this.id,
    this.homeId,
    this.name,
    this.creator,
    this.done,
  });

  factory LstTasks.fromJson(Map<String, dynamic> json) =>
      _$LstTasksFromJson(json);

  Map<String, dynamic> toJson() => _$LstTasksToJson(this);
}

@JsonSerializable()
class LstShoppingList {
  final int? id;
  final int? totalPrice;
  final int? userId;
  final int? homeShoppingList;
  final List<LsProducts>? lsProducts;
  final int? user;

  const LstShoppingList({
    this.id,
    this.totalPrice,
    this.userId,
    this.homeShoppingList,
    this.lsProducts,
    this.user,
  });

  factory LstShoppingList.fromJson(Map<String, dynamic> json) =>
      _$LstShoppingListFromJson(json);

  Map<String, dynamic> toJson() => _$LstShoppingListToJson(this);
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
