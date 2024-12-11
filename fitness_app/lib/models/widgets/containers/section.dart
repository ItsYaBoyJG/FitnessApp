import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section(
      {super.key,
      required this.title,
      required this.itemCount,
      required this.itemBuilder});

  final String title;
  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35.0),
      child: Column(
        children: [
          Text(title),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width - 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(4.0),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
          )
        ],
      ),
    );
  }
}
