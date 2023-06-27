// import 'package:flutter/foundation.dart';

// class DayTime {
//   String start;
//   String end;

//   DayTime({required this.start, required this.end});
// }

// class TimeData extends ChangeNotifier {
//   Map<String, DayTime> timesPerDay = {
//     'Monday': DayTime(start: '', end: ''),
//     'Tuesday': DayTime(start: '', end: ''),
//     'Wednesday': DayTime(start: '', end: ''),
//     'Thursday': DayTime(start: '', end: ''),
//     'Friday': DayTime(start: '', end: ''),
//     'Saturday': DayTime(start: '', end: ''),
//     'Sunday': DayTime(start: '', end: '')
//   };

//   void setStartTime(String day, String time) {
//     DayTime dayTime = timesPerDay[day]!;
//     dayTime.start = time;
//     notifyListeners();
//   }

//   void setEndTime(String day, String time) {
//     DayTime dayTime = timesPerDay[day]!;
//     dayTime.end = time;
//     notifyListeners();
//   }

//   String getStartTime(String day) {
//     return timesPerDay[day]!['start']!;
//   }

//   String getEndTime(String day) {
//     return timesPerDay[day]!['end']!;
//   }
// }
