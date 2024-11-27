import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyFatContainer extends ConsumerStatefulWidget {
  const BodyFatContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BodyFatContainerState();
  }
}

class _BodyFatContainerState extends ConsumerState<BodyFatContainer> {
  TextEditingController bfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width - 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Body Fat % (Optional)'),
          SizedBox(
            height: 50,
            width: 80,
            child: TextFormField(
              controller: bfController,
              decoration: InputDecoration(
                labelText: ref.read(userBfPercStateProvider.notifier).state == 0
                    ? ''
                    : '${ref.read(userBfPercStateProvider.notifier).state}',
                contentPadding:
                    const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
