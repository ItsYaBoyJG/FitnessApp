import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/utils/user_info_list.dart';
import 'package:fitness_app/view/account/widgets/data_list_item.dart';
import 'package:flutter/material.dart';

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
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width - 15,
      child: Column(
        children: [
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
          SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width * 0.90,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
                      ref.read(userGenderProvider.notifier).state =
                          _userInfoLists.getGenderList()[index];
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
