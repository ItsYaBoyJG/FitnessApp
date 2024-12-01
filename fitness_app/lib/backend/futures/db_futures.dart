import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/user.dart';

class DbFutures {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String id) {
    return _firebaseFirestore.collection('users').doc(id).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSavedRecipes(String id) {
    return _firebaseFirestore
        .collection('users')
        .doc(id)
        .collection('recipes')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getWorkoutPlans(
      String category) {
    return _firebaseFirestore.collection('workoutPlans').doc(category).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllWorkoutPlans() {
    return _firebaseFirestore.collection('workoutPlans').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPublicUserAccounts(String id) {
    return _firebaseFirestore.collection('publicUserAccounts').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFriends(String id) {
    return _firebaseFirestore
        .collection('friends')
        .doc(id)
        .collection('friends')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFollowing(String id) {
    return _firebaseFirestore
        .collection('friends')
        .doc(id)
        .collection('following')
        .get();
  }

  Future<UserProfile> userProfileData(String id) async {
    final data = await _firebaseFirestore.collection('userData').doc(id).get();
    return UserProfile.fromJson(data.data()!);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDailyMacros(String id) {
    return _firebaseFirestore.collection('userDailyMacroTotals').doc(id).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getWorkoutHistory(
      String id, DateTime weekStartDate) {
    String date =
        '${weekStartDate.year}-${weekStartDate.month}-${weekStartDate.day}';
    return _firebaseFirestore
        .collection('workoutHistory')
        .doc(id)
        .collection(date)
        .get();
  }
}
