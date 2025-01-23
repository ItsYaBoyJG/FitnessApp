import 'package:fitness_app/utils/user_info_list.dart';
import 'package:fitness_app/view/account/fields/activity.dart';
import 'package:fitness_app/view/account/widgets/profile_data_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  //Used to highlight the selected tile in the list view
  int? _isSelected;

  @override
  Widget build(BuildContext context) {
    return ProfileDataList(
        textBoxHeight: 50,
        textBoxWidth: MediaQuery.of(context).size.width - 35,
        textString: 'What is your baseline activity level?',
        listHeight: 80,
        listWidth: MediaQuery.of(context).size.width - 15,
        itemCount: _userInfoLists.getActivityList().length +
            _userInfoLists.getActivityDescriptionList().length,
        itemBuilder: (context, index) {
          if (index <= _userInfoLists.getActivityList().length - 1 &&
              index <= _userInfoLists.getActivityDescriptionList().length - 1) {
            return ActivityField(index: index);
          }
          return Container();
        },
        bottomContainerHeight: 50,
        bottomContainerWidth: MediaQuery.of(context).size.width - 15,
        onPressed: () {
          context.push('/goals');
        },
        buttonText: 'Next');
  }
}
