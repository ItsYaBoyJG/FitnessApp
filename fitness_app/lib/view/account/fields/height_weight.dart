import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/widgets/buttons/app_button.dart';
import 'package:fitness_app/view/account/widgets/height_val_container.dart';
import 'package:fitness_app/view/account/widgets/weight_val_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class HeightWeightContainer extends ConsumerStatefulWidget {
  const HeightWeightContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HeightWeightContainerState();
  }
}

class _HeightWeightContainerState extends ConsumerState<HeightWeightContainer> {
  bool heightSelected = false;
  bool weightSelected = false;

  final TextEditingController _cmController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weightValue = ref.watch(userWeightValueProvider);
    final cmValue = ref.watch(userCmHeightValueProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          HValueContainer(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width - 15,
              textBoxHeight: 50,
              textBoxWidth: 100,
              heightValueWidget: SizedBox(
                height: 50,
                width: 95,
                child: TextField(
                  controller: _cmController,
                  onChanged: (value) {
                    if (value != '' || value.length > 1) {
                      ref.read(userCmHeightValueProvider.notifier).state =
                          double.parse(value);
                    } else {
                      return;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: cmValue == 0 ? '0' : '$cmValue',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                  ),
                ),
              )),
          WValueContainer(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width - 15,
              textBoxHeight: 50,
              textBoxWidth: 100,
              controller: _weightController,
              onChanged: (value) {
                ref.read(userWeightValueProvider.notifier).state =
                    double.parse(value);
              },
              labelText: weightValue == 0 ? '0' : '$weightValue')
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        child: AppButton(
            onPressed: () {
              context.push('/activity');
            },
            text: 'Next'),
      ),
    );
  }
}
