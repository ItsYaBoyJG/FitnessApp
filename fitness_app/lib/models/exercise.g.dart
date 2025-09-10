// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
  uid: json['uid'] as String,
  date: json['date'] as String,
  caloriesBurned: (json['caloriesBurned'] as num).toInt(),
);

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
  'uid': instance.uid,
  'date': instance.date,
  'caloriesBurned': instance.caloriesBurned,
};
