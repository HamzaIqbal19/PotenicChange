import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/Notification%20Journey/widgets/notificationPermissionService.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/Created%20Practice.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeName.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/practiceReview.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_text_styles.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../HomeScreen/HomeScreen.dart';

class PracticeReminder extends StatefulWidget {
  final bool comingFromEditScreen;
  final String praticeName;
  final String goalName;
  final String goalColor;
  final String pracColor;
  const PracticeReminder(
      {Key? key,
      required this.comingFromEditScreen,
      required this.praticeName,
      required this.goalName,
      required this.goalColor,
      required this.pracColor})
      : super(key: key);

  @override
  State<PracticeReminder> createState() => _PracticeReminderState();
}

class _PracticeReminderState extends State<PracticeReminder> {
  bool radio1 = false;
  bool radio2 = false;
  bool updated = false;
  bool reminderSelected = false;

  setNotifications() {
    setUserReminder('receiveNotification', true);
    setUserReminder('beforePractice', radio1);
    setUserReminder('missedPractice', radio1);
    setUserReminder('goalEvaluation', radio1);
    setUserReminder('progressReport', radio1);
    setUserReminder('motivationalMessages', radio1);
    setUserReminder('hurdleReminder', radio1);
    setUserReminder('inspirationReminder', radio1);
  }

