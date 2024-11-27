import 'package:flutter/material.dart';

class MealContainer extends StatelessWidget {
  const MealContainer(
      {super.key,
      required this.tabName,
      required this.onPressed,
      required this.itemCount});

  final String tabName;
  final void Function() onPressed;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Text('Track $tabName'),
                  IconButton(onPressed: onPressed, icon: const Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width - 5,
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
