import 'package:fitness_app/utils/user_info_list.dart';
import 'package:fitness_app/view/account/fields/goals.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/view/account/widgets/profile_data_list.dart';

class GoalsView extends StatefulWidget {
  const GoalsView({super.key});

  @override
  State<GoalsView> createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  @override
  Widget build(BuildContext context) {
    return ProfileDataList(
        textBoxHeight: 50,
        textBoxWidth: MediaQuery.of(context).size.width - 45,
        textString:
            'What is your goal? Please select what aligns the closets to what you want to achieve.',
        listHeight: MediaQuery.of(context).size.height * 0.80,
        listWidth: MediaQuery.of(context).size.width - 15,
        itemCount: _userInfoLists.getGoalsList().length,
        itemBuilder: (context, index) {
          return GoalsField(index: index);
        },
        bottomContainerHeight: 50,
        bottomContainerWidth: MediaQuery.of(context).size.width - 15,
        onPressed: () {
          context.push('/goalreasons');
        },
        buttonText: 'Next');
  }
}
