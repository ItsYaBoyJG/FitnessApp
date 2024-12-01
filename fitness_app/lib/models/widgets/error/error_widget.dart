import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Something went wrong. Please try again'),
    );
  }
}
