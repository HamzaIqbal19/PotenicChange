import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWithRadioButtons extends HookWidget {
  // Define the static list of dates and their status
  final Map<DateTime, String> dateStatus = {
    DateTime(2023, 5, 1): 'null',
    DateTime(2023, 5, 2): 'completed',
    DateTime(2023, 5, 3): 'completed',
    DateTime(2023, 5, 4): 'missed',
    DateTime(2023, 5, 5): 'completed',
    DateTime(2023, 5, 6): 'completed',
    DateTime(2023, 5, 7): 'null',
    DateTime(2023, 5, 8): 'null',
    DateTime(2023, 5, 9): 'missed',
    DateTime(2023, 5, 10): 'completed',
    DateTime(2023, 5, 11): 'completed',
    DateTime(2023, 5, 12): 'completed',
    DateTime(2023, 5, 13): 'completed',
    DateTime(2023, 5, 14): 'null',
    DateTime(2023, 5, 15): 'null',
    DateTime(2023, 5, 16): 'completed',
    DateTime(2023, 5, 17): 'completed',
    DateTime(2023, 5, 18): 'completed',
    DateTime(2023, 5, 19): 'null',
    DateTime(2023, 5, 20): 'completed',
    DateTime(2023, 5, 21): 'null',
    DateTime(2023, 5, 22): 'null',
    DateTime(2023, 5, 23): 'completed',
    DateTime(2023, 5, 24): 'missed',
    DateTime(2023, 5, 25): 'completed',
    DateTime(2023, 5, 26): 'completed',
    DateTime(2023, 5, 27): 'completed',
    DateTime(2023, 5, 28): 'null',
    DateTime(2023, 5, 29): 'null',
    DateTime(2023, 5, 30): 'completed',
    DateTime(2023, 5, 31): 'missed',
  };

  String? getStatus(DateTime date) {
    return dateStatus[DateTime(date.year, date.month, date.day)];
  }

  IconData? getIcon(String? status) {
    switch (status) {
      case 'completed':
        return Icons.check;
      case 'missed':
        return Icons.close;
      default:
        return null;
    }
  }

  Widget _buildDayCell(DateTime date) {
    String? status = getStatus(date);
    IconData? iconData = getIcon(status);

    return Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(18),
      //   //color: status == 'completed'? Color(0xFF196F6E):status == 'missed'?Color(0xFFFE6624):Color(0xFFFFFFFF),
      // ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: const TextStyle(fontSize: 12),
            ),
            Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: const Color(0xFF8EA1B1)),
                color: status == 'completed'
                    ? const Color(0xFF196F6E)
                    : status == 'missed'
                        ? const Color(0xFFFE6624)
                        : const Color(0xFFFFFFFF),
              ),
              child: status == 'completed'
                  ? Icon(
                      iconData,
                      size: 15.0,
                      color: Colors.white,
                    )
                  : status == 'missed'
                      ? Icon(
                          size: 15.0,
                          iconData,
                          color: Colors.white,
                        )
                      : Icon(
                          iconData,
                          size: 15.0,
                          color: Colors.white,
                        ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Color(0xFFFE6624),
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Color(0xFFFE6624),
          ),
          titleTextStyle: TextStyle(fontSize: 24, color: Color(0xFF5B74A6)),
        ),
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        onPageChanged: (focusedDay) {},
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) => _buildDayCell(date),
          todayBuilder: (context, date, _) => _buildDayCell(date),
          selectedBuilder: (context, date, _) => _buildDayCell(date),
        ),
        eventLoader: (day) {
          return [];
        },
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
        ),
      ),
    );
  }
}
