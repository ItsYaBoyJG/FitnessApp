import 'package:fitness_app/data/auth/user_auth.dart';
import 'package:fitness_app/providers/future_providers.dart';
import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/diet/breakfast_view.dart';
import 'package:fitness_app/view/diet/dinner_view.dart';
import 'package:fitness_app/view/diet/lunch_view.dart';
import 'package:fitness_app/view/diet/widgets/macros.dart';
import 'package:fitness_app/view/diet/snack_view.dart';
import 'package:fitness_app/view/diet/widgets/calendar.dart';
import 'package:fitness_app/models/widgets/containers/header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class DietTab extends ConsumerStatefulWidget {
  const DietTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DietTabState();
  }
}

class _DietTabState extends ConsumerState<DietTab> {
  final UserAuth _userAuth = UserAuth();

  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final macros =
        ref.watch(userDailyMacroTotalsProvider(_userAuth.getUserId()));

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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width - 5,
                        child: CalendarDisplay(
                          focusedDay: _focusedDay,
                          onDaySelected: (focusedDay, selectedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                              ref.read(dateTimeProvider.notifier).state =
                                  selectedDay;
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                          selectedDayPredicate: (selectedDay) {
                            return isSameDay(_selectedDay, selectedDay);
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: MacrosDisplay(
                            uId: _userAuth.getUserId(),
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
