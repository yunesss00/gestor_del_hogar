import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itinerary.g.dart';

@JsonSerializable()
class Itinerary {
  final int? id;
  final int? homeId;
  final String? name;
  final String? description;
  final List<Task>? lstTasks;

  const Itinerary({
    this.id,
    this.homeId,
    this.name,
    this.description,
    this.lstTasks,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryToJson(this);
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
