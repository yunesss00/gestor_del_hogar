// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedTask _$AssignedTaskFromJson(Map<String, dynamic> json) => AssignedTask(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      userId: json['userId'] as int?,
      date: json['date'] as String?,
      dayOfWeek: json['dayOfWeek'] as int?,
      priority: json['priority'] as int?,
      done: json['done'] as int?,
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignedTaskToJson(AssignedTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'userId': instance.userId,
      'date': instance.date,
      'dayOfWeek': instance.dayOfWeek,
      'priority': instance.priority,
      'done': instance.done,
      'task': instance.task,
    };
