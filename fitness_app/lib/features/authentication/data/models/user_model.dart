import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fitness_app/features/authentication/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.age,
    required super.gender,
    required super.weight,
    required super.height,
    required super.activityLevel,
    required super.fitnessGoal,
    required super.goalReason,
    required super.createdAt,
    super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      age: user.age,
      gender: user.gender,
      weight: user.weight,
      height: user.height,
      activityLevel: user.activityLevel,
      fitnessGoal: user.fitnessGoal,
      goalReason: user.goalReason,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  factory UserModel.fromFirebaseUser(
    firebase_auth.User firebaseUser, {
    required String name,
    required int age,
    required String gender,
    required double weight,
    required double height,
    required String activityLevel,
    required String fitnessGoal,
    required String goalReason,
  }) {
    return UserModel(
      id: firebaseUser.uid,
      name: name,
      email: firebaseUser.email ?? '',
      age: age,
      gender: gender,
      weight: weight,
      height: height,
      activityLevel: activityLevel,
      fitnessGoal: fitnessGoal,
      goalReason: goalReason,
      createdAt: DateTime.now(),
    );
  }
}