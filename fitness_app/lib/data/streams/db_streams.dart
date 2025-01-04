import 'package:cloud_firestore/cloud_firestore.dart';

class DbStreams {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String userStream(String id) {
    return _firebaseFirestore.collection('users').doc(id).id;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> breakfastItemsStream(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('breakfastItems')
        .doc(id)
        .collection(date)
        .orderBy('name')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> lunchItemsStreams(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('lunchItems')
        .doc(id)
        .collection(date)
        .orderBy('name')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> dinnerItemStreams(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('dinnerItems')
        .doc(id)
        .collection(date)
        .orderBy('name')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> snackItemsStreams(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('snackItems')
        .doc(id)
        .collection(date)
        .orderBy('name')
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getRecipesByCategory(
      String category) {
    return _firebaseFirestore.collection('recipes').doc(category).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDailyMacroAmounts(
      String uId, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('userDailyMacros')
        .doc(uId)
        .collection(date)
        .doc('totals')
        .snapshots();
  }
}
