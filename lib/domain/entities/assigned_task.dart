import 'package:gestor_del_hogar/domain/entities/task.dart';
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