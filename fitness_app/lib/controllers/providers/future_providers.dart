import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/backend/futures/db_futures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbFuturesProvider = Provider((ref) => DbFutures());

final userIdFutureProvider = FutureProvider((ref) {
  return FirebaseAuth.instance.currentUser!.uid;
});

final userProfileData = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).userProfileData(id);
});

final userDailyMacroTotals = FutureProvider.family((ref, String id) {
  return ref.watch(dbFuturesProvider).getDailyMacros(id);
});
