
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/menu_dashboard_behaviour.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/progress_report.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeMenu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/practiceScoreCircle.dart';

import '../../utils/app_dimensions.dart';
import '../Capture Inspiration Journey/Widgets/updateBox.dart';
import '../Capture Inspiration Journey/inpiration_landing.dart';

class prac_score extends StatefulWidget {
  final int index;
  final String route;
  final String secondaryRoute;

  const prac_score(
      {super.key,
        required this.route,
        required this.index,
        required this.secondaryRoute});
  @override
  State<prac_score> createState() => _prac_scoreState();
}

class _prac_scoreState extends State<prac_score> {
  bool select_item = true;
  int? pracId;
  bool bt_visible = false;
  bool disable = false;
  bool Loader = true;
  var pracDetails;
  var goalDetails;
  bool saved = false;
  int selectedItemIndex = -1;
  int selectedItemIndex2 = -1;
  int selectedItemIndex3 = -1;
  int selectedItemIndex4 = -1;
  String level = '';
  String activeDate = '';
  String reportDate = '';

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
    'I believe in it',
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
    PracticeGoalApi.getUserPracticeById()
        .then((response) {
      if (response.length != 0) {
        setState(() {
          pracDetails = response;
          pracId = response['id'];
        });

        getGoalDetails(pracDetails["userGoalId"]);

        fetchPracticeAssesment();

        loadData();
      } else {}
    })
        .catchError((error) {})
        .whenComplete(() {});
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

  void stateChange() {
    setState(() {
      saved = false;
      disable = true;
    });
  }

  void startTimer() {
    Timer(const Duration(seconds: 4), () {
      stateChange();
    });
  }

  void getPracticeEval() {
    PracticeEvaluation.getPracticeEvaluation().then((response) {
      if (response.length != 0) {
        setState(() {
          selectedItemIndex =
          response['practiceEvaluation']['question1'] != null
              ? response['practiceEvaluation']['question1'] - 1
              : -1;
          selectedItemIndex2 =
          response['practiceEvaluation']['question2'] != null
              ? response['practiceEvaluation']['question2'] - 1
              : -1;
          selectedItemIndex3 =
          response['practiceEvaluation']['question3'] != null
              ? response['practiceEvaluation']['question3'] - 1
              : -1;
          selectedItemIndex4 =
          response['practiceEvaluation']['question4'] != null
              ? response['practiceEvaluation']['question4'] - 1
              : -1;
          level =
          response['practiceEvaluation']['totalPoint'].toString() == 'null'
              ? '-'
              : response['practiceEvaluation']['totalPoint'].toString();
          activeDate =
          response['practiceEvaluation']['activeDate'].toString() == 'null'
              ? '-'
              : response['practiceEvaluation']['createdAt']
              .toString()
              .substring(0, 10);
        });
      }
    });
  }

