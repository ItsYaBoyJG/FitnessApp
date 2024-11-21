import 'package:fitness_app/views/diet/diet_tab.dart';
import 'package:fitness_app/views/programs/programs_tab.dart';
import 'package:fitness_app/views/results/results_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: const TabBarView(children: [
            Programs(),
            Diet(),
            Results(),
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
        ));
  }
}
