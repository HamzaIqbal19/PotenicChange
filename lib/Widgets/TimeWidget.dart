import 'package:flutter/material.dart';
import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/widgets/sortedTimes.dart';
import 'package:potenic_app/Widgets/DateTimeBottomSheet.dart';
import 'package:potenic_app/Widgets/routinecommitment.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

int count = 0;

class TwoValues<T1, T2> {
  final T1 value1;
  final T2 value2;

  TwoValues(this.value1, this.value2);
}

class ThreeValues<T1, T2, T3> {
  final T1 value1;
  final T2 value2;
  final T3 value3;

  ThreeValues(this.value1, this.value2, this.value3);
}

class schedule_card extends StatefulWidget {
  final String days;
  final String startTime;
  final String endTime;
  final bool expansion;
  final ValueChanged<int> onCountChanged;

  final ValueChanged<TwoValues<String, int>> onChangedStart;
  final ValueChanged<ThreeValues<int, int, int>> onDelete;
  // final ValueChanged<String> onChangedEnd;

  const schedule_card(
      {Key? key,
      required this.startTime,
      required this.endTime,
      required this.days,
      required this.onCountChanged,
      required this.onChangedStart,
      // required this.onChangedEnd,
      required this.expansion,
      required this.onDelete})
      : super(key: key);

  @override
  State<schedule_card> createState() => _schedule_cardState(
        days,
        onCountChanged,
      );
}

class _schedule_cardState extends State<schedule_card> {
  String? minutes;
  String? hours;
  int num = 0;
  List<String> times = [];

  List<String> selectedDays = []; // Declare the selectedDays list here

  String day = '';
  String hour = '';
  String minute = '';
  String period = '';

  String endday = '';
  String endhour = '';

  String endperiod = '';

  bool Done = false;
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

  @override
  void initState() {
    super.initState();
    setState(() {
      count = 0;
    });
  }

  DateTime customParseTime(String time) {
    // Extract the time part and AM/PM
    final timeParts = time.trim().split(RegExp(r'(?<=\d)(?=[a-zA-Z])'));
    // print("time $timeParts");

    final timeString = timeParts[0];
    // print("time1 $timeString");
    final period = timeString.toString().split(' ');
    // print("time2 $period");

    final hourMinute = period[0].split(':');
    // print("time3 $hourMinute");
    int hour = int.parse(hourMinute[0]);
    // print("time4 $hour");
    final minute = int.parse(hourMinute[1]);
    // print("time5 $minute");

    // Adjust hour if the period is PM (excluding 12 PM)
    if (period[1] == 'pm' && hour != 12) {
      hour += 12;
    } else {
      // print("period $period");
    }
    // Adjust for 12 AM being midnight
    if (period[1] == 'am' && hour == 12) {
      hour = 0;
    } else {
      // print("period22 $period");
    }

    // Return a DateTime object for comparison
    return DateTime(0, 1, 1, hour, minute);
  }

