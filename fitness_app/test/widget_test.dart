// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fitness_app/view/diet/breakfast_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/providers.dart';

void main() {
  testWidgets('test display', (tester) async {
    await tester.pumpWidget(ProviderScope(child: WidgetTest()));
  });
}

class WidgetTest extends StatelessWidget {
  const WidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(builder: (context, ref, child) {
        final prov = ref.watch(foodItems);
        return BreakfastTabView();
      }),
    );
  }
}
