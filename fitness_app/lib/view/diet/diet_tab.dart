import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/view/diet/breakfast_view.dart';
import 'package:fitness_app/view/diet/calendar.dart';
import 'package:fitness_app/view/diet/dinner_view.dart';
import 'package:fitness_app/view/diet/lunch_view.dart';
import 'package:fitness_app/view/diet/macros_display.dart';
import 'package:fitness_app/view/diet/snack_view.dart';
import 'package:fitness_app/widgets/containers/header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DietTab extends ConsumerStatefulWidget {
  const DietTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DietTabState();
  }
}

class _DietTabState extends ConsumerState<DietTab> {
  final UserAuth _userAuth = UserAuth();

  @override
  Widget build(BuildContext context) {
    final macros =
        ref.watch(userDailyMacroTotalsProvider(_userAuth.getUserId()!));

    return macros.when(data: (data) {
      if (data.exists && data.data() != null) {
        Map<String, dynamic> macro = data.data() as Map<String, dynamic>;
        return Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: SafeArea(
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    flexibleSpace: Header(
                      rightSide: Container(
                        height: 35.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        margin: const EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(100, 140, 255, 1.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(),
                      ),
                      title: 'Daily Diet',
                    ),
                    bottom: TabBar(
                      tabs: const [
                        SizedBox(
                          height: 25.0,
                          child: Tab(
                            text: 'Breakfast',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                          child: Tab(
                            text: 'Lunch',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                          child: Tab(
                            text: 'Dinner',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                          child: Tab(
                            text: 'Snacks',
                          ),
                        ),
                      ],
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey[400],
                      indicatorWeight: 4.0,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: const Color.fromRGBO(215, 225, 255, 1.0),
                    ),
                  ),
                  body: Column(
                    children: [
                      const DietCalendar(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: MacrosDisplay(
                            uId: _userAuth.getUserId()!,
                            totalCalories: macro['calories'],
                            totalProtein: macro['protein'],
                            totalFat: macro['fat'],
                            totalCarbs: macro['carbs']),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width - 2,
                        child: const TabBarView(
                          children: [
                            BreakfastTabView(),
                            LunchTabView(),
                            DinnerTabView(),
                            SnackTabView(),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        );
      } else {
        //TODO: need a widget to display here when there is not data, but no error
        return Container();
      }
    }, error: (error, stackTrace) {
      return Text('$error ...... $stackTrace');
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
