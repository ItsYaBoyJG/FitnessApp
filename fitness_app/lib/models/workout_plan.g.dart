// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutPlan _$WorkoutPlanFromJson(Map<String, dynamic> json) => WorkoutPlan(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  duration: (json['duration'] as num).toInt(),
  exercises: (json['exercises'] as List<dynamic>)
      .map((e) => WorkoutComponent.fromJson(e as Map<String, dynamic>))
      .toList(),
  image: json['image'] as String,
);

Map<String, dynamic> _$WorkoutPlanToJson(WorkoutPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'exercises': instance.exercises,
      'image': instance.image,
    };
