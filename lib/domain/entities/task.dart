import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final int? id;
  final int? homeId;
  final String? name;
  final String? description;
  final int? creator;

  const Task({
    this.id,
    this.homeId,
    this.name,
    this.description,
    this.creator,
  });

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
