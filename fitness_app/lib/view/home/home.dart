import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/view/account/add_info.dart';
import 'package:fitness_app/view/home/display.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final hasAccount = ref.watch(hasAccountProvider);

    return hasAccount.when(data: (data) {
      if (data == null) {
        return const HomeDisplay();
      } else {
        return const AddProfileInfo();
      }
    }, error: (error, stackTrace) {
      return ErrorWidget(error);
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
