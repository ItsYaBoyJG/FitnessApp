import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/models/data/recipe.dart';
import 'package:fitness_app/models/data/user.dart';

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
/*
  addWorkout(WorkoutPlan workoutPlan, String type) {
    _firebaseFirestore
        .collection('exercises')
        .doc(type)
        .set(workoutPlan.toJson());
  } */
}


/**
 * addWorkout(WorkoutPlan workoutPlan, String type) {
    _firebaseFirestore
        .collection('exercises')
        .doc(type)
        .set(workoutPlan.toJson());
  }
 * 
 * 
 * ElevatedButton(
                        onPressed: () async {
                          WriteToDb writeToDb = WriteToDb();

                          Uuid uuid = Uuid();

                          String w1Image = await getImage(
                              'assets/images/man_deadlifting.jpg');
                          String w2Image = await getImage(
                              'assets/images/woman_workingout_outside.jpg');
                          String w3Image = await getImage(
                              'assets/images/woman_doing_shoulder_press.jpg');
                          String w4Image = await getImage(
                              'assets/images/woman_mid_stride_running.jpg');

                          writeToDb.addWorkout(
                              WorkoutPlan(
                                  id: uuid.v1(),
                                  title: 'workout1',
                                  description: 'Compound movement focused',
                                  duration: 90,
                                  exercises: [
                                    WorkoutComponent(
                                        name: 'Squats',
                                        type: 'Strength',
                                        duration: 5,
                                        instructions: '3 sets x 5 reps'),
                                    WorkoutComponent(
                                        name: 'Lunges',
                                        type: 'Strength',
                                        duration: 5,
                                        instructions: '3 sets x 10 reps'),
                                    WorkoutComponent(
                                        name: 'Leg extensions',
                                        type: 'Strength',
                                        duration: 5,
                                        instructions: '4 sets x 15 reps'),
                                    WorkoutComponent(
                                        name: 'Leg curls',
                                        type: 'Strength',
                                        duration: 5,
                                        instructions: '4 sets 15 reps')
                                  ],
                                  image: w1Image),
                              'lowerBody');

                          writeToDb.addWorkout(
                              WorkoutPlan(
                                  id: uuid.v1(),
                                  title: 'workout2',
                                  description: 'Bodyweight workout',
                                  duration: 30,
                                  exercises: [
                                    WorkoutComponent(
                                        name: 'Lunges',
                                        type: 'Strength',
                                        duration: 10,
                                        instructions: '5 sets x 20 reps'),
                                    WorkoutComponent(
                                        name: 'Bodyweight Squats',
                                        type: 'Strength',
                                        duration: 10,
                                        instructions: '5 sets x 15 reps'),
                                    WorkoutComponent(
                                        name: 'Crunches',
                                        type: 'Strength',
                                        duration: 5,
                                        instructions: '3 sets x 20 reps'),
                                    WorkoutComponent(
                                        name: 'Walking Lunges',
                                        type: 'Strength',
                                        duration: 5,
                                        instructions: '2 sets x 20 reps')
                                  ],
                                  image: w2Image),
                              'lowerBody');

                          writeToDb.addWorkout(
                              WorkoutPlan(
                                  id: uuid.v1(),
                                  title: 'workout1',
                                  description: 'Compound movement based',
                                  duration: 60,
                                  exercises: [
                                    WorkoutComponent(
                                        name: 'Bench Press',
                                        type: 'Strength',
                                        duration: 10,
                                        instructions: '3 sets x 8-12 reps'),
                                    WorkoutComponent(
                                        name: 'Shoulder press',
                                        type: 'Strength',
                                        duration: 10,
                                        instructions: '3 sets x 12-15 reps'),
                                    WorkoutComponent(
                                        name: 'Lat Pulldown',
                                        type: 'Strength',
                                        duration: 8,
                                        instructions: '3 sets x 8-10 reps ')
                                  ],
                                  image: w3Image),
                              'upperBody');

                          writeToDb.addWorkout(
                              WorkoutPlan(
                                  id: uuid.v1(),
                                  title: 'workout1',
                                  description: 'Cardio workout',
                                  duration: 15,
                                  exercises: [
                                    WorkoutComponent(
                                        name: 'Treadmill',
                                        type: 'Cardio',
                                        duration: 15,
                                        instructions:
                                            'Moderate paced run on the treadmill')
                                  ],
                                  image: w4Image),
                              'cardio');
                        },
                        child: Text('Save Data For Testing'))
 */