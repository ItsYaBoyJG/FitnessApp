import 'package:equatable/equatable.dart';

class SnackItemEquatable extends Equatable {
  const SnackItemEquatable({required this.id, required this.date});

  final String id;
  final DateTime date;

  @override
  List<Object?> get props => [id, date];
}
