import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/view/diet/diet_tab.dart';
import 'package:fitness_app/view/account/add_info.dart';
import 'package:fitness_app/view/programs/programs_tab.dart';
import 'package:fitness_app/view/results/results_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(userIdFutureProvider);
    final userData = ref.watch(userDailyMacroTotalsProvider(userId.value!));

    return userData.when(data: (data) {
      if (data.exists == true && data.data() != null) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: const TabBarView(children: [
              ProgramsTab(),
              DietTab(),
              ResultsTab(),
            ]),
            bottomNavigationBar: SizedBox(
              //TODO: this may require different height values for different platforms
              // 65 seems to be good on Android, while 85 is okay in IOS
              height: 65,
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
        return const AddProfileInfo();
      }
    }, error: (error, stackTrace) {
      return ErrorWidget(error);
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
