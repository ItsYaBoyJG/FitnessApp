import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/data/local/hive_registrar.g.dart';
import 'package:fitness_app/data/off_functions/off_functions.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/app.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  OffFunctions offFunctions = OffFunctions();
  offFunctions.setUserAgent();

  await Hive.initFlutter();
  Hive.registerAdapters();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}
