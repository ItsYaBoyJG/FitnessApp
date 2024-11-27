import 'package:flutter/material.dart';

class FoodSearchBar extends StatelessWidget {
  const FoodSearchBar(
      {super.key,
      required this.height,
      required this.width,
      required this.controller,
      this.onFieldSubmitted});

  final double height;
  final double width;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            icon: Icon(Icons.search),
            hintText: 'Search'),
      ),
    );
  }
}
