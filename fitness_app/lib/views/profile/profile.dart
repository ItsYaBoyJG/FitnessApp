import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:fitness_app/models/widgets/containers/main_program_card.dart';
import 'package:fitness_app/models/widgets/dialogs/edit_goal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final UserAuth _userAuth = UserAuth();

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
            title: const Text('Profile'),
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 123, 231),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: savedRecipes.when(data: (data) {
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
                                  label: const Text(
                                    'Add a recipe',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                  )),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }, error: (error, stackTrace) {
                        return const Text('Something went wrong.');
                      }, loading: () {
                        return const CircularProgressIndicator.adaptive();
                      }),
                    ),
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
              MainProgramCard(
                image: 'assets/images/woman_doing_crunches.jpg',
                cardTitle: 'For You',
                postTime: '8 min',
                onTap: () {},
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    }, error: (error, stackTrace) {
      return ErrorWidget(error);
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    });
  }
}
