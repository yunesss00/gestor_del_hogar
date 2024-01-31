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
      photo: json['photo'],
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
      description: json['description'] as String?,
      lstItineraryTasks: (json['lstItineraryTasks'] as List<dynamic>?)
          ?.map((e) => ItineraryTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LstItinerariesToJson(LstItineraries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'description': instance.description,
      'lstItineraryTasks': instance.lstItineraryTasks,
    };

LstItineraryTasks _$LstItineraryTasksFromJson(Map<String, dynamic> json) =>
    LstItineraryTasks(
      id: json['id'] as int?,
      dayOfWeek: json['dayOfWeek'] as int?,
      deleleted: json['deleleted'] as int?,
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LstItineraryTasksToJson(LstItineraryTasks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'deleleted': instance.deleleted,
      'lstTasks': instance.lstTasks,
    };

LstTasks _$LstTasksFromJson(Map<String, dynamic> json) => LstTasks(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      creator: json['creator'] as int?,
    );

Map<String, dynamic> _$LstTasksToJson(LstTasks instance) => <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'description': instance.description,
      'creator': instance.creator,
    };
