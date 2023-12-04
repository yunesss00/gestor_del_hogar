import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final int? id;
  final int? homeId;
  final String? name;
  final String? description;
  final int? creator;
  final int? done;

  const Task({
    this.id,
    this.homeId,
    this.name,
    this.description,
    this.creator,
    this.done,
  });

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
