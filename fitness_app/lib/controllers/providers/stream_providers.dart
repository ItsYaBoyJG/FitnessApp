import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/backend/streams/db_streams.dart';
import 'package:fitness_app/models/equatables/breakfast.dart';
import 'package:fitness_app/models/equatables/dinner.dart';
import 'package:fitness_app/models/equatables/lunch.dart';
import 'package:fitness_app/models/equatables/snacks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbStreamsProvider = Provider((ref) => DbStreams());

final currentUserProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final breakfastItemStreamProvider =
    StreamProvider.family<DocumentSnapshot, BreakfastItemEquatable>(
        (ref, item) {
  return ref.watch(dbStreamsProvider).breakfastItemsStream(item.id, item.date);
});

final lunchItemStreamProvider =
    StreamProvider.family<DocumentSnapshot, LunchItemEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).lunchItemsStreams(item.id, item.date);
});

final dinnerItemStreamProvider =
    StreamProvider.family<DocumentSnapshot, DinnerItemEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).dinnerItemStreams(item.id, item.date);
});

final snackItemStreamProvider =
    StreamProvider.family<DocumentSnapshot, SnackItemEquatable>((ref, item) {
  return ref.watch(dbStreamsProvider).snackItemsStreams(item.id, item.date);
});
