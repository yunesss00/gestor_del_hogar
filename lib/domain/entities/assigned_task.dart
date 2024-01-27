import 'package:json_annotation/json_annotation.dart';

part 'assigned_task.g.dart';

@JsonSerializable()
class AssignedTask {
  final int? id;
  final int? homeId;
  final int? userId;
  final String? date;
  final int? dayOfWeek;
  final int? priority;
  final int? done;
  final Task? task;

  const AssignedTask({
    this.id,
    this.homeId,
    this.userId,
    this.date,
    this.dayOfWeek,
    this.priority,
    this.done,
    this.task,
  });

  factory AssignedTask.fromJson(Map<String, dynamic> json) =>
      _$AssignedTaskFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedTaskToJson(this);

  AssignedTask copyWith({required int done}) {
    return AssignedTask(
      id: id,
      homeId: homeId,
      userId: userId,
      date: date,
      dayOfWeek: dayOfWeek,
      priority: priority,
      done: done,
      task: task,
    );
  }
}

@JsonSerializable()
class Task {
  final int? id;
  final int? homeId;
  final String? name;
  final int? creator;
  final String description;

  const Task({
    this.id,
    this.homeId,
    this.name,
    this.creator,
    required this.description,
  });

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
