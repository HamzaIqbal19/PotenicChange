import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal-Why.dart';
import 'package:potenic_app/Screen/Goal%20Review%20Journey/StarReview.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_text_styles.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/animatedButton.dart';

class GoalName extends StatefulWidget {
  final int catId;
  final String route;
  final bool saved;
  final bool comingFromEditScreen;

  const GoalName(this.catId,
      {required this.comingFromEditScreen,
      Key? key,
      required this.route,
      required this.saved})
      : super(key: key);

  @override
  State<GoalName> createState() => _GoalNameState();
}

class _GoalNameState extends State<GoalName> {
  String goalCategory = "";
  String goalName = "";
  var userIdentity;
  bool updated = false;
  final FocusNode _focusNode = FocusNode();
  String route = '';
  var id;
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
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
    if (widget.saved == true) {
      getData();
    }

    super.initState();
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      route = goalRoute!;
    });
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString('goal');
    Map<String, dynamic> jsonMap = json.decode(jsonString!);

    setState(() {
      goalName = jsonMap['name'];
    });
  }

  //
  getGoalName() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('goalCategoryId', widget.catId);
    setState(() {
      goalName = prefs.getString("goalName")!;
      mygoal.text = capitalizeFirstLetter(prefs.getString("goalName")!);
      goalCategory = prefs.getString("GoalCategory")!;

      id = prefs.getInt("goalId");
    });
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
    await prefs.setString('goalName', goalName);
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

  void getGoalStatus() {}

  Future<Goal> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('goal');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
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

  backPress() {
    if (route == '') {
      Navigator.pop(context);
    } else {
      widget.comingFromEditScreen
          ? updated == false
              ? showAnimatedDialog(
                  animationType: DialogTransitionType.fadeScale,
                  curve: Curves.easeInOut,
                  duration: const Duration(seconds: 1),
                  context: context,
                  builder: (BuildContext context) => const popUpGoals())
              : Navigator.push(
                  context,
                  FadePageRouteReverse(
                      page: StarReview(
                    route: widget.route,
                  )))
          : widget.route == 'saved_why'
              ? Navigator.pushReplacement(context,
                  FadePageRouteReverse(page: const HomeScreen(login: true)))
              : Navigator.pop(context);
    }
    // Add code for performing close action
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);

    Goal? currentGoal = goalProvider.currentGoal;
    if (widget.comingFromEditScreen == false) {
      mygoal.text = currentGoal!.name;
    }

    //final _formkey1 = GlobalKey<FormState>();

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
          extendBody: true,
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
                        : AppText().starCreate2,
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
                                        //color: Colors.white,
                                        child: TextButton(
                                          onPressed: () async {
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            if (route == 'view_all_goals') {
                                              Navigator.pushReplacement(
                                                  context,
                                                  FadePageRouteReverse(
                                                      page:
                                                          const view_all_goals_menu()));
                                            } else {
                                              getUserId(
                                                mygoal.text.toString(),
                                              );
                                              Navigator.push(
                                                context,
                                                FadePageRouteReverse(
                                                  page:
                                                      const HomeScreenProgressSaved(
                                                    login: true,
                                                    route: 'GoalName',
                                                  ),
                                                ),
                                              );
                                            }

                                            await prefs.setString(
                                                'route', "GoalName");
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
                        })
                ],
              )),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.width10(context) * 6),
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
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0,
                              bottom: AppDimensions.height10(context) * 2.6),
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
                                    left: AppDimensions.height10(context) *
                                        1.261),
                                width: AppDimensions.width10(context) * 7.437,
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
                                    left: AppDimensions.height10(context) *
                                        1.232),
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
                                      // width:
                                      //     AppDimensions.width10(context) * 16.9,
                                      height:
                                          AppDimensions.height10(context) * 2.2,
                                      child: Text(
                                        'Goal Name',
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
                                  width: AppDimensions.width10(context) * 8.1,
                                  height: AppDimensions.height10(context) * 6.0,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) * 2,
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
                : ValueListenableBuilder<TextEditingValue>(
                    valueListenable: mygoal,
                    builder: (context, value, child) {
                      return AnimatedScaleButton(
                        onTap: () async {
                          _focusNode.unfocus();

                          if (widget.comingFromEditScreen) {
                            final SharedPreferences prefs = await _prefs;
                            prefs.setString('goalName', mygoal.text);
                            AdminGoal()
                                .updateUserGoal('name', mygoal.text)
                                .then((value) {
                              if (value == true) {
                                setState(() {
                                  updated = true;
                                  showContainer = true;
                                });
                                startTimer();
                              }
                            });
                            // Navigator.pop(context, mygoal.text);
                          } else {
                            final SharedPreferences prefs = await _prefs;
                            prefs.setString('goalName', mygoal.text);
                            goalProvider.updateName(mygoal.text);
                            if (mygoal.text != "") {
                              getUserId(
                                mygoal.text.toString(),
                              );

                              Navigator.push(
                                context,
                                FadePageRoute(
                                  page: const GoalWhy(
                                    route: '',
                                    comingFromEditScreen: false,
                                    saved: false,
                                  ),
                                ),
                              );
                            } else {}
                          }
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5.2,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0,
                              bottom: AppDimensions.height10(context) * 2.6),
                          decoration: value.text.isNotEmpty
                              ? const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFCC10D),
                                        Color(0xFFFDA210)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                )
                              : BoxDecoration(
                                  color:
                                      const Color(0xFF282828).withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                ),
                          child: Center(
                            child: Text(
                              widget.comingFromEditScreen ? "Update" : "Next",
                              style: AppTextStyles()
                                  .onBoardingButtonStyle(context),
                            ),
                          ),
                        ),
                      );
                    },
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
                              ? goalName
                              : currentGoal!.name,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
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
                      height: AppDimensions.height10(context) * 1.9,
                    ),
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.width10(context) * 10.4,
                        height: AppDimensions.height10(context) * 7.6,
                        padding: EdgeInsets.only(
                            left: AppDimensions.width10(context) * 1.5,
                            right: AppDimensions.width10(context) * 1.5),
                        child: Image.asset(
                          "assets/images/image3.webp",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      height: AppDimensions.height10(context) * 3.4,
                    ),
                    Center(
                      child: Text(
                        AppText().goalNameText,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: widget.comingFromEditScreen
                              ? const Color(0xff437296)
                              : Colors.white,
                          fontSize: AppDimensions.font10(context) * 2.8,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 1.0,
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 2.8,
                      width: AppDimensions.width10(context) * 24.4,
                      child: Center(
                        child: Text(
                          AppText().goalNameSub,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.8,
                              fontWeight: FontWeight.w600,
                              color: widget.comingFromEditScreen
                                  ? const Color(0xff437296)
                                  : const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 3.4,
                    ),
                    Container(
                      height: AppDimensions.height10(context) * 10.5,
                      width: AppDimensions.width10(context) * 36.0,
                      padding: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.0,
                          right: AppDimensions.width10(context) * 0.6,
                          bottom: AppDimensions.height10(context) * 0.4,
                          left: AppDimensions.width10(context) * 2.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(
                              AppDimensions.height10(context) * 1.8))),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        maxLength: 50,
                        focusNode: _focusNode,
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                            fontFamily: 'Laila',
                            decoration: TextDecoration.none,
                            decorationThickness: 0,
                            height: AppDimensions.height10(context) * 0.15,
                            fontSize: AppDimensions.font10(context) * 2.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFA9934)),
                        //  key: _formkey1,

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: "",
                            hintStyle: TextStyle(
                                fontFamily: 'Laila',
                                fontSize: AppDimensions.font10(context) * 2.4,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFA9934)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                        controller: mygoal,
                        onChanged: (String value) {
                          goalProvider.updateName(value);
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
                      // width: AppDimensions.width10(context) *12.3,
                      width: AppDimensions.width10(context) * 34.7,
                      margin: EdgeInsets.only(
                          right: AppDimensions.width10(context) * 1.3),

                      padding: EdgeInsets.only(
                          left: AppDimensions.width10(context) * 0.1,
                          right: AppDimensions.width10(context) * 20.1),
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
                                    ? const Color(0xff437296)
                                    : Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.4,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "50",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: widget.comingFromEditScreen
                                    ? const Color(0xff437296)
                                    : Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.4,
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
                      width: AppDimensions.width10(context) * 34.7,
                      margin: EdgeInsets.only(
                          right: AppDimensions.width10(context) * 1.3),
                      child: Center(
                        child: Text(
                          AppText().goalNameBody,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: widget.comingFromEditScreen
                                ? const Color(0xff437296)
                                : Colors.white,
                            fontSize: AppDimensions.font10(context) * 1.6,
                          ),
                        ),
                      ),
                    ),
                    // MediaQuery.of(context).viewInsets.bottom == 0
                    //     ? updated
                    //         ? SizedBox(
                    //             height: AppDimensions.height10(context) * 25.3,
                    //           )
                    //         : SizedBox(
                    //             height: AppDimensions.height10(context) * 26.3,
                    //           )
                    //     : SizedBox(
                    //         height: AppDimensions.height10(context) * 9.6,
                    //       ),
                    //
                    // SizedBox(
                    //   height: AppDimensions.height10(context) * 2.5,
                    // ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class updateBox extends StatefulWidget {
  final onTap;
  final String text;
  const updateBox({super.key, required this.onTap, required this.text});

  @override
  State<updateBox> createState() => _updateBoxState();
}

class _updateBoxState extends State<updateBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 38.259,
      height: AppDimensions.height10(context) * 9.707,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin:
                EdgeInsets.only(left: AppDimensions.width10(context) * 1.261),
            width: AppDimensions.width10(context) * 4.437,
            height: AppDimensions.height10(context) * 4.437,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/circle_tick.webp'))),
          ),
          Container(
            //width: AppDimensions.width10(context) * 6.9,
            height: AppDimensions.height10(context) * 3.6,
            margin:
                EdgeInsets.only(left: AppDimensions.width10(context) * 1.232),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppDimensions.width10(context) * 4.6,
                  height: AppDimensions.height10(context) * 1.4,
                  //   color: Colors.amber,
                  child: Text(
                    'Updates saved',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.3,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 16.9,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    widget.text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
          AnimatedScaleButton(
            onTap: () {
              setState(() {});
            },
            child: Container(
              width: AppDimensions.width10(context) * 8.1,
              height: AppDimensions.height10(context) * 6.0,
              margin: EdgeInsets.only(
                  left: AppDimensions.width10(context) * 5,
                  right: AppDimensions.width10(context) * 1.23),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFFFFFF), width: 1),
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
              ),
              child: Center(
                child: Text(
                  'View',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
