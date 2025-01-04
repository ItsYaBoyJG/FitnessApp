import 'package:flutter/material.dart';

class CarbsValue extends StatelessWidget {
  const CarbsValue({super.key, required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Carbs'),
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
    );
  }
}
