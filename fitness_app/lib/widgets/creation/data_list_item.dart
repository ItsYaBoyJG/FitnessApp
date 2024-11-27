import 'package:flutter/material.dart';

class DataListItem extends StatelessWidget {
  const DataListItem(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.listDataIndex,
      required this.subtitle,
      required this.onTap});

  final double height;
  final double width;
  final Color color;
  final String listDataIndex;
  final String subtitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: ListTile(
          titleTextStyle:
              const TextStyle(fontSize: 14.0, color: Color(0xff000000)),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              listDataIndex,
              textAlign: TextAlign.center,
            ),
          ),
          subtitleTextStyle:
              const TextStyle(fontSize: 14.0, color: Color(0xff000000)),
          subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
