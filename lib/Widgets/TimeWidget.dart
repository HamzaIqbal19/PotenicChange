import 'package:flutter/material.dart';
import 'package:advance_expansion_tile/advance_expansion_tile.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:potenic_app/Widgets/DateTimeBottomSheet.dart';
import 'package:potenic_app/Widgets/routinecommitment.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

String start_time = '00:00';
String end_time = '07:00';
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

String? minutes;
String? hours;

List<String> selectedDays = []; // Declare the selectedDays list here
int count = 0;
String day = '';
String hour = '';
String minute = '';
String period = '';

String endday = '';
String endhour = '';
String endminute = minute;
String endperiod = '';

bool Done = false;

class schedule extends StatelessWidget {
  final ValueChanged<int> onCountChanged;

  schedule({required this.onCountChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 13, right: 5, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          schedule_card(
            days: 'Monday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 1.6,
          ),
          schedule_card(
            days: 'Tuesday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(height: AppDimensions.height10(context) * 1.6),
          schedule_card(
            days: 'Wednesday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(height: AppDimensions.height10(context) * 1.6),
          schedule_card(
            days: 'Thursday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(height: AppDimensions.height10(context) * 1.6),
          schedule_card(
            days: 'Friday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(height: AppDimensions.height10(context) * 1.6),
          schedule_card(
            days: 'Saturday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(height: AppDimensions.height10(context) * 1.6),
          schedule_card(
            days: 'Sunday',
            onCountChanged: onCountChanged,
          ),
          SizedBox(height: AppDimensions.height10(context) * 1.6),
        ],
      ),
    );
  }
}

class schedule_card extends StatefulWidget {
  final String days;
  final ValueChanged<int> onCountChanged;

  schedule_card({super.key, required this.days, required this.onCountChanged});

  @override
  State<schedule_card> createState() =>
      _schedule_cardState(days, onCountChanged);
}

class _schedule_cardState extends State<schedule_card> {
  final String days_name;
  final GlobalKey<AdvanceExpansionTileState> _globalKey = GlobalKey();
  void removeSelectedDay(String day) {
    if (count > 0) {
      setState(() {
        selectedDays.remove(day);
        onCountChanged(--count);
      });
    }
  }

  final ValueChanged<int> onCountChanged;

  _schedule_cardState(this.days_name, this.onCountChanged);

  @override
  Widget build(BuildContext context) {
    bool isDaySelected = false;

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: AppDimensions.height10(context) * 0.2,
                offset: Offset(0,
                    AppDimensions.height10(context) * 0.4), // Shadow position
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: AdvanceExpansionTile(
                key: _globalKey,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                trailing: isDaySelected
                    ? null
                    : Container(
                        height: 32.5,
                        width: 32.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(250, 153, 52, 1),
                        ),
                        child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return MyListWheelForm(
                                    onSelectionChanged: (selectedDay,
                                        selectedHour,
                                        selectedMinute,
                                        selectedPeriod,
                                        Done) {
                                      setState(() async {
                                        if (Done) {
                                          selectedDays.add(days_name);
                                          _globalKey.currentState?.expand();
                                          _globalKey.currentState?.expand();
                                          _globalKey.currentState?.expand();
                                          start_time =
                                              "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                                          end_time =
                                              "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                                          final SharedPreferences prefs =
                                              await _prefs;
                                          var Start_Time = prefs.setString(
                                              'startTime', '$start_time');
                                          var End_Time = prefs.setString(
                                              'endTime', '$end_time');

                                          Done = Done;
                                          print("Done:$Done");
                                          if (Done == true) {
                                            _globalKey.currentState?.expand();
                                            count = count + 1;
                                            onCountChanged(count);
                                            Navigator.pop(context);
                                          }
                                        }
                                        // date.hour.toString();
                                        day = selectedDay;
                                        hour = selectedHour;
                                        minute = selectedMinute;
                                        endday = selectedDay;
                                        endhour = selectedHour;
                                        endminute = selectedMinute;

                                        period = selectedPeriod;
                                        endperiod = selectedPeriod;
                                      });
                                    },
                                  );
                                },
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                              );
                            })),
                title: Text(
                  days_name,
                  style: const TextStyle(
                      color: Color.fromRGBO(67, 114, 150, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
                children: <Widget>[
                  Container(
                    // color:Colors.orange,
                    width: AppDimensions.height10(context) * 38.2,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const startTimerState(
                          text: ' 1) Time: ',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                              height: 37,
                              width: 37,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              child: FloatingActionButton(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    start_time = '00:00';
                                    removeSelectedDay(days_name);
                                  });
                                  _globalKey.currentState?.collapse();
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),

                  Container(
                    width: AppDimensions.height10(context) * 38.2,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const endTimerState(
                          text: '2) Time: ',
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                height: 37,
                                width: 37,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                ),
                                child: FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      end_time = '00:00';
                                      removeSelectedDay(days_name);
                                    });
                                    _globalKey.currentState?.collapse();
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                )))
                      ],
                    ),
                  ),

                  // add more data that you want like this
                ],
              ),
            ),
          ],
        ));
  }
}

