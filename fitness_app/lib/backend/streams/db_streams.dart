import 'package:cloud_firestore/cloud_firestore.dart';

class DbStreams {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String userStream(String id) {
    return _firebaseFirestore.collection('users').doc(id).id;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> breakfastItemsStream(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('meals')
        .doc(id)
        .collection('breakfast')
        .doc(date)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> lunchItemsStreams(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('meals')
        .doc(id)
        .collection('lunch')
        .doc(date)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> dinnerItemStreams(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('meals')
        .doc(id)
        .collection('dinner')
        .doc(date)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> snackItemsStreams(
      String id, DateTime dateTime) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    return _firebaseFirestore
        .collection('meals')
        .doc(id)
        .collection('snack')
        .doc(date)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getRecipesByCategory(
      String category) {
    return _firebaseFirestore.collection('recipes').doc(category).snapshots();
  }
}
