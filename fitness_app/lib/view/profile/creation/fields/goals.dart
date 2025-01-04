import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/utils/lists/user_info_list.dart';
import 'package:fitness_app/view/profile/creation/widgets/data_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fitness_app/view/profile/creation/widgets/profile_data_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoalsContainer extends ConsumerStatefulWidget {
  const GoalsContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GoalsContainerState();
  }
}

class _GoalsContainerState extends ConsumerState<GoalsContainer> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  //Used to highlight the selected tile in the list view
  int? _isSelected;

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
          return DataListItem(
            height: 50,
            width: MediaQuery.of(context).size.width - 15,
            color: _isSelected == index
                ? const Color(0xff3DA2C2)
                : const Color(0xff000000),
            listDataIndex: _userInfoLists.getGoalsList()[index],
            subtitle: '',
            onTap: () {
              setState(() {
                _isSelected = index;
              });
              ref.read(userGoalStateProvider.notifier).state =
                  _userInfoLists.getGoalsList()[index];
            },
          );
        },
        bottomContainerHeight: 50,
        bottomContainerWidth: MediaQuery.of(context).size.width - 15,
        onPressed: () {
          context.push('/goalreasons');
        },
        buttonText: 'Next');
  }
}
