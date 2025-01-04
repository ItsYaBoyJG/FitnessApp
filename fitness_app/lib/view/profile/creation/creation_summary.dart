import 'package:fitness_app/utils/calculations/calculations.dart';
import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/profile/creation/widgets/creation_summary.dart';
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
    final ageValue = ref.watch(userAgeStateProvider);
    final genderValue = ref.watch(userGenderStateProvider);
    final cmValue = ref.watch(userCmHeightValueProvider);
    final weightValue = ref.watch(userWeightValueProvider);
    final activityLevel = ref.watch(userActivityLevelStateProvider);
    final goalValue = ref.watch(userGoalStateProvider);
    final reasonValue = ref.watch(userGoalReasonStateProvider);
    final nameValue = ref.watch(userNameStateProvider);

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
            ref.read(initialCarbsPercentageProvider.notifier).state = 40;
            ref.read(initialProteinPercentageProvider.notifier).state = 40;
            ref.read(initialFatPercentageProvider.notifier).state = 20;
          } else {
            ref.read(initialCarbsPercentageProvider.notifier).state = 40;
            ref.read(initialProteinPercentageProvider.notifier).state = 30;
            ref.read(initialFatPercentageProvider.notifier).state = 30;
          }
          ref.read(initialDailyProteinStateProvider.notifier).state = protein;
          ref.read(initialDailyFatStateProvider.notifier).state = fat;
          ref.read(initialDailyCarbsStateProvider.notifier).state = carbs;
          ref.read(initialDailyCaloriesStateProvider.notifier).state = calories;

          context.push('/dailytotals');
        },
        buttonText: 'Done');
  }
}
