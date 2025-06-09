import 'package:fitness_app/view/diet/diet_tab.dart';
import 'package:fitness_app/view/programs/programs_tab.dart';
import 'package:fitness_app/view/results/results_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDisplay extends StatelessWidget {
  const HomeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
