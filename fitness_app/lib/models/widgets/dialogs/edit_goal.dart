import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/data/writes/write_to_db.dart';
import 'package:fitness_app/utils/lists/user_info_list.dart';
import 'package:fitness_app/view/profile/creation/widgets/data_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditGoalDialog extends StatefulWidget {
  const EditGoalDialog({super.key, required this.currentGoal});

  final String currentGoal;

  @override
  State<EditGoalDialog> createState() => _EditGoalDialogState();
}

class _EditGoalDialogState extends State<EditGoalDialog> {
  final UserInfoLists _userInfoLists = UserInfoLists();
  final WriteToDb _writeToDb = WriteToDb();
  final UserAuth _userAuth = UserAuth();

  //Used to highlight the selected tile in the list view
  int? _isSelected;
  String _newGoal = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change Goal'),
      content: SizedBox(
        height: 250,
        width: 250,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 75,
                width: MediaQuery.of(context).size.width - 20,
                child:
                    const Text('If you would like to change your current goal. '
                        'Please select a new goal below.'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width - 50,
                child: ListView.builder(
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
                            _newGoal = _userInfoLists.getGoalsList()[index];
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsPadding: const EdgeInsets.all(16.0),
      actions: [
        OutlinedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancel')),
        OutlinedButton(
            onPressed: () {
              _writeToDb.updateUserGoal(_userAuth.getUserId(), _newGoal);
            },
            child: const Text('Make Changes'))
      ],
    );
  }
}
