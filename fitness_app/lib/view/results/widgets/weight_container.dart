import 'package:flutter/material.dart';

class WeightResultContainer extends StatelessWidget {
  const WeightResultContainer(
      {super.key, required this.initialWeight, required this.currentWeight});

  final double initialWeight;
  final double currentWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weight Progress',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: const EdgeInsets.only(right: 10.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(231, 241, 255, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 35.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Starting Weight',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blueGrey[200],
                          ),
                        ),
                        Text(
                          '$initialWeight',
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blueGrey[200],
                        ),
                      ),
                      Text(
                        '$currentWeight',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25.0),
              width: MediaQuery.of(context).size.width - 40.0,
              margin: const EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 227, 255, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Text(
                'Enter today\'s weight',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(190, 130, 255, 1.0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
