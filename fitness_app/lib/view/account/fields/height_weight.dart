import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/account/widgets/height_val_container.dart';
import 'package:fitness_app/view/account/widgets/weight_val_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HeightWeightContainer extends HookConsumerWidget {
  const HeightWeightContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightController = useTextEditingController();
    final weightController = useTextEditingController();
    final weightValue = ref.watch(userWeightValueProvider);
    final heightValue = ref.watch(userCmHeightValueProvider);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.20,
      width: MediaQuery.sizeOf(context).width * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HValueContainer(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.40,
            textBoxHeight: 49,
            textBoxWidth: 100,
            controller: heightController,
            onChanged: (value) {
              ref.read(userCmHeightValueProvider.notifier).state =
                  double.parse(value);
            },
            labelText: heightValue == 0 ? '0' : '$heightValue',
          ),
          WValueContainer(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.40,
              textBoxHeight: 70,
              textBoxWidth: 100,
              controller: weightController,
              onChanged: (value) {
                ref.read(userWeightValueProvider.notifier).state =
                    double.parse(value);
              },
              labelText: weightValue == 0 ? '0' : '$weightValue')
        ],
      ),
    );
  }
}
