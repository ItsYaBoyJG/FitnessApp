import 'package:health/health.dart';

class HealthDataTypes {
  final List<HealthDataType> _iosTypes = [
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.HEART_RATE,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
    HealthDataType.STEPS,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.FLIGHTS_CLIMBED,
    HealthDataType.DISTANCE_WALKING_RUNNING,
    HealthDataType.EXERCISE_TIME,
    HealthDataType.WORKOUT,
  ];
  final List<HealthDataType> _androidTypes = [
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BASAL_ENERGY_BURNED,
    HealthDataType.STEPS,
    HealthDataType.HEART_RATE,
    HealthDataType.HEART_RATE_VARIABILITY_RMSSD,
    HealthDataType.DISTANCE_DELTA,
    HealthDataType.RESPIRATORY_RATE,
    HealthDataType.FLIGHTS_CLIMBED,
    HealthDataType.TOTAL_CALORIES_BURNED,
    HealthDataType.WORKOUT,
  ];

  List<HealthDataType> getIosTypes() {
    return _iosTypes;
  }

  List<HealthDataType> getAndroidTypes() {
    return _androidTypes;
  }
}
