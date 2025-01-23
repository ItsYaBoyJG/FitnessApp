import 'package:fitness_app/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NameField extends HookConsumerWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width - 15,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 50,
            child: const Text(
                'Enter your name, nickname or a username. Something that '
                'you wish to be known by.'),
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Username',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
            ),
            onChanged: (value) {
              if (value != '' || value.length > 5) {
                ref.read(userNameStateProvider.notifier).state =
                    nameController.text;
              } else {}
            },
          )
        ],
      ),
    );
  }
}
