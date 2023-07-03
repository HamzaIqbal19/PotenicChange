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
//     return timesPerDay[day]!['start'];
//   }

//   String getEndTime(String day) {
//     return timesPerDay[day]!['end']!;
//   }
// }

class Practice {
  String name;
  bool routine;
  List<Map<String, dynamic>> days;

  Practice({
    required this.name,
    required this.routine,
    required this.days,
  });

  factory Practice.fromJson(Map<String, dynamic> json) {
    return Practice(
      name: json['name'],
      routine: json['routine'],
      days: (json['days'] as List)
          .map((item) => Map<String, dynamic>.from(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'routine': routine,
      'days': days,
    };
  }
}
