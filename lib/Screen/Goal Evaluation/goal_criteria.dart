// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/new_progress_score.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class your_why extends StatefulWidget {
  final int index;
  final String destination;
  final bool premium;
  const your_why({
    super.key,
    required this.destination,
    required this.index,
    required this.premium,
  });

  @override
  State<your_why> createState() => _your_whyState();
}

class _your_whyState extends State<your_why> {
  List options = [
    'I’m not\nmaking any\nprogress\n',
    'I’m making\nsmall steps\nforward',
    'I’m making\nconsiderable\nsteps forward',
    "I’m almost\nthere\n",
    "I’m definitely\nliving my why\n"
  ];
  List messages = [];
  String text = 'vision';
  bool saved = false;
  bool visible = false;
  bool disable = false;

  void startTimer() {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        visible = false;
        saved = false;
        disable = true;
      });
    });
  }
  // List<int?> selectedOptions = List.generate(3, (_) => null);

  //int? selectedItemIndexOuter; // For the outer list
  //int? selectedItemIndexInner; // For the inner list

  //int? selectedItemIndex;
  bool bt_visible = false;
  bool Loader = true;
  List<int>? selectedItemIndexesOuter;
  List<int>? resetList;
  var goalDetails;
  String totalPoint = '';

  final Map<String, dynamic> reasons = {};
  final Map<String, dynamic> level = {};

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchGoalEvauation() {
    goalEvaluationApi.getGoalEvaluation().then((response) {});
  }

  void _fetchGoalDetails() {
    AdminGoal.getUserGoal().then((response) async {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
        });

        final SharedPreferences prefs = await _prefs;
        await prefs.setInt(
            'goal_eval_id', response["goalEvaluations"][widget.index]["id"]);
        loadData();
        if (widget.destination == 'reason') {
          if (response['goalEvaluations'][widget.index]["YourWay"] != null) {
            setState(() {
              totalPoint = response['goalEvaluations'][widget.index]["YourWay"]
                      ['level']
                  .toString();
              selectedItemIndexesOuter =
                  List.filled(goalDetails[widget.destination].length, -1);
              resetList =
                  List.filled(goalDetails[widget.destination].length, -1);
            });
            for (int i = 0;
                i <
                    response['goalEvaluations'][widget.index]["YourWay"]
                        .keys
                        .length;
                i++) {
              selectedItemIndexesOuter![i] = response['goalEvaluations']
                      [widget.index]["YourWay"]['reason ${i + 1}'] -
                  1;
              resetList![i] = response['goalEvaluations'][widget.index]
                      ["YourWay"]['reason ${i + 1}'] -
                  1;
            }
          } else {
            setState(() {
              selectedItemIndexesOuter =
                  List.filled(goalDetails[widget.destination].length, -1);
              resetList =
                  List.filled(goalDetails[widget.destination].length, -1);
            });
          }
        } else if (widget.destination == 'identityStatement') {
          if (response['goalEvaluations'][widget.index]["newIdentity"] !=
              null) {
            setState(() {
              totalPoint = response['goalEvaluations'][widget.index]
                      ["newIdentity"]['level']
                  .toString();
              selectedItemIndexesOuter =
                  List.filled(goalDetails[widget.destination].length, -1);
              resetList =
                  List.filled(goalDetails[widget.destination].length, -1);
            });
            for (int i = 0;
                i <
                    response['goalEvaluations'][widget.index]["newIdentity"]
                        .keys
                        .length;
                i++) {
              selectedItemIndexesOuter![i] = response['goalEvaluations']
                      [widget.index]["newIdentity"]['reason ${i + 1}'] -
                  1;
              resetList![i] = response['goalEvaluations'][widget.index]
                      ["newIdentity"]['reason ${i + 1}'] -
                  1;
            }
          } else {
            setState(() {
              selectedItemIndexesOuter =
                  List.filled(goalDetails[widget.destination].length, -1);
              resetList =
                  List.filled(goalDetails[widget.destination].length, -1);
            });
          }
        } else {
          if (response['goalEvaluations'][widget.index]
                  ["visualisingYourSelf"] !=
              null) {
            setState(() {
              totalPoint = response['goalEvaluations'][widget.index]
                      ["visualisingYourSelf"]['level']
                  .toString();
              selectedItemIndexesOuter =
                  List.filled(goalDetails[widget.destination].length, -1);
              resetList =
                  List.filled(goalDetails[widget.destination].length, -1);
            });
            for (int i = 0;
                i <
                    response['goalEvaluations'][widget.index]
                            ["visualisingYourSelf"]
                        .keys
                        .length;
                i++) {
              selectedItemIndexesOuter![i] = response['goalEvaluations']
                      [widget.index]["visualisingYourSelf"]['reason ${i + 1}'] -
                  1;
              resetList![i] = response['goalEvaluations'][widget.index]
                      ["visualisingYourSelf"]['reason ${i + 1}'] -
                  1;
            }
          } else {
            setState(() {
              selectedItemIndexesOuter =
                  List.filled(goalDetails[widget.destination].length, -1);
              resetList =
                  List.filled(goalDetails[widget.destination].length, -1);
            });
          }
        }

        print(response);
      } else {
        loadData();
      }
    }).catchError((error) {
      // loadData();
      print("error");
    }).whenComplete(() {
      loadData();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalDetails();
    if (widget.destination == 'identityStatement') {
      setState(() {
        text = 'new identity';
      });
    } else if (widget.destination == 'reason') {
      setState(() {
        text = 'why';
      });
    }

    setState(() {
      messages = [
        "No progress towards my $text yet",
        "I'm making small steps towards my $text",
        "I'm making gradual steps towards my $text",
        "I'm making significant and consistent steps towards my $text",
        "I'm living my $text"
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (disable == false && widget.premium) {
          showAnimatedDialog(
              animationType: DialogTransitionType.fadeScale,
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 1),
              context: context,
              builder: (BuildContext context) => Container(
                  width: AppDimensions.width10(context) * 27.0,
                  height: AppDimensions.height10(context) * 18.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 1.4)),
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
                          right: AppDimensions.width10(context) * 1.6,
                          left: AppDimensions.width10(context) * 1.6,
                          bottom: AppDimensions.height10(context) * 0.2),
                      height: AppDimensions.height10(context) * 2.2,
                      width: AppDimensions.width10(context) * 23.8,
                      child: Text(
                        "Exit without saving changes?",
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
                          left: AppDimensions.width10(context) * 1.6,
                          right: AppDimensions.width10(context) * 1.6),
                      width: AppDimensions.width10(context) * 23.8,
                      child: Text(
                        "Are you sure you want to exit, all your\nchanges will be lost?",
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
                          Container(
                            height: AppDimensions.height10(context) * 4.2,
                            width: double.infinity,
                            color: const Color(0xFF007AFF),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    FadePageRouteReverse(
                                        page: new_progress_score(
                                      premium: widget.premium,
                                      evaluationIndex: widget.index,
                                    )));
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400),
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
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
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
                  )));
        } else {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: new_progress_score(
                premium: widget.premium,
                evaluationIndex: widget.index,
              )));
          selectedItemIndexesOuter!.clear();
        }

        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  if (disable == false && widget.premium) {
                    showAnimatedDialog(
                        animationType: DialogTransitionType.fadeScale,
                        curve: Curves.easeInOut,
                        duration: const Duration(seconds: 1),
                        context: context,
                        builder: (BuildContext context) => Container(
                            width: AppDimensions.width10(context) * 27.0,
                            height: AppDimensions.height10(context) * 18.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 1.4)),
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
                                    right:
                                        AppDimensions.width10(context) * 1.6,
                                    left: AppDimensions.width10(context) * 1.6,
                                    bottom:
                                        AppDimensions.height10(context) * 0.2),
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.width10(context) * 23.8,
                                child: Text(
                                  "Exit without saving changes?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              content: Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.5,
                                    left: AppDimensions.width10(context) * 1.6,
                                    right:
                                        AppDimensions.height10(context) * 1.6),
                                width: AppDimensions.width10(context) * 23.8,
                                child: Text(
                                  "Are you sure you want to exit, all your\nchanges will be lost?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.3,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 4.2,
                                      width: double.infinity,
                                      color: const Color(0xFF007AFF),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              FadePageRouteReverse(
                                                  page: new_progress_score(
                                                evaluationIndex: widget.index,
                                                premium: widget.premium,
                                              )));
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 4.4,
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF007AFF)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )));
                  } else {
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page: new_progress_score(
                          evaluationIndex: widget.index,
                          premium: widget.premium,
                        )));
                  }
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.width10(context) * 3.0,
                  height: AppDimensions.height10(context) * 3.0,
                  fit: BoxFit.contain,
                )),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          foregroundDecoration: BoxDecoration(
              color: widget.premium
                  ? Colors.transparent
                  : Colors.black.withOpacity(0.4)),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          child: Loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 36.5,
                        height: AppDimensions.height10(context) * 52.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFF9DCC0).withOpacity(0),
                                const Color(0XFFFF7975).withOpacity(1)
                              ]),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: AppDimensions.width10(context) * 24.0,
                              height: AppDimensions.height10(context) * 3.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 7.1),
                              child: Text(
                                widget.destination == 'reason'
                                    ? 'Goal Criteria 1'
                                    : widget.destination == 'identityStatement'
                                        ? 'Goal Criteria 2'
                                        : 'Goal Criteria 3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 3.0,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                            Container(
                              //  width: AppDimensions.width10(context) * 24.0,
                              height: AppDimensions.height10(context) * 3.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0),
                              alignment: Alignment.topCenter,
                              child: Text(
                                widget.destination == 'reason'
                                    ? 'Your Why'
                                    : widget.destination == 'identityStatement'
                                        ? 'Your New Identity'
                                        : 'Your Vision',
                                //  'Your Why',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 3.0,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 32.4,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.5),
                              child: Text(
                                capitalizeFirstLetter(goalDetails['name']),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 8.7,
                              height: AppDimensions.height10(context) * 8.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 3.2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.1,
                                    color: const Color(0xFFFFFFFF)),
                                shape: BoxShape.circle,
                                color: totalPoint == ''
                                    ? Colors.transparent
                                    : const Color(0xFFFFFFFF),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 3.4,
                                    height:
                                        AppDimensions.height10(context) * 1.3,
                                    child: Text(
                                      'Level',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF646464)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 3.2,
                                    height:
                                        AppDimensions.height10(context) * 3.7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          totalPoint == '' ? '-' : totalPoint,
                                          // goalDetails['goalEvaluations'][0]
                                          //             ["YourWay"]['level']
                                          //         .toString()
                                          //         .isEmpty
                                          //     ? '-'
                                          //     : goalDetails['goalEvaluations'][0]
                                          //             ["YourWay"]['level']
                                          //         .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  2.4,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF646464)),
                                        ),
                                        Text(
                                          '/5',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w300,
                                              color: const Color(0xFF646464)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.width10(context) * 23.4,
                              height: AppDimensions.height10(context) * 8.3,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const Alignment(-1, -0.5),
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 2.5,
                                      height:
                                          AppDimensions.height10(context) * 1.6,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/colon.webp'),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(1, 0),
                                    child: Container(
                                      width:
                                          AppDimensions.width10(context) * 21.4,
                                      height:
                                          AppDimensions.height10(context) * 7.3,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1),
                                      child: Center(
                                        child: Text(
                                          totalPoint == ''
                                              ? 'Score needed'
                                              : widget.destination == 'reason'
                                                  ? messages[
                                                      int.parse(totalPoint) - 1]
                                                  : widget.destination ==
                                                          'identityStatement'
                                                      ? messages[int.parse(
                                                              totalPoint) -
                                                          1]
                                                      : messages[int.parse(
                                                              totalPoint) -
                                                          1],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 28.8,
                              height: AppDimensions.height10(context) * 4.2,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 3.3),
                              child: Text(
                                "Please give a score on how close you\nare towards achieving your goal.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.6,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                            Container(
                              // width: AppDimensions.width10(context) * 2.1,
                              //height: AppDimensions.height10(context) * 4.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.5),
                              child: Image.asset(
                                'assets/images/Arrow.webp',
                                width: AppDimensions.width10(context) * 4.1,
                                height: AppDimensions.height10(context) * 4.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: goalDetails[widget.destination].length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedItemIndexesOuter![index] = index;
                              });
                            },
                            child: Container(
                              // width: AppDimensions.width10(context) * 37.0,
                              //   height: AppDimensions.height10(context) * 11.9,
                              margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 4.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    // width: AppDimensions.width10(context) * 15.5,
                                    //height: AppDimensions.height10(context) * 2.9,
                                    child: Text(
                                      widget.destination == 'reason'
                                          ? "Why reason ${index + 1}"
                                          : widget.destination ==
                                                  'identityStatement'
                                              ? "Identity Statement ${index + 1}"
                                              : "Vision ${index + 1}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.4,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF437296)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.width10(context) * 37.0,
                                    //height: AppDimensions.height10(context) * 6.8,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.3),
                                    child: Text(
                                      goalDetails[widget.destination][index]
                                          ['text'],
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.0,
                                          fontWeight: FontWeight.w500,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          color: const Color(0xFF437296)),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height:
                                        AppDimensions.height10(context) * 16.3,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            3.0,
                                        left: AppDimensions.width10(context) *
                                            0.425),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index1) {
                                          return AnimatedScaleButton(
                                            onTap: () {
                                              if (disable != true &&
                                                  widget.premium == true) {
                                                setState(() {
                                                  selectedItemIndexesOuter![
                                                      index] = index1;
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  12.95,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  12.95,
                                              margin: EdgeInsets.only(
                                                  right: AppDimensions.height10(
                                                          context) *
                                                      1.5),
                                              child: Stack(children: [
                                                Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      12.95,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          12.95,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      gradient: widget.premium ==
                                                              false
                                                          ? const LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment.bottomCenter,
                                                              colors: [
                                                                  Color(
                                                                      0XFFFFFFFF),
                                                                  Color(
                                                                      0xFFFFFFFF)
                                                                ])
                                                          : selectedItemIndexesOuter![index] !=
                                                                  index1
                                                              ? const LinearGradient(
                                                                  begin: Alignment.topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                      Color(
                                                                          0XFFFFFFFF),
                                                                      Color(
                                                                          0xFFFFFFFF)
                                                                    ])
                                                              : const LinearGradient(
                                                                  begin: Alignment
                                                                      .topCenter,
                                                                  end: Alignment.bottomCenter,
                                                                  colors: [
                                                                      Color(
                                                                          0XFFFA9934),
                                                                      Color(
                                                                          0xFFFA9934)
                                                                    ]),
                                                      border: Border.all(
                                                          width:
                                                              AppDimensions.height10(
                                                                      context) *
                                                                  0.3,
                                                          color: widget.premium == false
                                                              ? const Color(0xFFEE8F70)
                                                              : selectedItemIndexesOuter![index] != index1
                                                                  ? const Color(0xFFEE8F70)
                                                                  : const Color(0xFFFFFFFF))),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          '${index1 + 1}',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .font10(
                                                                          context) *
                                                                  3.2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: widget
                                                                          .premium ==
                                                                      false
                                                                  ? const Color(
                                                                      0xFFFA9934)
                                                                  : selectedItemIndexesOuter![
                                                                              index] !=
                                                                          index1
                                                                      ? const Color(
                                                                          0xFFFA9934)
                                                                      : const Color(
                                                                          0xFFFFFFFF)),
                                                        ),
                                                      ),
                                                      Text(
                                                        options[index1],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: widget
                                                                        .premium ==
                                                                    false
                                                                ? const Color(
                                                                    0xFFFA9934)
                                                                : selectedItemIndexesOuter![
                                                                            index] !=
                                                                        index1
                                                                    ? const Color(
                                                                        0xFFFA9934)
                                                                    : const Color(
                                                                        0xFFFFFFFF)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                widget.premium == false
                                                    ? Container()
                                                    : selectedItemIndexesOuter![
                                                                index] !=
                                                            index1
                                                        ? Container()
                                                        : Align(
                                                            alignment:
                                                                const Alignment(
                                                                    0, 0.8),
                                                            child: Container(
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  4.0,
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  4.0,
                                                              padding: EdgeInsets
                                                                  .all(AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.2),
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border.all(
                                                                      width: AppDimensions.height10(
                                                                              context) *
                                                                          0.1,
                                                                      color: const Color(
                                                                          0xFFFFFFFF))),
                                                              child: Container(
                                                                width: AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    2.4,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    2.4,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width: AppDimensions.width10(context) *
                                                                            0.1,
                                                                        color: const Color(
                                                                            0xFFFFFFFF)),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: const DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/images/circle_tick.webp'))),
                                                              ),
                                                            ),
                                                          )
                                              ]),
                                            ),
                                          );
                                        }),
                                  ),
                                  Container(
                                    width: AppDimensions.width10(context) * 7.2,
                                    height:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFF437296),
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            3.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                3.0),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      saved
                          ? visible
                              ? Container(
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          3.6),
                                  child: updateBox(
                                      headText: "Changes saved",
                                      bodyText: 'Goal Criteria',
                                      onTap1: () {
                                        setState(() {
                                          saved = false;
                                        });
                                        startTimer();
                                      },
                                      functionText: 'Undo',
                                      FadeFunction: () {},
                                      edit: false),
                                )
                              //  GestureDetector(
                              //     onPanUpdate: (details) {
                              //       setState(() {
                              //         swipeOffset += details.delta.dx;
                              //       });

                              //       if (swipeOffset.abs() >=
                              //           MediaQuery.of(context).size.width /
                              //               3.0) {
                              //         setState(() {
                              //           visible = false;
                              //         });
                              //       }
                              //     },
                              //     child: AnimatedOpacity(
                              //       duration: const Duration(milliseconds: 700),
                              //       opacity: visible ? 1.0 : 0.0,
                              //       child: Transform.translate(
                              //         offset: Offset(swipeOffset, 0.0),
                              //         child: Container(
                              //           width: AppDimensions.width10(context) *
                              //               38.259,
                              //           height:
                              //               AppDimensions.height10(context) *
                              //                   9.707,
                              //           margin: EdgeInsets.only(
                              //               top: AppDimensions.height10(
                              //                       context) *
                              //                   9.9,
                              //               bottom: AppDimensions.height10(
                              //                       context) *
                              //                   2.193),
                              //           decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(
                              //                   AppDimensions.height10(
                              //                           context) *
                              //                       2.0),
                              //               gradient: const LinearGradient(
                              //                   begin: Alignment.topCenter,
                              //                   end: Alignment.bottomCenter,
                              //                   colors: [
                              //                     Color(0xFFD4B7B9),
                              //                     Color(0xFF91698C)
                              //                   ])),
                              //           child: Row(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Container(
                              //                 margin: EdgeInsets.only(
                              //                     left: AppDimensions.height10(
                              //                             context) *
                              //                         1.261),
                              //                 width: AppDimensions.height10(
                              //                         context) *
                              //                     4.437,
                              //                 height: AppDimensions.height10(
                              //                         context) *
                              //                     4.437,
                              //                 decoration: const BoxDecoration(
                              //                     image: DecorationImage(
                              //                         image: AssetImage(
                              //                             'assets/images/circle_tick.webp'))),
                              //               ),
                              //               Container(
                              //                 width: AppDimensions.height10(
                              //                         context) *
                              //                     10.8,
                              //                 margin: EdgeInsets.only(
                              //                     left: AppDimensions.height10(
                              //                             context) *
                              //                         1.232),
                              //                 child: Column(
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.start,
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment.center,
                              //                   children: [
                              //                     SizedBox(
                              //                       //  width: AppDimensions.width10(context) * 4.6,

                              //                       //   color: Colors.amber,
                              //                       child: Text(
                              //                         'Changes saved',
                              //                         style: TextStyle(
                              //                             fontSize: AppDimensions
                              //                                     .height10(
                              //                                         context) *
                              //                                 1.3,
                              //                             fontWeight:
                              //                                 FontWeight.w500,
                              //                             color: const Color(
                              //                                 0xFFFFFFFF)),
                              //                       ),
                              //                     ),
                              //                     SizedBox(
                              //                       // width: AppDimensions.width10(context) * 6.9,
                              //                       height:
                              //                           AppDimensions.height10(
                              //                                   context) *
                              //                               2.2,
                              //                       child: Text(
                              //                         'Goal Criteria',
                              //                         style: TextStyle(
                              //                             fontSize: AppDimensions
                              //                                     .height10(
                              //                                         context) *
                              //                                 1.8,
                              //                             fontWeight:
                              //                                 FontWeight.w500,
                              //                             color: const Color(
                              //                                 0xFFFFFFFF)),
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 ),
                              //               ),
                              //               AnimatedScaleButton(
                              //                 onTap: () {
                              //                   setState(() {
                              //                     saved = false;
                              //                   });
                              //                   //   Navigator.pop(context);
                              //                 },
                              //                 child: Container(
                              //                   width: AppDimensions.height10(
                              //                           context) *
                              //                       8.1,
                              //                   height: AppDimensions.height10(
                              //                           context) *
                              //                       6.0,
                              //                   margin: EdgeInsets.only(
                              //                       left:
                              //                           AppDimensions.height10(
                              //                                   context) *
                              //                               11.2),
                              //                   decoration: BoxDecoration(
                              //                     border: Border.all(
                              //                         color: const Color(
                              //                             0xFFFFFFFF),
                              //                         width: 1),
                              //                     borderRadius:
                              //                         BorderRadius.circular(
                              //                             AppDimensions
                              //                                     .height10(
                              //                                         context) *
                              //                                 2.0),
                              //                   ),
                              //                   child: Center(
                              //                     child: Text(
                              //                       'Undo',
                              //                       style: TextStyle(
                              //                           fontSize: AppDimensions
                              //                                   .height10(
                              //                                       context) *
                              //                               1.8,
                              //                           fontWeight:
                              //                               FontWeight.w500,
                              //                           color: const Color(
                              //                               0xFFFFFFFF)),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   )

                              : Container()
                          : Container(
                              width: AppDimensions.width10(context) * 35.4,
                              height: AppDimensions.height10(context) * 5.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 10.9,
                                  bottom:
                                      AppDimensions.height10(context) * 3.6),
                              child: Row(
                                children: [
                                  AnimatedScaleButton(
                                    onTap: () {
                                      if (disable == false &&
                                          widget.premium == true) {
                                        showAnimatedDialog(
                                            animationType:
                                                DialogTransitionType.fadeScale,
                                            curve: Curves.easeInOut,
                                            duration:
                                                const Duration(seconds: 1),
                                            context: context,
                                            builder: (BuildContext context) =>
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      27.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          18.2,
                                                  child: AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4)),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    actionsPadding:
                                                        EdgeInsets.zero,
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.4)),
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.9,
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          left: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          bottom: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.2,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              23.8,
                                                      child: Text(
                                                        "Clear answers?",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    content: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.5,
                                                          left: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6),
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.2,
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              23.8,
                                                      child: Text(
                                                        "Are you sure you want to clear all your\nanswers for this Goal criterion?",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.3,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                4.2,
                                                            width:
                                                                double.infinity,
                                                            color: const Color(
                                                                0xFF007AFF),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                selectedItemIndexesOuter =
                                                                    List.filled(
                                                                        goalDetails[widget.destination]
                                                                            .length,
                                                                        -1);
                                                                setState(() {});
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        "Laila",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                4.4,
                                                            width:
                                                                double.infinity,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        "Laila",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xFF007AFF)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                      }
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 8.0,
                                      height:
                                          AppDimensions.height10(context) * 5.0,
                                      decoration: BoxDecoration(
                                        color: disable
                                            ? const Color(0xFFFFFFFF)
                                                .withOpacity(0.4)
                                            : const Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                5.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Clear',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  // selectedItemIndexesOuter! !=
                                                  //         null
                                                  //     ?
                                                  const Color(0xFFFA9934)
                                              // : const Color(0xFFFA9934)
                                              //     .withOpacity(0.5)
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedScaleButton(
                                    onTap: () {
                                      if (disable == false &&
                                          widget.premium == true) {
                                        showAnimatedDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  27.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  18.2,
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4)),
                                                contentPadding: EdgeInsets.zero,
                                                actionsPadding: EdgeInsets.zero,
                                                titlePadding: EdgeInsets.zero,
                                                title: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.9,
                                                      right: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6,
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6,
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.2),
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.2,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      23.8,
                                                  child: Text(
                                                    "Reset answers?",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.7,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                content: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.5,
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6,
                                                      right: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.6),
                                                  // height: AppDimensions.height10(context) * 3.2,
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      23.8,
                                                  child: Text(
                                                    "Are you sure you want to reset, all your\nchanges for this criterion?",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.3,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.1,
                                                        child: Divider(
                                                          color: const Color(
                                                                  0XFF3C3C43)
                                                              .withOpacity(
                                                                  0.29),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          for (int i = 0;
                                                              i <
                                                                  resetList!
                                                                      .length;
                                                              i++) {
                                                            selectedItemIndexesOuter![
                                                                    i] =
                                                                resetList![i];
                                                          }
                                                          // selectedItemIndexesOuter =
                                                          //     resetList;
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);

                                                          // selectedItemIndexesOuter!.clear();
                                                        },
                                                        child: Container(
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              4.2,
                                                          width:
                                                              double.infinity,
                                                          color: const Color(
                                                              0xFF007AFF),
                                                          child: Center(
                                                            child: Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFFFFFFFF),
                                                                  fontSize:
                                                                      AppDimensions.font10(
                                                                              context) *
                                                                          1.7,
                                                                  fontFamily:
                                                                      "Laila",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.1,
                                                        child: Divider(
                                                          color: const Color(
                                                                  0XFF3C3C43)
                                                              .withOpacity(
                                                                  0.29),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.4,
                                                        width: double.infinity,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.7,
                                                                fontFamily:
                                                                    "Laila",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF007AFF)),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.1,
                                                        child: Divider(
                                                          color: const Color(
                                                                  0XFF3C3C43)
                                                              .withOpacity(
                                                                  0.29),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          animationType:
                                              DialogTransitionType.fadeScale,
                                          curve: Curves.easeInOut,
                                          duration: const Duration(seconds: 1),
                                        );
                                      }
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 8.0,
                                      height:
                                          AppDimensions.height10(context) * 5.0,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  1.0),
                                      decoration: BoxDecoration(
                                        color: disable
                                            ? const Color(0xFFFFFFFF)
                                                .withOpacity(0.4)
                                            : const Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                5.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Reset',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFFA9934)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedScaleButton(
                                    onTap: () {
                                      if (disable == false &&
                                          widget.premium == true) {
                                        if (selectedItemIndexesOuter!
                                                .contains(-1) ==
                                            false) {
                                          showAnimatedDialog(
                                              context: context,
                                              animationType:
                                                  DialogTransitionType
                                                      .fadeScale,
                                              curve: Curves.easeInOut,
                                              duration:
                                                  const Duration(seconds: 1),
                                              builder:
                                                  (BuildContext context) =>
                                                      Container(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              27.0,
                                                          height:
                                                              AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  18.2,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          1.4)),
                                                          child: AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AppDimensions.height10(context) *
                                                                            1.4)),
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            actionsPadding:
                                                                EdgeInsets.zero,
                                                            titlePadding:
                                                                EdgeInsets.zero,
                                                            title: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          AppDimensions.height10(context) *
                                                                              1.4)),
                                                              margin: EdgeInsets.only(
                                                                  top: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.9,
                                                                  right:
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          1.6,
                                                                  left: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.6,
                                                                  bottom: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.2),
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.2,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  23.8,
                                                              child: Text(
                                                                "Save changes?",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.font10(
                                                                              context) *
                                                                          1.7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                            content: Container(
                                                              margin: EdgeInsets.only(
                                                                  bottom: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.5,
                                                                  left: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.6,
                                                                  right: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      1.6),
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  3.2,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  23.8,
                                                              child: Text(
                                                                "Are you sure you want to save your new\nupdates?",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.font10(
                                                                              context) *
                                                                          1.3,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        AppDimensions.height10(context) *
                                                                            0.1,
                                                                    child:
                                                                        Divider(
                                                                      color: const Color(
                                                                              0XFF3C3C43)
                                                                          .withOpacity(
                                                                              0.29),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        AppDimensions.height10(context) *
                                                                            4.2,
                                                                    width: double
                                                                        .infinity,
                                                                    color: const Color(
                                                                        0xFF007AFF),
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        var sum = selectedItemIndexesOuter!.reduce((a,
                                                                                b) =>
                                                                            a +
                                                                            b);

                                                                        level[
                                                                            'level'] = ((sum + goalDetails[widget.destination].length) /
                                                                                goalDetails[widget.destination].length)
                                                                            .round();

                                                                        for (int i =
                                                                                0;
                                                                            i < selectedItemIndexesOuter!.length;
                                                                            i++) {
                                                                          reasons['reason ${i + 1}'] =
                                                                              selectedItemIndexesOuter![i] + 1;
                                                                        }

                                                                        goalEvaluationApi()
                                                                            .updateEvaluation(
                                                                          widget.destination == 'reason'
                                                                              ? "YourWay"
                                                                              : widget.destination == 'identityStatement'
                                                                                  ? "newIdentity"
                                                                                  : "visualisingYourSelf",
                                                                          {
                                                                            ...level,
                                                                            ...reasons
                                                                          },
                                                                        ).then((response) {
                                                                          if (response ==
                                                                              true) {
                                                                            setState(() {
                                                                              saved = true;
                                                                              visible = true;
                                                                              disable = true;
                                                                              totalPoint = '${((sum + goalDetails[widget.destination].length) / goalDetails[widget.destination].length).round()}';
                                                                            });
                                                                            startTimer();
                                                                          }
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Yes',
                                                                        style: TextStyle(
                                                                            color: const Color(
                                                                                0xFFFFFFFF),
                                                                            fontSize: AppDimensions.font10(context) *
                                                                                1.7,
                                                                            fontFamily:
                                                                                "Laila",
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        AppDimensions.height10(context) *
                                                                            0.1,
                                                                    child:
                                                                        Divider(
                                                                      color: const Color(
                                                                              0XFF3C3C43)
                                                                          .withOpacity(
                                                                              0.29),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        AppDimensions.height10(context) *
                                                                            4.4,
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Cancel',
                                                                        style: TextStyle(
                                                                            fontSize: AppDimensions.font10(context) *
                                                                                1.7,
                                                                            fontFamily:
                                                                                "Laila",
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: const Color(0xFF007AFF)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        AppDimensions.height10(context) *
                                                                            0.1,
                                                                    child:
                                                                        Divider(
                                                                      color: const Color(
                                                                              0XFF3C3C43)
                                                                          .withOpacity(
                                                                              0.29),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                            'Must select answer from each row',
                                            style: TextStyle(
                                                color: Colors.red
                                                    .withOpacity(0.8)),
                                          )));
                                        }
                                      }
                                    },
                                    child: Container(
                                      width:
                                          AppDimensions.width10(context) * 17.4,
                                      height:
                                          AppDimensions.height10(context) * 5.0,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  1.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            disable
                                                ? const Color(0xffFCC10D)
                                                    .withOpacity(0.4)
                                                : const Color(0xffFCC10D),
                                            disable
                                                ? const Color(0xffFDA210)
                                                    .withOpacity(0.4)
                                                : const Color(0xffFDA210),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                5.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Save updates',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
        extendBody: true,
        bottomNavigationBar: widget.premium == true
            ? Container()
            : GestureDetector(
                onTap: () {
                  Upgrade_sheet(context);
                },
                child: BottomAppBar(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Container(
                    height: AppDimensions.height10(context) * 7.7,
                    width: AppDimensions.width10(context) * 41.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                AppDimensions.height10(context) * 2.0),
                            topRight: Radius.circular(
                                AppDimensions.height10(context) * 2.0)),
                        color: const Color(0xFFF5F5F5)),
                    child: SizedBox(
                      height: AppDimensions.height10(context) * 3.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 1.0),
                            child: Text(
                              'Upgrade to score ',
                              style: TextStyle(
                                  color: const Color(0xFF437296),
                                  fontSize: AppDimensions.font10(context) * 2.8,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 3.2,
                            height: AppDimensions.height10(context) * 3.2,
                            padding: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.1,
                                left: AppDimensions.width10(context) * 0.6,
                                right: AppDimensions.width10(context) * 0.6,
                                bottom: AppDimensions.height10(context) * 0.9),
                            decoration: const BoxDecoration(
                                color: Color(0xFF437296),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/Arrow.webp',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

// AlertDialog save_criteria = AlertDialog(
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
//   contentPadding: EdgeInsets.zero,
//   actionsPadding: EdgeInsets.zero,
//   titlePadding: EdgeInsets.zero,
//   title: Container(
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
//     margin: EdgeInsets.only(
//         top: AppDimensions.height10(context) * 1.9,
//         right: AppDimensions.width10(context) * 1.6,
//         left: AppDimensions.width10(context) * 1.6,
//         bottom: AppDimensions.height10(context) * 0.2),
//     height: AppDimensions.height10(context) * 2.2,
//     width: AppDimensions.width10(context) * 23.8,
//     child: Text(
//       "Save changes?",
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: AppDimensions.font10(context) * 1.7,
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   ),
//   content: Container(
//     margin: EdgeInsets.only(
//         bottom: AppDimensions.height10(context) * 1.5,
//         left: AppDimensions.width10(context) * 1.6,
//         right: AppDimensions.width10(context) * 1.6),
//     height: AppDimensions.height10(context) * 3.2,
//     width: AppDimensions.width10(context) * 23.8,
//     child: Text(
//       "Are you sure you want to save your new\nupdates?",
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: AppDimensions.font10(context) * 1.3,
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   ),
//   actions: <Widget>[
//     Column(
//       children: [
//         SizedBox(
//           height: AppDimensions.height10(context) * 0.1,
//           child: Divider(
//             color: const Color(0XFF3C3C43).withOpacity(0.29),
//           ),
//         ),
//         Container(
//           height: AppDimensions.height10(context) * 4.2,
//           width: double.infinity,
//           color: const Color(0xFF007AFF),
//           child: GestureDetector(
//             onTap: () {
//                Navigator.push(context,
//                               FadePageRoute(page: const your_why(criteria: 1, saved: true,)));
//             },
//             child: Center(
//               child: Text(
//                 'Yes',
//                 style: TextStyle(
//                     color: const Color(0xFFFFFFFF),
//                     fontSize: AppDimensions.font10(context) * 1.7,
//                     fontFamily: "Laila",
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: AppDimensions.height10(context) * 0.1,
//           child: Divider(
//             color: const Color(0XFF3C3C43).withOpacity(0.29),
//           ),
//         ),
//         SizedBox(
//           height: AppDimensions.height10(context) * 4.4,
//           width: double.infinity,
//           child: TextButton(
//             onPressed: () {},
//             child: Text(
//               'Cancel',
//               style: TextStyle(
//                   fontSize: AppDimensions.font10(context) * 1.7,
//                   fontFamily: "Laila",
//                   fontWeight: FontWeight.w400,
//                   color: const Color(0xFF007AFF)),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: AppDimensions.height10(context) * 0.1,
//           child: Divider(
//             color: const Color(0XFF3C3C43).withOpacity(0.29),
//           ),
//         ),
//       ],
//     ),
//   ],
// );

Widget showSaveWithout(BuildContext context) {
  return SizedBox(
    width: AppDimensions.width10(context) * 27.0,
    height: AppDimensions.height10(context) * 18.2,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        margin: EdgeInsets.only(
            top: AppDimensions.height10(context) * 1.9,
            right: AppDimensions.width10(context) * 1.6,
            left: AppDimensions.width10(context) * 1.6,
            bottom: AppDimensions.height10(context) * 0.2),
        height: AppDimensions.height10(context) * 2.2,
        width: AppDimensions.width10(context) * 23.8,
        child: Text(
          "Exit without saving changes?",
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
            left: AppDimensions.width10(context) * 1.6,
            right: AppDimensions.width10(context) * 1.6),
        // height: AppDimensions.height10(context) * 3.2,
        width: AppDimensions.width10(context) * 23.8,
        child: Text(
          "Are you sure you want to exit, all your\nchanges will be lost?",
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
            Container(
              height: AppDimensions.height10(context) * 4.2,
              width: double.infinity,
              color: const Color(0xFF007AFF),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // selectedItemIndexesOuter!.clear();
                },
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
}

Widget showAlertBox(BuildContext context) {
  return SizedBox(
    width: AppDimensions.width10(context) * 27.0,
    height: AppDimensions.height10(context) * 18.2,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        margin: EdgeInsets.only(
            top: AppDimensions.height10(context) * 1.9,
            right: AppDimensions.width10(context) * 1.6,
            left: AppDimensions.width10(context) * 1.6,
            bottom: AppDimensions.height10(context) * 0.2),
        height: AppDimensions.height10(context) * 2.2,
        width: AppDimensions.width10(context) * 23.8,
        child: Text(
          "Clear answers?",
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
            left: AppDimensions.width10(context) * 1.6,
            right: AppDimensions.width10(context) * 1.6),
        //height: AppDimensions.height10(context) * 3.2,
        width: AppDimensions.width10(context) * 23.8,
        child: Text(
          "Are you sure you want to clear all your\nanswers for this Goal criterion?",
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
            Container(
              height: AppDimensions.height10(context) * 4.2,
              width: double.infinity,
              color: const Color(0xFF007AFF),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
}
