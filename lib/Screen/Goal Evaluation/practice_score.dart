// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';

class prac_score extends StatefulWidget {
  final bool saved;
  const prac_score({
    super.key,
    required this.saved,
  });

  @override
  State<prac_score> createState() => _prac_scoreState();
}

class _prac_scoreState extends State<prac_score> {
  bool select_item = true;
  int? pracId;
  bool bt_visible = false;
  bool Loader = true;
  var pracDetails;
  var goalDetails;

  int selectedItemIndex = -1;
  int selectedItemIndex2 = -1;
  int selectedItemIndex3 = -1;
  int selectedItemIndex4 = -1;
  String level = '';

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  List question1 = [
    "No help at all",
    "There is slow\nprogress",
    "There've been\nsome\nprogress",
    "There's been\ngood\nimprovement",
    "It's been very\neffective so\nfar"
  ];

  List question2 = [
    "Didn’t like it,\nnot useful to\nme",
    "It's not been\nbad",
    "I'm starting to\nenjoy it",
    'I quite like\nworking on it',
    "It's been fun\nand truly\nenjoyable"
  ];

  List question3 = [
    "I don't feel\nconfident at\nthis point",
    'I feel it is\npossible',
    'I feel it is\npossible',
    "It's helping me\nalready",
    'Very confident'
  ];

  List question4 = [
    "I feel it's\nalmost\nimpossible",
    'It feels\nchallenging',
    "I find it hard,\nbut willing to\nwork on it",
    'Relatively easy',
    "It's tough\nwork, but I am\nenjoying it"
  ];

