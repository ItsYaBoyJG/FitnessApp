import 'package:fitness_app/models/widgets/containers/main_program_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainSuggestion extends ConsumerStatefulWidget {
  const MainSuggestion({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MainSuggestionState();
  }
}

class _MainSuggestionState extends ConsumerState<MainSuggestion> {
  @override
  Widget build(BuildContext context) {
    return MainProgramCard(
      image: 'assets/images/woman_mid_stride_running.jpg',
      cardTitle: 'For You',
      postTime: '3 min',
      onTap: () {},
    );
  }
}
