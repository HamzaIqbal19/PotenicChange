import 'dart:async';
import 'dart:convert';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal_Identity.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Goal.dart';
import '../ReviewGoal/StarReview.dart';

class GoalWhy extends StatefulWidget {
  final String route;
  final bool comingFromEditScreen;
  final bool saved;

  const GoalWhy(
      {Key? key,
      required this.comingFromEditScreen,
      required this.route,
      required this.saved})
      : super(key: key);

  @override
  _goalwhyState createState() => _goalwhyState();
}

class _goalwhyState extends State<GoalWhy> {
  List<Map<String, String>> myTextFields = [];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //closing the focus
  final FocusNode blankNode = FocusNode();
  bool update = false;
  String goalName = "";
  bool saved = false;
  String Route = '';
  var reason;
  bool loading = true;
  int listReason = 0;
  String trigger = '1';

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString('goal');
    Map<String, dynamic> jsonMap = json.decode(jsonString!);

    if (jsonMap.isNotEmpty) {
      for (int i = 0; i <= jsonMap['reason'].length; i++) {
        myTextFields.add({
          'key': 'Reason ${myTextFields.length}',
          'text': '${jsonMap['reason'][i]['text']}',
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
                "Are you sure you want to reset, all your\nchanges for goal reason?",
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
                        reason = jsonDecode(resetData);
                      });
                      setState(() {
                        // trigger = '1';
                      });
                      print('Reason $reason');
                      blankNode.requestFocus();

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

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      Route = goalRoute!;
    });
  }

  @override
  void initState() {
    super.initState();
    getRoute();

    // Add one element to the list when the screen is initialized.

    if (widget.saved == true) {
      getData();
    } else {
      myTextFields.add({
        'key': 'Reason ${myTextFields.length}',
        'text': '',
      });
    }

    if (widget.comingFromEditScreen == false) {
      getGoalName();

      setState(() {
        loading = false;
      });
    } else {
      _fetchGoalNames();
    }
  }

  var resetData;

  void _fetchGoalNames() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          loading = false;
          goalName = response["name"];
          reason = response["reason"];
          resetData = jsonEncode(response["reason"]);
          listReason = response["reason"].length;
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
    });
  }

  int item = 1;

  void handleTextChanged(int index, String newValue) {
    setState(() {
      myTextFields[index]['text'] = newValue;
    });
  }

  void decrement() {
    item = item - 1;
    print("Decrement");
  }

  void handleDelete(int index) {
    widget.comingFromEditScreen
        ? setState(() {
            // myTextFields[index]['text'].remove(index);

            reason.removeAt(index);

            for (int i = index + 1; i < reason.length; i++) {
              reason[i]['key'] = i.toString();

              // Assuming 'key' is the identifier you want to update.
            }
            //index--;
          })
        : setState(() {
            // myTextFields[index]['text'].remove(index);

            myTextFields.removeAt(index);

            for (int i = index + 1; i < myTextFields.length; i++) {
              myTextFields[i]['key'] = i.toString();

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

      goal.reason = newReason;

      jsonString = jsonEncode(goal.toJson());

      await prefs.setString('goal', jsonString);
      getGoal();
    } else {}
  }

  Future<Goal> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    goalName = prefs.getString("goalName")!;
    String? jsonString = prefs.getString('goal');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      if (saved == false) {
        myTextFields[0]['text'] != ""
            ? Navigator.push(
                context,
                FadePageRoute(
                  page: const Goal_Identity(
                    route: '',
                    saved: false,
                    comingFromEditScreen: false,
                  ),
                ),
              )
            : Container();
      } else {
        Navigator.push(
          context,
          FadePageRoute(
            page: const HomeScreenProgressSaved(
              login: true,
              route: "goalWhy",
            ),
          ),
        );
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('route', "goalWhy");
      }

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

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);
    if (widget.comingFromEditScreen == false) {
      myTextFields = goalProvider.currentGoal!.reason;
    }
    //else {

    //}

    return WillPopScope(
      onWillPop: () {
        widget.comingFromEditScreen
            ? update == false
                ? showAnimatedDialog(
                    animationType: DialogTransitionType.fadeScale,
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 1),
                    context: context,
                    builder: (BuildContext context) => const popUpGoals())
                : Navigator.pushReplacement(
                    context,
                    FadePageRouteReverse(
                        page: StarReview(
                      route: widget.route,
                    )))
            : widget.saved
                ? Navigator.pushReplacement(
                    context,
                    FadePageRouteReverse(
                      page: const GoalName(
                        saved: false,
                        route: 'saved_why',
                        4,
                        comingFromEditScreen: false,
                      ),
                    ),
                  )
                : Navigator.pop(context);
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
                leading: Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Back.webp',
                      // width: AppDimensions.width10(context) * 3,
                      height: AppDimensions.height10(context) * 3,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      widget.comingFromEditScreen
                          ? update == false
                              ? showAnimatedDialog(
                                  animationType: DialogTransitionType.fadeScale,
                                  curve: Curves.easeInOut,
                                  duration: const Duration(seconds: 1),
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const popUpGoals())
                              : Navigator.pushReplacement(
                                  context,
                                  FadePageRouteReverse(
                                      page: StarReview(
                                    route: widget.route,
                                  )))
                          : widget.saved
                              ? Navigator.pushReplacement(
                                  context,
                                  FadePageRouteReverse(
                                    page: const GoalName(
                                      saved: false,
                                      route: 'saved_why',
                                      4,
                                      comingFromEditScreen: false,
                                    ),
                                  ),
                                )
                              : Navigator.pop(context);
                      // Add code for performing close action
                    },
                  ),
                ),
                actions: [
                  Center(
                    // alignment: Alignment.center,
                    child: widget.comingFromEditScreen
                        ? Container()
                        : IconButton(
                            icon: Image.asset(
                              'assets/images/Close.webp',
                              //width: AppDimensions.width10(context) * 3.0,
                              height: AppDimensions.height10(context) * 3.0,
                              fit: BoxFit.contain,
                            ),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                width: AppDimensions.width10(context) * 27.0,
                                height: AppDimensions.height10(context) * 22.0,
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              1.4)),
                                  contentPadding: EdgeInsets.zero,
                                  actionsPadding: EdgeInsets.zero,
                                  titlePadding: EdgeInsets.zero,
                                  title: Container(
                                    margin: const EdgeInsets.only(
                                        top: 19,
                                        right: 16,
                                        left: 16,
                                        bottom: 2),
                                    //height: AppDimensions.height10(context) * 2.5,
                                    width:
                                        AppDimensions.width10(context) * 23.8,
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
                                              setState(() {
                                                saved = true;
                                              });
                                              updateGoalReason(myTextFields);

                                              Navigator.push(
                                                context,
                                                FadePageRouteReverse(
                                                  page:
                                                      const HomeScreenProgressSaved(
                                                    login: true,
                                                    route: "goalWhy",
                                                  ),
                                                ),
                                              );
                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              await prefs.setString(
                                                  'route', "goalWhy");
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
                                              if (Route == 'view_all_goals') {
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
                                          width:
                                              AppDimensions.width10(context) *
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
                            ),

                            // Add code for performing close action
                          ),
                  ),
                ],
              )),
          body: Stack(children: [
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
                ? SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 5.5),
                          child: Center(
                            child: Text(
                              widget.comingFromEditScreen
                                  ? AppText().viewAndEdit
                                  : AppText().starCreate3,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: widget.comingFromEditScreen
                                    ? const Color(0xFF437296)
                                    : Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.8,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 0.5,
                        ),
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
                                fontSize: AppDimensions.font10(context) * 2.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 1.0,
                        ),
                        widget.comingFromEditScreen
                            ? SizedBox(
                                height: AppDimensions.height10(context) * 7.6,
                              )
                            :
                        Container(
                                width: AppDimensions.width10(context) * 10.4,
                                height: AppDimensions.height10(context) * 7.6,
                                padding: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 1.5,
                                    right:
                                        AppDimensions.width10(context) * 1.5),
                                child: Image.asset(
                                  "assets/images/image3.webp",
                                  fit: BoxFit.contain,
                                )),
                        SizedBox(
                          height: AppDimensions.height10(context) * 1.0,
                        ),
                        Center(
                          child: Text(
                            AppText().goalWhy,
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
                          child: Center(
                            child: Text(
                              AppText().goalWhyBody,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.8,
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
                          height: widget.comingFromEditScreen
                              ? reason.length <= 1
                                  ? AppDimensions.height10(context) * 22.0
                                  : AppDimensions.height10(context) * 36.0
                              : item <= 1
                                  ? AppDimensions.height10(context) * 22.0
                                  : AppDimensions.height10(context) * 36.0,
                          // color: Colors.amber,
                          child: Stack(children: [
                            ClipPath(
                              //clipper: OvalBottomBorderClipper(57),
                              child: Container(
                                // width: AppDimensions.width10(context) * 38.2,
                                //height: AppDimensions.height10(context) * 33.0,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 2.3),
                                padding: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.1,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white,
                                        width: AppDimensions.width10(context) *
                                            0.2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            AppDimensions.height10(context) *
                                                1.8))),

                                child: ListView.builder(
                                  itemCount: widget.comingFromEditScreen
                                      ? (reason?.length ?? 0)
                                      : myTextFields.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (BuildContext context, index) {
                                    if (widget.comingFromEditScreen) {
                                      if (reason == null ||
                                          index >= reason.length) {
                                        return Container(); // Return an empty container if the index is out of range.
                                      }
                                      return Column(children: [
                                        inner_text(
                                          key: Key(
                                              reason[index]['key'] + trigger),
                                          delete:
                                              reason.length > 1 ? true : false,
                                          head_text: "Reason ${index + 1}",
                                          body_text: reason[index]['text'],
                                          length: 200,
                                          onChanged: (newText) {
                                            if (myTextFields.isEmpty) {
                                              myTextFields.add({
                                                'key':
                                                    'Reason ${myTextFields.length.toString()}',
                                                'text': '',
                                              });
                                            }

                                            setState(() {
                                              reason[index]['text'] = newText;
                                            });
                                            handleTextChanged(index, newText);
                                          },
                                          onDelete: () {
                                            handleDelete(index);
                                          },
                                          index: index,
                                          placeHolder:
                                              'I want to achieve this goal because...',
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
                                                1.3,
                                          ),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Text(
                                                  "Character count: ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF464646),
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.3,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      6,
                                                  child: Text(
                                                    "${reason[index]['text'].toString().length}/200",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: const Color(
                                                          0xFF464646),
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.3,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    4.0,
                                                margin: EdgeInsets.only(
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      0.5,
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      0.1,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF282828)
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]);
                                    } else {
                                      // Use the myTextFields list.
                                      if (index >= myTextFields.length) {
                                        return Container(); // Return an empty container if the index is out of range.
                                      }
                                      return Column(children: [
                                        inner_text(
                                          key: Key(myTextFields[index]['key']!),
                                          delete: myTextFields.length > 1
                                              ? true
                                              : false,
                                          head_text: "Reason ${index + 1}",
                                          body_text: myTextFields[index]
                                              ['text']!,
                                          length: 200,
                                          onChanged: (newText) {
                                            setState(() {
                                              myTextFields[index]['text'] =
                                                  newText;
                                            });
                                            handleTextChanged(index, newText);
                                            goalProvider
                                                .updateReason(myTextFields);
                                          },
                                          onDelete: () {
                                            handleDelete(index);
                                            goalProvider
                                                .updateReason(myTextFields);
                                          },
                                          index: index,
                                          placeHolder:
                                              'I want to achieve this goal because...',
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
                                                1.3,
                                          ),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Text(
                                                  "Character count: ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xFF464646),
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.3,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      6,
                                                  child: Text(
                                                    "${myTextFields[index]['text'].toString().length}/200",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: const Color(
                                                          0xFF464646),
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.3,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    4.0,
                                                margin: EdgeInsets.only(
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      0.5,
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      0.1,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF282828)
                                                      .withOpacity(0.2),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]);
                                    }
                                  },
                                ),
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
                                //     ? const Alignment(0.01, 1.35)
                                //     : const Alignment(0.01, 1.25),
                                //heightFactor: 0.5,
                                child: widget.comingFromEditScreen
                                    ? reason.length > 4
                                        ? AnimatedScaleButton(
                                            onTap: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'You cannot add more than 5 items.'),
                                                  duration:
                                                      Duration(seconds: 3),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.7,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  4.7,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(
                                                    189, 158, 158, 158),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4,
                                                    left: 4,
                                                    right: 4,
                                                    bottom: 4),
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Image.asset(
                                                    'assets/images/Addgoal.webp',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.7,
                                                    width:
                                                        AppDimensions.height10(
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
                                                      reason.add({
                                                        'key':
                                                            'Reason ${reason.length.toString()}',
                                                        'text': '',
                                                      });
                                                    })
                                                  : setState(() {
                                                      myTextFields.add({
                                                        'key':
                                                            'Reason ${myTextFields.length.toString()}',
                                                        'text': '',
                                                      });
                                                    });
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.7,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  4.7,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                // color: Colors.orange,
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xFFB1B8FF),
                                                      Color(0xFFC5CAFF)
                                                    ]),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4,
                                                    left: 4,
                                                    right: 4,
                                                    bottom: 4),
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Image.asset(
                                                    'assets/images/Addgoal.webp',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.7,
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.7,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                    : myTextFields.length > 4
                                        ? AnimatedScaleButton(
                                            onTap: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'You cannot add more than 5 items.'),
                                                  duration:
                                                      Duration(seconds: 3),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.7,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  4.7,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(
                                                    189, 158, 158, 158),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4,
                                                    left: 4,
                                                    right: 4,
                                                    bottom: 4),
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Image.asset(
                                                    'assets/images/Addgoal.webp',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.7,
                                                    width:
                                                        AppDimensions.height10(
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
                                                      reason.add({
                                                        'key':
                                                            'Reason ${reason.length.toString()}',
                                                        'text': '',
                                                      });
                                                    })
                                                  : setState(() {
                                                      myTextFields.add({
                                                        'key':
                                                            'Reason ${myTextFields.length.toString()}',
                                                        'text': '',
                                                      });
                                                    });
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.7,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  4.7,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                // color: Colors.orange,
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xFFB1B8FF),
                                                      Color(0xFFC5CAFF)
                                                    ]),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4,
                                                    left: 4,
                                                    right: 4,
                                                    bottom: 4),
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Image.asset(
                                                    'assets/images/Addgoal.webp',
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.7,
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.7,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                              ),
                            )
                          ]),
                        ),
                        widget.comingFromEditScreen
                            ? SizedBox(
                                height: reason.length > 1
                                    ? AppDimensions.height10(context) * 14.5
                                    : AppDimensions.height10(context) * 26.0,
                              )
                            : MediaQuery.of(context).viewInsets.bottom == 0
                                ? SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 24.7,
                                  )
                                : SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                  ),
                        update
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
                                      width: AppDimensions.width10(context) *
                                          38.259,
                                      height: AppDimensions.height10(context) *
                                          9.707,
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
                                                AppDimensions.width10(context) *
                                                    4.437,
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.437,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/circle_tick.webp'))),
                                          ),
                                          Container(
                                            //width: AppDimensions.width10(context) * 6.9,
                                            height: AppDimensions.height10(
                                                    context) *
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
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  //   color: Colors.amber,
                                                  child: Text(
                                                    'Updates saved',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .font10(
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
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.2,
                                                  child: Text(
                                                    'The Why',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .font10(
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
                                                update = false;
                                              });
                                              stopTimer();
                                            },
                                            child: Container(
                                              width: AppDimensions.width10(
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
                                                          AppDimensions.font10(
                                                                  context) *
                                                              2,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  widget.comingFromEditScreen
                                      ? AnimatedScaleButton(
                                          onTap: () {
                                            resetDialog();
                                            // print(
                                            //     "ReasonReset $resetData ${reason == resetData}");
                                            // setState(() {
                                            //   reason = resetData;
                                            // });
                                            // print("Reason $reason");
                                            // print(
                                            //     "ReasonReset $resetData ${reason == resetData}");
                                            //   signupSheet(context, "Sign up / login", "login");
                                          },
                                          child: Container(
                                              width: AppDimensions.width10(
                                                      context) *
                                                  10.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  5.0,
                                              decoration: myTextFields[0]
                                                          ['text'] !=
                                                      ""
                                                  ? BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffFA9934)),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  50.0)),
                                                    )
                                                  : BoxDecoration(
                                                      // color: Color(0xFFFF7D50),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff282828)),
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  50.0)),
                                                    ),
                                              child: Center(
                                                  child: Text(
                                                "Reset",
                                                style: TextStyle(
                                                    fontFamily: "Laila",
                                                    fontWeight: FontWeight.w600,
                                                    color: myTextFields[0]
                                                                ['text'] !=
                                                            ""
                                                        ? const Color(
                                                            0xffFA9934)
                                                        : const Color(
                                                            0xff282828),
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            2),
                                              ))),
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 2.0,
                                  ),
                                  AnimatedScaleButton(
                                    onTap: () async {
                                      if (widget.comingFromEditScreen) {
                                        if (reason[0]['text'] != "") {
                                          AdminGoal()
                                              .updateUserGoal('reason', reason)
                                              .then((value) {
                                            if (value == true) {
                                              setState(() {
                                                update = true;
                                                showContainer = true;
                                              });
                                              startTimer();
                                            }
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Field can't be empty")));
                                        }
                                      } else {
                                        updateGoalReason(myTextFields);
                                      }
                                    },
                                    child: Container(
                                      height:
                                          AppDimensions.height10(context) * 5.2,
                                      width: widget.comingFromEditScreen
                                          ? AppDimensions.width10(context) *
                                              26.3
                                          : AppDimensions.width10(context) *
                                              31.3,
                                      decoration: widget.comingFromEditScreen
                                          ? myTextFields[0]['text'] != "" ||
                                                  widget.comingFromEditScreen ==
                                                      true
                                              ? BoxDecoration(
                                                  // color: Color(0xFFFF7D50),
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                        Color(0xFFFCC10D),
                                                        Color(0xFFFDA210)
                                                      ]),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              50.0)),
                                                )
                                              : BoxDecoration(
                                                  // color: Color(0xFFFF7D50),
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  color: const Color(0xFF282828)
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              50.0)),
                                                )
                                          : myTextFields[0]['text'] != "" ||
                                                  widget.comingFromEditScreen ==
                                                      true
                                              ? BoxDecoration(
                                                  // color: Color(0xFFFF7D50),
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                        Color(0xFFFCC10D),
                                                        Color(0xFFFDA210)
                                                      ]),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              50.0)),
                                                )
                                              : BoxDecoration(
                                                  // color: Color(0xFFFF7D50),
                                                  border: Border.all(
                                                      color:
                                                          Colors.transparent),
                                                  color: const Color(0xFF282828)
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              50.0)),
                                                ),
                                      child: Center(
                                        child: Text(
                                          widget.comingFromEditScreen
                                              ? "Save"
                                              : "Next",
                                          style: TextStyle(
                                            color: widget.comingFromEditScreen
                                                ? myTextFields[0]['text'] !=
                                                            "" ||
                                                        widget.comingFromEditScreen ==
                                                            true
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.5)
                                                : myTextFields[0]['text'] != ""
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.5),
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    2,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.5,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom))
                      ],
                    ),
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}
class ClipPainter extends CustomPainter {
  final CustomClipper<Path> clipper;

