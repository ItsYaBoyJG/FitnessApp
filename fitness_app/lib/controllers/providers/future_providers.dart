import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/backend/futures/db_futures.dart';
import 'package:fitness_app/models/equatables/exercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbFuturesProvider = Provider((ref) => DbFutures());

final userIdFutureProvider = FutureProvider((ref) {
  final UserAuth userAuth = UserAuth();
  return userAuth.getUserId();
});

final userProfileDataProvider = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).userProfileData(id);
});

final userDailyMacroTotalsProvider = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).getDailyMacros(id);
});

final userExerciseDataProvider =
    FutureProvider.family<QuerySnapshot, ExerciseEquatable>(
        (ref, exerciseData) {
  return ref
      .watch(dbFuturesProvider)
      .getWorkoutHistory(exerciseData.id, exerciseData.date);
});
