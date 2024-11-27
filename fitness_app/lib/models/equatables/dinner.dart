import 'package:equatable/equatable.dart';

class DinnerItemEquatable extends Equatable {
  const DinnerItemEquatable({required this.id, required this.date});

  final String id;
  final DateTime date;

  @override
  List<Object?> get props => [id, date];
}
