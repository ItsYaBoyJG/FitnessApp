import 'package:cloud_firestore/cloud_firestore.dart';

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
}
