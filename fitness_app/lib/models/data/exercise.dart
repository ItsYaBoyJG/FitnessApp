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

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      uid: json['uid'],
      date: json['date'],
      caloriesBurned: json['caloriesBurned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'date': date,
      'caloriesBurned': caloriesBurned,
    };
  }
}
