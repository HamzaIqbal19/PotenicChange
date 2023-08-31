import 'dart:async';
import 'dart:convert';

import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeReminder.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Widgets/DateTimeBottomSheet.dart';

import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeRoutineEdit extends StatefulWidget {
  final String goalName;
  const PracticeRoutineEdit({Key? key, required this.goalName})
      : super(key: key);

  @override
  State<PracticeRoutineEdit> createState() => _PracticeRoutineEditState();
}

int count = 0;

class _PracticeRoutineEditState extends State<PracticeRoutineEdit> {
  bool buttonActive = false;
  int Count = 0;
  var pracName;
  bool updated = false;
  String goalName = '';
  bool Loading = true;
  var schedule;
  var starttime;
  var color;
  var pracColor;
  var visualize;
  int num = 0;
  //final ValueKey<AdvanceExpansionTileState> _globalKeyNew =  ValueKey(Key(value));

  List<Map<String, dynamic>> timesPerDay = [
    {
      'day': 'Monday',
    },
    {
      'day': 'Tuesday',
    },
    {
      'day': 'Wednesday',
    },
    {
      'day': 'Thursday',
    },
    {
      'day': 'Friday',
    },
    {
      'day': 'Saturday',
    },
    {
      'day': 'Sunday',
    }
  ];
  List<String> selectedDay = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<Map<String, dynamic>> updates = [];

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          pracName = response["name"];
          schedule = response["schedule"];
        });

        replaceItems(schedule, timesPerDay);
        // mapItems(schedule, updates);
        loadData();
        print("---------------------------------");
        print("response123:$pracName");
        print('Times====================>$schedule');
        print('Times====================>$updates');
      } else {
        loadData();
        print("response:$response");
      }
    }).catchError((error) {
      loadData();
      print("hell");
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void mapItems(list1, list2) {
    for (var item in list1) {
      list2.add(item);
    }
  }

  void replaceItems(list1, list2) {
    for (var item1 in list1) {
      var day = item1['day'];

      for (var i = 0; i < list2.length; i++) {
        if (list2[i]['day'] == day) {
          list2[i] = item1;
        }
      }
    }
  }

  bool showContainer = false;
  double swipeOffset = 0.0;

  Timer? _timer;

  void startTimer() {
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        showContainer = false;
      });
      Timer(const Duration(seconds: 1), () {
        Navigator.push(context, FadePageRoute(page: const PracticeReview()));
      });
    });
  }

  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the timer if it's active
    }
  }

  @override
  void dispose() {
    stopTimer(); // Make sure to cancel the timer when the widget is disposed
    super.dispose();
  }

  int index1 = 0;

  @override
  void initState() {
    super.initState();
    _fetchPracticeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10(context) * 5.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Center(
              // alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3,
                  height: AppDimensions.height10(context) * 3,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  updated == false
                      ? showAnimatedDialog(
                          animationType: DialogTransitionType.fadeScale,
                          curve: Curves.easeInOut,
                          duration: const Duration(seconds: 1),
                          context: context,
                          builder: (BuildContext context) =>
                              const pop_up_practices())
                      : Navigator.push(
                          context, FadePageRoute(page: const PracticeReview()));

                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
                  // Add code for performing close action
                },
              ),
            ),
            actions: [
              Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 3.0,
                    height: AppDimensions.height10(context) * 3.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    // Add code for performing close action
                  },
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/GoalReviewBg.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Loading == false
              ? SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 5.3),
                        child: Center(
                          child: Text(
                            "View and edit mode",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296),
                              fontSize: AppDimensions.height10(context) * 1.8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 0.5,
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context) * 30,
                        child: Center(
                          child: Text(
                            widget.goalName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296),
                              fontSize: AppDimensions.height10(context) * 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 4,
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3.4,
                        width: AppDimensions.height10(context) * 36.4,
                        child: Center(
                          child: Text(
                            "Your routine commitment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF437296),
                              fontSize: AppDimensions.height10(context) * 2.8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) - 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: AppDimensions.height10(context) * 8.6,
                            width: AppDimensions.height10(context) * 37.2,
                            child: Center(
                              child: Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  text:
                                      'It’s important to set a consistent routine\nthat works for you. Please select time\nslots for 3 or more days.',
                                  style: TextStyle(
                                    color: const Color(0xFF437296),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 25, left: 13, right: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ListView.builder(
                                itemCount: selectedDay.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  blurRadius: 10,
                                                  spreadRadius:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.2,
                                                  offset: Offset(
                                                      0,
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.4), // Shadow position
                                                ),
                                              ],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(18))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: AdvanceExpansionTile(
                                                  key: const Key('expand'),
                                                  maintainState: true,
                                                  initiallyExpanded: true,
                                                  onExpansionChanged:
                                                      (expanded) {
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  trailing: Container(
                                                      height: 32.5,
                                                      width: 32.5,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color.fromRGBO(
                                                            250, 153, 52, 1),
                                                      ),
                                                      child:
                                                          FloatingActionButton(
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 30,
                                                              ),
                                                              onPressed: () {
                                                                showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return MyListWheelForm(
                                                                      key: Key(
                                                                          "${widget.key}"),
                                                                      onSelectionChanged: (selectedDay,
                                                                          selectedHour,
                                                                          selectedMinute,
                                                                          selectedPeriod,
                                                                          Done) {
                                                                        setState(
                                                                            () async {
                                                                          if (Done) {
                                                                            //selectedDays.add(days_name);
                                                                            // _globalKey.currentState?.expand();

                                                                            setState(() {
                                                                              // num = num + 1;
                                                                              //   start_time = "$selectedHour:$selectedMinute${selectedPeriod.toLowerCase()}";
                                                                            });

                                                                            // final SharedPreferences prefs =
                                                                            //     await _prefs;
                                                                            // var Start_Time = prefs.setString(
                                                                            //     'startTime', '$start_time');
                                                                            // var End_Time = prefs.setString(
                                                                            //     'endTime', '$end_time');

                                                                            Done =
                                                                                Done;
                                                                            print("Done:$Done");
                                                                            if (Done ==
                                                                                true) {
                                                                              // _globalKey.currentState?.expand();
                                                                              String start_time = '';
                                                                              print("$selectedHour:$selectedMinute ${selectedPeriod.toLowerCase()}");
                                                                              setState(() {
                                                                                start_time = "$selectedHour:$selectedMinute ${selectedPeriod.toLowerCase()}";
                                                                              });
                                                                              if (timesPerDay[index].keys.length < 11) {
                                                                                timesPerDay[index]['time${timesPerDay[index].keys.length}'] = start_time;
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Practice routine in limited to 10 sessions par day.")));
                                                                              }

                                                                              print(timesPerDay);

                                                                              // times.add(start_time);
                                                                              //// print(times);
                                                                              // TwoValues<String, int> values = TwoValues<String, int>(start_time, num);
                                                                              // widget.onChangedStart(values);
                                                                              // onCountChanged(count);
                                                                              // _globalKey.currentState?.expand();
                                                                              Navigator.pop(context);
                                                                            }
                                                                          }
                                                                          // day = selectedDay;
                                                                          // hour = selectedHour;
                                                                          // minute = selectedMinute;
                                                                          // endday = selectedDay;
                                                                          // endhour = selectedHour;

                                                                          // period = selectedPeriod;
                                                                          // endperiod = selectedPeriod;
                                                                        });
                                                                      },
                                                                    );
                                                                  },
                                                                  isScrollControlled:
                                                                      true,
                                                                  shape:
                                                                      const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .vertical(
                                                                      top: Radius
                                                                          .circular(
                                                                              16),
                                                                    ),
                                                                  ),
                                                                );
                                                              })),
                                                  title: Text(
                                                    selectedDay[index],
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            67, 114, 150, 1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20.0),
                                                  ),
                                                  children: <Widget>[
                                                    for (int i = 0;
                                                        i <
                                                                timesPerDay[index]
                                                                        .keys
                                                                        .length -
                                                                    1 &&
                                                            i <= 9;
                                                        i++) ...[
                                                      Container(
                                                        // color:Colors.orange,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            38.2,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10),
                                                        child: Row(
                                                          children: [
                                                            startTimerState(
                                                              key: Key(
                                                                  "$widget.key"),
                                                              text:
                                                                  ' ${i + 1}) Time: ',
                                                              start_Time:
                                                                  timesPerDay[
                                                                          index]
                                                                      .values
                                                                      .elementAt(
                                                                          i + 1),
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  // start_time = value;
                                                                });
                                                              },
                                                              onChangedStart:
                                                                  (value) {
                                                                Map<String,
                                                                        dynamic>
                                                                    DayMap =
                                                                    timesPerDay
                                                                        .firstWhere(
                                                                  (map) =>
                                                                      map['day'] ==
                                                                      selectedDay[
                                                                          index],
                                                                );
                                                                DayMap['time${i + 1}'] =
                                                                    value;
                                                                setState(() {
                                                                  //  start_time = value;
                                                                });
                                                                //times[i] = start_time;
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                              child: Container(
                                                                  height: 37,
                                                                  width: 37,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0.1),
                                                                  ),
                                                                  child:
                                                                      FloatingActionButton(
                                                                    elevation:
                                                                        0,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onPressed:
                                                                        () {
                                                                      print(i);

                                                                      timesPerDay[
                                                                              index]
                                                                          .remove(
                                                                              'time${i + 1}');

                                                                      for (int y = i +
                                                                              1;
                                                                          y <=
                                                                              timesPerDay[index].keys.length;
                                                                          y++) {
                                                                        String
                                                                            currentTimeKey =
                                                                            'time${y}';
                                                                        if (timesPerDay[index]
                                                                            .containsKey(currentTimeKey)) {
                                                                          timesPerDay[index]
                                                                              [
                                                                              'time${y - 1}'] = timesPerDay[
                                                                                  index]
                                                                              [
                                                                              currentTimeKey];
                                                                          timesPerDay[index]
                                                                              .remove(currentTimeKey);
                                                                        }
                                                                      }
                                                                      setState(
                                                                          () {});

                                                                      print(
                                                                          'removes last');

                                                                      print(
                                                                          timesPerDay);
                                                                      print(
                                                                          'removes key');
                                                                    },
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 15,
                                                                    ),
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.6,
                                      ),
                                    ],
                                  );
                                })),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 6.85,
                      ),
                      updated
                          ? GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  swipeOffset += details.delta.dx;
                                });

                                if (swipeOffset.abs() >=
                                    MediaQuery.of(context).size.width / 3.0) {
                                  setState(() {
                                    showContainer = false;
                                  });
                                }
                              },
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 700),
                                opacity: showContainer ? 1.0 : 0.0,
                                child: Transform.translate(
                                  offset: Offset(swipeOffset, 0.0),
                                  child: Container(
                                    width: AppDimensions.height10(context) *
                                        38.259,
                                    height:
                                        AppDimensions.height10(context) * 9.707,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFD4B7B9),
                                              Color(0xFF91698C)
                                            ])),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.261),
                                          width:
                                              AppDimensions.height10(context) *
                                                  4.437,
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.437,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/circle_tick.webp'))),
                                        ),
                                        Container(
                                          //width: AppDimensions.height10(context) * 6.9,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.6,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.232),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    4.6,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    1.4,
                                                //   color: Colors.amber,
                                                child: Text(
                                                  'Updates saved',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.3,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFFFFFFF)),
                                                ),
                                              ),
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    16.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.2,
                                                child: Text(
                                                  'Routine commitment',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFFFFFFF)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        AnimatedScaleButton(
                                          onTap: () {
                                            setState(() {
                                              updated = false;
                                            });
                                            stopTimer();
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.1,
                                            height: AppDimensions.height10(
                                                    context) *
                                                6.0,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    5,
                                                right: AppDimensions.height10(
                                                        context) *
                                                    1.23),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.0),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Undo',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.8,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFFFFFFFF)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedScaleButton(
                                  onTap: () async {
                                    for (int i = 0;
                                        i < timesPerDay.length;
                                        i++) {
                                      if (timesPerDay[i].keys.length > 1) {
                                        updates.add(timesPerDay[i]);
                                      }
                                    }
                                    print(updates);

                                    PracticeGoalApi()
                                        .updateUserPractice('schedule', updates)
                                        .then((response) {
                                      if (response == true) {
                                        setState(() {
                                          updated = true;
                                          showContainer = true;
                                        });
                                        startTimer();
                                      } else if (response == false) {
                                        print('Api call failed');
                                      }
                                    }).catchError((error) {
                                      print('===>Error');
                                    }).whenComplete(() {
                                      setState(() {
                                        // Hide loader when the API call completes
                                      });
                                    });

                                    print(
                                        "===================SelectedDays$updates");
                                  },
                                  child: Container(
                                    height: AppDimensions.height10(context) * 5,
                                    width:
                                        AppDimensions.height10(context) * 31.3,
                                    decoration: BoxDecoration(
                                      // color: Color(0xFFFF7D50),
                                      border:
                                          Border.all(color: Colors.transparent),

                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFFFCC10D),
                                            Color(0xFFFDA210)
                                          ]),

                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "More than 2 days selected - Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 4.2,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom))
                    ],
                  ),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ],
      ),
    );
  }
}