  var reminder;
  final NotificationPermissionService _notificationPermissionService =
      NotificationPermissionService();

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        setState(() {
          reminder = response["reminder"];
          radio1 = reminder;
          radio2 = !reminder;
        });
      } else {}
    }).catchError((error) {});
  }

  setUserReminder(name, reminder) {
    PracticeGoalApi().updateUserReminder(name, reminder);
  }

  String currentDay = DateFormat('EEEE').format(DateTime.now());

  var mygoal = TextEditingController();
  var practiceName = TextEditingController();
  var practice = TextEditingController();
  notificationPermissionSerice() {
    setState(() {
      radio1 = true;
      radio2 = false;
      reminderSelected = true;
    });
    _notificationPermissionService.checkAndRequestNotificationPermission(
        context, false);
  }

  var color;
  String route = '';
  bool loader = false;

  @override
  void initState() {
    if (widget.comingFromEditScreen) {
      _fetchPracticeDetails();
    }
    getGoalName();
    super.initState();
    getRoute();
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      route = goalRoute!;
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
      practiceName.text = practicename.toString();
      practice.text = practicename!;
    });
  }

  Future<List<Map<String, dynamic>>> loadTimesPerDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON-encoded string from shared preferences
    String? timesPerDayJson = prefs.getString('timesPerDay');

    if (timesPerDayJson != null) {
      // Convert the string back to a list of maps
      List<dynamic> decodedList = json.decode(timesPerDayJson);

      // Cast each map in the list to Map<String, dynamic>
      List<Map<String, dynamic>> loadedList =
          decodedList.map((item) => Map<String, dynamic>.from(item)).toList();

      return loadedList;
    } else {
      // If the value is not found, return an empty list
      return [];
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
        Navigator.push(
            context, FadePageRouteReverse(page: const PracticeReview()));
      });
    });
  }

  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the timer if it's active
    }
  }

  backPress() {
    widget.comingFromEditScreen
        ? updated == false
            ? showAnimatedDialog(
                animationType: DialogTransitionType.fadeScale,
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                context: context,
                builder: (BuildContext context) => const pop_up_practices())
            : Navigator.pop(context)
        : Navigator.pop(context);
  }

  @override
  void dispose() {
    stopTimer(); // Make sure to cancel the timer when the widget is disposed
    super.dispose();
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
            title: appBarTitle(
                context,
                widget.comingFromEditScreen
                    ? AppText().viewAndEdit
                    : AppText().createPrac3,
                widget.comingFromEditScreen),
            automaticallyImplyLeading: true,
            leading: Buttons().backButton(context, backPress),
            actions: [
              widget.comingFromEditScreen == true
                  ? Container()
                  : Buttons().closeButton(context, () {
                      if (widget.comingFromEditScreen == true) {
                        Navigator.pop(context);
                      } else {
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
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              content: Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.9,
                                    left: AppDimensions.width10(context) * 1.6,
                                    right:
                                        AppDimensions.width10(context) * 1.6),
                                height: AppDimensions.height10(context) * 3.2,
                                width: AppDimensions.width10(context) * 23.8,
                                child: Text(
                                  "If you close it now, you will lose all your progress.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height:
                                        AppDimensions.height10(context) * 0.15,
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
                                                    page:
                                                        const view_all_goals_menu()));
                                          } else if (route ==
                                              'view_all_goals_2') {
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
                      }
                    }),
            ],
          )),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.comingFromEditScreen
                    ? const AssetImage("assets/images/GoalReviewBg.webp")
                    : const AssetImage("assets/images/Categories.webp"),
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
                      widget.comingFromEditScreen
                          ? widget.goalName
                          : mygoal.text.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? const Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.font10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.7,
                ),
                widget.comingFromEditScreen
                    ? goalAndPractice(context, widget.goalColor,
                        widget.pracColor, widget.praticeName)
                    : goalAndPractice(
                        context, color, 2, practice.text.toString()),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.3,
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                  width: AppDimensions.width10(context) * 22.3,
                  child: Center(
                    child: Text(
                      AppText().pracReminder,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: widget.comingFromEditScreen
                            ? const Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.font10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) - 2,
                ),
                Text(
                  AppText().pracReminderBody,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: widget.comingFromEditScreen
                        ? const Color(0xff437296)
                        : Colors.white,
                    fontSize: AppDimensions.font10(context) * 1.8,
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  //height: AppDimensions.height10(context) * 16,
                  width: AppDimensions.width10(context) * 38.2,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE8776D),
                            Color(0xFFEF939D),
                            Color(0xFFD6C4C6)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(
                          AppDimensions.height10(context) * 2.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // color: Colors.blue,
                            width: AppDimensions.width10(context) * 25.9,
                            height: AppDimensions.height10(context) * 3.6,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    width: AppDimensions.width10(context) * 3.5,
                                    height:
                                        AppDimensions.height10(context) * 3.5,
                                    child: Image.asset(
                                      "assets/images/notifications.webp",
                                      fit: BoxFit.contain,
                                    )),
                                SizedBox(
                                    width:
                                        AppDimensions.width10(context) * 20.4,
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    child: Text(
                                      AppText().remindMe,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Laila",
                                        color: const Color(0xFFFFFFFF),
                                        fontSize:
                                            AppDimensions.font10(context) * 2.0,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (radio1 == true) {
                                setState(() {
                                  radio1 = false;
                                  reminderSelected = false;
                                });
                              } else if (radio1 == false) {
                                notificationPermissionSerice();
                              }
                            },
                            child: SizedBox(
                                width: AppDimensions.width10(context) * 3.3,
                                height: AppDimensions.height10(context) * 3.3,
                                child: radio1 == true
                                    ? Image.asset(
                                        "assets/images/uncheckradio.webp",
                                        width: AppDimensions.width10(context) *
                                            3.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.3,
                                      )
                                    : Image.asset(
                                        "assets/images/circle.webp",
                                        width: AppDimensions.width10(context) *
                                            3.3,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.3,
                                      )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 1.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: AppDimensions.height10(context) * 5.1,
                            width: AppDimensions.width10(context) * 34.5,
                            padding: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 2.0,
                                left: AppDimensions.width10(context) * 1.7),
                            child: Text(
                              AppText().remindMeBody,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Laila",
                                height: AppDimensions.height10(context) * 0.14,
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.font10(context) * 1.7,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.8,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.0,
                ),
                Container(
                  width: AppDimensions.width10(context) * 38.2,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE8776D),
                            Color(0xFFEF939D),
                            Color(0xFFD6C4C6)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(
                          AppDimensions.height10(context) * 2.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // color: Colors.blue,
                            width: AppDimensions.width10(context) * 25.9,
                            height: AppDimensions.height10(context) * 3.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    width: AppDimensions.width10(context) * 3.5,
                                    height:
                                        AppDimensions.height10(context) * 3.5,
                                    child: Image.asset(
                                      "assets/images/notificationsoff.webp",
                                      fit: BoxFit.contain,
                                    )),
                                SizedBox(
                                  width: AppDimensions.width10(context) * 20.4,
                                  height: AppDimensions.height10(context) * 2.4,
                                  child: Text(
                                    AppText().dontRemindMe,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFFFFFF),
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (radio2 == false) {
                                setState(() {
                                  radio2 = true;

                                  radio1 = false;
                                  reminderSelected = true;
                                });
                              } else {
                                setState(() {
                                  radio2 = false;
                                  reminderSelected = false;
                                });
                              }
                            },
                            child: SizedBox(
                                width: AppDimensions.width10(context) * 3.3,
                                height: AppDimensions.height10(context) * 3.3,
                                child: radio2 == true
                                    ? Image.asset(
                                        "assets/images/uncheckradio.webp")
                                    : Image.asset("assets/images/circle.webp")),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 1.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // height: AppDimensions.height10(context) * 6.8,
                            width: AppDimensions.width10(context) * 34.5,
                            padding: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 2.0,
                                left: AppDimensions.width10(context) * 1.7),
                            child: Text(
                              AppText().dontRemindMeBody,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Laila",
                                height: AppDimensions.height10(context) * 0.14,
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.font10(context) * 1.7,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: updated
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
                          width: AppDimensions.width10(context) * 38.259,
                          height: AppDimensions.height10(context) * 9.707,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFD4B7B9),
                                    Color(0xFF91698C)
                                  ])),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.width10(context) * 1.261),
                                width: AppDimensions.width10(context) * 4.437,
                                height: AppDimensions.height10(context) * 4.437,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/circle_tick.webp'))),
                              ),
                              Container(
                                //width: AppDimensions.width10(context) * 6.9,
                                height: AppDimensions.height10(context) * 3.6,
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.width10(context) * 1.232),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 4.6,
                                      height:
                                          AppDimensions.height10(context) * 1.4,
                                      //   color: Colors.amber,
                                      child: Text(
                                        'Updates saved',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.3,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 16.9,
                                      height:
                                          AppDimensions.height10(context) * 2.2,
                                      child: Text(
                                        'Your Reminder',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF)),
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
                                  width: AppDimensions.height10(context) * 8.1,
                                  height: AppDimensions.height10(context) * 6.0,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) * 5,
                                      right: AppDimensions.height10(context) *
                                          1.23),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFFFFFFF),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 2.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Undo',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFFFFFFF)),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.comingFromEditScreen
                          ? Container(
                              width: AppDimensions.width10(context) * 10.0,
                              height: AppDimensions.height10(context) * 4.8,
                              decoration: reminderSelected
                                  ? BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color(0xffFA9934)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                    )
                                  : BoxDecoration(
                                      // color: Color(0xFFFF7D50),
                                      border: Border.all(
                                          color: const Color(0xff282828)),
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                    ),
                              child: Center(
                                  child: Text(
                                "Reset",
                                style: TextStyle(
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w600,
                                    color: reminderSelected
                                        ? const Color(0xffFA9934)
                                        : const Color(0xff282828),
                                    fontSize:
                                        AppDimensions.font10(context) * 2),
                              )))
                          : Container(),
                      widget.comingFromEditScreen
                          ? SizedBox(
                              width: AppDimensions.width10(context) * 1,
                            )
                          : Container(),
                      AnimatedScaleButton(
                        onTap: () async {
                          if (widget.comingFromEditScreen) {
                            if (reminderSelected == true) {
                              setState(() {
                                loader =
                                    true; // Show loader when the API call starts
                              });

                              // List<Map<String, dynamic>>
                              //     loadedTimesPerDay =
                              //     await loadTimesPerDay();
                              final SharedPreferences prefs = await _prefs;

                              await prefs.setBool('pracReminder', radio1);
                              //add Id
                              PracticeGoalApi()
                                  .updateUserPractice(
                                    'reminder',
                                    radio1,
                                  )
                                  .then((response) {
                                    if (response == true) {
                                      setState(() {
                                        updated = true;
                                        showContainer = true;
                                      });
                                      startTimer();
                                    } else if (response == false) {}
                                  })
                                  .catchError((error) {})
                                  .whenComplete(() {
                                    setState(() {
                                      loader =
                                          false; // Hide loader when the API call completes
                                    });
                                  });
                              setNotifications();
                            }
                          } else {
                            if (reminderSelected == true) {
                              setState(() {
                                loader =
                                    true; // Show loader when the API call starts
                              });

                              List<Map<String, dynamic>> loadedTimesPerDay =
                                  await loadTimesPerDay();
                              final SharedPreferences prefs = await _prefs;

                              await prefs.setBool('pracReminder', radio1);
                              //add Id
                              PracticeGoalApi()
                                  .userAddPractice(
                                    practiceName.text.toString(),
                                    radio1,
                                    loadedTimesPerDay,
                                  )
                                  .then((response) async {
                                    if (response == true) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Practice Added Successfully")));
                                      if (route == 'view_all_goals') {
                                        Navigator.pushReplacement(
                                            context,
                                            FadePageRoute(
                                                page:
                                                    const view_all_goals_menu()));
                                      } else if (route == 'view_all_goals_2') {
                                        Navigator.pushReplacement(
                                            context,
                                            FadePageRoute(
                                                page:
                                                    const multiple_goal_inactive()));
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
                                      final SharedPreferences prefs =
                                          await _prefs;

                                      await prefs.remove('goal_route');
                                      await prefs.remove('route');
                                    } else if (response == false) {}
                                  })
                                  .catchError((error) {})
                                  .whenComplete(() {
                                    setState(() {
                                      loader =
                                          false; // Hide loader when the API call completes
                                    });
                                  });
                              setNotifications();
                            }
                          }
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5.2,
                          width: widget.comingFromEditScreen
                              ? AppDimensions.width10(context) * 26.3
                              : AppDimensions.width10(context) * 31.3,
                          decoration: BoxDecoration(
                            // color: Color(0xFFFF7D50),
                            border: Border.all(color: Colors.transparent),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: reminderSelected
                                    ? [
                                        const Color(0xFFFCC10D),
                                        const Color(0xFFFDA210)
                                      ]
                                    : [
                                        const Color(0xFFFCC10D)
                                            .withOpacity(0.5),
                                        const Color(0xFFFDA210).withOpacity(0.5)
                                      ]),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Center(
                            child: loader
                                ? SpinKitThreeBounce(
                                    color: const Color(0xFF8C648A),
                                    // delay: Duration(milliseconds: 0),
                                    size: AppDimensions.height10(context) * 3.5,
                                  )
                                : Text(
                                    widget.comingFromEditScreen
                                        ? "Update"
                                        : "Finished",
                                    style: AppTextStyles()
                                        .onBoardingButtonStyle(context),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
