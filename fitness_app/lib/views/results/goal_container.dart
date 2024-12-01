import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Goal',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.55,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Goal',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blueGrey[200],
                        ),
                      ),
                      Text(
                        data.fitnessGoal,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.33,
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(241, 227, 255, 1.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Goal',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blueGrey[200],
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
    }, error: (error, stackTrace) {
      return Text('error');
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
