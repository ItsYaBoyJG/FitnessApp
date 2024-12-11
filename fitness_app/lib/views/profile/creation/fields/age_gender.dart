import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:fitness_app/models/lists/user_info_list.dart';
import 'package:fitness_app/models/widgets/buttons/app_button.dart';
import 'package:fitness_app/models/widgets/creation/data_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgeGenderContainer extends ConsumerStatefulWidget {
  const AgeGenderContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AgeGenderContainerState();
  }
}

class _AgeGenderContainerState extends ConsumerState<AgeGenderContainer> {
  final UserInfoLists _userInfoLists = UserInfoLists();

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //Used to highlight the selected tile in the list view
  int? _isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width - 45,
                child: const Text(
                  'How old are you?',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width - 25,
              child: TextFormField(
                controller: _ageController,
                maxLength: 3,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  hintText: 'Age',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
                onChanged: (v) {
                  ref.read(userAgeStateProvider.notifier).state = int.parse(v);
                },
              ),
            ),
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width - 15,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
                    child: const Text(
                        'Enter your name, nickname or a username. Something that '
                        'you wish to be known by.'),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                    onChanged: (value) {
                      if (value != '' || value.length > 5) {
                        ref.read(userNameStateProvider.notifier).state =
                            _nameController.text;
                      } else {}
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        width: MediaQuery.of(context).size.width - 15,
        child: AppButton(
            onPressed: () {
              context.push('/heightandweight');
            },
            text: 'Next'),
      ),
    );
  }
}