  void fetchPracticeAssesment() async {
    PracticeEvaluation.getPracriceAssesment().then((response) {
      if (response.length != 0) {
        if (widget.index < 0) {
          int i = response['practiceEvaluations'].length - 1;

          setState(() {
            selectedItemIndex =
            response['practiceEvaluations'][i]['question1'] != null
                ? response['practiceEvaluations'][i]['question1'] - 1
                : -1;
            selectedItemIndex2 =
            response['practiceEvaluations'][i]['question2'] != null
                ? response['practiceEvaluations'][i]['question2'] - 1
                : -1;
            selectedItemIndex3 =
            response['practiceEvaluations'][i]['question3'] != null
                ? response['practiceEvaluations'][i]['question3'] - 1
                : -1;
            selectedItemIndex4 =
            response['practiceEvaluations'][i]['question4'] != null
                ? response['practiceEvaluations'][i]['question4'] - 1
                : -1;
            level = response['practiceEvaluations'][i]['totalPoint']
                .toString() ==
                'null'
                ? '-'
                : response['practiceEvaluations'][i]['totalPoint'].toString();
            activeDate = response['practiceEvaluations'][i]['activeDate']
                .toString() ==
                'null'
                ? '-'
                : response['practiceEvaluations'][i]['activeDate'].toString();
            reportDate =
            response['practiceEvaluations'][i]['endDate'].toString() ==
                'null'
                ? '-'
                : response['practiceEvaluations'][i]['endDate']
                .toString()
                .substring(0, 10);
          });
        } else if (widget.index >= 0) {
          setState(() {
            selectedItemIndex = response['practiceEvaluations'][widget.index]
            ['question1'] !=
                null
                ? response['practiceEvaluations'][widget.index]['question1'] - 1
                : -1;
            selectedItemIndex2 = response['practiceEvaluations'][widget.index]
            ['question2'] !=
                null
                ? response['practiceEvaluations'][widget.index]['question2'] - 1
                : -1;
            selectedItemIndex3 = response['practiceEvaluations'][widget.index]
            ['question3'] !=
                null
                ? response['practiceEvaluations'][widget.index]['question3'] - 1
                : -1;
            selectedItemIndex4 = response['practiceEvaluations'][widget.index]
            ['question4'] !=
                null
                ? response['practiceEvaluations'][widget.index]['question4'] - 1
                : -1;
            level = response['practiceEvaluations'][widget.index]['totalPoint']
                .toString() ==
                'null'
                ? '-'
                : response['practiceEvaluations'][widget.index]['totalPoint']
                .toString();
            activeDate = response['practiceEvaluations'][widget.index]
            ['activeDate']
                .toString() ==
                'null'
                ? '-'
                : response['practiceEvaluations'][widget.index]['activeDate']
                .toString();
            reportDate = response['practiceEvaluations'][widget.index]
            ['endDate']
                .toString() ==
                'null'
                ? '-'
                : response['practiceEvaluations'][widget.index]['endDate']
                .toString()
                .substring(0, 10);
          });
        }
      }
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
      onWillPop: () async {
        if (widget.route == 'pracice_menu_completed') {
          Navigator.pushReplacement(
              context, FadePageRouteReverse(page: const menu_behaviour()));
        } else if (widget.route == 'pracice_menu') {
          Navigator.pushReplacement(
              context,
              FadePageRouteReverse(
                  page: const practiceMenu(
                    goal_eval: false,
                    completed: false,
                  )));
        } else if (widget.route == 'assesment') {
          Navigator.pushReplacement(
              context,
              FadePageRouteReverse(
                  page: practice_assesment(
                    days: 0,
                    route: widget.secondaryRoute,
                  )));
        } else if (widget.route == 'report') {
          Navigator.pushReplacement(
              context,
              FadePageRouteReverse(
                  page: ProgressReport(
                    index: widget.index,
                  )));
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
              child: Buttons().backButton(context, () {
                if (widget.route == 'pracice_menu_completed') {
                  Navigator.pushReplacement(
                      context, FadePageRouteReverse(page: const menu_behaviour()));
                } else if (widget.route == 'pracice_menu') {
                  Navigator.pushReplacement(
                      context,
                      FadePageRouteReverse(
                          page: const practiceMenu(
                            goal_eval: false,
                            completed: false,
                          )));
                } else if (widget.route == 'assesment') {
                  Navigator.pushReplacement(
                      context,
                      FadePageRouteReverse(
                          page: practice_assesment(
                            days: 0,
                            route: widget.secondaryRoute,
                          )));
                } else if (widget.route == 'report') {
                  Navigator.pushReplacement(
                      context,
                      FadePageRouteReverse(
                          page: ProgressReport(
                            index: widget.index,
                          )));
                }
              })
            //  IconButton(
            //     onPressed: () {
            //       if (widget.route == 'pracice_menu_completed') {
            //         Navigator.pushReplacement(context,
            //             FadePageRouteReverse(page: const menu_behaviour()));
            //       } else if (widget.route == 'pracice_menu') {
            //         Navigator.pushReplacement(
            //             context,
            //             FadePageRouteReverse(
            //                 page: const practiceMenu(
            //               goal_eval: false,
            //               completed: false,
            //             )));
            //       } else if (widget.route == 'assesment') {
            //         Navigator.pushReplacement(
            //             context,
            //             FadePageRouteReverse(
            //                 page: practice_assesment(
            //               days: 0,
            //               route: widget.secondaryRoute,
            //             )));
            //       } else if (widget.route == 'report') {
            //         Navigator.pushReplacement(
            //             context,
            //             FadePageRouteReverse(
            //                 page: ProgressReport(
            //               index: widget.index,
            //             )));
            //       }
            //     },
            //     icon: Image.asset(
            //       'assets/images/Back.webp',
            //       // width: AppDimensions.width10(context) * 3.0,
            //       height: AppDimensions.height10(context) * 3.0,
            //       fit: BoxFit.contain,
            //     )),

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
                      width: AppDimensions.width10(context) * 36.5,
                      height: AppDimensions.height10(context) * 55.2,
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
                            width: AppDimensions.width10(context) * 30.1,
                            //  height: AppDimensions.height10(context) * 3.6,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    7.1),
                            child: Text(
                              'Practice Evaluation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 3.5,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 32.1,
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
                                  AppDimensions.font10(context) * 2.0,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 32.1,
                            //  height: AppDimensions.height10(context) * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    1.3),
                            child: Text(
                              'from ${activeDate != '' ? formatDate(activeDate) : activeDate} to ${reportDate != '' ? formatDate(reportDate) : reportDate}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 8.7,
                            height: AppDimensions.width10(context) * 8.7,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    3.2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: AppDimensions.width10(context) *
                                      0.1,
                                  color: const Color(0xFFFFFFFF)),
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) *
                                      3.4,
                                  height:
                                  AppDimensions.height10(context) *
                                      1.6,
                                  child: Text(
                                    'Level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.font10(
                                            context) *
                                            1.4,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.width10(context) *
                                      3.2,
                                  height:
                                  AppDimensions.height10(context) *
                                      3.7,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        level,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                            AppDimensions.font10(
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
                                            AppDimensions.font10(
                                                context) *
                                                1.8,
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
                            width: AppDimensions.width10(context) * 28.8,
                            height: AppDimensions.height10(context) * 4.5,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    3.3),
                            child: Text(
                              'Please assess the practice on helping\nyou reach your goal so far...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(
                                bottom:
                                AppDimensions.height10(context) * 1),
                            // width: AppDimensions.width10(context) * 2.1,
                            //height: AppDimensions.height10(context) * 4.3,

                            child: Image.asset(
                              'assets/images/Arrow.webp',
                              width: AppDimensions.width10(context) * 4.1,
                              height:
                              AppDimensions.height10(context) * 4.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 37.0,
                      height: AppDimensions.height10(context) * 11.9,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 4.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.width10(context) * 15.5,
                            height: AppDimensions.height10(context) * 2.9,
                            child: Text(
                              'Question 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 37.0,
                            height: AppDimensions.height10(context) * 5.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    1.3),
                            child: Text(
                              'How effective has this practice been in\nmoving you closer to reaching your goal?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 1.9,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: AppDimensions.width10(context) * 17,
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
                              return PracticeScoreCircle(
                                onTap: () {
                                  setState(() {
                                    if (saved != true) {
                                      selectedItemIndex =
                                      selectedItemIndex == index1
                                          ? -1
                                          : index1;
                                    }
                                  });
                                },
                                selectedIndex: selectedItemIndex,
                                index1: index1,
                                question: question1,
                              );
                              // Stack(
                              //   children: [
                              //     AnimatedScaleButton(
                              //       onTap: () {
                              //         setState(() {
                              //           if (saved != true) {
                              //             selectedItemIndex =
                              //                 selectedItemIndex == index1
                              //                     ? -1
                              //                     : index1;
                              //           }
                              //         });
                              //       },
                              //       child: Container(
                              //         width:
                              //             AppDimensions.width10(context) *
                              //                 15.0,
                              //         height:
                              //             AppDimensions.width10(context) *
                              //                 15.0,
                              //         margin: EdgeInsets.only(
                              //             right: AppDimensions.height10(
                              //                     context) *
                              //                 1.5),
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           gradient: selectedItemIndex !=
                              //                   index1
                              //               ? const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end:
                              //                       Alignment.bottomCenter,
                              //                   colors: [
                              //                       Color(0xFFA88CA5),
                              //                       Color(0xFFBF9BA7)
                              //                     ])
                              //               : const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end: Alignment
                              //                       .bottomCenter,
                              //                   colors: [
                              //                       Color(0XFFFFFFFF),
                              //                       Color(0xFFFFFFFF)
                              //                     ]),
                              //         ),
                              //         child: Center(
                              //           child: Container(
                              //             width: AppDimensions.width10(
                              //                         context) *
                              //                     14.95 -
                              //                 4,
                              //             height: AppDimensions.width10(
                              //                         context) *
                              //                     14.95 -
                              //                 4,
                              //             decoration: BoxDecoration(
                              //               shape: BoxShape.circle,
                              //               gradient: selectedItemIndex ==
                              //                       index1
                              //                   ? const LinearGradient(
                              //                       begin: Alignment
                              //                           .topCenter,
                              //                       end:
                              //                           Alignment.bottomCenter,
                              //                       colors: [
                              //                           Color(0xFFA88CA5),
                              //                           Color(0xFFBF9BA7)
                              //                         ])
                              //                   : const LinearGradient(
                              //                       begin:
                              //                           Alignment
                              //                               .topCenter,
                              //                       end: Alignment
                              //                           .bottomCenter,
                              //                       colors: [
                              //                           Color(0XFFFFFFFF),
                              //                           Color(0xFFFFFFFF)
                              //                         ]),
                              //               // border: Border.all(
                              //               //     width: AppDimensions.width10(context) * 0.3,
                              //               //     color: const Color(0xFF8C648A))
                              //             ),
                              //             child: Column(
                              //               // mainAxisAlignment:
                              //               //     MainAxisAlignment.center,
                              //               children: [
                              //                 Container(
                              //                   margin: EdgeInsets.only(
                              //                       top: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           1),
                              //                   child: Text(
                              //                     "${index1 + 1}",
                              //                     style: TextStyle(
                              //                         fontSize: AppDimensions
                              //                                 .height10(
                              //                                     context) *
                              //                             3.2,
                              //                         fontWeight:
                              //                             FontWeight.w500,
                              //                         color: selectedItemIndex !=
                              //                                 index1
                              //                             ? const Color(
                              //                                 0xFF8C648A)
                              //                             : const Color(
                              //                                 0xFFFBFBFB)),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(
                              //                       top: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           0.8),
                              //                   child: Text(
                              //                     question1[index1],
                              //                     textAlign:
                              //                         TextAlign.center,
                              //                     style: TextStyle(
                              //                         fontSize: AppDimensions
                              //                                 .font10(
                              //                                     context) *
                              //                             1.6,
                              //                         fontWeight:
                              //                             FontWeight.w400,
                              //                         color: selectedItemIndex !=
                              //                                 index1
                              //                             ? const Color(
                              //                                 0xFF8C648A)
                              //                             : const Color(
                              //                                 0xFFFBFBFB)),
                              //                   ),
                              //                 )
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     selectedItemIndex == index1
                              //         ? Align(
                              //             alignment:
                              //                 const Alignment(0.3, 0.93),
                              //             widthFactor: 3.35,
                              //             child: Container(
                              //               width: AppDimensions.width10(
                              //                       context) *
                              //                   3.8,
                              //               height: AppDimensions.width10(
                              //                       context) *
                              //                   3.8,
                              //               decoration: BoxDecoration(
                              //                   border: Border.all(
                              //                       width: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           0.1,
                              //                       color: const Color(
                              //                           0xFFFFFFFF)),
                              //                   shape: BoxShape.circle,
                              //                   image: const DecorationImage(
                              //                       image: AssetImage(
                              //                           'assets/images/Tick.webp'))),
                              //             ),
                              //           )
                              //         : Container()

                              //   ],
                              //  );
                            })),
                    Container(
                      width: AppDimensions.width10(context) * 7.2,
                      height: AppDimensions.height10(context) * 0.1,
                      color: const Color(0xFFFFFFFF),
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.0,
                          bottom: AppDimensions.height10(context) * 3.0),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 37.0,
                      height: AppDimensions.height10(context) * 10.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.width10(context) * 15.5,
                            height: AppDimensions.height10(context) * 2.9,
                            child: Text(
                              'Question 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 37.0,
                            height: AppDimensions.height10(context) * 5.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    1.3),
                            child: Text(
                              'How much have you enjoyed performing\nthe practice during this period?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 1.9,
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
                        width: AppDimensions.width10(context) * 3.0,
                        height: AppDimensions.height10(context) * 3.0,

                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ic_info_outline.webp'))),
                        // child: Image.asset(
                        //   "assets/images/ic_info_outline.webp",
                        //   width: AppDimensions.width10(context) * 3.0,
                        //   height: AppDimensions.height10(context) * 3.0,
                        // ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: AppDimensions.width10(context) * 17,
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
                              return PracticeScoreCircle(
                                onTap: () {
                                  if (saved != true) {
                                    setState(() {
                                      selectedItemIndex2 =
                                      selectedItemIndex2 == index1
                                          ? -1
                                          : index1;
                                    });
                                  }
                                },
                                selectedIndex: selectedItemIndex2,
                                question: question2,
                                index1: index1,
                              );
                              // Stack(
                              //   children: [
                              //     AnimatedScaleButton(
                              //       onTap: () {
                              //         if (saved != true) {
                              //           setState(() {
                              //             selectedItemIndex2 =
                              //                 selectedItemIndex2 == index1
                              //                     ? -1
                              //                     : index1;
                              //           });
                              //         }
                              //       },
                              //       child: Container(
                              //         width:
                              //             AppDimensions.width10(context) *
                              //                 15,
                              //         height:
                              //             AppDimensions.width10(context) *
                              //                 15,
                              //         margin: EdgeInsets.only(
                              //             right: AppDimensions.height10(
                              //                     context) *
                              //                 1.5),
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           gradient: selectedItemIndex2 !=
                              //                   index1
                              //               ? const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end:
                              //                       Alignment.bottomCenter,
                              //                   colors: [
                              //                       Color(0xFFA88CA5),
                              //                       Color(0xFFBF9BA7)
                              //                     ])
                              //               : const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end: Alignment
                              //                       .bottomCenter,
                              //                   colors: [
                              //                       Color(0XFFFFFFFF),
                              //                       Color(0xFFFFFFFF)
                              //                     ]),
                              //         ),
                              //         child: Center(
                              //           child: Container(
                              //             width: AppDimensions.width10(
                              //                         context) *
                              //                     14.95 -
                              //                 4,
                              //             height: AppDimensions.width10(
                              //                         context) *
                              //                     14.95 -
                              //                 4,
                              //             decoration: BoxDecoration(
                              //               shape: BoxShape.circle,
                              //               gradient: selectedItemIndex2 ==
                              //                       index1
                              //                   ? const LinearGradient(
                              //                       begin: Alignment
                              //                           .topCenter,
                              //                       end:
                              //                           Alignment.bottomCenter,
                              //                       colors: [
                              //                           Color(0xFFA88CA5),
                              //                           Color(0xFFBF9BA7)
                              //                         ])
                              //                   : const LinearGradient(
                              //                       begin:
                              //                           Alignment
                              //                               .topCenter,
                              //                       end: Alignment
                              //                           .bottomCenter,
                              //                       colors: [
                              //                           Color(0XFFFFFFFF),
                              //                           Color(0xFFFFFFFF)
                              //                         ]),
                              //               // border: Border.all(
                              //               //     width: AppDimensions.width10(context) * 0.3,
                              //               //     color: const Color(0xFF8C648A))
                              //             ),
                              //             child: Column(
                              //               // mainAxisAlignment:
                              //               //     MainAxisAlignment.center,
                              //               children: [
                              //                 Container(
                              //                   margin: EdgeInsets.only(
                              //                       top: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           1),
                              //                   child: Text(
                              //                     "${index1 + 1}",
                              //                     style: TextStyle(
                              //                         fontSize: AppDimensions
                              //                                 .height10(
                              //                                     context) *
                              //                             3.2,
                              //                         fontWeight:
                              //                             FontWeight.w500,
                              //                         color: selectedItemIndex2 !=
                              //                                 index1
                              //                             ? const Color(
                              //                                 0xFF8C648A)
                              //                             : const Color(
                              //                                 0xFFFBFBFB)),
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   margin: EdgeInsets.only(
                              //                       top: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           1),
                              //                   child: Text(
                              //                     question2[index1],
                              //                     textAlign:
                              //                         TextAlign.center,
                              //                     style: TextStyle(
                              //                         fontSize: AppDimensions
                              //                                 .font10(
                              //                                     context) *
                              //                             1.6,
                              //                         fontWeight:
                              //                             FontWeight.w400,
                              //                         color: selectedItemIndex2 !=
                              //                                 index1
                              //                             ? const Color(
                              //                                 0xFF8C648A)
                              //                             : const Color(
                              //                                 0xFFFBFBFB)),
                              //                   ),
                              //                 )
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     selectedItemIndex2 == index1
                              //         ? Align(
                              //             alignment:
                              //                 const Alignment(0.3, 0.92),
                              //             widthFactor: 3.35,
                              //             child: Container(
                              //               width: AppDimensions.width10(
                              //                       context) *
                              //                   3.8,
                              //               height: AppDimensions.width10(
                              //                       context) *
                              //                   3.8,
                              //               decoration: BoxDecoration(
                              //                   border: Border.all(
                              //                       width: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           0.1,
                              //                       color: const Color(
                              //                           0xFFFFFFFF)),
                              //                   shape: BoxShape.circle,
                              //                   image: const DecorationImage(
                              //                       image: AssetImage(
                              //                           'assets/images/Tick.webp'))),
                              //             ),
                              //           )
                              //         : Container()
                              //   ],
                              // );
                            })),
                    Container(
                      width: AppDimensions.width10(context) * 7.2,
                      height: AppDimensions.height10(context) * 0.1,
                      color: const Color(0xFFFFFFFF),
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.0,
                          bottom: AppDimensions.height10(context) * 3.0),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 37.0,
                      height: AppDimensions.height10(context) * 12.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.width10(context) * 15.5,
                            height: AppDimensions.height10(context) * 2.9,
                            child: Text(
                              'Question 3',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 37.0,
                            //  height: AppDimensions.height10(context) * 7.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    1.3),
                            child: Text(
                              'How confident are you that this\npractice will help move you closer\ntowards your goal?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 1.9,
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
                        height: AppDimensions.width10(context) * 17,
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
                              return PracticeScoreCircle(
                                onTap: () {
                                  if (saved != true) {
                                    setState(() {
                                      selectedItemIndex3 =
                                      selectedItemIndex3 == index1
                                          ? -1
                                          : index1;
                                    });
                                  }
                                },
                                selectedIndex: selectedItemIndex3,
                                index1: index1,
                                question: question3,
                              );
                              // Stack(
                              //   children: [
                              //     AnimatedScaleButton(
                              //       onTap: () {
                              //         if (saved != true) {
                              //           setState(() {
                              //             selectedItemIndex3 =
                              //                 selectedItemIndex3 == index1
                              //                     ? -1
                              //                     : index1;
                              //           });
                              //         }
                              //       },
                              //       child: Container(
                              //         width:
                              //             AppDimensions.width10(context) *
                              //                 12.95,
                              //         height:
                              //             AppDimensions.width10(context) *
                              //                 12.95,
                              //         margin: EdgeInsets.only(
                              //             right: AppDimensions.height10(
                              //                     context) *
                              //                 1.5),
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           gradient: selectedItemIndex3 !=
                              //                   index1
                              //               ? const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end:
                              //                       Alignment.bottomCenter,
                              //                   colors: [
                              //                       Color(0xFFA88CA5),
                              //                       Color(0xFFBF9BA7)
                              //                     ])
                              //               : const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end: Alignment
                              //                       .bottomCenter,
                              //                   colors: [
                              //                       Color(0XFFFFFFFF),
                              //                       Color(0xFFFFFFFF)
                              //                     ]),
                              //         ),
                              //         child: Center(
                              //           child: Container(
                              //             width: AppDimensions.width10(
                              //                         context) *
                              //                     12.95 -
                              //                 4,
                              //             height: AppDimensions.width10(
                              //                         context) *
                              //                     12.95 -
                              //                 4,
                              //             decoration: BoxDecoration(
                              //               shape: BoxShape.circle,
                              //               gradient: selectedItemIndex3 ==
                              //                       index1
                              //                   ? const LinearGradient(
                              //                       begin: Alignment
                              //                           .topCenter,
                              //                       end:
                              //                           Alignment.bottomCenter,
                              //                       colors: [
                              //                           Color(0xFFA88CA5),
                              //                           Color(0xFFBF9BA7)
                              //                         ])
                              //                   : const LinearGradient(
                              //                       begin:
                              //                           Alignment
                              //                               .topCenter,
                              //                       end: Alignment
                              //                           .bottomCenter,
                              //                       colors: [
                              //                           Color(0XFFFFFFFF),
                              //                           Color(0xFFFFFFFF)
                              //                         ]),
                              //               // border: Border.all(
                              //               //     width: AppDimensions.width10(context) * 0.3,
                              //               //     color: const Color(0xFF8C648A))
                              //             ),
                              //             child: Column(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 Container(
                              //                   child: Text(
                              //                     "${index1 + 1}",
                              //                     style: TextStyle(
                              //                         fontSize: AppDimensions
                              //                                 .height10(
                              //                                     context) *
                              //                             3.2,
                              //                         fontWeight:
                              //                             FontWeight.w500,
                              //                         color: selectedItemIndex3 !=
                              //                                 index1
                              //                             ? const Color(
                              //                                 0xFF8C648A)
                              //                             : const Color(
                              //                                 0xFFFBFBFB)),
                              //                   ),
                              //                 ),
                              //                 Text(
                              //                   question3[index1],
                              //                   textAlign:
                              //                       TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: AppDimensions
                              //                               .font10(
                              //                                   context) *
                              //                           1.46,
                              //                       fontWeight:
                              //                           FontWeight.w400,
                              //                       color: selectedItemIndex3 !=
                              //                               index1
                              //                           ? const Color(
                              //                               0xFF8C648A)
                              //                           : const Color(
                              //                               0xFFFBFBFB)),
                              //                 )
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     selectedItemIndex3 == index1
                              //         ? Align(
                              //             alignment:
                              //                 const Alignment(0, 0.8),
                              //             widthFactor: 3.35,
                              //             child: Container(
                              //               width: AppDimensions.width10(
                              //                       context) *
                              //                   4.0,
                              //               height: AppDimensions.width10(
                              //                       context) *
                              //                   4.0,
                              //               decoration: BoxDecoration(
                              //                   border: Border.all(
                              //                       width: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           0.1,
                              //                       color: const Color(
                              //                           0xFFFFFFFF)),
                              //                   shape: BoxShape.circle,
                              //                   image: const DecorationImage(
                              //                       image: AssetImage(
                              //                           'assets/images/Tick.webp'))),
                              //             ),
                              //           )
                              //         : Container()
                              //   ],
                              // );
                            })),
                    Container(
                      width: AppDimensions.width10(context) * 7.2,
                      height: AppDimensions.height10(context) * 0.1,
                      color: const Color(0xFFFFFFFF),
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.0,
                          bottom: AppDimensions.height10(context) * 3.0),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 37.0,
                      height: AppDimensions.height10(context) * 11.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.width10(context) * 15.5,
                            height: AppDimensions.height10(context) * 2.9,
                            child: Text(
                              'Question 4',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 37.0,
                            height: AppDimensions.height10(context) * 6.8,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) *
                                    1.3),
                            child: Text(
                              'How easy is it to implement this\npractice in to your life?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(context) * 1.9,
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
                        height: AppDimensions.width10(context) * 17,
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
                              return PracticeScoreCircle(
                                onTap: () {
                                  if (saved != true) {
                                    setState(() {
                                      selectedItemIndex4 =
                                      selectedItemIndex4 == index1
                                          ? -1
                                          : index1;
                                    });
                                  }
                                },
                                selectedIndex: selectedItemIndex4,
                                index1: index1,
                                question: question4,
                              );
                              // Stack(
                              //   children: [
                              //     AnimatedScaleButton(
                              //       onTap: () {
                              //         if (saved != true) {
                              //           setState(() {
                              //             selectedItemIndex4 =
                              //                 selectedItemIndex4 == index1
                              //                     ? -1
                              //                     : index1;
                              //           });
                              //         }
                              //       },
                              //       child: Container(
                              //         width:
                              //             AppDimensions.width10(context) *
                              //                 12.95,
                              //         height:
                              //             AppDimensions.width10(context) *
                              //                 12.95,
                              //         margin: EdgeInsets.only(
                              //             right: AppDimensions.height10(
                              //                     context) *
                              //                 1.5),
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           gradient: selectedItemIndex4 !=
                              //                   index1
                              //               ? const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end:
                              //                       Alignment.bottomCenter,
                              //                   colors: [
                              //                       Color(0xFFA88CA5),
                              //                       Color(0xFFBF9BA7)
                              //                     ])
                              //               : const LinearGradient(
                              //                   begin:
                              //                       Alignment.topCenter,
                              //                   end: Alignment
                              //                       .bottomCenter,
                              //                   colors: [
                              //                       Color(0XFFFFFFFF),
                              //                       Color(0xFFFFFFFF)
                              //                     ]),
                              //         ),
                              //         child: Center(
                              //           child: Container(
                              //             width: AppDimensions.width10(
                              //                         context) *
                              //                     12.95 -
                              //                 4,
                              //             height: AppDimensions.width10(
                              //                         context) *
                              //                     12.95 -
                              //                 4,
                              //             decoration: BoxDecoration(
                              //               shape: BoxShape.circle,
                              //               gradient: selectedItemIndex4 ==
                              //                       index1
                              //                   ? const LinearGradient(
                              //                       begin: Alignment
                              //                           .topCenter,
                              //                       end:
                              //                           Alignment.bottomCenter,
                              //                       colors: [
                              //                           Color(0xFFA88CA5),
                              //                           Color(0xFFBF9BA7)
                              //                         ])
                              //                   : const LinearGradient(
                              //                       begin:
                              //                           Alignment
                              //                               .topCenter,
                              //                       end: Alignment
                              //                           .bottomCenter,
                              //                       colors: [
                              //                           Color(0XFFFFFFFF),
                              //                           Color(0xFFFFFFFF)
                              //                         ]),
                              //               // border: Border.all(
                              //               //     width: AppDimensions.width10(context) * 0.3,
                              //               //     color: const Color(0xFF8C648A))
                              //             ),
                              //             child: Column(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.center,
                              //               children: [
                              //                 Container(
                              //                   child: Text(
                              //                     "${index1 + 1}",
                              //                     style: TextStyle(
                              //                         fontSize: AppDimensions
                              //                                 .height10(
                              //                                     context) *
                              //                             3.2,
                              //                         fontWeight:
                              //                             FontWeight.w500,
                              //                         color: selectedItemIndex4 !=
                              //                                 index1
                              //                             ? const Color(
                              //                                 0xFF8C648A)
                              //                             : const Color(
                              //                                 0xFFFBFBFB)),
                              //                   ),
                              //                 ),
                              //                 Text(
                              //                   question4[index1],
                              //                   textAlign:
                              //                       TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: AppDimensions
                              //                               .font10(
                              //                                   context) *
                              //                           1.46,
                              //                       fontWeight:
                              //                           FontWeight.w400,
                              //                       color: selectedItemIndex4 !=
                              //                               index1
                              //                           ? const Color(
                              //                               0xFF8C648A)
                              //                           : const Color(
                              //                               0xFFFBFBFB)),
                              //                 )
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     selectedItemIndex4 == index1
                              //         ? Align(
                              //             alignment:
                              //                 const Alignment(0, 0.8),
                              //             widthFactor: 3.35,
                              //             child: Container(
                              //               width: AppDimensions.width10(
                              //                       context) *
                              //                   4.0,
                              //               height: AppDimensions.width10(
                              //                       context) *
                              //                   4.0,
                              //               decoration: BoxDecoration(
                              //                   border: Border.all(
                              //                       width: AppDimensions
                              //                               .height10(
                              //                                   context) *
                              //                           0.1,
                              //                       color: const Color(
                              //                           0xFFFFFFFF)),
                              //                   shape: BoxShape.circle,
                              //                   image: const DecorationImage(
                              //                       image: AssetImage(
                              //                           'assets/images/Tick.webp'))),
                              //             ),
                              //           )
                              //         : Container()
                              //   ],
                              // );
                            })),
                    saved
                        ? Container(
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) *
                              3.6),
                      child: Center(
                        child: updateBox(
                          headText: "Changes saved",
                          bodyText: 'Practice Score',
                          onTap1: () {
                            setState(() {
                              saved = false;
                            });
                          },
                          functionText: 'Undo',
                          edit: false,
                          FadeFunction: () {
                            stateChange();
                          },
                        ),
                      ),
                    )
                        : Container(
                      width: AppDimensions.width10(context) * 35.4,
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
                              if (disable == false) {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              width:
                              AppDimensions.width10(context) *
                                  8.0,
                              height:
                              AppDimensions.height10(context) *
                                  5.0,
                              decoration: BoxDecoration(
                                color: disable
                                    ? const Color(0xFFFFFFFF)
                                    .withOpacity(0.4)
                                    : const Color(0xFFFFFFFF),
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
                                        fontSize: AppDimensions.font10(
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
                              if (disable == false) {
                                setState(() {
                                  selectedItemIndex = -1;
                                  selectedItemIndex2 = -1;
                                  selectedItemIndex3 = -1;
                                  selectedItemIndex4 = -1;
                                });
                              }
                            },
                            child: Container(
                              width:
                              AppDimensions.width10(context) *
                                  8.0,
                              height:
                              AppDimensions.height10(context) *
                                  5.0,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(
                                      context) *
                                      1.0),
                              decoration: BoxDecoration(
                                color: disable
                                    ? const Color(0xFFFFFFFF)
                                    .withOpacity(0.4)
                                    : const Color(0xFFFFFFFF),
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
                                        fontSize: AppDimensions.font10(
                                            context) *
                                            2.0,
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
                              if (disable == false) {
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
                                      animationType: DialogTransitionType
                                          .fadeScale,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(
                                          seconds: 1),
                                      builder: (BuildContext
                                      context) =>
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
                                                  borderRadius: BorderRadius
                                                      .circular(
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
                                                            PracticeEvaluation()
                                                                .updatePracticeEvaluation(
                                                                selectedItemIndex + 1,
                                                                selectedItemIndex2 + 1,
                                                                selectedItemIndex3 + 1,
                                                                selectedItemIndex4 + 1)
                                                                .then((response) {
                                                              if (response ==
                                                                  true) {
                                                                Navigator.pop(context);
                                                                setState(() {
                                                                  saved = true;
                                                                  level = "${((selectedItemIndex + selectedItemIndex2 + selectedItemIndex3 + selectedItemIndex4 + 4) / 4).round()}";
                                                                });
                                                                startTimer();
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
                                                                    2.0,
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
                                }
                              }
                            },
                            child: Container(
                              width:
                              AppDimensions.width10(context) *
                                  17.4,
                              height:
                              AppDimensions.height10(context) *
                                  5.0,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(
                                      context) *
                                      1.0),
                              decoration: BoxDecoration(
                                gradient: disable == true
                                    ? LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xffFCC10D)
                                        .withOpacity(0.4),
                                    const Color(0xffFDA210)
                                        .withOpacity(0.4),
                                  ],
                                )
                                    : selectedItemIndex >= 0 &&
                                    selectedItemIndex2 >=
                                        0 &&
                                    selectedItemIndex3 >=
                                        0 &&
                                    selectedItemIndex4 >= 0
                                    ? const LinearGradient(
                                  begin:
                                  Alignment.topCenter,
                                  end: Alignment
                                      .bottomCenter,
                                  colors: [
                                    Color(0xffFCC10D),
                                    Color(0xffFDA210),
                                  ],
                                )
                                    : LinearGradient(
                                  begin:
                                  Alignment.topCenter,
                                  end: Alignment
                                      .bottomCenter,
                                  colors: [
                                    const Color(
                                        0xffFCC10D)
                                        .withOpacity(0.5),
                                    const Color(
                                        0xffFDA210)
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
                                        fontSize: AppDimensions
                                            .height10(context) *
                                            2.0,
                                        fontWeight: FontWeight.w600,
                                        color: selectedItemIndex >= 0 &&
                                            selectedItemIndex2 >=
                                                0 &&
                                            selectedItemIndex3 >=
                                                0 &&
                                            selectedItemIndex4 >=
                                                0 ||
                                            disable == false
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
          width: AppDimensions.width10(context) * 40,
          // height: AppDimensions.height10(context) * 64.4,
          padding: EdgeInsets.only(bottom: AppDimensions.height10(context) * 3),
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.width10(context) * 1.5),
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
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 30.7,
                //height: AppDimensions.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  "How we define\n‘enjoyment’?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.8,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensions.width10(context) * 33.2,
                  //  height: AppDimensions.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
                  child: RichText(
                      //textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
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
                                "we generally mean a satisfying experience of performing a certain action.\n\nHowever,"),
                        TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                " mean different things for different people depending on time, environment and context.\n\nFor Potenic ,"),
                        TextSpan(
                            text: ' ‘enjoyment’ ',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(
                            text:
                                "means few things:\n\n1. Having an “I can do it” attitude\n2. Believing in yourself\n3. Making a progress\n4. Having a choice\n5. Having a freedom\n\nWhen you evaluate your practice for this question, just bear this in mind:)")
                      ]))),
            ],
          )),
    ),
  );
}
