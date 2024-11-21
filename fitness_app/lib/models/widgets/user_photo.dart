import 'package:fitness_app/views/profile/profile.dart';
import 'package:flutter/material.dart';

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
          radius: 25,
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
    );
  }
}
