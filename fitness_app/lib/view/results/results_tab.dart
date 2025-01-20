import 'dart:io';

import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/models/widgets/buttons/app_button.dart';
import 'package:fitness_app/models/widgets/containers/header.dart';
import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/view/results/widgets/calories_burned.dart';
import 'package:fitness_app/view/results/widgets/goal_container.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class ResultsTab extends ConsumerStatefulWidget {
  const ResultsTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ResultsTabState();
  }
}

class _ResultsTabState extends ConsumerState<ResultsTab> {
  final UserAuth _userAuth = UserAuth();

  final DateTime _selectedDay = DateTime.now();

  Health _health = Health();

  _requestPermissions() async {
    if (Platform.isAndroid) {
      await Permission.accessNotificationPolicy.request();
    } else {
      await _health.requestAuthorization([
        HealthDataType.TOTAL_CALORIES_BURNED,
        HealthDataType.STEPS,
        HealthDataType.WORKOUT,
      ], permissions: [
        HealthDataAccess.READ
      ]);
    }
  }

  _checkPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.activityRecognition.isGranted) {
        return;
      } else {
        _requestPermissions();
      }
    } else {
      if (await _health.hasPermissions([
            HealthDataType.TOTAL_CALORIES_BURNED,
            HealthDataType.STEPS,
            HealthDataType.WORKOUT,
          ]) ==
          true) {
        return;
      } else {
        _requestPermissions();
      }
    }
  }

  void _configure() {
    try {
      _health.configure();
      if (Platform.isAndroid) {
        _health.getHealthConnectSdkStatus();
      } else {
        return;
      }
      _checkPermissions();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _configure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        ref.watch(userProfileDataProvider(_userAuth.getUserId()));
    final goalData = ref.watch(userGoalDataProvider(_userAuth.getUserId()));
    return goalData.when(
      data: (data) {
        if (data.data() != null && data.exists == true) {
          Map<String, dynamic> goalData = data.data() as Map<String, dynamic>;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Header(
                      title: 'Results',
                      rightSide: Container(),
                    ),
                    /* Container(
                      color: Colors.white,
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 35.0),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(241, 227, 255, 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Body Progress',
                              style: TextStyle(
                                color: Color.fromRGBO(190, 130, 255, 1.0),
                                fontSize: 18.0,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  print('camera pressed');
                                  addData();
                                },
                                icon: const Icon(Icons.camera_alt))
                          ],
                        ),
                      ),
                    ), */

                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25.0,
                        horizontal: 20.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(231, 241, 248, 1.0),
                      ),
                      child: CaloriesBurned(
                          caloriesGoal: double.parse(goalData['calorieGoal'])),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const GoalContainer(),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width - 20,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(14.0)),
            child: Column(
              children: [
                const Text(
                    'It looks like you do not have any information that would '
                    'listed on this page. You can go create it, however.'),
                AppButton(
                    onPressed: () {
                      //TODO: add navigation to goal page
                    },
                    text: 'Set a goal')
              ],
            ),
          );
        }
      },
      error: (error, stackTrace) {
        return Text('error');
      },
      loading: () {
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
