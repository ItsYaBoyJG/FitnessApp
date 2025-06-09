import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/widgets/containers/image_card_with_internal.dart';
import 'package:fitness_app/widgets/containers/section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpperBodySuggestions extends ConsumerStatefulWidget {
  const UpperBodySuggestions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UpperBodySuggestionsState();
  }
}

class _UpperBodySuggestionsState extends ConsumerState<UpperBodySuggestions> {
  @override
  Widget build(BuildContext context) {
    final ubPrograms = ref.watch(upperBodyExerciseProvider);
    return ubPrograms.when(data: (data) {
      if (data.exists && data.data()!.isNotEmpty) {
        return Section(
          title: '' // 'Upper Body Workouts'
          ,
          itemCount: data.data()!.length,
          itemBuilder: (context, index) {
            return ImageCardWithInternal(
                image: 'assets/images/woman_doing_shoulder_press.jpg',
                title: data.data()!['description'],
                duration: '${data.data()!['duration']} minutes',
                onTap: () {});
          },
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
