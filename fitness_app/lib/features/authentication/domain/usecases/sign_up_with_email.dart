import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/features/authentication/domain/entities/user.dart';
import 'package:fitness_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpWithEmail implements UseCase<User, SignUpParams> {
  const SignUpWithEmail(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await repository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  @override
  List<Object> get props => [email, password, name];
}