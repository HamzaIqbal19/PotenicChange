import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class CalendarBottomSheet extends StatefulWidget {
  final ValueChanged<int> onChangedStart;

  const CalendarBottomSheet({super.key, required this.onChangedStart});
  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateTime selectedDate = DateTime.now();
  int numberOfDays = 0;
  String minDate = '2023-05-01';

  Future<void> getAccountDate() async {
    final SharedPreferences prefs = await _prefs;
    var date = prefs.getString('accountCreatedAt');
    setState(() {
      minDate = date.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getAccountDate();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height10(context) * 30.3,
      child: Column(
        children: [
          Container(
            height: AppDimensions.height10(context) * 3.8,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF828282),
                  width: AppDimensions.width10(context) * 0.1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 5.0,
                    height: AppDimensions.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 2.0,
                    ),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF2F80ED),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Perform your 'Done' action here

                    widget.onChangedStart(numberOfDays);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 3.7,
                    height: AppDimensions.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 1.9,
                    ),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF2F80ED),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 26.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: DateTime.parse(minDate),
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  final currentTime = DateTime.parse(
                      DateTime.now().toString().substring(0, 10));
                  final selectedDate =
                      DateTime.parse(value.toString().substring(0, 10));
                  final difference = selectedDate.difference(
                      DateTime.parse(currentTime.toString().substring(0, 10)));
                  numberOfDays = difference.inDays;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
