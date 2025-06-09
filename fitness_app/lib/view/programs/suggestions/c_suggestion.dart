import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/widgets/containers/image_card_with_internal.dart';
import 'package:fitness_app/widgets/containers/section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardioSuggestions extends ConsumerStatefulWidget {
  const CardioSuggestions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CardioSuggestionsState();
  }
}

class _CardioSuggestionsState extends ConsumerState<CardioSuggestions> {
  @override
  Widget build(BuildContext context) {
    final cardioPrograms = ref.watch(cardioExerciseProvider);
    return cardioPrograms.when(data: (data) {
      if (data.exists && data.data()!.isNotEmpty) {
        Map<String, dynamic> cData = data.data() as Map<String, dynamic>;
        return Section(
          title: '' //'Suggested Cardio Workouts'
          ,
          itemCount: data.data()!.length,
          itemBuilder: (context, index) {
            return ImageCardWithInternal(
                image: 'assets/images/man_tieing_shoes.jpg',
                title: cData['description'],
                duration: '${cData['duration']} minutes',
                onTap: () {});
          },

          /*[

            ImageCardWithInternal(
              image: 'assets/images/man_tieing_shoes.jpg',
              title: 'Running \n Workout',
              duration: '${cData['duration']} minutes',
              onTap: () {},
            ),
            ImageCardWithInternal(
              image: 'assets/images/woman_doing_crunches_2.jpg',
              title: 'Core \n Workout',
              duration: '5 min',
              onTap: () {},
            ),
            ImageCardWithInternal(
              image: 'assets/images/woman_workingout_outside.jpg',
              title: 'Hiit \n Workout',
              duration: '8 min',
              onTap: () {},
            ), 
          ],*/
        );
      } else {
        return Container();
      }
    }, error: (error, stackTrace) {
      return ErrorWidget(error);
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}
