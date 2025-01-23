import 'package:fitness_app/utils/user_info_list.dart';
import 'package:fitness_app/view/account/fields/gain_weight_reasons.dart';
import 'package:fitness_app/view/account/widgets/profile_data_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GainWeightGoalReasons extends StatefulWidget {
  const GainWeightGoalReasons({super.key});

  @override
  State<GainWeightGoalReasons> createState() => _GainWeightGoalReasonsState();
}

class _GainWeightGoalReasonsState extends State<GainWeightGoalReasons> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  @override
  Widget build(BuildContext context) {
    return ProfileDataList(
        textBoxHeight: 50,
        textBoxWidth: MediaQuery.of(context).size.width - 45,
        textString:
            'What may have been the reason for not being able to acheive this goal previously?',
        listHeight: MediaQuery.of(context).size.height * 0.80,
        listWidth: MediaQuery.of(context).size.width - 15,
        itemCount: _userInfoLists.getGainWeightGoalReasons().length,
        itemBuilder: (context, index) {
          if (index <= _userInfoLists.getGainWeightGoalReasons().length - 1) {
            return GainWeightReasons(index: index);
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
