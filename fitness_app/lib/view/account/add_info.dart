import 'dart:io';

import 'package:fitness_app/view/account/age_gender_name_hw.dart';
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
  final Health _health = Health();

  String _weight = '';

  String _height = '';

  String _date = '';

  bool _addManuallySelected = false;

  void _requestHealthDataAccess() async {
    String weight = '';
    String height = '';
    String birth = '';
    if (Platform.isAndroid) {
      if (await Permission.activityRecognition.request().isGranted) {
        weight = _health.getHealthDataFromTypes(types: [
          HealthDataType.WEIGHT,
        ], startTime: DateTime.now(), endTime: DateTime.now()).toString();

        height = _health.getHealthDataFromTypes(types: [
          HealthDataType.HEIGHT,
        ], startTime: DateTime.now(), endTime: DateTime.now()).toString();
        birth = _health.getHealthDataFromTypes(types: [
          HealthDataType.BIRTH_DATE,
        ], startTime: DateTime.now(), endTime: DateTime.now()).toString();
        setState(() {
          _weight = weight;
          _height = height;
          _date = birth;
        });
      } else {
        //showHealthDataRequestDialog
      }
    } else {
      birth = _health.requestAuthorization([
        HealthDataType.BIRTH_DATE,
      ], permissions: [
        HealthDataAccess.READ
      ]).toString();

      height = _health.getHealthDataFromTypes(types: [
        HealthDataType.HEIGHT,
      ], startTime: DateTime(2000), endTime: DateTime.now()).toString();
      weight = _health.getHealthDataFromTypes(types: [
        HealthDataType.WEIGHT,
      ], startTime: DateTime.now(), endTime: DateTime.now()).toString();
      setState(() {
        _weight = weight;
        _height = height;
        _date = birth;
      });
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
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const AgeGenderNameView();
  }
}
