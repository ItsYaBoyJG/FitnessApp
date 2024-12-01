import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class CaloriesBurned extends StatelessWidget {
  const CaloriesBurned(
      {super.key, required this.caloriesBurned, required this.calorieGoal});

  final double caloriesBurned;
  final double calorieGoal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Text(
            'You\'ve burned',
            style: TextStyle(
              color: Color.fromARGB(255, 114, 114, 114),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$caloriesBurned Cal',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  '$calorieGoal Cal',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
            child: FAProgressBar(
              currentValue: caloriesBurned,
              maxValue: calorieGoal,
              progressColor: Colors.purpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
