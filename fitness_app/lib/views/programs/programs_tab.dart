import 'package:fitness_app/models/data/workout_plan.dart';
import 'package:fitness_app/models/widgets/header.dart';
import 'package:fitness_app/models/widgets/daily_tip.dart';
import 'package:fitness_app/models/widgets/image_card_with_basic_footer.dart';
import 'package:fitness_app/models/widgets/image_card_with_internal.dart';
import 'package:fitness_app/models/widgets/main_program_card.dart';
import 'package:fitness_app/models/widgets/section.dart';
import 'package:fitness_app/models/widgets/user_photo.dart';
import 'package:fitness_app/models/widgets/user_tip.dart';
import 'package:fitness_app/views/activity/activity_detail.dart';
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
                Header(
                  title: 'Programs',
                  rightSide: UserPhoto(
                    image: 'assets/images/image009.jpg',
                  ),
                ),
                const MainProgramCard(
                    image: 'assets/images/image004.jpg',
                    cardTitle: 'For You',
                    postTime: '8 min'),
                Section(
                  title: 'Fat burning',
                  horizontalList: [
                    ImageCardWithInternal(
                      image: 'assets/images/image004.jpg',
                      title: 'Running \nWorkout',
                      duration: '7 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/image004.jpg',
                      title: 'Core \nWorkout',
                      duration: '7 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/image004.jpg',
                      title: 'Core \nWorkout',
                      duration: '7 min',
                    ),
                  ],
                ),
                const Section(
                  title: 'Abs Generating',
                  horizontalList: [
                    ImageCardWithInternal(
                      image: 'assets/images/image002.jpg',
                      title: 'Core \nWorkout',
                      duration: '7 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/image002.jpg',
                      title: 'Core \nWorkout',
                      duration: '7 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/image002.jpg',
                      title: 'Core \nWorkout',
                      duration: '7 min',
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
                            image: 'assets/images/image010.jpg',
                            name: 'User Img',
                          ),
                          UserTip(
                            image: 'assets/images/image010.jpg',
                            name: 'User Img',
                          ),
                          UserTip(
                            image: 'assets/images/image010.jpg',
                            name: 'User Img',
                          ),
                          UserTip(
                            image: 'assets/images/image010.jpg',
                            name: 'User Img',
                          ),
                        ],
                      ),
                      Section(
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
                      ),
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
