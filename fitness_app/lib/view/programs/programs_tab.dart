import 'package:fitness_app/widgets/containers/header.dart';
import 'package:fitness_app/widgets/account/user_photo.dart';
import 'package:fitness_app/view/programs/suggestions/c_suggestion.dart';
import 'package:fitness_app/view/programs/suggestions/lb_suggestion.dart';
import 'package:fitness_app/view/programs/suggestions/main_suggestion.dart';
import 'package:fitness_app/view/programs/suggestions/ub_suggestion.dart';
import 'package:flutter/material.dart';

class ProgramsTab extends StatefulWidget {
  const ProgramsTab({super.key});

  @override
  State<ProgramsTab> createState() => _ProgramsTabState();
}

class _ProgramsTabState extends State<ProgramsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: const Column(
              children: [
                Header(
                  title: 'Programs',
                  rightSide: UserPhoto(
                    image: 'assets/images/owl.jpg',
                  ),
                ),
                Text('Recommended for you'),
                MainSuggestion(),
                CardioSuggestions(),
                LowerBodySuggestions(),
                UpperBodySuggestions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
