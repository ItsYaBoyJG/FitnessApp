import 'package:fitness_app/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

class ProfileDataList extends StatelessWidget {
  const ProfileDataList({
    super.key,
    required this.textBoxHeight,
    required this.textBoxWidth,
    required this.textString,
    required this.listHeight,
    required this.listWidth,
    required this.itemCount,
    required this.itemBuilder,
    required this.bottomContainerHeight,
    required this.bottomContainerWidth,
    required this.onPressed,
    required this.buttonText,
  });

  final double textBoxHeight;
  final double textBoxWidth;
  final String textString;
  final double listHeight;
  final double listWidth;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double bottomContainerHeight;
  final double bottomContainerWidth;
  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: textBoxHeight,
              width: textBoxWidth,
              child: Text(textString),
            ),
            SizedBox(
              height: listHeight,
              width: listWidth,
              child: ListView.builder(
                  itemCount: itemCount, itemBuilder: itemBuilder),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: bottomContainerHeight,
        width: bottomContainerWidth,
        child: AppButton(onPressed: onPressed, text: buttonText),
      ),
    );
  }
}
