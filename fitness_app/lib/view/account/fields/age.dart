import 'package:fitness_app/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgeField extends HookConsumerWidget {
  const AgeField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ageController = useTextEditingController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width - 25,
      child: TextFormField(
        controller: ageController,
        maxLength: 3,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          hintText: 'Age',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        onChanged: (v) {
          ref.read(userAgeProvider.notifier).state = int.parse(v);
        },
      ),
    );
  }
}
