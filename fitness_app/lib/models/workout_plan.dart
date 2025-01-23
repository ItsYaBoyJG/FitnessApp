import 'package:fitness_app/models/workout_component.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_plan.g.dart';

@JsonSerializable()
class WorkoutPlan {
  WorkoutPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.exercises,
    required this.image,
  });

  final String id;
  final String title;
  final String description;
  final int duration;
  final List<WorkoutComponent> exercises;
  final String image;

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPlanFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutPlanToJson(this);
}
