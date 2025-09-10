import 'package:fitness_app/core/providers/repository_providers.dart';
import 'package:fitness_app/features/authentication/domain/usecases/sign_in_with_email.dart';
import 'package:fitness_app/features/authentication/domain/usecases/sign_out.dart';
import 'package:fitness_app/features/authentication/domain/usecases/sign_up_with_email.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Authentication Use Cases
final signInWithEmailProvider = Provider<SignInWithEmail>((ref) {
  return SignInWithEmail(ref.read(authRepositoryProvider));
});

final signUpWithEmailProvider = Provider<SignUpWithEmail>((ref) {
  return SignUpWithEmail(ref.read(authRepositoryProvider));
});

final signOutProvider = Provider<SignOut>((ref) {
  return SignOut(ref.read(authRepositoryProvider));
});