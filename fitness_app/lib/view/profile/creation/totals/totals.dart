import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/data/writes/write_to_db.dart';
import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/profile/creation/widgets/values/calories.dart';
import 'package:fitness_app/view/profile/creation/widgets/values/carbs.dart';
import 'package:fitness_app/view/profile/creation/widgets/values/fat.dart';
import 'package:fitness_app/view/profile/creation/widgets/values/protein.dart';
import 'package:fitness_app/models/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class DailyTotalsSumPage extends ConsumerStatefulWidget {
  const DailyTotalsSumPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DailyTotalsSumPageState();
  }
}

class _DailyTotalsSumPageState extends ConsumerState<DailyTotalsSumPage> {
  final WriteToDb _writeToDb = WriteToDb();
  final UserAuth _userAuth = UserAuth();

  @override
  Widget build(BuildContext context) {
    final calories = ref.watch(initialDailyCaloriesStateProvider);
    final protein = ref.watch(initialDailyProteinStateProvider);
    final carbs = ref.watch(initialDailyCarbsStateProvider);
    final fat = ref.watch(initialDailyFatStateProvider);
    final age = ref.watch(userAgeStateProvider);
    final gender = ref.watch(userGenderStateProvider);
    final activity = ref.watch(userActivityLevelStateProvider);
    final weight = ref.watch(userWeightValueProvider);
    final height = ref.watch(userCmHeightValueProvider);
    final goal = ref.watch(userGoalStateProvider);
    final goalReason = ref.watch(userGoalReasonStateProvider);
    final name = ref.watch(userNameStateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width,
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 30,
                  child: const Text(
                    'If you wish to make any changes. Either go back, or '
                    'select the Edit button next to each below by each to change it.',
                    overflow: TextOverflow.clip,
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CaloriesValue(value: calories),
                    ProteinValue(value: protein),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FatValue(value: fat),
                    CarbsValue(value: carbs),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        child: AppButton(
            onPressed: () {
              _writeToDb.saveUser(_userAuth.getUserId());
              _writeToDb.saveDailyMacrosTotals(
                  _userAuth.getUserId(), calories, protein, fat, carbs);
              _writeToDb.saveUserData(
                  _userAuth.getUserId(),
                  name,
                  age,
                  gender,
                  weight,
                  height,
                  activity,
                  goal,
                  goalReason,
                  DateTime.now(),
                  null);

              // ref.invalidate(userProfileData);
              Future.delayed(const Duration(milliseconds: 200));
              context.go('/');
            },
            text: 'Save Information'),
      ),
    );
  }
}
