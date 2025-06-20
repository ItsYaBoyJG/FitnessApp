import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/data/local/local_storage.dart';
import 'package:fitness_app/data/writes/write_to_db.dart';
import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/widgets/buttons/app_button.dart';
import 'package:fitness_app/widgets/containers/macro_val.dart';
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
  final LocalStorage _localStorage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    final calories = ref.watch(initialDailyCaloriesProvider);
    final protein = ref.watch(initialDailyProteinProvider);
    final carbs = ref.watch(initialDailyCarbsProvider);
    final fat = ref.watch(initialDailyFatProvider);
    final age = ref.watch(userAgeProvider);
    final gender = ref.watch(userGenderProvider);
    final activity = ref.watch(userActivityLevelProvider);
    final weight = ref.watch(userWeightValueProvider);
    final height = ref.watch(userCmHeightValueProvider);
    final goal = ref.watch(userGoalProvider);
    final goalReason = ref.watch(userGoalReasonProvider);
    final name = ref.watch(userNameProvider);

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
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.70,
                padding: const EdgeInsets.all(6.0),
                child: const Text(
                  'Below you can find your calculated daily macro values that we recommend.',
                  overflow: TextOverflow.clip,
                ),
              ),
              Container(
                height: 85,
                width: MediaQuery.of(context).size.width * 0.70,
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: const Text(
                  'If you wish to make any changes. Either go back, or '
                  'select the Edit button next to each below by each to change it.',
                  overflow: TextOverflow.clip,
                ),
              ),
              Center(
                child: AppButton(onPressed: () {}, text: 'Edit'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MarcoValWidget(macro: 'Calories', value: calories),
                    MarcoValWidget(macro: 'Protein', value: protein),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MarcoValWidget(macro: 'Fat', value: fat),
                    MarcoValWidget(macro: 'Carbs', value: carbs),
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
              _writeToDb.saveUser(_userAuth.getUserId()!);
              _writeToDb.saveDailyMacrosTotals(
                  _userAuth.getUserId()!, calories, protein, fat, carbs);
              _writeToDb.saveUserData(
                  _userAuth.getUserId()!,
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

              _localStorage.createdAccount(true);

              ref.invalidate(userDailyMacroTotalsProvider);
              ref.invalidate(hasAccountProvider);
              // ref.invalidate(userProfileData);
              Future.delayed(const Duration(milliseconds: 200));
              context.go('/');
            },
            text: 'Save Information'),
      ),
    );
  }
}
