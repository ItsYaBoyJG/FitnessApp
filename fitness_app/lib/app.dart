import 'package:fitness_app/theme.dart';
import 'package:fitness_app/views/home.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: const Home(),
    );
  }
}
