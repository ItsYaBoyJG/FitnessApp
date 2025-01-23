import 'package:flutter/material.dart';

class CaloriesValue extends StatelessWidget {
  const CaloriesValue({super.key, required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.30,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Text('Calories'),
                )
              ],
            ),
            SizedBox(
              height: 50,
              width: 110,
              child: Card(
                child: ListTile(
                  leadingAndTrailingTextStyle:
                      const TextStyle(fontSize: 14.0, color: Colors.black),
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 2.0, 10.0),
                    child: Text(
                      '$value',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