class startTimerState extends StatefulWidget {
  final String text;

  const startTimerState({
    super.key,
    required this.text,
  });

  @override
  State<startTimerState> createState() => _startTimerStateState(text);
}

class _startTimerStateState extends State<startTimerState> {
  endTime() {
    return start_time;
  }

  String text_state;

  _startTimerStateState(this.text_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10(context) * 31.6,
      height: AppDimensions.height10(context) * 3.7,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                text_state,
                //textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color.fromRGBO(100, 100, 100, 1),
                  fontSize: AppDimensions.height10(context) * 1.6,
                  fontFamily: "Laila",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 17.2,
                child: Text(
                  start_time,
                  style: TextStyle(
                    color: const Color.fromRGBO(250, 153, 52, 1),
                    fontSize: AppDimensions.height10(context) * 1.6,
                    fontFamily: "Laila",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: AppDimensions.height10(context) * 2.4,
            // height: AppDimensions.height10*1.7,
            // padding: EdgeInsets.only(right:AppDimensions.height10*0.6),
            child: Center(
              child: GestureDetector(
                  // elevation: 0,
                  // backgroundColor: Colors.transparent,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MyListWheelForm(
                          onSelectionChanged: (selectedDay, selectedHour,
                              selectedMinute, selectedPeriod, Done) {
                            setState(() {
                              start_time =
                                  "$selectedHour: $selectedMinute ${selectedPeriod.toLowerCase()}";
                              // date.hour.toString();
                              day = selectedDay;
                              hour = selectedHour;
                              minute = selectedMinute;
                              period = selectedPeriod;
                            });
                          },
                        );
                      },
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: const Color.fromRGBO(250, 153, 52, 1),
                    // size: AppDimensions.height10*3.5,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class endTimerState extends StatefulWidget {
  final String text;

  const endTimerState({super.key, required this.text});

  @override
  State<endTimerState> createState() => _endTimerStateState(text);
}

class _endTimerStateState extends State<endTimerState> {
  endTime() {
    return end_time;
  }

  String text_state;

  _endTimerStateState(this.text_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10(context) * 31.6,
      height: AppDimensions.height10(context) * 3.7,
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                text_state,
                //textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: AppDimensions.height10(context) * 1.6,
                  fontFamily: "Laila",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 16.2,
                child: Text(
                  end_time,
                  style: TextStyle(
                    color: Color.fromRGBO(250, 153, 52, 1),
                    fontSize: AppDimensions.height10(context) * 1.6,
                    fontFamily: "Laila",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: AppDimensions.height10(context) * 2.4,
            // height: AppDimensions.height10*1.7,
            // padding: EdgeInsets.only(right:AppDimensions.height10*0.6),
            child: Center(
              child: GestureDetector(
                  // elevation: 0,
                  // backgroundColor: Colors.transparent,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MyListWheelForm(
                          onSelectionChanged: (selectedDay, selectedHour,
                              selectedMinute, selectedPeriod, Done) {
                            setState(() {
                              end_time =
                                  "$selectedHour: $selectedMinute ${selectedPeriod.toLowerCase()}";
                              // date.hour.toString();
                              endday = selectedDay;
                              endhour = selectedHour;
                              endminute = selectedMinute;
                              endperiod = selectedPeriod;
                            });
                          },
                        );
                      },
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromRGBO(250, 153, 52, 1),
                    // size: AppDimensions.height10*3.5,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
