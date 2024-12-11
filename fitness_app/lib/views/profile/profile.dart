import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/backend/writes/write_to_db.dart';
import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:fitness_app/models/data/recipe.dart';
import 'package:fitness_app/models/data/workout_component.dart';
import 'package:fitness_app/models/data/workout_plan.dart';
import 'package:fitness_app/models/widgets/containers/main_program_card.dart';
import 'package:fitness_app/models/widgets/dialogs/edit_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final UserAuth _userAuth = UserAuth();

  Future<String> getImage(String imagePath) async {
    final b = await rootBundle.load(imagePath);

    Uint8List r = b.buffer.asUint8List(b.offsetInBytes, b.lengthInBytes);
    return r.toString();
  }

  @override
  Widget build(BuildContext context) {
    final userProfileData =
        ref.watch(userProfileDataProvider(_userAuth.getUserId()));
    final savedRecipes =
        ref.watch(userSavedRecipesProvider(_userAuth.getUserId()));
    return userProfileData.when(data: (data) {
      if (data.data() != null &&
          data.exists == true &&
          data.data()!.isNotEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            actions: [
              OutlinedButton(onPressed: () {}, child: const Text('Account'))
            ],
          ),
          body: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 163, 144, 215),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${data.data()!['name']}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const CircleAvatar(
                      foregroundImage: AssetImage('assets/images/owl.jpg'),
                      radius: 50,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width - 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 196, 184, 234),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                                          currentGoal: data
                                                                  .data()![
                                                              'fitnessGoal']);
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
                        ],
                      ),
                    ),
                    /* Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 123, 231),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: savedRecipes.when(data: (data) {
                        print(data.length);
                        if (data.isNotEmpty) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: MediaQuery.of(context).size.width - 20,
                                child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: ListTile(
                                          leading: Text(data[index].title),
                                          onTap: () {},
                                        ),
                                      );
                                    }),
                              ),
                              TextButton.icon(
                                  onPressed: () {},
                                  label: const Text('Add a recipe')),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }, error: (error, stackTrace) {
                        print(error);
                        print(stackTrace);
                        return Text('error');
                      }, loading: () {
                        return const CircularProgressIndicator.adaptive();
                      }),
                    ), */
                    ElevatedButton(
                        onPressed: () async {
                          WriteToDb writeToDb = WriteToDb();

                          Uuid uuid = Uuid();

                          String w1Image = await getImage(
                              'assets/images/man_deadlifting.jpg');
                          String w2Image = await getImage(
                              'assets/images/woman_workingout_outside.jpg');
                          String w3Image = await getImage(
                              'assets/images/woman_doing_shoulder_press.jpg');
                          String w4Image = await getImage(
                              'assets/images/woman_mid_stride_running.jpg');

                          writeToDb.addWorkout(WorkoutPlan(
                              id: uuid.v1(),
                              title: 'workout1',
                              description: 'Compound movement focused',
                              duration: 90,
                              exercises: [
                                WorkoutComponent(
                                    name: 'Squats',
                                    type: 'Strength',
                                    duration: 5,
                                    instructions: '3 sets x 5 reps'),
                                WorkoutComponent(
                                    name: 'Lunges',
                                    type: 'Strength',
                                    duration: 5,
                                    instructions: '3 sets x 10 reps'),
                                WorkoutComponent(
                                    name: 'Leg extensions',
                                    type: 'Strength',
                                    duration: 5,
                                    instructions: '4 sets x 15 reps'),
                                WorkoutComponent(
                                    name: 'Leg curls',
                                    type: 'Strength',
                                    duration: 5,
                                    instructions: '4 sets 15 reps')
                              ],
                              image: w1Image));

                          writeToDb.addWorkout(WorkoutPlan(
                              id: uuid.v1(),
                              title: 'workout2',
                              description: 'Bodyweight workout',
                              duration: 30,
                              exercises: [
                                WorkoutComponent(
                                    name: 'Lunges',
                                    type: 'Strength',
                                    duration: 10,
                                    instructions: '5 sets x 20 reps'),
                                WorkoutComponent(
                                    name: 'Bodyweight Squats',
                                    type: 'Strength',
                                    duration: 10,
                                    instructions: '5 sets x 15 reps'),
                                WorkoutComponent(
                                    name: 'Crunches',
                                    type: 'Strength',
                                    duration: 5,
                                    instructions: '3 sets x 20 reps'),
                                WorkoutComponent(
                                    name: 'Walking Lunges',
                                    type: 'Strength',
                                    duration: 5,
                                    instructions: '2 sets x 20 reps')
                              ],
                              image: w2Image));

                          writeToDb.addUpperBody(WorkoutPlan(
                              id: uuid.v1(),
                              title: 'workout1',
                              description: 'Compound movement based',
                              duration: 60,
                              exercises: [
                                WorkoutComponent(
                                    name: 'Bench Press',
                                    type: 'Strength',
                                    duration: 10,
                                    instructions: '3 sets x 8-12 reps'),
                                WorkoutComponent(
                                    name: 'Shoulder press',
                                    type: 'Strength',
                                    duration: 10,
                                    instructions: '3 sets x 12-15 reps'),
                                WorkoutComponent(
                                    name: 'Lat Pulldown',
                                    type: 'Strength',
                                    duration: 8,
                                    instructions: '3 sets x 8-10 reps ')
                              ],
                              image: w3Image));

                          writeToDb.addRunning(WorkoutPlan(
                              id: uuid.v1(),
                              title: 'workout1',
                              description: 'Cardio workout',
                              duration: 15,
                              exercises: [
                                WorkoutComponent(
                                    name: 'Treadmill',
                                    type: 'Cardio',
                                    duration: 15,
                                    instructions:
                                        'Moderate paced run on the treadmill')
                              ],
                              image: w4Image));
                        },
                        child: Text('Save Data For Testing'))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50)),
                      child: const Text('Friends')),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50)),
                      child: const Text('Followers')),
                ],
              ),
              const MainProgramCard(
                  image: 'assets/images/woman_doing_crunches.jpg',
                  cardTitle: 'For You',
                  postTime: '8 min'),
            ],
          ),
        );
      } else {
        return Container();
      }
    }, error: (error, stackTrace) {
      return Text('error');
    }, loading: () {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    });
  }
}
