// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      creator: json['creator'] as int?,
      done: json['done'] as int?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'description': instance.description,
      'creator': instance.creator,
      'done': instance.done,
    };
