import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:fitness_app/controllers/providers/stream_providers.dart';
import 'package:fitness_app/models/equatables/date_id_eq.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MacrosDisplay extends ConsumerWidget {
  const MacrosDisplay(
      {super.key,
      required this.uId,
      required this.totalCalories,
      required this.totalProtein,
      required this.totalFat,
      required this.totalCarbs});

  final String uId;
  final int totalCalories;
  final int totalProtein;
  final int totalFat;
  final int totalCarbs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateTimeProvider);
    final dayAmounts = ref.watch(
        dailyMacroAmountsStreamProvider(DateIdEquatable(id: uId, date: date)));

    return dayAmounts.when(data: (data) {
      if (data.data() != null || data.exists == true) {
        Map<String, dynamic> dailyValues = data.data() as Map<String, dynamic>;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Calories'),
                Text('$totalCalories'),
                Text('${dailyValues['calories']}')
              ],
            ),
            Column(
              children: [
                const Text('Protein'),
                Text('$totalProtein'),
                Text('${dailyValues['protein']}')
              ],
            ),
            Column(
              children: [
                const Text('Fat'),
                Text('$totalFat'),
                Text('${dailyValues['fat']}')
              ],
            ),
            Column(
              children: [
                const Text('Carbs'),
                Text('$totalCarbs'),
                Text('${dailyValues['carbs']}')
              ],
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Calories'),
                Text('$totalCalories'),
              ],
            ),
            Column(
              children: [
                const Text('Protein'),
                Text('$totalProtein'),
              ],
            ),
            Column(
              children: [
                const Text('Fat'),
                Text('$totalFat'),
              ],
            ),
            Column(
              children: [
                const Text('Carbs'),
                Text('$totalCarbs'),
              ],
            ),
          ],
        );
      }
    }, error: (error, stackTrace) {
      return Text('error');
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}
