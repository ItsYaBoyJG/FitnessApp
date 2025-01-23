import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/utils/user_info_list.dart';
import 'package:fitness_app/view/account/widgets/data_list_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoseWeightReasons extends ConsumerStatefulWidget {
  const LoseWeightReasons({super.key, required this.index});

  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoseWeightReasonsState();
  }
}

class _LoseWeightReasonsState extends ConsumerState<LoseWeightReasons> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  //Used to highlight the selected tile in the list view
  int? _isSelected;

  @override
  Widget build(BuildContext context) {
    final index = widget.index;
    return DataListItem(
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        color: _isSelected == index
            ? const Color(0xff3DA2C2)
            : const Color(0xff000000),
        listDataIndex: _userInfoLists.getLoseWeightGoalReasons()[index],
        subtitle: '',
        onTap: () {
          setState(() {
            _isSelected = index;
          });

          ref.read(userGoalReasonStateProvider.notifier).state =
              _userInfoLists.getLoseWeightGoalReasons()[index];
        });
  }
}
