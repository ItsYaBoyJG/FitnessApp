import 'package:flutter/material.dart';

class HValueContainer extends StatelessWidget {
  const HValueContainer({
    super.key,
    required this.height,
    required this.width,
    required this.textBoxHeight,
    required this.textBoxWidth,
    required this.controller,
    required this.onChanged,
    required this.labelText,
  });

  final double height;
  final double width;
  final double textBoxHeight;
  final double textBoxWidth;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String labelText;

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
          SizedBox(
            height: 50,
            width: 100,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: labelText,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
