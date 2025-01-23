import 'package:json_annotation/json_annotation.dart';

part 'workout_component.g.dart';

@JsonSerializable()
class WorkoutComponent {
  WorkoutComponent({
    required this.name,
    required this.type,
    required this.duration,
    required this.instructions,
  });

  final String name;
  final String type;
  final int duration;
  final String instructions;

  factory WorkoutComponent.fromJson(Map<String, dynamic> json) =>
      _$WorkoutComponentFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutComponentToJson(this);
}