  ClipPainter(this.clipper);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // paint.color = Colors.blue[800];
    paint.style = PaintingStyle.fill;
    canvas.drawPath(clipper.getClip(size), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ArcClipper extends CustomClipper<Path> {
  ArcClipper(this.height);

  ///The height of the arc
  final double height;

  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.2, size.width, size.height - height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    ArcClipper oldie = oldClipper as ArcClipper;
    return height != oldie.height;
  }
}

class Arc extends StatelessWidget {
  final double height;
  final Widget child;
  const Arc({
    super.key,
    required this.height,
    required this.child,
  });

  /// The widget which one of [edge]s is going to be clippddddded as arc

  @override
  Widget build(BuildContext context) {
    var clipper = ArcClipper(height);
    return CustomPaint(
      painter: ClipPainter(clipper),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}

class popUpGoals extends StatelessWidget {
  const popUpGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.width10(context) * 27.0,
      height: AppDimensions.height10(context) * 18.2,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        title: Container(
          margin:
              const EdgeInsets.only(top: 19, right: 16, left: 16, bottom: 2),
          height: AppDimensions.height10(context) * 2.2,
          width: AppDimensions.width10(context) * 23.8,
          child: Text(
            "Exit?",
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
          //height: AppDimensions.height10(context) * 3.2,
          width: AppDimensions.width10(context) * 23.8,
          child: Text(
            "Your new updates have not been saved.\nIf you exit now, your new updates will\nbe cancelled.",
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Go back',
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
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page: const StarReview(
                          route: 'goal',
                        )));
                  },
                  child: const Text(
                    'Yes, cancel and exit',
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
    );
  }
}
