import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/recipe.dart';

class DbFutures {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String id) {
    return _firebaseFirestore.collection('users').doc(id).get();
  }

  Future<List<Recipe>> getSavedRecipes(String id) async {
    final data = await _firebaseFirestore
        .collection('usersData')
        .doc(id)
        .collection('recipes')
        .get();

    return data.docs
        .map((toElement) => Recipe.fromJson(toElement.data()))
        .toList();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getWorkoutPlans(
      String category) {
    return _firebaseFirestore.collection('exercises').doc(category).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllWorkoutPlans() {
    return _firebaseFirestore.collection('exercises').get();
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

  Future<DocumentSnapshot<Map<String, dynamic>>> userProfileData(
      String id) async {
    return await _firebaseFirestore.collection('usersData').doc(id).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDailyMacros(String id) {
    return _firebaseFirestore.collection('userDailyMacroTotals').doc(id).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getWorkoutHistory(String id) {
    return _firebaseFirestore
        .collection('workoutHistory')
        .doc(id)
        .collection('dailyData')
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserGoals(String uId) {
    return _firebaseFirestore.collection('goals').doc(uId).get();
  }
}
