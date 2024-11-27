import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDisplay extends StatelessWidget {
  const CalendarDisplay(
      {super.key,
      required this.focusedDay,
      required this.onDaySelected,
      required this.onPageChanged,
      required this.selectedDayPredicate});

  final DateTime focusedDay;
  final void Function(DateTime, DateTime) onDaySelected;
  final void Function(DateTime) onPageChanged;
  final bool Function(DateTime) selectedDayPredicate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(2023),
      lastDay: DateTime(2055),
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,
      selectedDayPredicate: selectedDayPredicate,
      calendarFormat: CalendarFormat.week,
      calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 162, 119, 169))),
      daysOfWeekVisible: true,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      headerVisible: true,
      headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronVisible: true,
          rightChevronVisible: true),
    );
  }
}
