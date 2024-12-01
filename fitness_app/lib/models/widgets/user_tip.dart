import 'package:flutter/material.dart';

class UserTip extends StatelessWidget {
  const UserTip({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 15.0,
        top: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 105,
            height: 105,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(360.0),
              ),
              border: Border.all(
                color: Colors.white,
                width: 7.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
