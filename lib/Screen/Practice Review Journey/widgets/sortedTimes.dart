class timerSorter {

  String formatTo12Hour(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = hour >= 12 ? 'pm' : 'am';

    // Convert 24-hour format to 12-hour format
    hour = hour % 12 == 0 ? 12 : hour % 12;

    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  String convertTo24HourFormat(String time) {
    String formattedTime = time.toLowerCase();
    bool isPM = formattedTime.contains('pm');
    List<String> parts = formattedTime.replaceAll(RegExp(r'[ap]m'), '').split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    if (isPM && hour != 12) {
      hour += 12;
    } else if (!isPM && hour == 12) {
      hour = 0; // 12:00 am is midnight (00:00 in 24-hour format)
    }

    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}