import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/widgets/containers/image_card_with_internal.dart';
import 'package:fitness_app/widgets/containers/section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LowerBodySuggestions extends ConsumerStatefulWidget {
  const LowerBodySuggestions({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LowerBodySuggestionsState();
  }
}

class _LowerBodySuggestionsState extends ConsumerState<LowerBodySuggestions> {
  @override
  Widget build(BuildContext context) {
    final lbPrograms = ref.watch(lowerBodyExerciseProvider);
    return lbPrograms.when(data: (data) {
      if (data.exists && data.data()!.isNotEmpty) {
        return Section(
          title: 'Lower Body Workouts',
          itemCount: data.data()!.length,
          itemBuilder: (context, index) {
            return ImageCardWithInternal(
                image: 'assets/images/woman_workingout_outside.jpg',
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
