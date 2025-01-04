import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/models/widgets/dialogs/edit_goal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoalContainer extends ConsumerStatefulWidget {
  const GoalContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GoalContainerState();
  }
}

class _GoalContainerState extends ConsumerState<GoalContainer> {
  final UserAuth _userAuth = UserAuth();

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        ref.watch(userProfileDataProvider(_userAuth.getUserId()));

    return userProfileData.when(data: (data) {
      if (data.data() != null &&
          data.exists == true &&
          data.data()!.isNotEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Goal',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: const EdgeInsets.only(right: 10.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(231, 241, 255, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 35.0),
                    child: Column(
                      children: [
                        Text(
                          'Current Goal',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  5.0, 10.0, 15.0, 5.0),
                              child: Text(
                                '${data.data()!['fitnessGoal']}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 5.0, 5.0),
                              child: TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return EditGoalDialog(
                                            currentGoal:
                                                data.data()!['fitnessGoal']);
                                      });
                                },
                                label: const Text('Edit'),
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /*  Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width - 20,
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 227, 255, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                ],
              ),
            ) */
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.50,
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(241, 227, 255, 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Goal',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text('Add'),
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        );
      }
    }, error: (error, stackTrace) {
      return ErrorWidget(error);
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
