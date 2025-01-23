import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/data/streams/db_streams.dart';
import 'package:fitness_app/utils/date_id_equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dbStreamsProvider = Provider((ref) => DbStreams());

final userAuthStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final breakfastItemStreamProvider =
    StreamProvider.family<QuerySnapshot, DateIdEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).breakfastItemsStream(item.id, item.date);
});

final lunchItemStreamProvider =
    StreamProvider.family<QuerySnapshot, DateIdEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).lunchItemsStreams(item.id, item.date);
});

final dinnerItemStreamProvider =
    StreamProvider.family<QuerySnapshot, DateIdEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).dinnerItemStreams(item.id, item.date);
});

final snackItemStreamProvider =
    StreamProvider.family<QuerySnapshot, DateIdEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).snackItemsStreams(item.id, item.date);
});

final dailyMacroAmountsStreamProvider =
    StreamProvider.family<DocumentSnapshot, DateIdEquatable>((ref, dateId) {
  return ref
      .watch(dbStreamsProvider)
      .getDailyMacroAmounts(dateId.id, dateId.date);
});
