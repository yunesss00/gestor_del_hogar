import 'package:gestor_del_hogar/domain/entities/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itinerary.g.dart';

@JsonSerializable()
class Itinerary {
  final int? id;
  final int? homeId;
  final String? name;
  final String? description;
  final List<ItineraryTask>? lstItineraryTasks;

  const Itinerary({
    this.id,
    this.homeId,
    this.name,
    this.description,
    this.lstItineraryTasks,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryToJson(this);
}

@JsonSerializable()
class ItineraryTask {
  final int? id;
  final int? dayOfWeek;
  final int? deleleted;
  final List<Task>? lstTasks;

  const ItineraryTask({
    this.id,
    this.dayOfWeek,
    this.deleleted,
    this.lstTasks,
  });

  factory ItineraryTask.fromJson(Map<String, dynamic> json) =>
      _$ItineraryTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ItineraryTaskToJson(this);

  copyWith({required int dayOfWeek}) {}
}

@JsonSerializable()
class LstTasks {
  final int? id;
  final int? homeId;
  final String? name;
  final String? description;
  final int? creator;

  const LstTasks({
    this.id,
    this.homeId,
    this.name,
    this.description,
    this.creator,
  });

  factory LstTasks.fromJson(Map<String, dynamic> json) =>
      _$LstTasksFromJson(json);

  Map<String, dynamic> toJson() => _$LstTasksToJson(this);
}
