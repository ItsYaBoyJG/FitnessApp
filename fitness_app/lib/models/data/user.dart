import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserProfile {
  final String uid; // Unique identifier for the user
  final String name; // User's name
  final int age; // User's age
  final String gender; // e.g., Male, Female, Non-Binary, etc.
  final double weight; // in kilograms
  final double height; // in centimeters
  final String activityLevel; // e.g., Sedentary, Active, Very Active
  final String fitnessGoal; // e.g., Lose Weight, Gain Muscle, Maintain Fitness
  final String goalReason;
  final DateTime createdAt; // Date the profile was created
  final DateTime? updatedAt; // Date the profile was last updated (optional)

  UserProfile({
    required this.uid,
    required this.name,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.fitnessGoal,
    required this.goalReason,
    required this.createdAt,
    this.updatedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      weight: json['weight'].toDouble(),
      height: json['height'].toDouble(),
      activityLevel: json['activityLevel'],
      fitnessGoal: json['fitnessGoal'],
      goalReason: json['goalReason'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'activityLevel': activityLevel,
      'fitnessGoal': fitnessGoal,
      'goalReason': goalReason,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
