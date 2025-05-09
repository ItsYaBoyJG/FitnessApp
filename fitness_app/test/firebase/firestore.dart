import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

final _firestore = FakeFirebaseFirestore();

const _uId = '12356';
const _friendId = '345346';
const _friendName = 'Tim';
const _udmt = 'userDailyMacroTotals';
const _udm = 'userDailyMacros';
const _bItem = 'breakfastItems';
const _wrkHstry = 'workoutHistory';
const _gData = 'goals';
const _date = '2025-05-08';
const _totals = 'totals';
const _daily = 'daily';

Future<void> goalData() async {
  final data = await _firestore.collection(_gData).doc(_uId).set({
    'calorieGoal': 4500,
    'currentWeight': 155,
    'goalWeight': 188,
  });
  return data;
}

Future<DocumentReference<Map<String, dynamic>>> userData() async {
  final data = _firestore.collection('users').doc(_uId);

  return data;
}

Future<void> friendsData() async {
  final data = await _firestore
      .collection('friends')
      .doc('12356')
      .collection('friends')
      .doc(_friendId)
      .set({'name': 'Tim', 'friendId': _firestore});
  return data;
}

Future<void> followerData() async {
  final data = await _firestore
      .collection('friends')
      .doc('12356')
      .collection('following')
      .doc(_friendId)
      .set({'name': _friendName, 'friendId': _firestore});
  return data;
}

Future<void> dailyMT() async {
  final data = await _firestore.collection(_udmt).doc(_uId).set({
    'calories': 1000,
    'protein': 150,
    'fat': 150,
    'carbs': '200',
  });
  return data;
}

Future<void> dailyMacros() async {
  final data = await _firestore
      .collection(_udm)
      .doc(_uId)
      .collection(_date)
      .doc(_totals)
      .set({
    'calories': 1000,
    'protein': 150,
    'fat': 150,
    'carbs': '200',
  });
  return data;
}

Future<DocumentReference<Map<String, dynamic>>> foodItem() async {
  final data = await _firestore
      .collection(_bItem)
      .doc(_uId)
      .collection(_date)
      .add({'name': 'eggs', 'count': 5, 'calories': 250});
  return data;
}

Future<void> workoutHistory() async {
  final data = await _firestore
      .collection(_wrkHstry)
      .doc(_uId)
      .collection(_daily)
      .doc(_date)
      .set({
    'caloriesBurned': 2000,
    'currentWeight': 191,
  });
  return data;
}
