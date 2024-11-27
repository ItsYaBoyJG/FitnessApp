import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/future_providers.dart';
import 'package:fitness_app/views/diet/breakfast/tab_view.dart';
import 'package:fitness_app/views/diet/dinner/tab_view.dart';
import 'package:fitness_app/views/diet/lunch/tab_view.dart';
import 'package:fitness_app/views/diet/snack/tab_view.dart';
import 'package:fitness_app/widgets/calendar/calendar.dart';
import 'package:fitness_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class DietTab extends ConsumerStatefulWidget {
  const DietTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DietTabState();
  }
}

class _DietTabState extends ConsumerState<DietTab> {
  final UserAuth _auth = UserAuth();

  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final macros = ref.watch(userDailyMacroTotals(_auth.getUserId()));

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
                        child: const Center(
                          child: Text(
                            'Tracker',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      title: 'Diet',
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
                      CalendarDisplay(
                        focusedDay: _focusedDay,
                        onDaySelected: (focusedDay, selectedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                        selectedDayPredicate: (selectedDay) {
                          return isSameDay(_selectedDay, selectedDay);
                        },
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Calories'),
                                Text('${macro['calories']}')
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Protein'),
                                Text('${macro['protein']}')
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Fat'),
                                Text('${macro['fat']}')
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Carbs'),
                                Text('${macro['carbs']}')
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width - 2,
                        child: TabBarView(
                          children: [
                            BreakfastTabView(date: _focusedDay),
                            LunchTabView(date: _focusedDay),
                            DinnerTabView(date: _focusedDay),
                            SnackTabView(date: _focusedDay),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        );
      } else {
        return Placeholder();
      }
    }, error: (error, stackTrace) {
      return Text('$error ...... $stackTrace');
    }, loading: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}
