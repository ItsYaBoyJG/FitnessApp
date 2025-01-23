import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/account/gain_weight_reason.dart';
import 'package:fitness_app/view/account/lose_weight_reason.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoalReasonsView extends ConsumerStatefulWidget {
  const GoalReasonsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GoalReasonsViewState();
  }
}

class _GoalReasonsViewState extends ConsumerState<GoalReasonsView> {
  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(userGoalStateProvider);
    switch (goal) {
      case 'Lose Weight':
        return const LoseWeightGoalReason();

      default:
        return const GainWeightGoalReasons();
    }
  }
}
