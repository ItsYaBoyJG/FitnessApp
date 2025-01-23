import 'package:fitness_app/widgets/containers/circle_badge.dart';
import 'package:flutter/material.dart';

class Achievements extends StatelessWidget {
  const Achievements(
      {super.key,
      //  required this.firstWorkout,
      required this.firstCalGoal,
      required this.firstCalGoalTotal,
      required this.secondCalGoal,
      required this.secondCalGoalTotal});

  // final bool firstWorkout;
  final bool firstCalGoal;
  final double firstCalGoalTotal;
  final bool secondCalGoal;
  final double secondCalGoalTotal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            'Achievements',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //   firstWorkout == true
                //       ? const CircleBadge(
                //           color: Color.fromRGBO(190, 130, 255, 1.0),
                //           title: '1st',
                //           subtitle: 'Workout',
                //         )
                //       : Container(),
                firstCalGoal == true
                    ? CircleBadge(
                        color: const Color.fromRGBO(75, 142, 255, 1.0),
                        title: '$firstCalGoalTotal',
                        subtitle: 'Burned',
                      )
                    : Container(),
                secondCalGoal == true
                    ? CircleBadge(
                        color: const Color.fromRGBO(255, 255, 255, 1.0),
                        title: '$secondCalGoal',
                        subtitle: 'Goal',
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
