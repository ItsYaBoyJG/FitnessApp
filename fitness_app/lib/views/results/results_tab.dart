import 'dart:io';

import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:fitness_app/models/equatables/date_id_eq.dart';
import 'package:fitness_app/models/widgets/buttons/app_button.dart';
import 'package:fitness_app/utils/health_data_types.dart';
import 'package:fitness_app/models/widgets/containers/header.dart';
import 'package:fitness_app/models/widgets/containers/circle_badge.dart';
import 'package:fitness_app/views/profile/creation/fields/age_gender.dart';
import 'package:fitness_app/views/results/achievements.dart';
import 'package:fitness_app/views/results/calories_burned.dart';
import 'package:fitness_app/views/results/goal_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
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

  DateTime _selectedDay = DateTime.now();

  final HealthDataTypes _healthDataTypes = HealthDataTypes();
  List<HealthDataPoint> _healthDataList = [];
  List<HealthDataType> _types = [
    HealthDataType.WEIGHT,
    HealthDataType.TOTAL_CALORIES_BURNED,
    HealthDataType.WORKOUT,
  ];

  void getDataTypes() {
    if (Platform.isAndroid) {
      setState(() {
        _types = _healthDataTypes.getAndroidTypes();
      });
    } else if (Platform.isIOS) {
      setState(() {
        _types = _healthDataTypes.getIosTypes();
      });
    } else {
      return;
    }
  }

  void installHealthConnect() async {
    if (Platform.isAndroid) {
      final status = await Health().getHealthConnectSdkStatus();

      if (status == null) {
        await Health().installHealthConnect();
      } else {
        return;
      }
    }
    await Health().installHealthConnect();
  }

  Future<PermissionStatus> checkActivityPermissions() async {
    var activityStatus = await Permission.activityRecognition.status;
    if (await Permission.activityRecognition.request().isGranted) {
      activityStatus = PermissionStatus.granted;
      return activityStatus;
    } else {
      activityStatus = PermissionStatus.denied;
      return activityStatus;
    }
  }

  Future<PermissionStatus> checkLocationPermissions() async {
    var locationStatus = await Permission.location.status;
    if (await Permission.location.request().isGranted) {
      locationStatus = PermissionStatus.granted;
      return locationStatus;
    } else {
      locationStatus = PermissionStatus.denied;
      return locationStatus;
    }
  }

  void checkPermissions() async {
    final activityPerms = await checkActivityPermissions();
    final locationPerms = await checkLocationPermissions();

    print(activityPerms);
    print(locationPerms);

    List<HealthDataAccess> permissions =
        _types.map((e) => HealthDataAccess.READ).toList();

    bool? hasPerms =
        await Health().hasPermissions(_types, permissions: permissions);

    if (activityPerms == PermissionStatus.granted &&
        locationPerms == PermissionStatus.granted) {
      if (!hasPerms!) {
        try {
          await Health().requestAuthorization(_types, permissions: permissions);
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void getAllData() async {
    // final lastFetched;

    try {
      List<HealthDataPoint> list = await Health().getHealthDataFromTypes(
        types: _types,
        startTime: DateTime.now().subtract(const Duration(days: 1)),
        endTime: DateTime.now(),
      );
      list.sort((a, b) => b.dateTo.compareTo(a.dateTo));

      _healthDataList.addAll(list);
    } catch (e) {
      print(e);
    }
    _healthDataList = Health().removeDuplicates(_healthDataList);

    print(_healthDataList);
  }

  Future<int?>? fetchStepData() async {
    int? steps = 0;

    bool? stepPerms = await Health().hasPermissions([HealthDataType.STEPS]);

    if (stepPerms!) {
      try {
        steps = await Health().getTotalStepsInInterval(
          DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          DateTime.now(),
        );
      } catch (e) {}
    } else {
      stepPerms = await Health().requestAuthorization([HealthDataType.STEPS]);
    }
    return steps;
  }

  void configure() {
    try {
      Health().configure().then((e) {
        print('configured');
      });
      Health().getHealthConnectSdkStatus().then((e) {
        print('configed');
      });

      checkPermissions();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    //  configure();
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
