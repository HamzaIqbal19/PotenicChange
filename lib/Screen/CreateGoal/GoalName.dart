import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal-Why.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading2.dart';
import '../ReviewGoal/StarReview.dart';
import '../Your_goals/veiw_all_goals.dart';

class GoalName extends StatefulWidget {
  final int catId;
  final bool comingFromEditScreen;

  const GoalName(this.catId, {required this.comingFromEditScreen, Key? key})
      : super(key: key);

  @override
  State<GoalName> createState() => _GoalNameState();
}

class _GoalNameState extends State<GoalName> {
  String goalCategory = "";
  String goalName = "";
  String route = '';
  var id;
  String capitalizeFirstLetter(String text) {
    if (text == null || text.isEmpty) {
      return '';
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // _GoalNameState();

  final mygoal = TextEditingController();

  @override
  void initState() {
    getGoalName();
    getRoute();
    super.initState();
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

  //
  getGoalName() async {
    print("hello world1224");
    final SharedPreferences prefs = await _prefs;
    var catId = prefs.setInt('goalCategoryId', widget.catId);
    setState(() {
      goalName = prefs.getString("goalName")!;
      mygoal.text = capitalizeFirstLetter(prefs.getString("goalName")!);
      goalCategory = prefs.getString("GoalCategory")!;

      id = prefs.getInt("goalId");
    });

    print("mygoal.text:${capitalizeFirstLetter(prefs.getString("goalName")!)}");
    print("goalName:$goalName");
  }

  Future getUserId(String goalname) async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt("userid");

    saveGoalToPrefs(userId!, widget.catId, goalname);
  }

  Future<void> saveGoalToPrefs(
    var userId,
    var categoryId,
    var goalName,
  ) async {
    final SharedPreferences prefs = await _prefs;
    var GoalName = prefs.setString('goalName', goalName);
    //var GoalCategory = prefs.setString("GoalCategory", widget.Circletitle);

    Goal goal = Goal(
      name: goalName,
      reason: [
        {"key": "reason1", "text": "This is reason 1"},
      ],
      identityStatement: [
        {"key": "reason1", "text": "This is reason 1"},
      ],
      visualizingYourSelf: [
        {"key": "reason1", "text": "This is reason 1"},
      ],
      userId: userId,
      goalCategoryId: categoryId,
    );
    String jsonString =
        jsonEncode(goal.toJson()); // converting object to json string
    prefs.setString('goal', jsonString);

    getGoal();
  }

  Future<Goal> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    print("GoalId:${prefs.getInt("goalId")}");
    String? jsonString = prefs.getString('goal');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      print("Goal===============>$jsonString");
      // Navigator.push(
      //   context,
      //   FadePageRoute(
      //     page: GoalName(),
      //   ),
      // );
      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

  // @override
  // void dispose() {
  //   mygoal;
  // }

  @override
  Widget build(BuildContext context) {
    //final _formkey1 = GlobalKey<FormState>();

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
                  Navigator.pop(context);
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
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                      width: AppDimensions.height10(context) * 27.0,
                      height: AppDimensions.height10(context) * 21.0,
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        actionsPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 1.4)),
                        title: Container(
                          margin: EdgeInsets.only(
                              top: 19, right: 16, left: 16, bottom: 4),
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 23.8,
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
                          margin:
                              EdgeInsets.only(bottom: 19, left: 16, right: 16),
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
                                color:
                                    const Color(0xFF3C3C43).withOpacity(0.29),
                                width: double.infinity,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 0.7,
                              ),
                              Container(
                                height: 42,
                                width: double.infinity,
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () async {
                                    Navigator.push(
                                      context,
                                      FadePageRoute3(
                                        exitPage: GoalName(
                                          widget.catId,
                                          comingFromEditScreen: false,
                                        ),
                                        enterPage:
                                            const HomeScreenProgressSaved(
                                          login: true,
                                          route: 'GoalName',
                                        ),
                                      ),
                                    );

                                    final SharedPreferences prefs =
                                        await _prefs;
                                    await prefs.setString('route', "GoalName");
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
                                color:
                                    const Color(0xFF3C3C43).withOpacity(0.29),
                                width: double.infinity,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 0.7,
                              ),
                              Container(
                                height: 44,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () async {
                                    if (route == 'view_all_goals') {
                                      Navigator.pushReplacement(
                                          context,
                                          FadePageRoute(
                                              page:
                                                  const veiw_all_goals_menu()));
                                    } else {
                                      Navigator.push(
                                        context,
                                        FadePageRoute2(
                                          true,
                                          exitPage: GoalName(
                                            widget.catId,
                                            comingFromEditScreen: false,
                                          ),
                                          enterPage:
                                              const HomeScreen(login: true),
                                        ),
                                      );
                                    }
                                    final SharedPreferences prefs =
                                        await _prefs;
                                    await prefs.remove('goal');
                                    await prefs.remove('route');
                                    await prefs.remove('goal_route');
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
                                color:
                                    const Color(0xFF3C3C43).withOpacity(0.29),
                                width: double.infinity,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 0.7,
                              ),
                              Container(
                                height: 42,
                                width: AppDimensions.height10(context) * 27.0,
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
                  ),
                  // Add code for performing close action
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.comingFromEditScreen
                    ? AssetImage("assets/images/GoalReviewBg.webp")
                    : AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      widget.comingFromEditScreen
                          ? "View and edit mode"
                          : "Star Creation 2/5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  width: AppDimensions.height10(context) * 30,
                  child: Center(
                    child: Text(
                      capitalizeFirstLetter(goalName),
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.9,
                ),
                Container(
                    // color: Colors.blue,
                    width: AppDimensions.height10(context) * 10.4,
                    height: AppDimensions.height10(context) * 7.6,
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.height10(context) * 1.5),
                    child: Image.asset(
                      "assets/images/image3.webp",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Goal Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  height: AppDimensions.height10(context) * 2.8,
                  width: AppDimensions.height10(context) * 24.4,
                  child: Center(
                    child: Text(
                      "Enter the name of your goal ",
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                          color: widget.comingFromEditScreen
                              ? Color(0xff437296)
                              : Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  height: AppDimensions.height10(context) * 10.5,
                  width: AppDimensions.height10(context) * 36.0,
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.0,
                      right: AppDimensions.height10(context) * 0.6,
                      bottom: AppDimensions.height10(context) * 0.4,
                      left: AppDimensions.height10(context) * 2.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(
                          AppDimensions.height10(context) * 1.8))),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    maxLength: 50,
                    textAlignVertical: TextAlignVertical.top,
                    //  key: _formkey1,
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 2.4,
                        fontWeight: FontWeight.w500,
                        height: AppDimensions.height10(context) * 0.14,
                        color: const Color(0xFFFA9934)),

                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "",
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.4,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFA9934)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                    controller: mygoal,
                    onEditingComplete: () {
                      setState(
                          () {}); // This will trigger a re-build and update the condition
                    },
                    validator: (val) {
                      if (val == null || val == "") {
                        return "Kindly Enter Goal Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  // width: AppDimensions.height10(context) *12.3,
                  width: AppDimensions.height10(context) * 34.7,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 1.3),

                  padding: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 0.1,
                      right: AppDimensions.height10(context) * 20.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Character count:",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: widget.comingFromEditScreen
                                ? Color(0xff437296)
                                : Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.4,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "50",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: widget.comingFromEditScreen
                                ? Color(0xff437296)
                                : Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.1,
                ),
                Container(
                  height: AppDimensions.height10(context) * 4.2,
                  width: AppDimensions.height10(context) * 34.7,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 1.3),
                  child: Center(
                    child: Text(
                      "You can change the name of your goal later by going into your Dashboard.  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.6,
                      ),
                    ),
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 29.3,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 9.6,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: AnimatedScaleButton(
                          onTap: () {
                            // signupSheet(context, "Sign up / login", "login");
                          },
                          child: Image.asset(
                            "assets/images/Moreactions.webp",
                            fit: BoxFit.contain,
                          ),
                        )),
                    SizedBox(
                      width: AppDimensions.height10(context) * 2.0,
                    ),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: mygoal,
                      builder: (context, value, child) {
                        return AnimatedScaleButton(
                          onTap: () async {
                            if (widget.comingFromEditScreen) {
                              final SharedPreferences prefs = await _prefs;
                              prefs.setString('goalName', mygoal.text);
                              AdminGoal()
                                  .updateUserGoal('name', mygoal.text)
                                  .then((value) {
                                if (value == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => StarReview(
                                          route: 'goal',
                                        ),
                                      ));
                                }
                              });
                              // Navigator.pop(context, mygoal.text);
                            } else {
                              if (mygoal.text != "") {
                                getUserId(
                                  mygoal.text.toString(),
                                );
                                print('=====================>');
                                print(mygoal.text.toString());
                                final SharedPreferences prefs = await _prefs;

                                // getUserId(
                                //   mygoal.text.toString(),
                                // );
                                Navigator.push(
                                  context,
                                  FadePageRoute2(
                                    true,
                                    exitPage: GoalName(
                                      widget.catId,
                                      comingFromEditScreen: false,
                                    ),
                                    enterPage: GoalWhy(
                                      comingFromEditScreen: false,
                                    ),
                                  ),
                                );
                              } else {}
                            }
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 5,
                            width: AppDimensions.height10(context) * 31.3,
                            decoration: value.text.isNotEmpty
                                ? BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFFCC10D),
                                          Color(0xFFFDA210)
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  )
                                : BoxDecoration(
                                    color: const Color(0xFF282828)
                                        .withOpacity(0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  ),
                            child: Center(
                              child: Text(
                                widget.comingFromEditScreen ? "Update" : "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
/*
                    AnimatedScaleButton(
                      onTap: () async {
                        if (widget.comingFromEditScreen) {
                          final SharedPreferences prefs = await _prefs;
                          prefs.setString('goalName', mygoal.text);
                          AdminGoal()
                              .updateUserGoal('name', mygoal.text)
                              .then((value) {
                            if (value == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => StarReview(
                                      route: 'goal',
                                    ),
                                  ));
                            }
                          });
                          // Navigator.pop(context, mygoal.text);
                        } else {
                          if (mygoal.text != "") {
                          } else {
                            getUserId(
                              mygoal.text.toString(),
                            );
                          }

                          print('=====================>');
                          print(mygoal.text.toString());
                          final SharedPreferences prefs = await _prefs;

                          // getUserId(
                          //   mygoal.text.toString(),
                          // );
                          Navigator.push(
                            context,
                            FadePageRoute2(
                              true,
                              exitPage: GoalName(
                                widget.catId,
                                comingFromEditScreen: false,
                              ),
                              enterPage: GoalWhy(
                                comingFromEditScreen: false,
                              ),
                            ),
                          );
                        }
                      },
                     
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: mygoal.text != ""
                            ? BoxDecoration(
                                // color: Color(0xFFFF7D50),
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
                              )
                            : BoxDecoration(
                                // color: Color(0xFFFF7D50),
                                border: Border.all(color: Colors.transparent),
                                color: const Color(0xFF282828).withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              ),
                        child: Center(
                          child: Text(
                            widget.comingFromEditScreen ? "Update" : "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                */
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )
        ],
      ),
    );
  }
}
