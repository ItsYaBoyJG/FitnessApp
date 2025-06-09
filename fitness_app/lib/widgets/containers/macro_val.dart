import 'package:flutter/material.dart';

class MarcoValWidget extends StatelessWidget {
  const MarcoValWidget({super.key, required this.macro, required this.value});
  final String macro;
  final int value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(macro),
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
