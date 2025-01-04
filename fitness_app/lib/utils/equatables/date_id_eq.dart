import 'package:equatable/equatable.dart';

class DateIdEquatable extends Equatable {
  const DateIdEquatable({required this.id, required this.date});

  final String id;
  final DateTime date;

  @override
  List<Object?> get props => [id, date];
}
