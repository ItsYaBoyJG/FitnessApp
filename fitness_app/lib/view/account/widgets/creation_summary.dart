import 'package:fitness_app/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

class CreationSummaryContainer extends StatelessWidget {
  const CreationSummaryContainer({
    super.key,
    required this.name,
    required this.ageValue,
    required this.genderValue,
    required this.heightUnits,
    required this.heightValue,
    required this.weightUnits,
    required this.weightValue,
    required this.activityLevel,
    required this.goalValue,
    required this.reasonValue,
    required this.onPressed,
    required this.buttonText,
  });

  final String name;
  final int ageValue;
  final String genderValue;
  final String heightUnits;
  final String heightValue;
  final String weightUnits;
  final double weightValue;
  final String activityLevel;
  final String goalValue;
  final String reasonValue;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('Username:'), Text(name)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('Age:'), Text('$ageValue')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('Gender:'), Text(genderValue)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text('Height ($heightUnits):'), Text(heightValue)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text('Weight ($weightUnits):'), Text('$weightValue')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [const Text('Goal(s):'), Text(goalValue)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Reason you are making this goal:'),
                    Text(reasonValue)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        child: AppButton(onPressed: onPressed, text: buttonText),
      ),
    );
  }
}
