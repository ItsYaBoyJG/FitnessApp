import 'package:equatable/equatable.dart';

class LunchItemEquatable extends Equatable {
  const LunchItemEquatable({required this.id, required this.date});

  final String id;
  final DateTime date;

  @override
  List<Object?> get props => [id, date];
}
