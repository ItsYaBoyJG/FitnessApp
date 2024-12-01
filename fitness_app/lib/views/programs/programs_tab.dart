import 'package:fitness_app/models/widgets/header.dart';
import 'package:fitness_app/models/widgets/image_card_with_internal.dart';
import 'package:fitness_app/models/widgets/main_program_card.dart';
import 'package:fitness_app/models/widgets/section.dart';
import 'package:fitness_app/models/widgets/account/user_photo.dart';
import 'package:fitness_app/models/widgets/user_tip.dart';
import 'package:flutter/material.dart';

class Programs extends StatelessWidget {
  const Programs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                const Header(
                  title: 'Programs',
                  rightSide: UserPhoto(
                    image: 'assets/images/owl.jpg',
                  ),
                ),
                const MainProgramCard(
                    image: 'assets/images/woman_mid_stride_running.jpg',
                    cardTitle: 'For You',
                    postTime: '3 min'),
                const Section(
                  title: 'Suggested Workouts',
                  horizontalList: [
                    ImageCardWithInternal(
                      image: 'assets/images/man_tieing_shoes.jpg',
                      title: 'Running \n Workout',
                      duration: '10 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/woman_doing_crunches_2.jpg',
                      title: 'Core \n Workout',
                      duration: '5 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/woman_workingout_outside.jpg',
                      title: 'Hiit \n Workout',
                      duration: '8 min',
                    ),
                  ],
                ),
                const Section(
                  title: 'More to try!',
                  horizontalList: [
                    ImageCardWithInternal(
                      image: 'assets/images/woman_doing_a_plank.jpg',
                      title: 'Core \n Workout',
                      duration: '5 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/woman_doing_yoga_outside.jpg',
                      title: 'Yoga \n Workout',
                      duration: '15 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/woman_pegboard_climbing.jpg',
                      title: 'Workout',
                      duration: '10 min',
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: [
                      Section(
                        title: 'Daily Tips',
                        horizontalList: <Widget>[
                          UserTip(
                            image:
                                'assets/images/two_women_workingout_together.jpg',
                            name: 'User Img',
                          ),
                          UserTip(
                            image: 'assets/images/bumper_plate.jpg',
                            name: 'User Img',
                          ),
                          UserTip(
                            image: 'assets/images/man_deadlifting.jpg',
                            name: 'User Img',
                          ),
                          UserTip(
                            image: 'assets/images/woman_stretching_2.jpg',
                            name: 'User Img',
                          ),
                        ],
                      ),
                      /* const Section(
                        horizontalList: [
                          DailyTip(
                              image: 'assets/images/image001.jpg',
                              title: 'Something here',
                              subtitle: 'Subtitle here'),
                          DailyTip(
                              image: 'assets/images/image001.jpg',
                              title: 'Something here',
                              subtitle: 'Subtitle here'),
                          DailyTip(
                              image: 'assets/images/image001.jpg',
                              title: 'Something here',
                              subtitle: 'Subtitle here')
                        ],
                        title: '',
                      ), */
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
