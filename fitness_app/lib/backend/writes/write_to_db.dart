import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/user.dart';

class WriteToDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void saveUserData(UserProfile user) {
    _firebaseFirestore.collection('usersData').doc(user.uid).set(user.toJson());
  }

  void saveUser(String uid) {
    _firebaseFirestore.collection('users').doc(uid);
  }

  void updateUserData(UserProfile user) {
    _firebaseFirestore.collection('users').doc(user.uid).update(user.toJson());
  }

  void deleteUserData(String uid) {
    _firebaseFirestore.collection('users').doc(uid).delete();
  }

  void addUserToFriendsList(String uid, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(uid)
        .collection('friends')
        .doc(name)
        .set({});
  }

  void addUserToFollowingList(String uid, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(uid)
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
        .collection(m)
        .doc(uid)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }

  void saveExerciseData(String uid, DateTime dateTime, double caloriesBurned,
      double caloriesGoal, double currentWeight, double goalWeight) {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    _firebaseFirestore
        .collection('exerciseData')
        .doc(uid)
        .collection(date)
        .doc()
        .set({
      'caloriesBurned': caloriesBurned,
      'caloriesGoal': caloriesGoal,
      'currentWeight': currentWeight,
      'goalWeight': goalWeight,
    });
  }
}
