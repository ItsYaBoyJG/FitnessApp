import 'package:equatable/equatable.dart';

class BreakfastItemEquatable extends Equatable {
  const BreakfastItemEquatable({required this.id, required this.date});

  final String id;
  final DateTime date;

  @override
  List<Object?> get props => [id, date];
}
