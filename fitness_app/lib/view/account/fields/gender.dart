import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/utils/user_info_list.dart';
import 'package:fitness_app/widgets/buttons/app_button.dart';
import 'package:fitness_app/view/account/widgets/data_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenderField extends StatefulHookConsumerWidget {
  const GenderField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GenderFieldState();
  }
}

class _GenderFieldState extends ConsumerState<GenderField> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  int? _isSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width - 15,
      child: ListView.builder(
          itemCount: _userInfoLists.getGenderList().length,
          itemBuilder: (context, index) {
            return DataListItem(
              height: 50,
              width: MediaQuery.of(context).size.width - 15,
              color: _isSelected == index
                  ? const Color(0xff3DA2C2)
                  : const Color(0xff000000),
              listDataIndex: _userInfoLists.getGenderList()[index],
              subtitle: '',
              onTap: () {
                setState(() {
                  _isSelected = index;
                });
                ref.read(userGenderStateProvider.notifier).state =
                    _userInfoLists.getGenderList()[index];
              },
            );
          }),
    );
  }
}
