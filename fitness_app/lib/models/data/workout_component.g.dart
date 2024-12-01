// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutComponent _$WorkoutComponentFromJson(Map<String, dynamic> json) =>
    WorkoutComponent(
      name: json['name'] as String,
      type: json['type'] as String,
      duration: (json['duration'] as num).toInt(),
      instructions: json['instructions'] as String,
    );

Map<String, dynamic> _$WorkoutComponentToJson(WorkoutComponent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'duration': instance.duration,
      'instructions': instance.instructions,
    };
