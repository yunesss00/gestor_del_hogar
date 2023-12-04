// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => Itinerary(
      id: json['id'] as int?,
      homeId: json['homeId'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      lstTasks: (json['lstTasks'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItineraryToJson(Itinerary instance) => <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'description': instance.description,
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
