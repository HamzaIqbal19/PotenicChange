import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeReminder.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/animatedButton.dart';
import '../HomeScreen/HomeScreen.dart';

class PracticeRoutine extends StatefulWidget {
  const PracticeRoutine({Key? key}) : super(key: key);

  @override
  State<PracticeRoutine> createState() => _PracticeRoutineState();
}

class _PracticeRoutineState extends State<PracticeRoutine> {
  bool buttonActive = false;
  int Count = 0;

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

  var mygoal = TextEditingController();
  var practiceName = TextEditingController();
  var practice = TextEditingController();
  var color;
  String route = '';
  int index1 = 0;

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
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goal_route = prefs.getString('goal_route');
    print("================Route=${prefs.getString('goal_route')}");
    setState(() {
      route = goal_route!;
    });
    print("================Route=$route");
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getGoalName() async {
    print("hello world1224");
    final SharedPreferences prefs = await _prefs;
    var my_goal = prefs.getString("goalName");
    var practice_Name = prefs.getString('pracName');
    var goalColor = prefs.getString('goalColor');
    setState(() {
      color = goalColor;
      mygoal.text = my_goal!;
      practice.text = practice_Name!;
      practiceName.text = practice_Name!;
    });
    print('=======================>$color');
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
                  setState(() {
                    count = 0;
                  });

                  Navigator.pop(context);
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
                    showAnimatedDialog(
                      animationType: DialogTransitionType.fadeScale,
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                        width: AppDimensions.height10(context) * 27.0,
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
                            width: AppDimensions.height10(context) * 23.8,
                            child: Text(
                              "Are you sure?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF000000),
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          content: Container(
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.9,
                                left: AppDimensions.height10(context) * 1.6,
                                right: AppDimensions.height10(context) * 1.6),
                            height: AppDimensions.height10(context) * 3.2,
                            width: AppDimensions.height10(context) * 23.8,
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
                                            FadePageRoute(
                                                page:
                                                    const veiw_all_goals_menu()));
                                      } else if (route == 'view_all_goals_2') {
                                        Navigator.pushReplacement(
                                            context,
                                            FadePageRoute(
                                                page:
                                                    const multiple_goal_inactive()));
                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          FadePageRoute(
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
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.3),
                  child: Center(
                    child: Text(
                      "Practice Creation 3/3",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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
                      mygoal.text.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10(context) * 7.9,
                      height: AppDimensions.height10(context) * 7.9,
                      // color: Colors.amber,

                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-3, 0),
                            child: Container(
                              width: AppDimensions.height10(context) * 7.9,
                              height: AppDimensions.height10(context) * 7.9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(color == '1'
                                        ? "assets/images/red_gradient.webp"
                                        : color == '2'
                                            ? 'assets/images/orange_moon.webp'
                                            : color == '3'
                                                ? "assets/images/lightGrey_gradient.webp"
                                                : color == '4'
                                                    ? "assets/images/lightBlue_gradient.webp"
                                                    : color == '5'
                                                        ? "assets/images/medBlue_gradient.webp"
                                                        : color == '6'
                                                            ? "assets/images/Blue_gradient.webp"
                                                            : 'assets/images/orange_moon.webp'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1.5, 0),
                            child: Container(
                              height: AppDimensions.height10(context) * 4.9,
                              width: AppDimensions.height10(context) * 4.9,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse 158_wb.webp'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        //width: AppDimensions.height10(context) * 22,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.5),
                        child: practice.text.toString().length > 20
                            ? Text(
                                capitalizeFirstLetter(
                                  practice.text.substring(0, 19) + '...',
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF156F6D),
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              )
                            : Text(
                                capitalizeFirstLetter(
                                  practice.text.toString(),
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF156F6D),
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              )),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.3,
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
                        color: Colors.white,
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
                                'It’s important to set a consistent routine that works for you. Please select time slots\n ',
                            style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'for 3 or more days.',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
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
                                    print(value);
                                    //  print(timesPerDay[index]['day']);
                                    print(
                                        "Start index printing${timesPerDay[index]}");
                                    if (value.value2 == 1) {
                                      setState(() {
                                        timesPerDay[index]['time1'] =
                                            value.value1;
                                        index1 = index;
                                      });
                                    } else if (value.value2 <= 9) {
                                      Map<String, dynamic> DayMap =
                                          timesPerDay.firstWhere(
                                        (map) =>
                                            map['day'] == selectedDay[index],
                                      );
                                      DayMap['time${value.value2}'] =
                                          value.value1;
                                      // timesPerDay.where((element) =>
                                      //     timesPerDay[index]['day'] ==
                                      //     selectedDay[index]);
                                    } else {
                                      print('Max per day limit reached');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Practice routine in limited to 10 sessions par day.")));
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
                                  // },
                                  onCountChanged: (value) {
                                    // Clear the existing selectedDays list
                                    // selectedDays.clear();
                                    bool isAlreadySelected = selectedDays
                                        .contains(timesPerDay[index]);

                                    // Add the selected day to selectedDays list based on the index
                                    if (isAlreadySelected) {
                                      print(
                                          "The list is alredy exist in object");

                                      // If it's already selected, remove it from the list
                                      // selectedDays.remove(timesPerDay[index]);
                                    } else {
                                      // If it's not already selected, add it to the list
                                      selectedDays.add(timesPerDay[index]);
                                      setState(() {
                                        Count = count;
                                        index1 = index;
                                      });

                                      print("counter incress: $Count");
                                    }

                                    print('Selected Days:');
                                    print(selectedDays);
                                  },
                                  expansion: false,
                                  onDelete: (value) {
                                    print(selectedDays);
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
                                        Count = Count - 1;
                                      });
                                    }

                                    print(selectedDays);
                                    setState(() {
                                      //Count = value.value1;
                                      index1 = index;
                                    });
                                    print(Count);
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
                        print(timesPerDay);
                        if (Count >= 3) {
                          saveTimesPerDay(selectedDays);

                          print(timesPerDay[6]['start']);
                          print(timesPerDay[6]['end']);
                          print(timesPerDay[6]['day']);
                          Navigator.push(
                            context,
                            FadePageRoute(
                              page: const PracticeReminder(
                                comingFromEditScreen: false,
                              ),
                            ),
                          );
                          // setState(() {
                          //   count = 0;
                          // });
                        } else {
                          print(timesPerDay[index1]);
                        }
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),

                          gradient: Count >= 3
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.6,
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
          ),
        ],
      ),
    );
  }
}
