import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:potenic_app/API/PracticeModal.dart';
import 'package:potenic_app/Widgets/DateTimeBottomSheet.dart';
import 'package:potenic_app/Widgets/routinecommitment.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class schedule extends StatefulWidget {
  final ValueChanged<int> onCountChanged;

  schedule({required this.onCountChanged});

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  @override
  void initState() {
    prac();
    super.initState();
  }

  void prac() {
    String jsonStr = '''
  {
    "name": "Sample Practice",
    "routine": true,
    "days": [
      {
        "day": "Monday",
        "startTime": "9:00 AM",
        "endTime": "5:00 PM"
      },
      {
        "day": "Tuesday",
        "startTime": "8:30 AM",
        "endTime": "4:30 PM"
      }
    ]
  }
  ''';

    Map<String, dynamic> jsonData = json.decode(jsonStr);
    Practice practice = Practice.fromJson(jsonData);

    print(practice.name); // Output: Sample Practice
    print(practice.routine); // Output: true
    print(practice.days.length); // Output: 2

    for (var day in practice.days) {
      print(day['day']); // Output: Monday, Tuesday
      print(day['startTime']); // Output: 9:00 AM, 8:30 AM
      print(day['endTime']); // Output: 5:00 PM, 4:30 PM
    }

    // To convert the object back to JSON
    Map<String, dynamic> toJsonData = practice.toJson();
    String jsonString = json.encode(toJsonData);
    print(jsonString);
  }

  List<Map<String, dynamic>> timesPerDay = [];
  String start_time = '00:00';
  String end_time = '07:00';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25, left: 13, right: 5, bottom: 5),
        child:
            //  Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     schedule_card(
            //       //  key: Key(timesPerDay[0]['key']),
            //       days: 'Monday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(
            //       height: AppDimensions.height10(context) * 1.6,
            //     ),
            //     schedule_card(
            //       //  key: Key(timesPerDay[1]['key']),
            //       days: 'Tuesday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(height: AppDimensions.height10(context) * 1.6),
            //     schedule_card(
            //       //  key: Key(timesPerDay[2]['key']),
            //       days: 'Wednesday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(height: AppDimensions.height10(context) * 1.6),
            //     schedule_card(
            //       // key: Key(timesPerDay[3]['key']),
            //       days: 'Thursday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(height: AppDimensions.height10(context) * 1.6),
            //     schedule_card(
            //       // key: Key(timesPerDay[4]['key']),
            //       days: 'Friday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(height: AppDimensions.height10(context) * 1.6),
            //     schedule_card(
            //       //key: Key(timesPerDay[5]['key']),
            //       days: 'Saturday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(height: AppDimensions.height10(context) * 1.6),
            //     schedule_card(
            //       // key: Key(timesPerDay[6]['key']),
            //       days: 'Sunday',
            //       onCountChanged: widget.onCountChanged,
            //     ),
            //     SizedBox(height: AppDimensions.height10(context) * 1.6),
            //   ],
            // ),
            Container());
  }
}

class schedule_card extends StatefulWidget {
  final String days;
  final ValueChanged<int> onCountChanged;
  final ValueChanged<String> onChangedStart;
  final ValueChanged<String> onChangedEnd;

  schedule_card(
      {Key? key,
      required this.days,
      required this.onCountChanged,
      required this.onChangedStart,
      required this.onChangedEnd})
      : super(key: key);

  @override
  State<schedule_card> createState() => _schedule_cardState(
        days,
        onCountChanged,
      );
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

  // final ValueChanged<String> onChangedStart;
  // final ValueChanged<String> onChangedEnd;

  final ValueChanged<int> onCountChanged;
  void onChangedStart(String value) {
    setState(() {
      //start_time = value;
      // timesPerDay.firstWhere((day) => day['day'] == days_name)['start'] = value;
    });
    print(value);
  }

  void onChangedEnd(String value) {
    setState(() {
      //end_time = value;
      // timesPerDay.firstWhere((day) => day['day'] == days_name)['end'] = value;
    });
    print(value);
  }

  @override
  void initState() {
    super.initState();
  }

  _schedule_cardState(
    this.days_name,
    this.onCountChanged,
  );

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
                                          // _globalKey.currentState?.expand();
                                          // _globalKey.currentState?.expand();
                                          setState(() {
                                            start_time =
                                                "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                                          });

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
                                            setState(() {
                                              setState(() {
                                                start_time =
                                                    "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                                              });
                                            });
                                            count = count + 1;
                                            onCountChanged(count);
                                            // Navigator.pop(context);
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
                        startTimerState(
                          text: ' 1) Time: ',
                          onChanged: (value) {
                            setState(() {
                              start_time = value;
                            });
                            widget.onChangedStart(value);
                          },
                          onChangedStart: (String value) {
                            setState(() {
                              start_time = value;
                            });
                          },
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
                        endTimerState(
                          text: '2) Time: ',
                          onChanged: (value) {
                            setState(() {
                              end_time = value;
                            });
                          },
                          onChangedEnd: (String value) {
                            setState(() {
                              end_time = value;
                            });
                            widget.onChangedEnd(value);
                          },
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
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onChangedStart;

  const startTimerState({
    super.key,
    required this.text,
    required this.onChanged,
    required this.onChangedStart,
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
                            String startTime =
                                "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                            widget.onChanged(startTime);
                            widget.onChangedStart(
                                startTime); // Pass the selected value to the onChanged callback
                            setState(() {
                              start_time = startTime;

                              day = selectedDay;
                              hour = selectedHour;
                              minute = selectedMinute;
                              period = selectedPeriod;
                            });
                            Done = true;
                            widget.onChanged(start_time);
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
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onChangedEnd;

  const endTimerState(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.onChangedEnd});

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
                            String endTime =
                                "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                            widget.onChanged(
                                endTime); // Pass the selected value to the onChanged callback
                            setState(() {
                              end_time = endTime;

                              endday = selectedDay;
                              endhour = selectedHour;
                              endminute = selectedMinute;
                              endperiod = selectedPeriod;
                            });
                            widget.onChangedEnd(end_time);
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
