import 'dart:async';
import 'dart:convert';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal-Why.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal_Identity.dart';
import 'package:potenic_app/Screen/Goal%20Review%20Journey/StarReview.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';
import 'Goal Finished.dart';

class Visualising extends StatefulWidget {
  final String route;
  final bool comingFromEditScreen;
  final bool saved;
  const Visualising(
      {Key? key,
      required this.comingFromEditScreen,
      required this.route,
      required this.saved})
      : super(key: key);

  @override
  State<Visualising> createState() => _VisualisingState();
}

class _VisualisingState extends State<Visualising> {
  List<Map<String, String>> goalVisualising = [];
  bool update = false;

  //closing the focus
  final FocusNode blankNode = FocusNode();
  bool loading = true;
  String goalName = "";
  var visualize;
  var resetData;
  String route = '';
  bool saved = false;
  int listReason = 0;
  String trigger = '1';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveAddPracRoute() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getBool('pracRoute') != false) {
      await prefs.setBool("pracRoute", true);
    }
  }

  @override
  void initState() {
    super.initState();
    getRoute();
    // Add one element to the list when the screen is initialized.
    if (widget.saved == true) {
      getData();
    } else {
      goalVisualising.add({
        'key': 'Reason ${goalVisualising.length}',
        'text': '',
      });
    }

    if (widget.comingFromEditScreen == false) {
      getGoalName();
    } else {
      _fetchGoalNames();
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
            context,
            FadePageRoute(
                page: StarReview(
              route: widget.route,
            )));
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

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString('goal');
    Map<String, dynamic> jsonMap = json.decode(jsonString!);

    if (jsonMap.isNotEmpty) {
      for (int i = 0; i <= jsonMap['visualizingYourSelf'].length; i++) {
        goalVisualising.add({
          'key': 'Reason ${goalVisualising.length}',
          'text': '${jsonMap['visualizingYourSelf'][i]['text']}',
        });
      }
    }
  }

  resetDialog() {
    return showAnimatedDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: AppDimensions.height10(context) * 27.0,
          height: AppDimensions.height10(context) * 18.2,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 1.4)),
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            title: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 1.4)),
              margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.9,
                  right: AppDimensions.height10(context) * 1.6,
                  left: AppDimensions.height10(context) * 1.6,
                  bottom: AppDimensions.height10(context) * 0.2),
              height: AppDimensions.height10(context) * 2.2,
              width: AppDimensions.height10(context) * 23.8,
              child: Text(
                "Reset answers?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 1.7,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            content: Container(
              margin: EdgeInsets.only(
                  bottom: AppDimensions.height10(context) * 1.5,
                  left: AppDimensions.height10(context) * 1.6,
                  right: AppDimensions.height10(context) * 1.6),
              // height: AppDimensions.height10(context) * 3.2,
              width: AppDimensions.height10(context) * 23.8,
              child: Text(
                "Are you sure you want to reset, all your\nchanges for goal visualization?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 1.3,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            actions: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                    child: Divider(
                      color: const Color(0XFF3C3C43).withOpacity(0.29),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        trigger = '${int.parse(trigger) + 1}';
                      });
                      setState(() {
                        visualize = jsonDecode(resetData);
                      });
                      setState(() {
                        //  trigger = '1';
                      });
                      Navigator.pop(context);
                    }

                    // selectedItemIndexesOuter!.clear();
                    ,
                    child: Container(
                      height: AppDimensions.height10(context) * 4.2,
                      width: double.infinity,
                      color: const Color(0xFF007AFF),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize: AppDimensions.font10(context) * 1.7,
                              fontFamily: "Laila",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                    child: Divider(
                      color: const Color(0XFF3C3C43).withOpacity(0.29),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 4.4,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.7,
                            fontFamily: "Laila",
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF007AFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 0.1,
                    child: Divider(
                      color: const Color(0XFF3C3C43).withOpacity(0.29),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
    );
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          loading = false;
          goalName = response["name"];
          visualize = response["visualizingYourSelf"];
          resetData = jsonEncode(response["visualizingYourSelf"]);
        });
      }
    }).catchError((error) {
      setState(() {
        loading = false;
      });
    });
  }

  getGoalName() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      goalName = prefs.getString("goalName")!;
      loading = false;
    });
  }

  int item = 1;

  void handleTextChanged(int index, String newValue) {
    setState(() {
      goalVisualising[index]['text'] = newValue;
    });
  }

  void decrement() {
    item = item - 1;
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      route = goalRoute!;
    });
  }

  void handleDelete(int index) {
    widget.comingFromEditScreen
        ? setState(() {
            visualize.removeAt(index);

            for (int i = index + 1; i < visualize.length; i++) {
              visualize[i]['key'] = i.toString();
            }
          })
        : setState(() {
            goalVisualising.removeAt(index);

            for (int i = index + 1; i < goalVisualising.length; i++) {
              goalVisualising[i]['key'] = i.toString();

              // Assuming 'key' is the identifier you want to update.
            }
            //index--;
          });
    decrement();
    //closing the focus
    blankNode.requestFocus();
  }

  void increment() {
    item = item + 1;
  }

  void incrementEdit() {
    listReason = listReason + 1;
  }

  Future<void> updateGoalReason(List<Map<String, String>> newReason) async {
    final prefs = await SharedPreferences.getInstance();

    // Check if 'goal' is in shared preferences
    if (prefs.containsKey('goal')) {
      // Get stored Goal object from shared preferences
      String? jsonString = prefs.getString('goal');
      Map<String, dynamic> userMap = jsonDecode(jsonString!);

      Goal goal = Goal.fromJson(userMap);
      // Update reason field
      goal.visualizingYourSelf = newReason;

      // Convert updated Goal object back to JSON string
      jsonString = jsonEncode(goal.toJson());

      // Save updated Goal object back to shared preferences
      await prefs.setString('goal', jsonString);
      getGoal();
    } else {}
  }

  backPress() {
    if (route == '') {
      Navigator.pop(context);
    } else {
      widget.comingFromEditScreen
          ? update == false
              ? showAnimatedDialog(
                  animationType: DialogTransitionType.fadeScale,
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 1),
                  context: context,
                  builder: (BuildContext context) => const popUpGoals())
              : Navigator.push(
                  context,
                  FadePageRouteReverse(
                      page: const StarReview(
                    route: 'goal',
                  )))
          : widget.saved
              ? Navigator.push(
                  context,
                  FadePageRouteReverse(
                      page: const Goal_Identity(
                    comingFromEditScreen: false,
                    route: '',
                    saved: true,
                  )))
              : Navigator.pop(context);
    }
    // Add code for performing close action
  }

  Future<Goal> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('goal');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      AdminGoal().userAddGoal(jsonMap).then((response) async {
        setState(() {
          loading = false;
        });
        if (response == true) {
          Navigator.push(
            context,
            FadePageRoute(
              page: const GoalFinished(),
            ),
          );
          await prefs.remove('goal');
        } else {
          setState(() {
            loading = false;
          });
          return false;
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text("Your sign in details are incorrect, please try again!!")));
        }
      }).catchError((error) {
        return error;
      });

      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);
    if (widget.comingFromEditScreen == false) {
      goalVisualising = goalProvider.currentGoal!.visualizingYourSelf;
    }

    return WillPopScope(
      onWillPop: () {
        backPress();
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(AppDimensions.height10(context) * 5.0),
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: appBarTitle(
                    context,
                    widget.comingFromEditScreen
                        ? AppText().viewAndEdit
                        : AppText().starCreate5,
                    false),
                leading: Buttons().backButton(context, backPress),
                actions: [
                  widget.comingFromEditScreen
                      ? Container()
                      : Buttons().closeButton(context, () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                              width: AppDimensions.width10(context) * 27.0,
                              height: AppDimensions.height10(context) * 21.0,
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
                                  // height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.width10(context) * 23.8,
                                  child: const Text(
                                    "Exit onboarding?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 19, left: 16, right: 16),
                                  height: 32,
                                  width: 238,
                                  child: const Text(
                                    "Please select from the options below",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Column(
                                    children: [
                                      FDottedLine(
                                        color: const Color(0xFF3C3C43)
                                            .withOpacity(0.29),
                                        width: double.infinity,
                                        strokeWidth: 2.0,
                                        dottedLength: 10.0,
                                        space: 0.7,
                                      ),
                                      SizedBox(
                                        height: 42,
                                        width: double.infinity,
                                        // color: Colors.white,
                                        child: TextButton(
                                          onPressed: () async {
                                            // updateGoalReason(goalVisualising);
                                            if (route == 'view_all_goals') {
                                              Navigator.pushReplacement(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page:
                                                          const view_all_goals_menu()));
                                            } else {
                                              Navigator.push(
                                                context,
                                                FadePageRouteReverse(
                                                  page:
                                                      const HomeScreenProgressSaved(
                                                    login: true,
                                                    route: "goalVisualising",
                                                  ),
                                                ),
                                              );

                                            }
                                            final SharedPreferences prefs =
                                            await _prefs;
                                            await prefs.setString(
                                                'route', "goalVisualising");
                                          },
                                          child: const Text(
                                            'Exit & save progress',
                                            style: TextStyle(
                                                color: Color(0xFF007AFF),
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      FDottedLine(
                                        color: const Color(0xFF3C3C43)
                                            .withOpacity(0.29),
                                        width: double.infinity,
                                        strokeWidth: 2.0,
                                        dottedLength: 10.0,
                                        space: 0.7,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        width: double.infinity,
                                        child: TextButton(
                                          onPressed: () async {
                                            if (route == 'view_all_goals') {
                                              Navigator.pushReplacement(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page:
                                                          const view_all_goals_menu()));
                                            } else {
                                              Navigator.push(
                                                context,
                                                FadePageRouteReverse(
                                                  page: const HomeScreen(
                                                      login: true),
                                                ),
                                              );
                                            }
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            await prefs.remove('goal');
                                            await prefs.remove('goal_route');
                                            await prefs.remove('route');
                                          },
                                          child: const Text(
                                            'Exit & delete progress',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF007AFF)),
                                          ),
                                        ),
                                      ),
                                      FDottedLine(
                                        color: const Color(0xFF3C3C43)
                                            .withOpacity(0.29),
                                        width: double.infinity,
                                        strokeWidth: 2.0,
                                        dottedLength: 10.0,
                                        space: 0.7,
                                      ),
                                      SizedBox(
                                        height: 42,
                                        width: AppDimensions.width10(context) *
                                            27.0,
                                        //color: Colors.white,
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Cancel exit',
                                            style: TextStyle(
                                                color: Color(0xFF007AFF),
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
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
          extendBody: true,
          bottomNavigationBar: update
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
                                      AppDimensions.height10(context) * 1.261),
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
                                      AppDimensions.height10(context) * 1.232),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 4.6,
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
                                        AppDimensions.height10(context) * 16.9,
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    child: Text(
                                      'The Vision',
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
                                  update = false;
                                });
                                stopTimer();
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 8.1,
                                height: AppDimensions.height10(context) * 6.0,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 5,
                                    right:
                                        AppDimensions.height10(context) * 1.23),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFFFFFFF), width: 1),
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Undo',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
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
              : Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.0,
                      bottom: AppDimensions.height10(context) * 2.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.comingFromEditScreen
                          ? AnimatedScaleButton(
                              onTap: () {
                                resetDialog();
                              },
                              child: Container(
                                  width: AppDimensions.width10(context) * 10.0,
                                  height: AppDimensions.height10(context) * 5.0,
                                  decoration: goalVisualising[0]['text'] != ""
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
                                        color: goalVisualising[0]['text'] != ""
                                            ? const Color(0xffFA9934)
                                            : const Color(0xff282828),
                                        fontSize:
                                            AppDimensions.font10(context) * 2),
                                  ))),
                            )
                          : Container(),
                      // Container(
                      //     // color: Colors.blue,
                      //     width:
                      //         AppDimensions.width10(context) *
                      //             5.0,
                      //     height:
                      //         AppDimensions.height10(context) *
                      //             5.0,
                      //     child: AnimatedScaleButton(
                      //       onTap: () {
                      //         //   signupSheet(context, "Sign up / login", "login");
                      //       },
                      //       child: Image.asset(
                      //         "assets/images/Moreactions.webp",
                      //         fit: BoxFit.contain,
                      //       ),
                      //     )),
                      SizedBox(
                        width: AppDimensions.width10(context) * 2.0,
                      ),
                      AnimatedScaleButton(
                        onTap: () async {
                          if (widget.comingFromEditScreen) {
                            if (visualize[0]['text'] != "") {
                              AdminGoal()
                                  .updateUserGoal(
                                      'visualizingYourSelf', visualize)
                                  .then((value) {
                                if (value == true) {
                                  setState(() {
                                    update = true;
                                    showContainer = true;
                                  });
                                  startTimer();
                                  // Navigator.push(
                                  //     context,
                                  //     FadePageRoute(
                                  //       page: const StarReview(
                                  //         route: 'goal',
                                  //       ),
                                  //     ));
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Field can't be empty")));
                            }
                          } else {
                            final SharedPreferences prefs = await _prefs;
                            await prefs.remove('route');
                            saveAddPracRoute();
                            goalVisualising[0]['text'] != ""
                                ? updateGoalReason(goalVisualising)
                                : Container();
                          }
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5.2,
                          width: widget.comingFromEditScreen
                              ? AppDimensions.width10(context) * 26.2
                              : AppDimensions.width10(context) * 31.3,
                          decoration: goalVisualising[0]['text'] == ""
                              ? BoxDecoration(
                                  // color: Color(0xFFFF7D50),
                                  border: Border.all(color: Colors.transparent),
                                  color:
                                      const Color(0xFF282828).withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                )
                              : BoxDecoration(
                                  border: Border.all(color: Colors.transparent),
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
                              widget.comingFromEditScreen
                                  ? 'Update'
                                  : goalVisualising[0]['text'] != ""
                                      ? "Create your goal"
                                      : "Next",
                              style: TextStyle(
                                color: goalVisualising[0]['text'] != "" ||
                                        widget.comingFromEditScreen == true
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                fontSize: UpdatedDimensions.font10(context) * 2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          body: Stack(
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
              loading == false
                  ? Container(
                      height: AppDimensions.height10(context) * 70.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 11),
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              width: AppDimensions.width10(context) * 30,
                              child: Center(
                                child: Text(
                                  goalName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: widget.comingFromEditScreen
                                        ? const Color(0xFF437296)
                                        : Colors.white,
                                    fontSize:
                                        AppDimensions.font10(context) * 2.2,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 1.0,
                            ),
                            widget.comingFromEditScreen
                                ? SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 7.6,
                                  )
                                : Container(
                                    // color: Colors.blue,
                                    width:
                                        AppDimensions.width10(context) * 10.4,
                                    height:
                                        AppDimensions.height10(context) * 7.6,
                                    // color: Colors.blue,

                                    padding: EdgeInsets.only(
                                        left: AppDimensions.width10(context) *
                                            1.5,
                                        right: AppDimensions.height10(context) *
                                            1.5),
                                    child: Image.asset(
                                      "assets/images/image3.webp",
                                      fit: BoxFit.contain,
                                    )),
                            SizedBox(
                              height: AppDimensions.height10(context) * 1.0,
                            ),
                            Center(
                              child: Text(
                                AppText().goalVisual,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: widget.comingFromEditScreen
                                      ? const Color(0xFF437296)
                                      : Colors.white,
                                  fontSize: AppDimensions.font10(context) * 2.8,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 1.0,
                            ),
                            SizedBox(
                              // height: AppDimensions.height10(context) * 4.9,
                              width: AppDimensions.width10(context) * 37.2,
                              // height: AppDimensions.height10(context) * 4.9,
                              child: Center(
                                child: Text(
                                  AppText().goalVisualBody,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w600,
                                      color: widget.comingFromEditScreen
                                          ? const Color(0xFF437296)
                                          : const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 3.4,
                            ),
                            SizedBox(
                              width: AppDimensions.width10(context) * 38.2,
                              // height: widget.comingFromEditScreen
                              //     ? visualize.length <= 1
                              //         ? AppDimensions.height10(context) * 22.0
                              //         : AppDimensions.height10(context) * 36.0
                              //     : item <= 1
                              //         ? AppDimensions.height10(context) * 22.0
                              //         : AppDimensions.height10(context) * 37.0,
                              child: Stack(children: [
                                Container(
                                  // width: AppDimensions.width10(context) * 38.2,
                                  //height: AppDimensions.height10(context) * 33.0,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          2.3),
                                  padding: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 1.1,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white,
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppDimensions.height10(context) *
                                                  1.8))),
                                  child: ListView.builder(
                                    itemCount: widget.comingFromEditScreen
                                        ? (visualize?.length ?? 0)
                                        : goalVisualising.length,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, index) {
                                      if (widget.comingFromEditScreen) {
                                        if (visualize == null ||
                                            index >= visualize.length) {
                                          return Container(); // Return an empty container if the index is out of range.
                                        }
                                        return Column(children: [
                                          inner_text(
                                            key: Key(visualize[index]['key'] +
                                                trigger),
                                            delete: visualize.length > 1
                                                ? true
                                                : false,
                                            head_text:
                                                "${index + 1}. I picture myself.... ",
                                            body_text: visualize[index]
                                                ['text']!,
                                            length: 200,
                                            onChanged: (newText) {
                                              if (goalVisualising.isEmpty) {
                                                goalVisualising.add({
                                                  'key':
                                                      'Reason ${goalVisualising.length.toString()}',
                                                  'text': '',
                                                });
                                              }
                                              setState(() {
                                                visualize[index]['text'] =
                                                    newText;
                                              });
                                              handleTextChanged(index, newText);
                                            },
                                            onDelete: () => handleDelete(index),
                                            index: index,
                                            placeHolder: '',
                                            comingFromEditScreen:
                                                widget.comingFromEditScreen,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.5,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.3),
                                            child: Row(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Character count: ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFF464646),
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.3,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            6,
                                                    child: Text(
                                                      "${visualize[index]['text'].toString().length}/200",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xFF464646),
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.3,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.0,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.5,
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xFF282828)
                                                          .withOpacity(0.2)),
                                                )
                                              ],
                                            ),
                                          )
                                        ]);
                                      } else {
                                        if (index >= goalVisualising.length) {
                                          return const Center();
                                        }
                                        return Column(children: [
                                          inner_text(
                                            key: Key(
                                                goalVisualising[index]['key']!),
                                            delete: goalVisualising.length > 1
                                                ? true
                                                : false,
                                            head_text:
                                                "${index + 1}. I picture myself.... ",
                                            body_text: goalVisualising[index]
                                                ['text']!,
                                            length: 200,
                                            onChanged: (newText) {
                                              setState(() {
                                                goalVisualising[index]['text'] =
                                                    newText;
                                              });
                                              handleTextChanged(index, newText);
                                              goalProvider
                                                  .updateVisualizingYourSelf(
                                                      goalVisualising);
                                            },
                                            onDelete: () {
                                              handleDelete(index);
                                              goalProvider
                                                  .updateVisualizingYourSelf(
                                                      goalVisualising);
                                            },
                                            index: index,
                                            placeHolder: '',
                                            comingFromEditScreen: false,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.5,
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.3),
                                            child: Row(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Character count: ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFF464646),
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.3,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            6,
                                                    child: Text(
                                                      "${goalVisualising[index]['text'].toString().length}/200",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xFF464646),
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.3,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.0,
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.5,
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xFF282828)
                                                          .withOpacity(0.2)),
                                                )
                                              ],
                                            ),
                                          )
                                        ]);
                                      }
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    // alignment: item == 1
                                    //     ? const Alignment(0.01, 1.4)
                                    //     : const Alignment(0.01, 1.21),
                                    //heightFactor: 0.5,
                                    child: widget.comingFromEditScreen
                                        ? visualize.length > 2
                                            ? AnimatedScaleButton(
                                                onTap: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'You cannot add more than 3 items.'),
                                                      duration:
                                                          Duration(seconds: 3),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.7,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.7,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromARGB(
                                                        189, 158, 158, 158),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4,
                                                            left: 4,
                                                            right: 4,
                                                            bottom: 4),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Image.asset(
                                                        'assets/images/Addgoal.webp',
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.7,
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            4.7,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : AnimatedScaleButton(
                                                onTap: () {
                                                  increment();
                                                  widget.comingFromEditScreen
                                                      ? setState(() {
                                                          visualize.add({
                                                            'key':
                                                                'Reason ${visualize.length.toString()}',
                                                            'text': '',
                                                          });
                                                        })
                                                      : setState(() {
                                                          goalVisualising.add({
                                                            'key':
                                                                'Identity ${goalVisualising.length.toString()}',
                                                            'text': '',
                                                          });
                                                        });
                                                },
                                                child: Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.7,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.7,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xFFB1B8FF),
                                                          Color(0xFFC5CAFF)
                                                        ]),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4,
                                                            left: 4,
                                                            right: 4,
                                                            bottom: 4),
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.7,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.7,
                                                      decoration:
                                                          const BoxDecoration(
                                                              //color: Colors.transparent,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/images/Addgoal.webp'),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                    ),
                                                  ),
                                                ),
                                              )
                                        : goalVisualising.length > 2
                                            ? AnimatedScaleButton(
                                                onTap: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'You cannot add more than 3 items.'),
                                                      duration:
                                                          Duration(seconds: 3),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.7,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.7,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromARGB(
                                                        189, 158, 158, 158),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4,
                                                            left: 4,
                                                            right: 4,
                                                            bottom: 4),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      child: Image.asset(
                                                        'assets/images/Addgoal.webp',
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.7,
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            4.7,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : AnimatedScaleButton(
                                                onTap: () {
                                                  increment();
                                                  widget.comingFromEditScreen
                                                      ? setState(() {
                                                          visualize.add({
                                                            'key':
                                                                'Reason ${visualize.length.toString()}',
                                                            'text': '',
                                                          });
                                                        })
                                                      : setState(() {
                                                          goalVisualising.add({
                                                            'key':
                                                                'Identity ${goalVisualising.length.toString()}',
                                                            'text': '',
                                                          });
                                                        });
                                                },
                                                child: Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.7,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.7,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xFFB1B8FF),
                                                          Color(0xFFC5CAFF)
                                                        ]),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4,
                                                            left: 4,
                                                            right: 4,
                                                            bottom: 4),
                                                    child: Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.7,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.7,
                                                      decoration:
                                                          const BoxDecoration(
                                                              //color: Colors.transparent,
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/images/Addgoal.webp'),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                  ),
                                )
                              ]),
                            ),
                            // widget.comingFromEditScreen
                            //     ? SizedBox(
                            //         height: visualize.length > 1
                            //             ? AppDimensions.height10(context) * 14.5
                            //             : AppDimensions.height10(context) * 24.0,
                            //       )
                            //     : MediaQuery.of(context).viewInsets.bottom == 0
                            //         ? SizedBox(
                            //             height: AppDimensions.height10(context) *
                            //                 21.4,
                            //           )
                            //         : SizedBox(
                            //             height:
                            //                 AppDimensions.height10(context) * 4.0,
                            //           ),
                            //
                            // SizedBox(
                            //   height: AppDimensions.height10(context) * 2.5,
                            // ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom))
                          ],
                        ),
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
        ),
      ),
    );
  }
}
