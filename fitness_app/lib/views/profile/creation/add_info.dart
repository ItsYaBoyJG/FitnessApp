import 'package:fitness_app/views/profile/creation/fields/age_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  Widget build(BuildContext context) {
    return const AgeGenderContainer();
  }
}
