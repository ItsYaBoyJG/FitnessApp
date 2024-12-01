import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:fitness_app/views/diet/diet_tab.dart';
import 'package:fitness_app/views/programs/programs_tab.dart';
import 'package:fitness_app/views/results/results_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(userIdFutureProvider);
    final userData = ref.watch(userDailyMacroTotalsProvider(userId.value!));

    return userData.when(data: (data) {
      if (data.exists == true) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: const TabBarView(children: [
              Programs(),
              DietTab(),
              ResultsTab(),
            ]),
            bottomNavigationBar: SizedBox(
              height: 85,
              width: MediaQuery.of(context).size.width,
              child: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                  Tab(
                    icon: Icon(Icons.food_bank),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.award),
                  ),
                ],
                labelPadding: EdgeInsets.all(5.0),
                unselectedLabelColor: Colors.black,
                labelColor: Colors.amber,
                indicatorWeight: 2,
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Text('error'),
          ),
        );
      }
    }, error: (error, stackTrace) {
      return Text('error');
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
