import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/user.dart';

class WriteToDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void saveUserData(UserProfile user) {
    _firebaseFirestore.collection('usersData').doc(user.id).set(user.toJson());
  }

  void saveUser(String id) {
    _firebaseFirestore.collection('users').doc(id);
  }

  void updateUserData(UserProfile user) {
    _firebaseFirestore.collection('users').doc(user.id).update(user.toJson());
  }

  void deleteUserData(String id) {
    _firebaseFirestore.collection('users').doc(id).delete();
  }

  void addUserToFriendsList(String id, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(id)
        .collection('friends')
        .doc(name)
        .set({});
  }

  void addUserToFollowingList(String id, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(id)
        .collection('following')
        .doc(name)
        .set({});
  }

  void saveDailyMacrosTotals(
    String uId,
    int calories,
    int protein,
    int fat,
    int carbs,
  ) {
    _firebaseFirestore.collection('userDailyMacroTotals').doc(uId).set({
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    });
  }

  void saveDailyMacros(
    String uId,
    DateTime dateTime,
    double calories,
    double protein,
    double fat,
    double carbs,
  ) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    _firebaseFirestore
        .collection('userDailyMacros')
        .doc(uId)
        .collection(date)
        .doc()
        .set({
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    });
  }

  /// save user added breakfast item
  void saveBreakfastItem(
      String uid, DateTime date, String name, int count, double calories) {
    String collDate = '${date.year}-${date.month}-${date.day}';
    _firebaseFirestore
        .collection('breakfastItems')
        .doc(uid)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }

  ///Save user selected lunch item
  void saveLunchItem(
      String uid, DateTime date, String name, int count, int calories) {
    String collDate = '${date.year}-${date.month}-${date.day}';
    _firebaseFirestore
        .collection('lunchItems')
        .doc(uid)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }

  ///Save user selected dinner item
  void saveDinnerItem(
      String uid, DateTime date, String name, int count, int calories) {
    String collDate = '${date.year}-${date.month}-${date.day}';
    _firebaseFirestore
        .collection('dinnerItems')
        .doc(uid)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }

  ///Save user selected snack item
  void saveSnackItem(
      String uid, DateTime date, String name, int count, int calories) {
    String collDate = '${date.year}-${date.month}-${date.day}';
    _firebaseFirestore
        .collection('snackItems')
        .doc(uid)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }

  void saveMealItem(String uid, DateTime date, String name, int count,
      int calories, String meal) {
    String collDate = '${date.year}-${date.month}-${date.day}';
    String m = '${meal}items';
    _firebaseFirestore
        .collection('snackItems')
        .doc(uid)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }
}
