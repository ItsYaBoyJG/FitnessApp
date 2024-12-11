import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/recipe.dart';
import 'package:fitness_app/models/data/user.dart';
import 'package:fitness_app/models/data/workout_plan.dart';

class WriteToDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void saveUserData(
      String uId,
      String name,
      int age,
      String gender,
      double weight,
      double height,
      String activityLevel,
      String fitnessGoal,
      String goalReason,
      DateTime createdAtDateTime,
      DateTime? updatedAtDateTime) {
    String createdAt =
        '${createdAtDateTime.year}-${createdAtDateTime.month}-${createdAtDateTime.day}';
    String? updatedAt = updatedAtDateTime != null
        ? '${updatedAtDateTime.year}-${updatedAtDateTime.month}-${updatedAtDateTime.day}'
        : null;

    _firebaseFirestore.collection('usersData').doc(uId).set({
      'uId': uId,
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
      'activityLevel': activityLevel,
      'fitnessGoal': fitnessGoal,
      'goalReason': goalReason,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    });
  }

  void saveUser(String uId) {
    _firebaseFirestore.collection('users').doc(uId);
  }

  void updateUserData(UserProfile user) {
    _firebaseFirestore
        .collection('usersData')
        .doc(user.uId)
        .update(user.toJson());
  }

  void updateUserGoal(String uId, String fitnessGoal) {
    _firebaseFirestore
        .collection('usersData')
        .doc(uId)
        .update({'fitnessGoal': fitnessGoal});
  }

  void deleteUserData(String uId) {
    _firebaseFirestore.collection('users').doc(uId).delete();
  }

  void addUserToFriendsList(String uId, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(uId)
        .collection('friends')
        .doc(name)
        .set({});
  }

  void addUserToFollowingList(String uId, String name) {
    _firebaseFirestore
        .collection('friends')
        .doc(uId)
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
  ) async {
    await _firebaseFirestore.collection('userDailyMacroTotals').doc(uId).set({
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    });
  }

  void saveDailyMacros(String uId, DateTime dateTime, int calories, int protein,
      int fat, int carbs) async {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    await _firebaseFirestore
        .collection('userDailyMacros')
        .doc(uId)
        .collection(date)
        .doc('totals')
        .set({
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    });
  }

  void updateDailyMacros(String uId, DateTime dateTime, int calories,
      int protein, int fat, int carbs) async {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    await _firebaseFirestore
        .collection('userDailyMacros')
        .doc(uId)
        .collection(date)
        .doc('totals')
        .update({
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbs': carbs,
    });
  }

  void saveMealItem(String uId, DateTime date, String name, int count,
      int calories, String meal) async {
    String collDate = '${date.year}-${date.month}-${date.day}';
    String m = '${meal}Items';
    await _firebaseFirestore
        .collection(m)
        .doc(uId)
        .collection(collDate)
        .doc()
        .set({'name': name, 'count': count, 'calories': calories});
  }

  void saveExerciseData(String uId, DateTime dateTime, double caloriesBurned,
      double currentWeight) async {
    String date = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    await _firebaseFirestore
        .collection('workoutHistory')
        .doc(uId)
        .collection('dailyData')
        .doc(date)
        .set({
      'caloriesBurned': caloriesBurned,
      'currentWeight': currentWeight,
    });
  }

  void saveGoalData(String uId, int caloriesGoal, double currenWeight,
      double goalWeight) async {
    await _firebaseFirestore.collection('goals').doc(uId).set({
      'calorieGoal': caloriesGoal,
      'currentWeight': currenWeight,
      'goalWeight': goalWeight
    });
  }

  void addSavedRecipe(Recipe recipe) async {
    await _firebaseFirestore
        .collection('usersData')
        .doc(recipe.id)
        .collection('recipes')
        .doc()
        .set(recipe.toJson());
  }

  addWorkout(WorkoutPlan workoutPlan) {
    _firebaseFirestore
        .collection('exercises')
        .doc('lowerBody')
        .collection(workoutPlan.id)
        .doc()
        .set(workoutPlan.toJson());
  }

  addUpperBody(WorkoutPlan workoutPlan) {
    _firebaseFirestore
        .collection('exercises')
        .doc('upperBody')
        .collection(workoutPlan.id)
        .doc()
        .set(workoutPlan.toJson());
  }

  addRunning(WorkoutPlan workoutPlan) {
    _firebaseFirestore
        .collection('exercises')
        .doc('running')
        .collection(workoutPlan.id)
        .doc()
        .set(workoutPlan.toJson());
  }
}