  void getPracticeDetail() {
    PracticeGoalApi.getUserPracticeById().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          pracDetails = response;
          pracId = response['id'];
        });
        getGoalDetails(pracDetails["userGoalId"]);

        if (widget.saved == true) {
          getPracticeEval();
        } else {
          print("Unsaved");
        }

        print(pracDetails);
        loadData();
        print("---------------------------------");
      } else {
        print("response:$response");
      }
    }).catchError((error) {
      print("hell");
    }).whenComplete(() {});
  }

  void getGoalDetails(Id) {
    AdminGoal.getUserGoalById(Id).then((response) {
      if (response.length != 0) {
        setState(() {
          goalDetails = response["name"];
        });
      }
    });
  }

  void getPracticeEval() {
    PracticeEvaluation.getPracticeEvaluation().then((response) {
      print("Evaluation called");
      print(response['practiceEvaluation']['question1']);

      if (response.length != 0) {
        setState(() {
          selectedItemIndex = response['practiceEvaluation']['question1'];
          selectedItemIndex2 = response['practiceEvaluation']['question2'];
          selectedItemIndex3 = response['practiceEvaluation']['question3'];
          selectedItemIndex4 = response['practiceEvaluation']['question4'];
          level = response['practiceEvaluation']['totalPoint'].toString();
        });
      }
      print(
          "$selectedItemIndex $selectedItemIndex2 $selectedItemIndex3 $selectedItemIndex4");
    });
  }

  @override
  void initState() {
    super.initState();
    getPracticeDetail();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
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
                  if (widget.saved == true) {
                    Navigator.push(
                        context,
                        FadePageRoute(
                            page: const view_goals(
                          missed: false,
                          name: '',
                          update: false,
                        )));
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3.0,
                  height: AppDimensions.height10(context) * 3.0,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Background.webp'),
            fit: BoxFit.cover,
          )),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/nebula-28 2.webp'),
              fit: BoxFit.cover,
            )),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/nebula-28 1.webp'),
                fit: BoxFit.cover,
              )),
              child: Loader == false
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 36.5,
                            height: AppDimensions.height10(context) * 48.2,
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
                                    const Color(0XFF825179).withOpacity(1)
                                  ]),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 30.1,
                                  height: AppDimensions.height10(context) * 3.6,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          7.1),
                                  child: Text(
                                    'Practice Evaluation',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 32.1,
                                  // height: AppDimensions.height10(context) * 4.4,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.1),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '‘${pracDetails["name"]}’ for goal ‘$goalDetails’ 20 active day',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 32.1,
                                  height: AppDimensions.height10(context) * 1.9,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Text(
                                    'from [dd/mmm/yy] to [dd/mmm/yy]',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 8.7,
                                  height: AppDimensions.height10(context) * 8.7,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFFFFFFFF)),
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            3.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        child: Text(
                                          'Level',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            3.2,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.7,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.saved == true
                                                  ? level
                                                  : pracDetails[
                                                              "practiceLevel"] !=
                                                          null
                                                      ? pracDetails[
                                                              "practiceLevel"]
                                                          .toString()
                                                      : '-',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                            Text(
                                              '/5',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 28.8,
                                  height: AppDimensions.height10(context) * 4.2,
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.3),
                                  child: Text(
                                    'Please assess the practice on helping\nyou reach your goal so far...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10(context) * 2.1,
                                  //height: AppDimensions.height10(context) * 4.3,

                                  child: Image.asset(
                                    'assets/images/Arrow.webp',
                                    width:
                                        AppDimensions.height10(context) * 4.1,
                                    height:
                                        AppDimensions.height10(context) * 4.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 37.0,
                            height: AppDimensions.height10(context) * 11.9,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 15.5,
                                  height: AppDimensions.height10(context) * 2.9,
                                  child: Text(
                                    'Question 1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 37.0,
                                  height: AppDimensions.height10(context) * 4.9,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Text(
                                    'How effective has this practice been in\nmoving you closer to reaching your goal?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              height: AppDimensions.height10(context) * 16.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0,
                                  left:
                                      AppDimensions.height10(context) * 0.425),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: question1.length,
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    return Stack(
                                      children: [
                                        AnimatedScaleButton(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex =
                                                  selectedItemIndex == index1
                                                      ? -1
                                                      : index1;
                                            });
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
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: selectedItemIndex !=
                                                      index1
                                                  ? const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end:
                                                          Alignment.bottomCenter,
                                                      colors: [
                                                          Color(0xFFA88CA5),
                                                          Color(0xFFBF9BA7)
                                                        ])
                                                  : const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                          Color(0XFFFFFFFF),
                                                          Color(0xFFFFFFFF)
                                                        ]),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                height: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: selectedItemIndex ==
                                                          index1
                                                      ? const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end:
                                                              Alignment.bottomCenter,
                                                          colors: [
                                                              Color(0xFFA88CA5),
                                                              Color(0xFFBF9BA7)
                                                            ])
                                                      : const LinearGradient(
                                                          begin:
                                                              Alignment
                                                                  .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                              Color(0XFFFFFFFF),
                                                              Color(0xFFFFFFFF)
                                                            ]),
                                                  // border: Border.all(
                                                  //     width: AppDimensions.height10(context) * 0.3,
                                                  //     color: const Color(0xFF8C648A))
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "${index1 + 1}",
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedItemIndex !=
                                                                    index1
                                                                ? const Color(
                                                                    0xFF8C648A)
                                                                : const Color(
                                                                    0xFFFBFBFB)),
                                                      ),
                                                    ),
                                                    Text(
                                                      question1[index1],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: selectedItemIndex !=
                                                                  index1
                                                              ? const Color(
                                                                  0xFF8C648A)
                                                              : const Color(
                                                                  0xFFFBFBFB)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        selectedItemIndex == index1
                                            ? Align(
                                                alignment:
                                                    const Alignment(0, 0.8),
                                                widthFactor: 3.35,
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          color: const Color(
                                                              0xFFFFFFFF)),
                                                      shape: BoxShape.circle,
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/Tick.webp'))),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    );
                                  })),
                          Container(
                            width: AppDimensions.height10(context) * 7.2,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFFFFFFFF),
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.0,
                                bottom: AppDimensions.height10(context) * 3.0),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 37.0,
                            height: AppDimensions.height10(context) * 10.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 2.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 15.5,
                                  height: AppDimensions.height10(context) * 2.9,
                                  child: Text(
                                    'Question 2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 37.0,
                                  height: AppDimensions.height10(context) * 5.1,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Text(
                                    'How much have you enjoyed performing\nthe practice during this period?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        //height: AppDimensions.height10(context) * 0.12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              enjoyment(context);
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 3.0,
                              height: AppDimensions.height10(context) * 3.0,

                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/ic_info_outline.webp'))),
                              // child: Image.asset(
                              //   "assets/images/ic_info_outline.webp",
                              //   width: AppDimensions.height10(context) * 3.0,
                              //   height: AppDimensions.height10(context) * 3.0,
                              // ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              height: AppDimensions.height10(context) * 16.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0,
                                  left:
                                      AppDimensions.height10(context) * 0.425),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: question2.length,
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    return Stack(
                                      children: [
                                        AnimatedScaleButton(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex2 =
                                                  selectedItemIndex2 == index1
                                                      ? -1
                                                      : index1;
                                            });
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
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: selectedItemIndex2 !=
                                                      index1
                                                  ? const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end:
                                                          Alignment.bottomCenter,
                                                      colors: [
                                                          Color(0xFFA88CA5),
                                                          Color(0xFFBF9BA7)
                                                        ])
                                                  : const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                          Color(0XFFFFFFFF),
                                                          Color(0xFFFFFFFF)
                                                        ]),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                height: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: selectedItemIndex2 ==
                                                          index1
                                                      ? const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end:
                                                              Alignment.bottomCenter,
                                                          colors: [
                                                              Color(0xFFA88CA5),
                                                              Color(0xFFBF9BA7)
                                                            ])
                                                      : const LinearGradient(
                                                          begin:
                                                              Alignment
                                                                  .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                              Color(0XFFFFFFFF),
                                                              Color(0xFFFFFFFF)
                                                            ]),
                                                  // border: Border.all(
                                                  //     width: AppDimensions.height10(context) * 0.3,
                                                  //     color: const Color(0xFF8C648A))
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "${index1 + 1}",
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedItemIndex2 !=
                                                                    index1
                                                                ? const Color(
                                                                    0xFF8C648A)
                                                                : const Color(
                                                                    0xFFFBFBFB)),
                                                      ),
                                                    ),
                                                    Text(
                                                      question2[index1],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: selectedItemIndex2 !=
                                                                  index1
                                                              ? const Color(
                                                                  0xFF8C648A)
                                                              : const Color(
                                                                  0xFFFBFBFB)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        selectedItemIndex2 == index1
                                            ? Align(
                                                alignment:
                                                    const Alignment(0, 0.8),
                                                widthFactor: 3.35,
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          color: const Color(
                                                              0xFFFFFFFF)),
                                                      shape: BoxShape.circle,
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/Tick.webp'))),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    );
                                  })),
                          Container(
                            width: AppDimensions.height10(context) * 7.2,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFFFFFFFF),
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.0,
                                bottom: AppDimensions.height10(context) * 3.0),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 37.0,
                            height: AppDimensions.height10(context) * 11.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 2.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 15.5,
                                  height: AppDimensions.height10(context) * 2.9,
                                  child: Text(
                                    'Question 3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 37.0,
                                  //  height: AppDimensions.height10(context) * 7.0,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Text(
                                    'How confident are you that this\npractice will help move you closer\ntowards your goal?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        // height: 1.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              height: AppDimensions.height10(context) * 16.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0,
                                  left:
                                      AppDimensions.height10(context) * 0.425),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: question3.length,
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    return Stack(
                                      children: [
                                        AnimatedScaleButton(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex3 =
                                                  selectedItemIndex3 == index1
                                                      ? -1
                                                      : index1;
                                            });
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
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: selectedItemIndex3 !=
                                                      index1
                                                  ? const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end:
                                                          Alignment.bottomCenter,
                                                      colors: [
                                                          Color(0xFFA88CA5),
                                                          Color(0xFFBF9BA7)
                                                        ])
                                                  : const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                          Color(0XFFFFFFFF),
                                                          Color(0xFFFFFFFF)
                                                        ]),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                height: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: selectedItemIndex3 ==
                                                          index1
                                                      ? const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end:
                                                              Alignment.bottomCenter,
                                                          colors: [
                                                              Color(0xFFA88CA5),
                                                              Color(0xFFBF9BA7)
                                                            ])
                                                      : const LinearGradient(
                                                          begin:
                                                              Alignment
                                                                  .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                              Color(0XFFFFFFFF),
                                                              Color(0xFFFFFFFF)
                                                            ]),
                                                  // border: Border.all(
                                                  //     width: AppDimensions.height10(context) * 0.3,
                                                  //     color: const Color(0xFF8C648A))
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "${index1 + 1}",
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedItemIndex3 !=
                                                                    index1
                                                                ? const Color(
                                                                    0xFF8C648A)
                                                                : const Color(
                                                                    0xFFFBFBFB)),
                                                      ),
                                                    ),
                                                    Text(
                                                      question3[index1],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: selectedItemIndex3 !=
                                                                  index1
                                                              ? const Color(
                                                                  0xFF8C648A)
                                                              : const Color(
                                                                  0xFFFBFBFB)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        selectedItemIndex3 == index1
                                            ? Align(
                                                alignment:
                                                    const Alignment(0, 0.8),
                                                widthFactor: 3.35,
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          color: const Color(
                                                              0xFFFFFFFF)),
                                                      shape: BoxShape.circle,
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/Tick.webp'))),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    );
                                  })),
                          Container(
                            width: AppDimensions.height10(context) * 7.2,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFFFFFFFF),
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.0,
                                bottom: AppDimensions.height10(context) * 3.0),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 37.0,
                            height: AppDimensions.height10(context) * 11.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 2.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 15.5,
                                  height: AppDimensions.height10(context) * 2.9,
                                  child: Text(
                                    'Question 4',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 37.0,
                                  height: AppDimensions.height10(context) * 6.8,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Text(
                                    'How easy is it to implement this\npractice in to your life?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        //  height: 1.2,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              height: AppDimensions.height10(context) * 16.3,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 4.0,
                                  left:
                                      AppDimensions.height10(context) * 0.425),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: question4.length,
                                  itemBuilder:
                                      (BuildContext context, int index1) {
                                    return Stack(
                                      children: [
                                        AnimatedScaleButton(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex4 =
                                                  selectedItemIndex4 == index1
                                                      ? -1
                                                      : index1;
                                            });
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
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: selectedItemIndex4 !=
                                                      index1
                                                  ? const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end:
                                                          Alignment.bottomCenter,
                                                      colors: [
                                                          Color(0xFFA88CA5),
                                                          Color(0xFFBF9BA7)
                                                        ])
                                                  : const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                          Color(0XFFFFFFFF),
                                                          Color(0xFFFFFFFF)
                                                        ]),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                height: AppDimensions.height10(
                                                            context) *
                                                        12.95 -
                                                    4,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: selectedItemIndex4 ==
                                                          index1
                                                      ? const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end:
                                                              Alignment.bottomCenter,
                                                          colors: [
                                                              Color(0xFFA88CA5),
                                                              Color(0xFFBF9BA7)
                                                            ])
                                                      : const LinearGradient(
                                                          begin:
                                                              Alignment
                                                                  .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                              Color(0XFFFFFFFF),
                                                              Color(0xFFFFFFFF)
                                                            ]),
                                                  // border: Border.all(
                                                  //     width: AppDimensions.height10(context) * 0.3,
                                                  //     color: const Color(0xFF8C648A))
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "${index1 + 1}",
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedItemIndex4 !=
                                                                    index1
                                                                ? const Color(
                                                                    0xFF8C648A)
                                                                : const Color(
                                                                    0xFFFBFBFB)),
                                                      ),
                                                    ),
                                                    Text(
                                                      question4[index1],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: selectedItemIndex4 !=
                                                                  index1
                                                              ? const Color(
                                                                  0xFF8C648A)
                                                              : const Color(
                                                                  0xFFFBFBFB)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        selectedItemIndex4 == index1
                                            ? Align(
                                                alignment:
                                                    const Alignment(0, 0.8),
                                                widthFactor: 3.35,
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      4.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          4.0,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          color: const Color(
                                                              0xFFFFFFFF)),
                                                      shape: BoxShape.circle,
                                                      image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/Tick.webp'))),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    );
                                  })),
                          widget.saved
                              ? Container(
                                  width:
                                      AppDimensions.height10(context) * 38.259,
                                  height:
                                      AppDimensions.height10(context) * 9.707,
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 9.9,
                                      bottom: AppDimensions.height10(context) *
                                          2.193),
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
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.261),
                                        width: AppDimensions.height10(context) *
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
                                        width: AppDimensions.height10(context) *
                                            10.8,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.673,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                1.232),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              //  width: AppDimensions.height10(context) * 4.6,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              //   color: Colors.amber,
                                              child: Text(
                                                'Changes saved',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.3,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFFFFFFFF)),
                                              ),
                                            ),
                                            SizedBox(
                                              // width: AppDimensions.height10(context) * 6.9,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.2,
                                              child: Text(
                                                'Goal Criteria',
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
                                          ],
                                        ),
                                      ),
                                      AnimatedScaleButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.1,
                                          height:
                                              AppDimensions.height10(context) *
                                                  6.0,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  11.2),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFFFFFFF),
                                                width: 1),
                                            borderRadius: BorderRadius.circular(
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
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  width: AppDimensions.height10(context) * 35.4,
                                  height: AppDimensions.height10(context) * 5.0,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          10.9,
                                      bottom: AppDimensions.height10(context) *
                                          3.6),
                                  child: Row(
                                    children: [
                                      AnimatedScaleButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
                                                    5.0),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Cancel',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w600,
                                                color: selectedItemIndex >= 0 ||
                                                        selectedItemIndex2 >=
                                                            0 ||
                                                        selectedItemIndex3 >=
                                                            0 ||
                                                        selectedItemIndex4 >= 0
                                                    ? const Color(0xFFFA9934)
                                                    : const Color(0xFFFA9934)
                                                        .withOpacity(0.5)),
                                          )),
                                        ),
                                      ),
                                      AnimatedScaleButton(
                                        onTap: () {
                                          setState(() {
                                            selectedItemIndex = -1;
                                            selectedItemIndex2 = -1;
                                            selectedItemIndex3 = -1;
                                            selectedItemIndex4 = -1;
                                          });
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.0,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFFFF),
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
                                                    5.0),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Clear',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w600,
                                                color: selectedItemIndex >= 0 ||
                                                        selectedItemIndex2 >=
                                                            0 ||
                                                        selectedItemIndex3 >=
                                                            0 ||
                                                        selectedItemIndex4 >= 0
                                                    ? const Color(0xFFFA9934)
                                                    : const Color(0xFFFA9934)
                                                        .withOpacity(0.5)),
                                          )),
                                        ),
                                      ),
                                      AnimatedScaleButton(
                                        onTap: () {
                                          if (selectedItemIndex < 0 ||
                                              selectedItemIndex2 < 0 ||
                                              selectedItemIndex3 < 0 ||
                                              selectedItemIndex4 < 0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                              'Must select answer from each row',
                                              style: TextStyle(
                                                  color: Colors.red
                                                      .withOpacity(0.8)),
                                            )));
                                          } else {
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
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                18.2,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        AppDimensions.height10(context) *
                                                                            1.4)),
                                                            child: AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          AppDimensions.height10(context) *
                                                                              1.4)),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              actionsPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              titlePadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              title: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(AppDimensions.height10(context) *
                                                                            1.4)),
                                                                margin: EdgeInsets.only(
                                                                    top: AppDimensions.height10(
                                                                            context) *
                                                                        1.9,
                                                                    right: AppDimensions
                                                                            .height10(
                                                                                context) *
                                                                        1.6,
                                                                    left: AppDimensions.height10(
                                                                            context) *
                                                                        1.6,
                                                                    bottom: AppDimensions.height10(
                                                                            context) *
                                                                        0.2),
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    2.2,
                                                                width: AppDimensions
                                                                        .height10(
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
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                              content:
                                                                  Container(
                                                                margin: EdgeInsets.only(
                                                                    bottom:
                                                                        AppDimensions.height10(context) *
                                                                            1.5,
                                                                    left: AppDimensions.height10(
                                                                            context) *
                                                                        1.6,
                                                                    right: AppDimensions.height10(
                                                                            context) *
                                                                        1.6),
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    3.2,
                                                                width: AppDimensions
                                                                        .height10(
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
                                                                        AppDimensions.height10(context) *
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
                                                                        color: const Color(0XFF3C3C43)
                                                                            .withOpacity(0.29),
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
                                                                          PracticeEvaluation()
                                                                              .addPracticeEvaluation(selectedItemIndex + 1, selectedItemIndex2 + 1, selectedItemIndex3 + 1, selectedItemIndex4 + 1, pracId)
                                                                              .then((response) {
                                                                            if (response.length !=
                                                                                0) {
                                                                              Navigator.push(context, FadePageRoute(page: const prac_score(saved: true)));
                                                                              print("Practice evaluation added");
                                                                            }
                                                                          });

                                                                          // Navigator.push(
                                                                          //     context,
                                                                          //     FadePageRoute(
                                                                          //         page:
                                                                          //             your_why(
                                                                          //       saved: true,
                                                                          //       destination:
                                                                          //           widget
                                                                          //               .destination,
                                                                          //     )));
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Yes',
                                                                          style: TextStyle(
                                                                              color: const Color(0xFFFFFFFF),
                                                                              fontSize: AppDimensions.height10(context) * 1.7,
                                                                              fontFamily: "Laila",
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      child:
                                                                          Divider(
                                                                        color: const Color(0XFF3C3C43)
                                                                            .withOpacity(0.29),
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
                                                                              fontSize: AppDimensions.height10(context) * 1.7,
                                                                              fontFamily: "Laila",
                                                                              fontWeight: FontWeight.w400,
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
                                                                        color: const Color(0XFF3C3C43)
                                                                            .withOpacity(0.29),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            )));
                                          }
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  17.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.0,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          decoration: BoxDecoration(
                                            gradient: selectedItemIndex >= 0 &&
                                                    selectedItemIndex2 >= 0 &&
                                                    selectedItemIndex3 >= 0 &&
                                                    selectedItemIndex4 >= 0
                                                ? const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xffFCC10D),
                                                      Color(0xffFDA210),
                                                    ],
                                                  )
                                                : LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      const Color(0xffFCC10D)
                                                          .withOpacity(0.5),
                                                      const Color(0xffFDA210)
                                                          .withOpacity(0.5),
                                                    ],
                                                  ),
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
                                                    5.0),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Save updates',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w600,
                                                color: selectedItemIndex >= 0 &&
                                                        selectedItemIndex2 >=
                                                            0 &&
                                                        selectedItemIndex3 >=
                                                            0 &&
                                                        selectedItemIndex4 >= 0
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.5)),
                                          )),
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
          ),
        ),
      ),
    );
  }
}

void enjoyment(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10(context) * 39.4,
          height: AppDimensions.height10(context) * 62.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(AppDimensions.height10(context) * 2.0),
                  topRight:
                      Radius.circular(AppDimensions.height10(context) * 2.0)),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.height10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 30.7,
                height: AppDimensions.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'How we define\n‘enjoyment’',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.15,
                      fontSize: AppDimensions.height10(context) * 3.0,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensions.height10(context) * 35.2,
                  //  height: AppDimensions.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
                  child: RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.4,
                              fontFamily: 'laila',
                              height: AppDimensions.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                        TextSpan(text: 'When we talk about'),
                        TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "we generally mean a\nsatisfying experience of performing a certain action.\n\nHowever,"),
                        TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "can mean different things for\ndifferent people depending on time, environment and\ncontext.\n\nFor Potenic and this question specifically,"),
                        TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "means few things:\n\n1. Feeling empowered\n2. Being in control\n3. Making progress\n4. Having choice\n5. Having freedom\n\nWhen you evaluate your practice for this question, just bear this in mind to help you :)")
                      ]))),
            ],
          )),
    ),
  );
}
