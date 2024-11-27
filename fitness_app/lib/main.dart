import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/controllers/http_calls/off_functions.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  OffFunctions offFunctions = OffFunctions();
  offFunctions.setUserAgent();

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}
