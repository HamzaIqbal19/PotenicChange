
import 'package:intl/intl.dart';

String getFormattedDate(int removeDay) {
  return DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(Duration(days: removeDay)));
}

String getFormattedDay(int removeDay) {
  return DateFormat('EEEE')
      .format(DateTime.now().subtract(Duration(days: removeDay)));
}
