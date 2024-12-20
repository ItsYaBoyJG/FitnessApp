import 'dart:io';

import 'package:fitness_app/models/widgets/buttons/app_button.dart';
import 'package:fitness_app/utils/health_data_types.dart';
import 'package:fitness_app/views/profile/creation/fields/age_gender.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProfileInfo extends ConsumerStatefulWidget {
  const AddProfileInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddProfileInfoState();
  }
}

class _AddProfileInfoState extends ConsumerState<AddProfileInfo> {
  //TODO: add more of a add info start page rather than just having it
  // direct users directly to age and gender container. Also add the option
  // to add Phone's Health Data
  Health _health = Health();
  HealthDataTypes _healthDataTypes = HealthDataTypes();

  getHealthData() async {
    if (Platform.isAndroid) {
      List<HealthDataType> types = _healthDataTypes.getAndroidTypes();
      bool requested = await _health
          .requestAuthorization(types, permissions: [HealthDataAccess.READ]);

      if (requested) {
        // https://yusufbiberoglu.medium.com/flutter-health-package-usage-with-tutorial-video-822db8eafbb3
      } else {}
    } else {}
  }

  bool _addManuallySelected = false;

  @override
  Widget build(BuildContext context) {
    return _addManuallySelected == false
        ? Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width - 80,
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
                  child: const Text(
                      'You can add your health and fitness data, and your information'
                      ' from either your health app on your device. Or you can enter it manaully. '),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(onPressed: () {}, text: 'Use Health App'),
                    AppButton(
                        onPressed: () {
                          setState(() {
                            _addManuallySelected = true;
                          });
                        },
                        text: 'Enter Manually')
                  ],
                )
              ],
            ),
          )
        : const AgeGenderContainer();
  }
}
