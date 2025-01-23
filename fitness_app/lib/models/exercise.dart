import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  Exercise({
    required this.uid,
    required this.date,
    required this.caloriesBurned,
  });
  final String uid;
  final String date;
  final int caloriesBurned;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
