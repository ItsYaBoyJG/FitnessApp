import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:fitness_app/models/lists/user_info_list.dart';
import 'package:fitness_app/models/widgets/creation/data_list_item.dart';
import 'package:fitness_app/models/widgets/creation/profile_data_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ActivityContainer extends ConsumerStatefulWidget {
  const ActivityContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ActivityContainerState();
  }
}

class _ActivityContainerState extends ConsumerState<ActivityContainer> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  String _activity = '';

  //Used to highlight the selected tile in the list view
  int? _isSelected;

  @override
  Widget build(BuildContext context) {
    final activityLevel = ref.watch(userActivityLevelStateProvider);
    final list = _userInfoLists.getActivityList;
    return ProfileDataList(
        textBoxHeight: 50,
        textBoxWidth: MediaQuery.of(context).size.width - 35,
        textString: 'What is your baseline activity level?',
        listHeight: MediaQuery.of(context).size.height * 0.50,
        listWidth: MediaQuery.of(context).size.width - 15,
        itemCount: _userInfoLists.getActivityList().length +
            _userInfoLists.getActivityDescriptionList().length,
        itemBuilder: (context, index) {
          if (index <= _userInfoLists.getActivityList().length - 1 &&
              index <= _userInfoLists.getActivityDescriptionList().length - 1) {
            return DataListItem(
              height: 80,
              width: MediaQuery.of(context).size.width - 15,
              color: _isSelected == index
                  ? const Color(0xff3DA2C2)
                  : const Color(0xff000000),
              listDataIndex: _userInfoLists.getActivityList()[index],
              subtitle: _userInfoLists.getActivityDescriptionList()[index],
              onTap: () {
                setState(() {
                  _isSelected = index;
                });
                ref.read(userActivityLevelStateProvider.notifier).state =
                    _userInfoLists.getActivityList()[index];
              },
            );
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
