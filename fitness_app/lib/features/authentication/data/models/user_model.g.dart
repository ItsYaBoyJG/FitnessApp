// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  age: (json['age'] as num).toInt(),
  gender: json['gender'] as String,
  weight: (json['weight'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  activityLevel: json['activityLevel'] as String,
  fitnessGoal: json['fitnessGoal'] as String,
  goalReason: json['goalReason'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'age': instance.age,
  'gender': instance.gender,
  'weight': instance.weight,
  'height': instance.height,
  'activityLevel': instance.activityLevel,
  'fitnessGoal': instance.fitnessGoal,
  'goalReason': instance.goalReason,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
