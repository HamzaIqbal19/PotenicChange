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

class your_impact extends StatefulWidget {
  final int index;
  final bool premium;
  const your_impact({
    super.key,
    required this.index,
    required this.premium,
  });

  @override
  State<your_impact> createState() => _your_impactState();
}

class _your_impactState extends State<your_impact> {
  List options = [
    'It makes my\nlife worse\n',
    'It causes me a\nlot of distress\n',
    "I've noticed\nsome positive\nchanges",
    "I feel good\nabout it\n",
    "It's changing\nmy life\npositively :)"
  ];
  List options2 = [
    'It properly\nupsets me\n',
    'Slightly\nfrustrated and\nuneasy',
    "It doesn't\nbother me\n",
    "Positive that\nI'm taking the\nright actions",
    "Empowered\nand good\nabout myself"
  ];

  List messages = [
    "It hasn’t started to impact my life",
    "It has little impact on my life",
    "It has positive impact on my life",
    "It has a significant impact on my life",
    "It's impacting my life positively and consistently"
  ];
  int select_item_2 = -1;
  int select_item = -1;
  int reset_item_1 = -1;
  int reset_item_2 = -1;
  bool bt_visible = false;
  bool saved = false;
  bool disable = false;
  int level = 0;
  bool Loader = true;
  var goalDetails;
  bool visible = false;
  double swipeOffset = 0.0;
  void startTimer() {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        visible = false;
        saved = false;
        disable = true;
      });
    });
  }

  void undoTimer() {
    setState(() {
      visible = false;
      saved = false;
      disable = false;
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchGoalDetails() {
    AdminGoal.getUserGoal()
        .then((response) async {
          if (response.length != 0) {
            setState(() {
              goalDetails = response;
              level = goalDetails['goalEvaluations'][widget.index]
                  ["impactOnYourSelf"]['level'];
              select_item = goalDetails['goalEvaluations'][widget.index]
                      ["impactOnYourSelf"]['currentImpact'] -
                  1;
              select_item_2 = goalDetails['goalEvaluations'][widget.index]
                      ["impactOnYourSelf"]['currentEmotions'] -
                  1;
              reset_item_1 = goalDetails['goalEvaluations'][widget.index]
                      ["impactOnYourSelf"]['currentImpact'] -
                  1;
              reset_item_2 = goalDetails['goalEvaluations'][widget.index]
                      ["impactOnYourSelf"]['currentEmotions'] -
                  1;
            });

            loadData();
            final SharedPreferences prefs = await _prefs;
            await prefs.setInt('goal_eval_id',
                response["goalEvaluations"][widget.index]["id"]);
          } else {
            loadData();
          }
        })
        .catchError((error) {})
        .whenComplete(() {
          loadData();
        });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalDetails();
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
                      height: AppDimensions.height10(context) * 3.2,
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
                                Navigator.push(
                                    context,
                                    FadePageRouteReverse(
                                        page: new_progress_score(
                                      premium: widget.premium,
                                      evaluationIndex: widget.index,
                                    )));
                                setState(() {
                                  select_item = -1;
                                  select_item_2 = -1;
                                });
                              },
                              child: Center(
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
          setState(() {
            select_item = -1;
            select_item_2 = -1;
          });
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
                                        AppDimensions.height10(context) * 1.6,
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
                                height: AppDimensions.height10(context) * 3.4,
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
                                                premium: widget.premium,
                                                evaluationIndex: widget.index,
                                              )));
                                          setState(() {
                                            select_item = -1;
                                            select_item_2 = -1;
                                          });
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
                          premium: widget.premium,
                          evaluationIndex: widget.index,
                        )));
                    setState(() {
                      select_item = -1;
                      select_item_2 = -1;
                    });
                  }
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  // width: AppDimensions.width10(context) * 3.0,
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
                                'Goal Criteria 4',
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
                              height: AppDimensions.height10(context) * 3.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0),
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Impact on your life',
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
                              height: AppDimensions.width10(context) * 8.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 3.2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.1,
                                    color: const Color(0xFFFFFFFF)),
                                shape: BoxShape.circle,
                                color:
                                    goalDetails['goalLevel'] == 0 && level == 0
                                        ? Colors.transparent
                                        : const Color(0xFFFFFFFF),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 3.4,
                                    height:
                                        AppDimensions.height10(context) * 1.6,
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
                                          goalDetails['goalLevel'] == 0 &&
                                                  level == 0
                                              ? '-'
                                              : level.toString(),
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
                              //height: AppDimensions.height10(context) * 7.3,
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
                                    child: SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 21.4,
                                      // height:
                                      //     AppDimensions.height10(context) * 7.3,

                                      ///color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          goalDetails['goalLevel'] == null ||
                                                  goalDetails['goalLevel'] ==
                                                      0 ||
                                                  level == 0
                                              ? "Score needed"
                                              : '${messages[level - 1]}',
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
                              height: AppDimensions.height10(context) * 4.5,
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.9),
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
                      Container(
                        width: AppDimensions.width10(context) * 37.0,
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
                                'Current impact',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.4,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 37.0,
                              height: AppDimensions.height10(context) * 2.2,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.3),
                              child: Text(
                                'How this goal is impacting your life?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    fontWeight: FontWeight.w500,
                                    height:
                                        AppDimensions.height10(context) * 0.15,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.width10(context) * 16.3,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0,
                            left: AppDimensions.width10(context) * 0.425),
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index1) {
                              return AnimatedScaleButton(
                                onTap: () {
                                  if (disable != true &&
                                      widget.premium == true) {
                                    setState(() {
                                      select_item = index1;
                                    });
                                  }
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 12.95,
                                  height:
                                      AppDimensions.width10(context) * 12.95,
                                  margin: EdgeInsets.only(
                                      right:
                                          AppDimensions.width10(context) * 1.5),
                                  child: Stack(children: [
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 13.0,
                                      height:
                                          AppDimensions.width10(context) * 13.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: select_item != index1
                                              ? const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Color(0XFFF5F5F5),
                                                      Color(0XFFF5F5F5)
                                                    ])
                                              : const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Color(0XFFFA9E71),
                                                      Color(0xFFF9B87E)
                                                    ]),
                                          border: Border.all(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.3,
                                              color: select_item != index1
                                                  ? const Color(0xFFEE8F70)
                                                  : const Color(0xFFFFFFFF))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${index1 + 1}',
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    3.1,
                                                fontWeight: FontWeight.w500,
                                                color: select_item != index1
                                                    ? const Color(0xFFFA9934)
                                                    : const Color(0xFFFFFFFF)),
                                          ),
                                          Text(
                                            options[index1],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.46,
                                                fontWeight: FontWeight.w400,
                                                color: select_item != index1
                                                    ? const Color(0xFFFA9934)
                                                    : const Color(0xFFFFFFFF)),
                                          )
                                        ],
                                      ),
                                    ),
                                    select_item != index1
                                        ? Container()
                                        : Align(
                                            alignment: const Alignment(0, 0.8),
                                            child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              padding: EdgeInsets.all(
                                                  AppDimensions.height10(
                                                          context) *
                                                      0.2),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              0.1,
                                                      color: const Color(
                                                          0xFFFFFFFF))),
                                              child: Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            0.1,
                                                        color: const Color(
                                                            0xFFFFFFFF)),
                                                    shape: BoxShape.circle,
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
                        height: AppDimensions.height10(context) * 0.1,
                        color: const Color(0xFF437296),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0,
                            bottom: AppDimensions.height10(context) * 3.0),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 37.0,
                        //  height: AppDimensions.height10(context) * 11.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              //width: AppDimensions.width10(context) * 15.5,
                              height: AppDimensions.height10(context) * 2.9,
                              child: Text(
                                'Current emotions',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.4,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 37.0,
                              //height: AppDimensions.height10(context) * 6.8,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.3),
                              child: Text(
                                'How does it make you feel?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    fontWeight: FontWeight.w500,
                                    height:
                                        AppDimensions.height10(context) * 0.15,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.width10(context) * 16.3,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0,
                            left: AppDimensions.width10(context) * 0.425),
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: options2.length,
                            itemBuilder: (BuildContext context, int index1) {
                              return AnimatedScaleButton(
                                onTap: () {
                                  if (disable != true &&
                                      widget.premium == true) {
                                    setState(() {
                                      select_item_2 = index1;
                                    });
                                  }
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 13.0,
                                  height: AppDimensions.width10(context) * 13.0,
                                  margin: EdgeInsets.only(
                                      right:
                                          AppDimensions.width10(context) * 1.5),
                                  child: Stack(children: [
                                    Container(
                                      width: AppDimensions.width10(context) *
                                          12.95,
                                      height: AppDimensions.width10(context) *
                                          12.95,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: select_item_2 != index1
                                              ? const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Color(0XFFF5F5F5),
                                                      Color(0XFFF5F5F5)
                                                    ])
                                              : const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Color(0XFFFA9E71),
                                                      Color(0xFFF9B87E)
                                                    ]),
                                          border: Border.all(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.3,
                                              color: select_item_2 != index1
                                                  ? const Color(0xFFEE8F70)
                                                  : const Color(0xFFFFFFFF))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${index1 + 1}',
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    3.1,
                                                fontWeight: FontWeight.w500,
                                                color: select_item_2 != index1
                                                    ? const Color(0xFFFA9934)
                                                    : const Color(0xFFFFFFFF)),
                                          ),
                                          Text(
                                            options2[index1],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.46,
                                                fontWeight: FontWeight.w400,
                                                color: select_item_2 != index1
                                                    ? const Color(0xFFFA9934)
                                                    : const Color(0xFFFFFFFF)),
                                          )
                                        ],
                                      ),
                                    ),
                                    select_item_2 != index1
                                        ? Container()
                                        : Align(
                                            alignment: const Alignment(0, 0.8),
                                            child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              padding: EdgeInsets.all(
                                                  AppDimensions.height10(
                                                          context) *
                                                      0.2),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              0.1,
                                                      color: const Color(
                                                          0xFFFFFFFF))),
                                              child: Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            0.1,
                                                        color: const Color(
                                                            0xFFFFFFFF)),
                                                    shape: BoxShape.circle,
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
                                          disable = false;
                                        });
                                        undoTimer();
                                      },
                                      functionText: 'Undo',
                                      FadeFunction: () {},
                                      edit: false),
                                )
                              : Container()
                          : Container(
                              width: AppDimensions.width10(context) * 35.4,
                              height: AppDimensions.height10(context) * 5.0,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 7.5,
                                  bottom:
                                      AppDimensions.height10(context) * 9.5),
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
                                                                setState(() {
                                                                  select_item =
                                                                      -1;
                                                                  select_item_2 =
                                                                      -1;
                                                                });
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
                                              color: const Color(0xFFFA9934)),
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
                                                          select_item =
                                                              reset_item_1;
                                                          select_item_2 =
                                                              reset_item_2;
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
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
                                        if (select_item != -1 &&
                                            select_item_2 != -1) {
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
                                                                        setState(
                                                                            () {
                                                                          level =
                                                                              ((select_item + select_item_2 + 2) / 2).round();
                                                                        });

                                                                        GoalEvaluationApi()
                                                                            .updateEvaluation(
                                                                          "impactOnYourSelf",
                                                                          {
                                                                            "level":
                                                                                level,
                                                                            "currentImpact":
                                                                                (select_item + 1),
                                                                            "currentEmotions":
                                                                                (select_item_2 + 1)
                                                                          },
                                                                        ).then((response) {
                                                                          print(
                                                                              "criteria update response $response");
                                                                          if (response ==
                                                                              true) {
                                                                            setState(() {
                                                                              saved = true;
                                                                              visible = true;
                                                                              disable = true;
                                                                            });
                                                                            startTimer();
                                                                          }
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
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
                                        gradient:
                                            //  bt_visible
                                            //     ?
                                            LinearGradient(
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
                  color: const Color(0xFFF5F5F5),
                  padding: EdgeInsets.zero,
                  height: AppDimensions.height10(context) * 7.7,
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

Widget showSaveWithout(
  BuildContext context,
) {
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
        height: AppDimensions.height10(context) * 3.2,
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

Widget showAlertBox(BuildContext context, onTap) {
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
        height: AppDimensions.height10(context) * 3.2,
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
                  onTap;
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
