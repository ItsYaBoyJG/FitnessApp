import 'package:json_annotation/json_annotation.dart';

part 'workout_component.g.dart';

@JsonSerializable()
class WorkoutComponent {
  final String name; // Exercise name
  final String type; // e.g., Cardio, Strength, Flexibility
  final int duration; // Duration in minutes for this exercise
  final String instructions; // Optional detailed instructions

  WorkoutComponent({
    required this.name,
    required this.type,
    required this.duration,
    required this.instructions,
  });

  factory WorkoutComponent.fromJson(Map<String, dynamic> json) {
    return WorkoutComponent(
      name: json['name'],
      type: json['type'],
      duration: json['duration'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'duration': duration,
      'instructions': instructions,
    };
  }
}
