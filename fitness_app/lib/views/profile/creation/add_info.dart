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
  final _key = GlobalKey<FormState>();

  TextEditingController bfController = TextEditingController();

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return const AgeGenderContainer();
  }
}