  List<String> sortTimes(List<String> times) {
    try {
      times.sort((a, b) => customParseTime(a).compareTo(customParseTime(b)));
      return times;
    } catch (e) {
      print("Error: $e");
      return times; // Return the original list in case of an error
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
  }

  void onChangedEnd(String value) {
    setState(() {
      //end_time = value;
      // timesPerDay.firstWhere((day) => day['day'] == days_name)['end'] = value;
    });
  }

  _schedule_cardState(
    this.days_name,
    this.onCountChanged,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
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
            AdvanceExpansionTile(
              key: _globalKey,
              initiallyExpanded: widget.expansion,
              onExpansionChanged: (expanded) {
                if (expanded) {
                  setState(() {
                    count = count + 1;
                  });
                } else {
                  setState(() {
                    count = count - 1;
                  });

                  // num = 0;
                }
              },
              disabled: true,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              trailing: Container(
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
                              key: Key("${widget.key}"),
                              onSelectionChanged: (selectedDay, selectedHour,
                                  selectedMinute, selectedPeriod, Done) {
                                setState(() async {
                                  if (Done) {
                                    selectedDays.add(days_name);
                                    print("timesss ${times.length}");

                                    setState(() {
                                      num = num + 1;
                                      start_time =
                                          "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                                    });

                                    Done = Done;
                                    if (Done == true) {
                                      _globalKey.currentState?.expand();
                                      setState(() {
                                        start_time =
                                            "$selectedHour:$selectedMinute ${selectedPeriod.toLowerCase()}";
                                      });

                                      if (times.contains(start_time)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "This time slot is already selected.")),
                                        );
                                      } else {
                                        times.add(start_time);
                                        sortTimes(times);

                                        print("length ${times.length}");
                                      }
                                      TwoValues<String, int> values =
                                          TwoValues<String, int>(
                                              start_time, num);
                                      widget.onChangedStart(values);
                                      onCountChanged(count);
                                      _globalKey.currentState?.expand();
                                      print("times $times");
                                      Navigator.pop(context);
                                    }
                                  }
                                  day = selectedDay;
                                  hour = selectedHour;
                                  minute = selectedMinute;
                                  endday = selectedDay;
                                  endhour = selectedHour;

                                  period = selectedPeriod;
                                  endperiod = selectedPeriod;
                                });
                              },
                              initialHour: hour,
                              initialMinute: minute,
                              initialPeriod: endperiod,
                            );
                          },
                          isDismissible: false,
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
                for (int i = 0; i < times.length && i <= 9; i++) ...[
                  Container(
                    // color:Colors.orange,
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 10),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        startTimerState(
                          key: Key("$widget.key"),
                          text: ' $num) Time: ',
                          start_Time: times[i],
                          onChanged: (value) {
                            // setState(() {
                            //   start_time = value;
                            // });
                            // times[i] = start_time;

                            // TwoValues<String, int> values =
                            //     TwoValues<String, int>(value, num);

                            // widget.onChangedStart(values);
                          },
                          onChangedStart: (String value) {
                            setState(() {
                              start_time = value;
                            });
                            if (times.contains(start_time)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "This time slot is already selected.")),
                              );
                            } else {
                              times[i] = start_time;
                              sortTimes(times);
                            }

                            print("times $times");
                          },
                        ),
                        // SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                              height: 36,
                              width: 36,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              child: FloatingActionButton(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                onPressed: () {
                                  if (num == 0) {
                                    _globalKey.currentState?.collapse();
                                  } else {
                                    times.removeAt(i);
                                    num = num - 1;
                                  }

                                  ThreeValues<int, int, int> values =
                                      ThreeValues<int, int, int>(count, i, num);

                                  // TwoValues<int, int> values =
                                  //     TwoValues<int, int>(count, i);
                                  widget.onDelete(values);
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
                ]

                // Container(
                //   width: AppDimensions.width10(context) * 38.2,
                //   padding: const EdgeInsets.only(bottom: 10),
                //   child: Row(
                //     children: [
                //       endTimerState(
                //         key: Key("$widget.key"),
                //         text: '2) Time: ',
                //         endTime: widget.endTime,
                //         onChanged: (value) {
                //           setState(() {
                //             end_time = value;
                //           });
                //         },
                //         onChangedEnd: (String value) {
                //           setState(() {
                //             end_time = value;
                //           });
                //           widget.onChangedEnd(value);
                //         },
                //       ),
                //       Padding(
                //           padding: const EdgeInsets.only(left: 8.0),
                //           child: Container(
                //               height: 37,
                //               width: 37,
                //               decoration: const BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Color.fromRGBO(0, 0, 0, 0.1),
                //               ),
                //               child: FloatingActionButton(
                //                 elevation: 0,
                //                 backgroundColor: Colors.transparent,
                //                 onPressed: () {
                //                   setState(() {
                //                     widget.endTime = null!;

                //                     //  removeSelectedDay(days_name);
                //                   });
                //                   //  _globalKey.currentState?.collapse();
                //                 },
                //                 child: const Icon(
                //                   Icons.delete,
                //                   color: Colors.black,
                //                   size: 15,
                //                 ),
                //               )))
                //     ],
                //   ),
                // ),

                // add more data that you want like this
              ],
            ),
          ],
        ));
  }
}

class startTimerState extends StatefulWidget {
  final String text;
  final String start_Time;

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onChangedStart;

  const startTimerState({
    Key? key,
    required this.start_Time,
    required this.text,
    required this.onChanged,
    required this.onChangedStart,
  }) : super(key: key);

