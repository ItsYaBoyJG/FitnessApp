import 'package:fitness_app/providers/state_providers.dart';
import 'package:fitness_app/view/diet/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class DietCalendar extends ConsumerStatefulWidget {
  const DietCalendar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DietCalendarState();
  }
}

class _DietCalendarState extends ConsumerState<DietCalendar> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarDisplay(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width - 5,
      focusedDay: _focusedDay,
      onDaySelected: (focusedDay, selectedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          ref.read(dateTimeProvider.notifier).state = selectedDay;
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      selectedDayPredicate: (selectedDay) {
        return isSameDay(_selectedDay, selectedDay);
      },
    );
  }
}
