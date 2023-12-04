// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName1: json['lastName1'] as String?,
      lastName2: json['lastName2'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      lstItineraries: (json['lstItineraries'] as List<dynamic>?)
          ?.map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName1': instance.lastName1,
      'lastName2': instance.lastName2,
      'email': instance.email,
      'photo': instance.photo,
      'lstItineraries': instance.lstItineraries,
      'lstTasks': instance.lstTasks,
    };

LstItineraries _$LstItinerariesFromJson(Map<String, dynamic> json) =>
    LstItineraries(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => LstTasks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LstItinerariesToJson(LstItineraries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'lstTasks': instance.lstTasks,
    };

LstTasks _$LstTasksFromJson(Map<String, dynamic> json) => LstTasks(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      creator: json['creator'] as int?,
      done: json['done'] as int?,
    );

Map<String, dynamic> _$LstTasksToJson(LstTasks instance) => <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'creator': instance.creator,
      'done': instance.done,
    };
