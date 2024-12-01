import 'package:fitness_app/routes.dart';
import 'package:fitness_app/utils/theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.appTheme,
      routerConfig: router,
    );
  }
}
