import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/utils/lists/user_info_list.dart';
import 'package:fitness_app/view/profile/creation/widgets/data_list_item.dart';
import 'package:fitness_app/view/profile/creation/widgets/profile_data_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class GoalReasonsContainer extends ConsumerStatefulWidget {
  const GoalReasonsContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GoalReasonsContainerState();
  }
}

class _GoalReasonsContainerState extends ConsumerState<GoalReasonsContainer> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  //Used to highlight the selected tile in the list view
  int? _isSelected;

  @override
  Widget build(BuildContext context) {
    final goal = ref.watch(userGoalStateProvider);
    ref.watch(userGoalReasonStateProvider);

    switch (goal) {
      case 'Lose Weight':
        return ProfileDataList(
            textBoxHeight: 50,
            textBoxWidth: MediaQuery.of(context).size.width - 45,
            textString:
                'What may have been the reason for not being able to acheive this goal previously?',
            listHeight: MediaQuery.of(context).size.height * 0.80,
            listWidth: MediaQuery.of(context).size.width - 15,
            itemCount: _userInfoLists.getLoseWeightGoalReasons().length,
            itemBuilder: (context, index) {
              return DataListItem(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 15,
                  color: _isSelected == index
                      ? const Color(0xff3DA2C2)
                      : const Color(0xff000000),
                  listDataIndex:
                      _userInfoLists.getLoseWeightGoalReasons()[index],
                  subtitle: '',
                  onTap: () {
                    setState(() {
                      _isSelected = index;
                    });

                    ref.read(userGoalReasonStateProvider.notifier).state =
                        _userInfoLists.getLoseWeightGoalReasons()[index];
                  });
            },
            bottomContainerHeight: 50,
            bottomContainerWidth: MediaQuery.of(context).size.width - 15,
            onPressed: () {
              context.push('/creationsummary');
            },
            buttonText: 'Next');

      default:
        return ProfileDataList(
            textBoxHeight: 50,
            textBoxWidth: MediaQuery.of(context).size.width - 45,
            textString:
                'What may have been the reason for not being able to acheive this goal previously?',
            listHeight: MediaQuery.of(context).size.height * 0.80,
            listWidth: MediaQuery.of(context).size.width - 15,
            itemCount: _userInfoLists.getGainWeightGoalReasons().length,
            itemBuilder: (context, index) {
              if (index <=
                  _userInfoLists.getGainWeightGoalReasons().length - 1) {
                return DataListItem(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 15,
                    color: _isSelected == index
                        ? const Color(0xff3DA2C2)
                        : const Color(0xff000000),
                    listDataIndex:
                        _userInfoLists.getGainWeightGoalReasons()[index],
                    subtitle: '',
                    onTap: () {
                      setState(() {
                        _isSelected = index;
                      });
                      ref.read(userGoalReasonStateProvider.notifier).state =
                          _userInfoLists.getGainWeightGoalReasons()[index];
                    });
              }
              return Container();
            },
            bottomContainerHeight: 50,
            bottomContainerWidth: MediaQuery.of(context).size.width - 15,
            onPressed: () {
              context.push('/creationsummary');
            },
            buttonText: 'Next');
    }
  }
}
