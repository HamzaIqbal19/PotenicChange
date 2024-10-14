import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_text_styles.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/animatedButton.dart';
import '../HomeScreen/HomeScreen.dart';
import 'Created Practice.dart';
import 'PracticeReminder.dart';

class PracticeRoutine extends StatefulWidget {
  const PracticeRoutine({Key? key}) : super(key: key);

  @override
  State<PracticeRoutine> createState() => _PracticeRoutineState();
}

class _PracticeRoutineState extends State<PracticeRoutine> {
  bool buttonActive = false;
  int count1 = 0;
  bool loader = false;

  bool notificationStatus = false;
  bool status2 = false;

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
  List<Map<String, dynamic>> selectedDays = [];

  void timeAdd() {
    timesPerDay.add({
      'day': 'Monday',
    });
  }

  getReminderStatus() {
    PracticeGoalApi.getUserReminder().then((value) {
      print("Reminder status: $value");
      if (value != null) {
        setState(() {
          notificationStatus = value['beforePractice'];
          status2 = value['missedPractice'];
        });
      }
    });
  }

  var mygoal = TextEditingController();
  var practiceName = TextEditingController();
  var practice = TextEditingController();
  var color;
  String route = '';
  int index1 = 0;

  savePractice() {
    setState(() {
      loader = true;
    });
    PracticeGoalApi()
        .userAddPractice(
          practiceName.text.toString(),
          true,
          selectedDays,
        )
        .then((response) async {
          if (response == true) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Practice Added Successfully")));
            if (route == 'view_all_goals') {
              Navigator.pushReplacement(
                  context, FadePageRoute(page: const view_all_goals_menu()));
            } else if (route == 'view_all_goals_2') {
              Navigator.pushReplacement(
                  context, FadePageRoute(page: const multiple_goal_inactive()));
            } else {
              Navigator.pushReplacement(
                context,
                FadePageRoute2(
                  true,
                  exitPage: const PracticeReminder(
                    comingFromEditScreen: false,
                    praticeName: '',
                    goalName: '',
                    goalColor: '',
                    pracColor: '',
                  ),
                  enterPage: const PracticeFinished(),
                ),
              );
            }
            final SharedPreferences prefs = await _prefs;

            await prefs.remove('goal_route');
            await prefs.remove('route');
          } else if (response == false) {}
        })
        .catchError((error) {})
        .whenComplete(() {
          setState(() {
            loader = false; // Hide loader when the API call completes
          });
        });
  }

  Future<void> saveTimesPerDay(List<Map<String, dynamic>> timesPerDay) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert the list to a JSON-encoded string
    String timesPerDayJson = json.encode(timesPerDay);

    // Save the string to shared preferences
    await prefs.setString('timesPerDay', timesPerDayJson);
  }

  @override
  void initState() {
    super.initState();
    getGoalName();
    getRoute();
    getReminderStatus();
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goal_route = prefs.getString('goal_route');
    setState(() {
      route = goal_route!;
    });
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getGoalName() async {
    final SharedPreferences prefs = await _prefs;
    var myGoal = prefs.getString("goalName");
    var practicename = prefs.getString('pracName');
    var goalColor = prefs.getString('goalColor');
    setState(() {
      color = goalColor;
      mygoal.text = myGoal!;
      practice.text = practicename!;
      practiceName.text = practicename;
    });
  }

  backPress() {
    setState(() {
      count1 = 0;
    });

    Navigator.pop(context);
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
            title: Text(
              AppText().createPrac3,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: AppDimensions.font10(context) * 1.8,
              ),
            ),
            leading: Buttons().backButton(context, backPress),
            actions: [
              Buttons().closeButton(context, () {
                showAnimatedDialog(
                  animationType: DialogTransitionType.fadeScale,
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 1),
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                    width: AppDimensions.width10(context) * 27.0,
                    height: AppDimensions.height10(context) * 18.2,
                    child: AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      actionsPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 1.4)),
                      title: Container(
                        margin: const EdgeInsets.only(
                            top: 19, right: 16, left: 16, bottom: 2),
                        height: AppDimensions.height10(context) * 2.2,
                        width: AppDimensions.width10(context) * 23.8,
                        child: Text(
                          "Are you sure?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      content: Container(
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 1.9,
                            left: AppDimensions.width10(context) * 1.6,
                            right: AppDimensions.width10(context) * 1.6),
                        height: AppDimensions.height10(context) * 3.2,
                        width: AppDimensions.width10(context) * 23.8,
                        child: Text(
                          "If you close it now, you will lose all your progress.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: AppDimensions.height10(context) * 0.15,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 42,
                              width: double.infinity,
                              color: const Color(0xFF007AFF),
                              child: TextButton(
                                onPressed: () async {
                                  if (route == 'view_all_goals') {
                                    Navigator.pushReplacement(
                                        context,
                                        FadePageRouteReverse(
                                            page: const view_all_goals_menu()));
                                  } else if (route == 'view_all_goals_2') {
                                    Navigator.pushReplacement(
                                        context,
                                        FadePageRouteReverse(
                                            page:
                                                const multiple_goal_inactive()));
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      FadePageRouteReverse(
                                        page: const HomeScreen(
                                          login: true,
                                        ),
                                      ),
                                    );

                                    final SharedPreferences prefs =
                                        await _prefs;

                                    await prefs.remove('route');
                                  }
                                },
                                child: const Text(
                                  'Close',
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 17,
                                      fontFamily: "Laila",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 44,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Laila",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF007AFF)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 10.5),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 30,
                  child: Center(
                    child: Text(
                      mygoal.text.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context),
                ),
                goalAndPractice(context, color, 2, practice.text.toString()),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.3,
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                  width: AppDimensions.width10(context) * 36.4,
                  child: Center(
                    child: Text(
                      AppText().practiceRotine,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 2.8,
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
                      width: AppDimensions.width10(context) * 37.2,
                      child: Center(
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: AppText().practiceRotineBody1,
                            style: TextStyle(
                              fontFamily: 'Laila',
                              color: const Color(0xFFFFFFFF),
                              fontSize: AppDimensions.font10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppText().practiceRotineBody2,
                                  style: TextStyle(
                                    fontFamily: 'Laila',
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
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
                                  // days: '${timesPerDay[index]['day']}',
                                  days: selectedDay[index],

                                  startTime: "${timesPerDay[index]['time1']}",
                                  endTime: "${timesPerDay[index]['time2']}",
                                  onChangedStart: (value) {
                                    if (value.value2 == 1) {
                                      setState(() {
                                        timesPerDay[index]['time1'] =
                                            value.value1;
                                        index1 = index;
                                      });
                                    } else if (value.value2 <= 10) {
                                      Map<String, dynamic> DayMap =
                                          timesPerDay.firstWhere(
                                        (map) =>
                                            map['day'] == selectedDay[index],
                                      );
                                      DayMap['time${value.value2}'] =
                                          value.value1;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Practice routine in limited to 10 sessions par day.")));
                                    }
                                  },

                                  onCountChanged: (value) {
                                    // Clear the existing selectedDays list
                                    bool isAlreadySelected = selectedDays
                                        .contains(timesPerDay[index]);

                                    if (isAlreadySelected) {
                                    } else {
                                      // If it's not already selected, add it to the list
                                      selectedDays.add(timesPerDay[index]);
                                      setState(() {
                                        count1 = count;
                                        index1 = index;
                                      });
                                    }
                                  },
                                  expansion: false,
                                  onDelete: (value) {
                                    if (value.value3 >= 1) {
                                      int ind = selectedDays.indexWhere(
                                          (element) =>
                                              element['day'] ==
                                              selectedDay[index]);

                                      selectedDays[ind]
                                          .remove('time${value.value2}');

                                      for (int i = value.value2 + 1;
                                          i <= selectedDays[ind].length;
                                          i++) {
                                        String currentTimeKey = 'time$i';
                                        if (selectedDays[ind]
                                            .containsKey(currentTimeKey)) {
                                          selectedDays[ind]['time${i - 1}'] =
                                              selectedDays[ind][currentTimeKey];
                                          selectedDays[ind]
                                              .remove(currentTimeKey);
                                        }
                                      }
                                    } else {
                                      selectedDays.removeWhere((element) =>
                                          element['day'] == selectedDay[index]);
                                      setState(() {
                                        count1 = count - 1;
                                      });
                                    }

                                    setState(() {
                                      index1 = index;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.6,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedScaleButton(
                      onTap: () async {
                        if (count1 >= 3) {
                          if (notificationStatus == true || status2 == true) {
                            savePractice();
                          } else {
                            saveTimesPerDay(selectedDays);

                            Navigator.push(
                              context,
                              FadePageRoute(
                                page: const PracticeReminder(
                                  comingFromEditScreen: false,
                                  goalName: '',
                                  praticeName: '',
                                  goalColor: '',
                                  pracColor: '',
                                ),
                              ),
                            );
                            final SharedPreferences prefs = await _prefs;
                            await prefs.setBool('pracRoute', false);
                            // setState(() {
                            //   count = 0;
                            // });
                          }
                        } else {}
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5.2,
                        width: AppDimensions.width10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),

                          gradient: count1 >= 3
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                      Color(0xFFFCC10D),
                                      Color(0xFFFDA210)
                                    ])
                              : const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                      Color(0xFF828282),
                                      Color(0xFF828282)
                                    ]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                          child: Text(
                            "More than 2 days selected - Next",
                            style:
                                AppTextStyles().onBoardingButtonStyle(context),
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
          ),
        ],
      ),
    );
  }
}
