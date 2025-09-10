import 'package:fitness_app/core/providers/external_providers.dart';
import 'package:fitness_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:fitness_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:fitness_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Data Sources
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    firebaseAuth: ref.read(firebaseAuthProvider),
    firestore: ref.read(firestoreProvider),
  );
});

// Repositories
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
    networkInfo: ref.read(networkInfoProvider),
  );
});