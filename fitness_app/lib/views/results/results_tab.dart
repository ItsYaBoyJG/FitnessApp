import 'dart:io';

import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:fitness_app/models/equatables/exercise.dart';
import 'package:fitness_app/models/widgets/buttons/app_button.dart';
import 'package:fitness_app/utils/health_data_types.dart';
import 'package:fitness_app/models/widgets/header.dart';
import 'package:fitness_app/models/widgets/circle_badge.dart';
import 'package:fitness_app/views/results/achievements.dart';
import 'package:fitness_app/views/results/calories_burned.dart';
import 'package:fitness_app/views/results/goal_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
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
    var locationStatus = await Permission.activityRecognition.status;
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

  getHealtConnectStatus() async {
    assert(Platform.isAndroid);

    final status = await Health().getHealthConnectSdkStatus();
  }

  configure() {
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
    configure();
    super.initState();
  }

  Future<void> addData() async {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(minutes: 20));

    // Add data for supported types
    // NOTE: These are only the ones supported on Androids new API Health Connect.
    // Both Android's Health Connect and iOS' HealthKit have more types that we support in the enum list [HealthDataType]
    // Add more - like AUDIOGRAM, HEADACHE_SEVERE etc. to try them.
    bool success = true;

    // misc. health data examples using the writeHealthData() method
    success &= await Health().writeHealthData(
        value: 1.925,
        type: HealthDataType.HEIGHT,
        startTime: earlier,
        endTime: now,
        recordingMethod: RecordingMethod.manual);
    success &= await Health().writeHealthData(
        value: 90,
        type: HealthDataType.WEIGHT,
        startTime: now,
        recordingMethod: RecordingMethod.manual);
    success &= await Health().writeHealthData(
        value: 90,
        type: HealthDataType.HEART_RATE,
        startTime: earlier,
        endTime: now,
        recordingMethod: RecordingMethod.manual);
    success &= await Health().writeHealthData(
        value: 90,
        type: HealthDataType.STEPS,
        startTime: earlier,
        endTime: now,
        recordingMethod: RecordingMethod.manual);
    success &= await Health().writeHealthData(
      value: 200,
      type: HealthDataType.ACTIVE_ENERGY_BURNED,
      startTime: earlier,
      endTime: now,
    );
    success &= await Health().writeHealthData(
        value: 70,
        type: HealthDataType.HEART_RATE,
        startTime: earlier,
        endTime: now);
    if (Platform.isIOS) {
      success &= await Health().writeHealthData(
          value: 30,
          type: HealthDataType.HEART_RATE_VARIABILITY_SDNN,
          startTime: earlier,
          endTime: now);
    } else {
      success &= await Health().writeHealthData(
          value: 30,
          type: HealthDataType.HEART_RATE_VARIABILITY_RMSSD,
          startTime: earlier,
          endTime: now);
    }
    success &= await Health().writeHealthData(
        value: 37,
        type: HealthDataType.BODY_TEMPERATURE,
        startTime: earlier,
        endTime: now);
    success &= await Health().writeHealthData(
        value: 105,
        type: HealthDataType.BLOOD_GLUCOSE,
        startTime: earlier,
        endTime: now);
    success &= await Health().writeHealthData(
        value: 1.8,
        type: HealthDataType.WATER,
        startTime: earlier,
        endTime: now);

    // different types of sleep
    success &= await Health().writeHealthData(
        value: 0.0,
        type: HealthDataType.SLEEP_REM,
        startTime: earlier,
        endTime: now);
    success &= await Health().writeHealthData(
        value: 0.0,
        type: HealthDataType.SLEEP_ASLEEP,
        startTime: earlier,
        endTime: now);
    success &= await Health().writeHealthData(
        value: 0.0,
        type: HealthDataType.SLEEP_AWAKE,
        startTime: earlier,
        endTime: now);
    success &= await Health().writeHealthData(
        value: 0.0,
        type: HealthDataType.SLEEP_DEEP,
        startTime: earlier,
        endTime: now);

    // specialized write methods
    success &= await Health().writeBloodOxygen(
      saturation: 98,
      startTime: earlier,
      endTime: now,
    );
    success &= await Health().writeWorkoutData(
      activityType: HealthWorkoutActivityType.AMERICAN_FOOTBALL,
      title: "Random workout name that shows up in Health Connect",
      start: now.subtract(const Duration(minutes: 15)),
      end: now,
      totalDistance: 2430,
      totalEnergyBurned: 400,
    );
    success &= await Health().writeBloodPressure(
      systolic: 90,
      diastolic: 80,
      startTime: now,
    );
    success &= await Health().writeMeal(
        mealType: MealType.SNACK,
        startTime: earlier,
        endTime: now,
        caloriesConsumed: 1000,
        carbohydrates: 50,
        protein: 25,
        fatTotal: 50,
        name: "Banana",
        caffeine: 0.002,
        vitaminA: 0.001,
        vitaminC: 0.002,
        vitaminD: 0.003,
        vitaminE: 0.004,
        vitaminK: 0.005,
        b1Thiamin: 0.006,
        b2Riboflavin: 0.007,
        b3Niacin: 0.008,
        b5PantothenicAcid: 0.009,
        b6Pyridoxine: 0.010,
        b7Biotin: 0.011,
        b9Folate: 0.012,
        b12Cobalamin: 0.013,
        calcium: 0.015,
        copper: 0.016,
        iodine: 0.017,
        iron: 0.018,
        magnesium: 0.019,
        manganese: 0.020,
        phosphorus: 0.021,
        potassium: 0.022,
        selenium: 0.023,
        sodium: 0.024,
        zinc: 0.025,
        water: 0.026,
        molybdenum: 0.027,
        chloride: 0.028,
        chromium: 0.029,
        cholesterol: 0.030,
        fiber: 0.031,
        fatMonounsaturated: 0.032,
        fatPolyunsaturated: 0.033,
        fatUnsaturated: 0.065,
        fatTransMonoenoic: 0.65,
        fatSaturated: 066,
        sugar: 0.067,
        recordingMethod: RecordingMethod.manual);

    // Store an Audiogram - only available on iOS
    // const frequencies = [125.0, 500.0, 1000.0, 2000.0, 4000.0, 8000.0];
    // const leftEarSensitivities = [49.0, 54.0, 89.0, 52.0, 77.0, 35.0];
    // const rightEarSensitivities = [76.0, 66.0, 90.0, 22.0, 85.0, 44.5];
    // success &= await Health().writeAudiogram(
    //   frequencies,
    //   leftEarSensitivities,
    //   rightEarSensitivities,
    //   now,
    //   now,
    //   metadata: {
    //     "HKExternalUUID": "uniqueID",
    //     "HKDeviceName": "bluetooth headphone",
    //   },
    // );

    success &= await Health().writeMenstruationFlow(
      flow: MenstrualFlow.medium,
      isStartOfCycle: true,
      startTime: earlier,
      endTime: now,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        ref.watch(userProfileDataProvider(_userAuth.getUserId()));
    final exerciseData = ref.watch(userExerciseDataProvider(
        ExerciseEquatable(id: _userAuth.getUserId(), date: DateTime.now())));
    return exerciseData.when(
      data: (data) {
        if (data.docs.isNotEmpty) {
          Map<String, dynamic> eData = data.docs as Map<String, dynamic>;
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
                      child: userProfileData.when(data: (data) {
                        return Column(
                          children: [
                            //   Achievements( firstCalGoal: firstCalGoal, firstCalGoalTotal: firstCalGoalTotal, secondCalGoal: secondCalGoal, secondCalGoalTotal: secondCalGoalTotal),
                            CaloriesBurned(
                                caloriesBurned: eData['caloriesBurned'],
                                calorieGoal: eData['caloriesGoal']),
                          ],
                        );
                      }, error: (error, stackTrace) {
                        print(error);
                        return Center(
                          child: Text(' error'),
                        );
                      }, loading: () {
                        return const CircularProgressIndicator.adaptive();
                      }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 55.0,
                        left: 20.0,
                        right: 20.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*   Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 45.0,
                        horizontal: 30.0,
                      ),
                      child: const Text(
                        'Track your weight every morning before your breakfast',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),*/
                          SizedBox(
                            height: 50,
                          ),
                          GoalContainer()
                        ],
                      ),
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
