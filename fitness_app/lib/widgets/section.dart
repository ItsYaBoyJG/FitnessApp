import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.title, required this.horizontalList});

  final String title;
  final List<Widget> horizontalList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35.0),
      child: Column(
        children: [
          Text(title),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: horizontalList,
            ),
          )
        ],
      ),
    );
  }
}
