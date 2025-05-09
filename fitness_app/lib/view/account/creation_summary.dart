import 'package:fitness_app/utils/calculations/calculations.dart';
import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/account/widgets/creation_summary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreationSummary extends ConsumerStatefulWidget {
  const CreationSummary({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CreationSummaryState();
  }
}

class _CreationSummaryState extends ConsumerState<CreationSummary> {
  final Calculations _calculations = Calculations();

  @override
  Widget build(BuildContext context) {
    final ageValue = ref.watch(userAgeProvider);
    final genderValue = ref.watch(userGenderProvider);
    final cmValue = ref.watch(userCmHeightValueProvider);
    final weightValue = ref.watch(userWeightValueProvider);
    final activityLevel = ref.watch(userActivityLevelProvider);
    final goalValue = ref.watch(userGoalProvider);
    final reasonValue = ref.watch(userGoalReasonProvider);
    final nameValue = ref.watch(userNameProvider);

    return CreationSummaryContainer(
        name: nameValue,
        ageValue: ageValue,
        genderValue: genderValue,
        heightUnits: 'cm',
        heightValue: '$cmValue',
        weightUnits: 'kgs',
        weightValue: weightValue,
        activityLevel: activityLevel,
        goalValue: goalValue,
        reasonValue: reasonValue,
        onPressed: () {
          final calories = _calculations.calculateDailyCalorieIntake(
              ageValue,
              genderValue,
              weightValue.round(),
              double.parse(cmValue.toString()),
              activityLevel,
              goalValue);
          final protein = _calculations.calculateDvProtein(calories, goalValue);

          final fat = _calculations.calculateDvFat(calories, goalValue);
          final carbs = _calculations.calculateDvCarbs(calories, goalValue);

          if (goalValue.startsWith('L')) {
            ref.read(initialCarbsPercProvider.notifier).state = 40;
            ref.read(initialProteinPercProvider.notifier).state = 40;
            ref.read(initialFatPercProvider.notifier).state = 20;
          } else {
            ref.read(initialCarbsPercProvider.notifier).state = 40;
            ref.read(initialProteinPercProvider.notifier).state = 30;
            ref.read(initialFatPercProvider.notifier).state = 30;
          }
          ref.read(initialDailyProteinProvider.notifier).state = protein;
          ref.read(initialDailyFatProvider.notifier).state = fat;
          ref.read(initialDailyCarbsProvider.notifier).state = carbs;
          ref.read(initialDailyCaloriesProvider.notifier).state = calories;

          context.push('/dailytotals');
        },
        buttonText: 'Done');
  }
}
