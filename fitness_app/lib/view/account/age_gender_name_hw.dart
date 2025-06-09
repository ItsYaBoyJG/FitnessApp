import 'package:fitness_app/view/account/fields/age.dart';
import 'package:fitness_app/view/account/fields/gender.dart';
import 'package:fitness_app/view/account/fields/height_weight.dart';
import 'package:fitness_app/view/account/fields/name.dart';
import 'package:fitness_app/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgeGenderNameView extends StatefulWidget {
  const AgeGenderNameView({super.key});

  @override
  State<AgeGenderNameView> createState() => _AgeGenderNameViewState();
}

class _AgeGenderNameViewState extends State<AgeGenderNameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.sizeOf(context).width * 0.70,
            child: const Text(
              "Let's begin by adding some information so we can help you reach your goals.",
            ),
          ),
          const AgeField(),
          const GenderField(),
          const NameField(),
          const HeightWeightContainer(),
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        child: AppButton(
            onPressed: () {
              context.push('/goals');
            },
            text: 'Next'),
      ),
    );
  }
}
