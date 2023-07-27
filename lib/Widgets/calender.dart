import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWithRadioButtons extends StatelessWidget {
  final bool status;
  // Define the static list of dates and their status
  final Map<DateTime, String> dateStatus = {
    DateTime(2023, 5, 1): 'null',
    DateTime(2023, 5, 2): 'completed',
    DateTime(2023, 5, 3): 'completed',
    DateTime(2023, 5, 4): 'completed',
    DateTime(2023, 5, 5): 'completed',
    DateTime(2023, 5, 6): 'completed',
    DateTime(2023, 5, 7): 'null',
    DateTime(2023, 5, 8): 'null',
    DateTime(2023, 5, 9): 'completed',
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
    DateTime(2023, 5, 24): 'completed',
    DateTime(2023, 5, 25): 'completed',
    DateTime(2023, 5, 26): 'completed',
    DateTime(2023, 5, 27): 'completed',
    DateTime(2023, 5, 28): 'null',
    DateTime(2023, 5, 29): 'null',
    DateTime(2023, 5, 30): 'completed',
    DateTime(2023, 5, 31): 'completed',
  };

  final Map<DateTime, String> missedStatus = {
    DateTime(2023, 5, 1): 'completed',
    DateTime(2023, 5, 2): 'completed',
    DateTime(2023, 5, 3): 'completed',
    DateTime(2023, 5, 4): 'missed',
    DateTime(2023, 5, 5): 'completed',
    DateTime(2023, 5, 6): 'missed',
    DateTime(2023, 5, 7): 'null',
    DateTime(2023, 5, 8): 'null',
    DateTime(2023, 5, 9): 'missed',
    DateTime(2023, 5, 10): 'completed',
    DateTime(2023, 5, 11): 'missed',
    DateTime(2023, 5, 12): 'completed',
    DateTime(2023, 5, 13): 'missed',
    DateTime(2023, 5, 14): 'null',
    DateTime(2023, 5, 15): 'null',
    DateTime(2023, 5, 16): 'completed',
    DateTime(2023, 5, 17): 'missed',
    DateTime(2023, 5, 18): 'completed',
    DateTime(2023, 5, 19): 'null',
    DateTime(2023, 5, 20): 'completed',
    DateTime(2023, 5, 21): 'null',
    DateTime(2023, 5, 22): 'null',
    DateTime(2023, 5, 23): 'missed',
    DateTime(2023, 5, 24): 'completed',
    DateTime(2023, 5, 25): 'null',
    DateTime(2023, 5, 26): 'missed',
    DateTime(2023, 5, 27): 'completed',
    DateTime(2023, 5, 28): 'null',
    DateTime(2023, 5, 29): 'null',
    DateTime(2023, 5, 30): 'null',
    DateTime(2023, 5, 31): 'missed',
  };
  CalendarWithRadioButtons({super.key, required this.status});

  String? getStatus(DateTime date) {
    if (status == true) {
      return dateStatus[DateTime(date.year, date.month, date.day)];
    } else {
      return missedStatus[DateTime(date.year, date.month, date.day)];
    }
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

  Widget _buildDayCell(context, DateTime date) {
    String? status = getStatus(date);
    IconData? iconData = getIcon(status);

    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          //color: status == 'completed'? Color(0xFF196F6E):status == 'missed'?Color(0xFFFE6624):Color(0xFFFFFFFF),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppDimensions.height10(context) * 2.0,
                width: AppDimensions.height10(context) * 2.0,
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
                        size: AppDimensions.height10(context) * 1.5,
                        color: Colors.white,
                      )
                    : status == 'missed'
                        ? Icon(
                            size: AppDimensions.height10(context) * 1.5,
                            iconData,
                            color: Colors.white,
                          )
                        : Icon(
                            iconData,
                            size: AppDimensions.height10(context) * 1.5,
                            color: Colors.white,
                          ),
              ),
              Text(
                '${date.day}',
                style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 1.4,
                    color: const Color(0xFF8EA1B1)),
              ),
              // Container(
              //   height: AppDimensions.height10(context) * 0.05,
              //   color: const Color(0xFF828282),
              // )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          //color: status == 'completed'? Color(0xFF196F6E):status == 'missed'?Color(0xFFFE6624):Color(0xFFFFFFFF),
        ),
        child: TableCalendar(
          availableGestures: AvailableGestures.none,
          firstDay: DateTime.utc(2021, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: DateTime(2023, 5),
          headerStyle: HeaderStyle(
            titleCentered: true,
            leftChevronIcon: const Icon(
              Icons.chevron_left,
              color: Color(0xFFFE6624),
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_right,
              color: Color(0xFFFE6624),
            ),
            titleTextStyle: TextStyle(
                fontSize: AppDimensions.height10(context) * 2.4,
                color: const Color(0xFF5B74A6),
                fontWeight: FontWeight.w600,
                fontFamily: 'laila'),
          ),
          calendarFormat: CalendarFormat.month,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
          },
          onPageChanged: (focusedDay) {},
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, _) => _buildDayCell(context, date),
            todayBuilder: (context, date, _) => _buildDayCell(context, date),
            selectedBuilder: (context, date, _) => _buildDayCell(context, date),
          ),
          eventLoader: (day) {
            return [];
          },
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false,
          ),
        ),
      ),
    );
  }
}
