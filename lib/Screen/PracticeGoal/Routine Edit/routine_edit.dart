import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeReminder.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';

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

  List<Map<String, dynamic>> timesPerDay = [
    {'day': 'Monday', 'time1': '9:00 am'},
    {'day': 'Tuesday', 'time1': '9:00 am'},
    {'day': 'Wednesday', 'time1': '9:00 am'},
    {'day': 'Thursday', 'time1': '9:00 am'},
    {'day': 'Friday', 'time1': '9:00 am'},
    {'day': 'Saturday', 'time1': '9:00 am'},
    {'day': 'Sunday', 'time1': '9:00 am'}
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
        mapItems(schedule, updates);
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
                                itemCount: timesPerDay.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      schedule_card(
                                        key: Key('$index'),
                                        onDelete: (value) {
                                          setState(() {
                                            Count = value;
                                            index1 = index;
                                          });
                                          timesPerDay.removeAt(index);
                                        },
                                        // days: '${timesPerDay[index]['day']}',
                                        days: '${selectedDay[index]}',

                                        startTime:
                                            "${timesPerDay[index]['time1']}",
                                        endTime:
                                            "${timesPerDay[index]['time2']}",
                                        onChangedStart: (value) {
                                          print(value);
                                          //  print(timesPerDay[index]['day']);
                                          print(
                                              "Start index printing${timesPerDay[index]}");

                                          setState(() {
                                            timesPerDay[index]['time1'] = value;
                                            index1 = index;
                                          });

                                          bool isAlreadySelected = updates
                                              .contains(timesPerDay[index]);

                                          // Add the selected day to selectedDays list based on the index
                                          if (isAlreadySelected) {
                                            print(
                                                "The list is alredy exist in object");
                                            updates[index]['time1'] = value;
                                          } else {
                                            updates.add(timesPerDay[index]);
                                            print(updates);

                                            print("counter incress: $Count");
                                          }
                                        },
                                        // onChangedEnd: (value) {
                                        //   print(value);
                                        //   print(
                                        //       "End index printing${timesPerDay[index]}");

                                        //   setState(() {
                                        //     timesPerDay[index]['time2'] = value;

                                        //     index1 = index;
                                        //   });

                                        //   bool isAlreadySelected = updates
                                        //       .contains(timesPerDay[index]);
                                        //   print('2');
                                        //   // Add the selected day to selectedDays list based on the index
                                        //   if (isAlreadySelected) {
                                        //     print(
                                        //         "The list is alredy exist in object");
                                        //     updates[index]['time2'] = value;
                                        //   } else {
                                        //     updates.add(timesPerDay[index]);
                                        //     print(updates);
                                        //   }
                                        // },
                                        onCountChanged: (value) {
                                          // Clear the existing selectedDays list
                                          // selectedDays.clear();
                                          bool isAlreadySelected = updates
                                              .contains(timesPerDay[index]);

                                          // Add the selected day to selectedDays list based on the index
                                          if (isAlreadySelected) {
                                            print(
                                                "The list is alredy exist in object");
                                            // If it's already selected, remove it from the list
                                            // selectedDays.remove(timesPerDay[index]);
                                          } else {
                                            // If it's not already selected, add it to the list
                                            updates.add(timesPerDay[index]);
                                            print(updates);
                                            setState(() {
                                              Count = value;
                                              index1 = index;
                                            });

                                            print("counter incress: $Count");
                                          }

                                          print('Selected Days:');
                                          print(updates);
                                        },
                                        expansion: true,
                                      ),
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
                                    ;

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
