import 'package:fitness_app/models/data/workout_component.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_plan.g.dart';

@JsonSerializable()
class WorkoutPlan {
  final String id;
  final String title;
  final String description;
  final int duration; // Total duration in minutes
  final List<WorkoutComponent> exercises;
  final String image;

  WorkoutPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.exercises,
    required this.image,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        duration: json['duration'],
        exercises: (json['exercises'] as List)
            .map((item) => WorkoutComponent.fromJson(item))
            .toList(),
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'exercises': exercises.map((item) => item.toJson()).toList(),
      'image': image,
    };
  }
}
