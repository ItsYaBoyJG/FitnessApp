import 'package:flutter/material.dart';

class HValueContainer extends StatelessWidget {
  const HValueContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.textBoxHeight,
      required this.textBoxWidth,
      required this.heightValueWidget});

  final double height;
  final double width;
  final double textBoxHeight;
  final double textBoxWidth;
  final Widget heightValueWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: textBoxHeight,
            width: textBoxWidth,
            child: const Text('How tall are you? (cms)'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [heightValueWidget],
          )
        ],
      ),
    );
  }
}
