import 'package:equatable/equatable.dart';

class ExerciseEquatable extends Equatable {
  const ExerciseEquatable({required this.id, required this.date});
  final String id;
  final DateTime date;

  @override
  List<Object?> get props => [id, date];
}
