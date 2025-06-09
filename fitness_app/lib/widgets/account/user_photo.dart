import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 10.0, 0.0),
      child: GestureDetector(
        child: CircleAvatar(
          foregroundImage: AssetImage(image),
          radius: 20,
        ),
        onTap: () {
          context.push('/profile');
        },
      ),
    );
  }
}
