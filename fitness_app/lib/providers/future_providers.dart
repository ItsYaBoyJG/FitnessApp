import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/data/futures/db_futures.dart';
import 'package:fitness_app/data/local/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dbFuturesProvider = Provider((ref) => DbFutures());

final userIdFutureProvider = FutureProvider((ref) {
  final UserAuth userAuth = UserAuth();
  final id = userAuth.getUserId();

  if (id != null) {
    return id;
  } else {
    return null;
  }
  // return userAuth.getUserId();
});

final userProfileDataProvider = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).userProfileData(id);
});

final userDailyMacroTotalsProvider = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).getDailyMacros(id);
});

final userExerciseDataProvider = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).getWorkoutHistory(id);
});

final userGoalDataProvider = FutureProvider.family((ref, String uId) {
  return ref.watch(dbFuturesProvider).getUserGoals(uId);
});

final userSavedRecipesProvider = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).getSavedRecipes(id);
});

final cardioExerciseProvider = FutureProvider((ref) {
  return ref.watch(dbFuturesProvider).getWorkoutPlans('cardio');
});

final lowerBodyExerciseProvider = FutureProvider((ref) {
  return ref.watch(dbFuturesProvider).getWorkoutPlans('lowerBody');
});
final upperBodyExerciseProvider = FutureProvider((ref) {
  return ref.watch(dbFuturesProvider).getWorkoutPlans('upperBody');
});

final hasAccountProvider = FutureProvider((ref) {
  LocalStorage localStorage = LocalStorage();
  return localStorage.hasAccount();
});
