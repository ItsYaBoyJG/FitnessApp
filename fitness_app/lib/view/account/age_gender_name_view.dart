import 'package:fitness_app/view/account/fields/age.dart';
import 'package:fitness_app/view/account/fields/gender.dart';
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width - 45,
                child: const Text(
                  'How old are you?',
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            ///
            const AgeField(),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width - 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Please select your gender assigned at birth.'),
                  IconButton(
                      onPressed: () {
                        //TODO: add either a pop up dialog or just link to a site from the website that
                        // explains why there's only two when it comes to calculating
                        // BMR and daily calories
                      },
                      icon: const Icon(Icons.question_mark)),
                ],
              ),
            ),
            const GenderField(),
            const NameField(),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        child: AppButton(
            onPressed: () {
              context.push('/heightandweight');
            },
            text: 'Next'),
      ),
    );
  }
}
