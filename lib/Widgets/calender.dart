import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWithRadioButtons extends StatefulWidget {
  final bool status;
  var dateStatus;
  final bool limitCalender;

  CalendarWithRadioButtons(
      {super.key,
      required this.status,
      required this.dateStatus,
      required this.limitCalender});

  @override
  State<CalendarWithRadioButtons> createState() =>
      _CalendarWithRadioButtonsState();
}

class _CalendarWithRadioButtonsState extends State<CalendarWithRadioButtons> {
  // Define the static list of dates and their status

  final Map<DateTime, String> missedStatus = {
    DateTime(2023, 05, 1): 'completed',
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

  Map<DateTime, String> convertToFormattedProgress(practiceProgress) {
    Map<DateTime, String> formattedProgress = {};
    practiceProgress.forEach((dateString, status) {
      DateTime date = DateTime.parse(dateString);
      formattedProgress[date] = status;
    });
    return formattedProgress;
  }

  String? getStatus(DateTime date) {
    if (widget.status == true) {
      return convertToFormattedProgress(
          widget.dateStatus)[DateTime(date.year, date.month, date.day)];
    } else {
      return missedStatus[DateTime(date.year, date.month, date.day)];
    }
  }

  @override
  void initState() {
    super.initState();
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

  String getDateAtLastIndex(jsonData) {
    // Parse the JSON-like data into a Dart map
    // Map<String, dynamic> data = jsonDecode(jsonData);

    // Retrieve the date at the last index
    String lastDate = jsonData.keys.last;

    return lastDate;
  }

  String getDateAtFirstIndex(jsonData) {
    // Parse the JSON-like data into a Dart map
    // Map<String, dynamic> data = jsonDecode(jsonData);

    // Retrieve the date at the last index
    String lastDate = jsonData.keys.first;

    return lastDate;
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
                height: AppDimensions.height10(context) * 2.3,
                width: AppDimensions.width10(context) * 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                      color: status == 'completed' || status == 'missed'
                          ? Colors.transparent
                          : const Color(0xFF8EA1B1)),
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
                    fontSize: AppDimensions.font10(context) * 1.4,
                    color: status == 'completed'
                        ? const Color(0xFF156F6D)
                        : status == 'missed'
                            ? const Color(0xFFFE6624)
                            : const Color(0xFF8EA1B1)),
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
          //color: Colors.red,
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          //color: status == 'completed'? Color(0xFF196F6E):status == 'missed'?Color(0xFFFE6624):Color(0xFFFFFFFF),
        ),
        child: TableCalendar(
          availableGestures: AvailableGestures.none,
          rowHeight: AppDimensions.height10(context) * 6.2,
          firstDay: widget.limitCalender
              ? DateTime.parse(getDateAtFirstIndex(widget.dateStatus))
              : DateTime.utc(2023, 1, 1),
          lastDay: widget.limitCalender
              ? DateTime.parse(getDateAtLastIndex(widget.dateStatus))
              : DateTime.utc(2030, 12, 31),
          focusedDay: DateTime.parse(getDateAtLastIndex(widget.dateStatus)),
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
                fontSize: AppDimensions.font10(context) * 2.4,
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
          calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              tablePadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.height10(context) * 3.7),
              rowDecoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: const Color(0xFF828282),
                          width: AppDimensions.width10(context) * 0.05)))),
        ),
      ),
    );
  }
}


//  {
//     DateTime(2023, 5, 1): 'null',
//     DateTime(2023, 5, 2): 'completed',
//     DateTime(2023, 5, 3): 'completed',
//     DateTime(2023, 5, 4): 'completed',
//     DateTime(2023, 5, 5): 'completed',
//     DateTime(2023, 5, 6): 'completed',
//     DateTime(2023, 5, 7): 'null',
//     DateTime(2023, 5, 8): 'null',
//     DateTime(2023, 5, 9): 'completed',
//     DateTime(2023, 5, 10): 'completed',
//     DateTime(2023, 5, 11): 'completed',
//     DateTime(2023, 5, 12): 'completed',
//     DateTime(2023, 5, 13): 'completed',
//     DateTime(2023, 5, 14): 'null',
//     DateTime(2023, 5, 15): 'null',
//     DateTime(2023, 5, 16): 'completed',
//     DateTime(2023, 5, 17): 'completed',
//     DateTime(2023, 5, 18): 'completed',
//     DateTime(2023, 5, 19): 'null',
//     DateTime(2023, 5, 20): 'completed',
//     DateTime(2023, 5, 21): 'null',
//     DateTime(2023, 5, 22): 'null',
//     DateTime(2023, 5, 23): 'completed',
//     DateTime(2023, 5, 24): 'completed',
//     DateTime(2023, 5, 25): 'completed',
//     DateTime(2023, 5, 26): 'completed',
//     DateTime(2023, 5, 27): 'completed',
//     DateTime(2023, 5, 28): 'null',
//     DateTime(2023, 5, 29): 'null',
//     DateTime(2023, 5, 30): 'completed',
//     DateTime(2023, 5, 31): 'completed',
//   };
