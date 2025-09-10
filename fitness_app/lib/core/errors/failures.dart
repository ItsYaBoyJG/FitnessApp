import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class AuthFailure extends Failure {
  final String message;
  
  const AuthFailure(this.message);
  
  @override
  List<Object> get props => [message];
}

class ValidationFailure extends Failure {
  final String message;
  
  const ValidationFailure(this.message);
  
  @override
  List<Object> get props => [message];
}