  @override
  State<startTimerState> createState() => _startTimerStateState(text);
}

class _startTimerStateState extends State<startTimerState> {
  String? minutes;
  String? hours;

  List<String> selectedDays = []; // Declare the selectedDays list here

  String day = '';
  String hour = '';
  String minute = '';
  String period = '';

  String endday = '';
  String endhour = '';

  String endperiod = '';

  bool Done = false;
  // endTime() {
  //   return start_time;
  // }

  String text_state;

  _startTimerStateState(this.text_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 30,
      height: AppDimensions.height10(context) * 3.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return MyListWheelForm(
                key: Key("$widget.key"),
                onSelectionChanged: (selectedDay, selectedHour, selectedMinute,
                    selectedPeriod, Done) {
                  String startTime =
                      "$selectedHour:$selectedMinute ${selectedPeriod.toLowerCase()}";

                  widget.onChanged(startTime);
                  widget.onChangedStart(
                      startTime); // Pass the selected value to the onChanged callback
                  setState(() {
                    start_time = startTime;
                    print("start time $start_time");

                    day = selectedDay;
                    hour = selectedHour;
                    minute = selectedMinute;
                    period = selectedPeriod;
                    Done = true;
                  });
                  Done = true;

                  widget.onChanged(start_time);
                  Navigator.pop(context);
                },
                initialHour: widget.start_Time.split(':')[0],
                initialMinute: widget.start_Time.split(':')[1].split(' ')[0],
                initialPeriod: widget.start_Time.substring(5, 7),
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
                    fontSize: AppDimensions.font10(context) * 1.6,
                    fontFamily: "Laila",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 17.2,
                  child: Text(
                    widget.start_Time,
                    style: TextStyle(
                      color: const Color.fromRGBO(250, 153, 52, 1),
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: AppDimensions.width10(context) * 2.4,
              child: Center(
                child: SizedBox(
                    child: Image.asset(
                  'assets/images/Polygon_orange.webp',
                  width: AppDimensions.width10(context) * 1.7,
                  height: AppDimensions.height10(context) * 1.7,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class endTimerState extends StatefulWidget {
  final String text;
  final String endTime;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onChangedEnd;

  const endTimerState(
      {Key? key,
      required this.endTime,
      required this.text,
      required this.onChanged,
      required this.onChangedEnd})
      : super(key: key);

  @override
  State<endTimerState> createState() => _endTimerStateState(text);
}

class _endTimerStateState extends State<endTimerState> {
  String? minutes;
  String? hours;

  List<String> selectedDays = []; // Declare the selectedDays list here

  String day = '';
  String hour = '';
  String minute = '';
  String period = '';

  String endday = '';
  String endhour = '';

  String endperiod = '';

  bool Done = false;
  // endTime() {
  //   return end_time;
  // }

  String text_state;

  _endTimerStateState(this.text_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 31.6,
      height: AppDimensions.height10(context) * 3.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
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
                  fontSize: AppDimensions.font10(context) * 1.6,
                  fontFamily: "Laila",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: AppDimensions.width10(context) * 17.2,
                child: Text(
                  widget.endTime,
                  style: TextStyle(
                    color: const Color.fromRGBO(250, 153, 52, 1),
                    fontSize: AppDimensions.font10(context) * 1.6,
                    fontFamily: "Laila",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: AppDimensions.width10(context) * 2.4,
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
                          key: Key('${widget.key}'),
                          onSelectionChanged: (selectedDay, selectedHour,
                              selectedMinute, selectedPeriod, Done) {
                            String endTime =
                                "$selectedHour:$selectedMinute ${selectedPeriod.toLowerCase()}";
                            widget.onChanged(
                                endTime); // Pass the selected value to the onChanged callback
                            setState(() {
                              end_time = endTime;

                              endday = selectedDay;
                              endhour = selectedHour;

                              endperiod = selectedPeriod;
                            });
                            widget.onChangedEnd(end_time);
                            Navigator.pop(context);
                          },
                          initialHour: hour,
                          initialMinute: minute,
                          initialPeriod: period,
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
                  child: SizedBox(
                      child: Image.asset(
                    'assets/images/Polygon_orange.webp',
                    width: AppDimensions.width10(context) * 1.7,
                    height: AppDimensions.height10(context) * 1.7,
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
