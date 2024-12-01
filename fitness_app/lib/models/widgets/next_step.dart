import 'package:flutter/material.dart';

class NextStep extends StatelessWidget {
  const NextStep({
    super.key,
    required this.image,
    required this.title,
    required this.seconds,
  });

  final String image, title;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.0,
          width: 60.0,
          margin: const EdgeInsets.only(
            right: 20.0,
            bottom: 20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        SizedBox(
          height: 65.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$seconds sec',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blueGrey[200],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
