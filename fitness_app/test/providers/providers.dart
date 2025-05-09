import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:riverpod_test/riverpod_test.dart';

import '../firebase/firestore.dart';

// void userProvider() {
//   testProvider('User Data For Buttons on HomePage', provider: _userProvider);
// }

final goalProvider = FutureProvider((ref) => goalData());
final friendsData = FutureProvider((ref) => followerData());
final dailyMacroTotal = FutureProvider((ref) => dailyMT());
final dailyMacro = FutureProvider((ref) => dailyMacros());
final foodItems = FutureProvider((ref) => foodItem());
final workout = FutureProvider((ref) => workoutHistory());
