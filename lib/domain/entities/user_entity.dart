import 'package:gestor_del_hogar/domain/entities/itinerary.dart';
import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final int? id;
  final String? firstName;
  final String? lastName1;
  final String? lastName2;
  final String? email;
  final String? photo;
  final List<Itinerary>? lstItineraries;
  final List<Task>? lstTasks;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName1,
    this.lastName2,
    this.email,
    this.photo,
    this.lstItineraries,
    this.lstTasks,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
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
