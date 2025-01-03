import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_summary.dart';
import 'package:potenic_app/Widgets/AppCustomCircle.dart';
import 'package:potenic_app/Widgets/alertbox.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'splash_hurdles.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class hurdles_goal_impact extends StatefulWidget {
  final bool summary;
  const hurdles_goal_impact({super.key, required this.summary});

  @override
  State<hurdles_goal_impact> createState() => _hurdles_goal_impactState();
}

class _hurdles_goal_impactState extends State<hurdles_goal_impact> {
  int selectBox = -1;
  int selectinActive = -1;
  var hurdlesSummary;
  var goals = [];
  bool loading = true;
  List<Map<String, dynamic>> active = [];
  List<Map<String, dynamic>> inActive = [];
  List<int> selectedIndices = [];
  List<int> selectedInActiveIndices = [];
  bool selectAll = false;

  List selectedGoals = [];
  List multiGoals = [];
  List allgoalsSelected = [];

  Future<void> saveGoalsToSharedPreferences(List goals) async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = json.encode(goals);
    prefs.setString('selected_goals', encodedGoals);
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void _fetchUserGoal() {
    AdminGoal.getUserGoalByUserId().then((response) {
      setState(() {
        goals = response;
      });
      if (widget.summary == true) {
        _fetchHurdleSummary();
      } else {
        getHurdleRoute();
      }
      loadData();
      _newFunction();
    });
  }

  Future<Timer> clearData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesSummary = response['hurdle']['userGoalId'];
        });
        _sort();
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  _sort() {
    if (hurdlesSummary.length >= goals.length) {
      setState(() {
        selectAll = true;
      });
    }
    for (int i = 0; i <= goals.length; i++) {
      if (goals[i]['isActive'] == true) {
        if (hurdlesSummary.contains(goals[i]['id'])) {
          multiGoals.add(goals[i]['id']);
          selectedIndices.add(active.indexOf(goals[i]));
        }
      } else {
        if (hurdlesSummary.contains(goals[i]['id'])) {
          multiGoals.add(goals[i]['id']);
          selectedInActiveIndices.add(inActive.indexOf(goals[i]));
        }
      }
    }
  }

  void checkHurdle() async {
    Hurdles()
        .checkUserHurdles()
        .then((response) {
          if (response == true) {
            Navigator.push(
              context,
              FadePageRouteReverse(page: const landing_hurdles()),
            );

            return response;
          } else if (response == false) {
            Navigator.push(
                context, FadePageRouteReverse(page: const hurdles_splash()));
          }
        })
        .catchError((error) {})
        .whenComplete(() {});
  }

  _newFunction() {
    for (int i = 0; i <= goals.length; i++) {
      if (goals[i]['isActive'] == true) {
        active.add(goals[i]);
        allgoalsSelected.add(goals[i]['id']);
      } else {
        inActive.add(goals[i]);
        allgoalsSelected.add(goals[i]['id']);
      }
    }
  }

  var route;

  void getHurdleRoute() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      route = prefs.getString('HurdleRoute').toString().isEmpty
          ? ''
          : prefs.getString('HurdleRoute');
    });

    // multiGoals.clear();
    // allgoalsSelected.clear();
    if (prefs.getString('HurdleRoute') != null) {
      getHurdleGoals();
    }
  }

  void getHurdleGoals() async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = prefs.getString('selected_goals');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      if (decodedGoals.length >= goals.length) {
        setState(() {
          selectAll = true;
        });
      }
      for (int i = 0; i <= goals.length; i++) {
        if (goals[i]['isActive'] == true) {
          if (decodedGoals.contains(goals[i]['id'])) {
            multiGoals.add(goals[i]['id']);
            selectedIndices.add(active.indexOf(goals[i]));
          }
        } else {
          if (decodedGoals.contains(goals[i]['id'])) {
            multiGoals.add(goals[i]['id']);
            selectedInActiveIndices.add(inActive.indexOf(goals[i]));
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchUserGoal();
  }

  @override
  Widget build(BuildContext context) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.width10(context) * 18.9,
            height: AppDimensions.height10(context) * 2.8,
            child: Row(
              children: [
                //increasing font size through out title in hurdles by 2 px
                //change was requested by clients
                GradientText(
                  AppText().captureHurdle1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Laila',
                    fontSize: AppDimensions.font10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Laila',
                    fontSize: AppDimensions.font10(context) * 2.2,
                    fontWeight: FontWeight.w400,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: Buttons().closeButton(context, () {
                widget.summary
                    ? Navigator.pop(context)
                    : AlertBox().alertDialog(context, "Hurdle?", () async {
                        checkHurdle();
                        final SharedPreferences prefs = await _prefs;

                        await prefs.remove('HurdleRoute');
                        await prefs.remove('hurdleName');
                        await prefs.remove('NameHurdle');
                        await prefs.remove('hurdleStatement');
                        await prefs.remove('hurdleId');
                        await prefs.remove('selected_goals');
                        await prefs.remove("hurdle_selected");
                      });
              }),
              // IconButton(
              //     onPressed: () {
              //       widget.summary
              //           ? Navigator.pop(context)
              //           : AlertBox().alertDialog(context, "Hurdle?", () async {
              //               checkHurdle();
              //               final SharedPreferences prefs = await _prefs;

              //               await prefs.remove('HurdleRoute');
              //               await prefs.remove('hurdleName');
              //               await prefs.remove('NameHurdle');
              //               await prefs.remove('hurdleStatement');
              //               await prefs.remove('hurdleId');
              //               await prefs.remove('selected_goals');
              //               await prefs.remove("hurdle_selected");
              //             });
              //       // showAnimatedDialog(
              //       //     animationType: DialogTransitionType.fadeScale,
              //       //     curve: Curves.easeInOut,
              //       //     duration: const Duration(seconds: 1),
              //       //     context: context,
              //       //     builder: (BuildContext context) => SizedBox(
              //       //           width: AppDimensions.width10(context) * 27.0,
              //       //           height:
              //       //               AppDimensions.height10(context) * 24.0,
              //       //           child: AlertDialog(
              //       //             shape: RoundedRectangleBorder(
              //       //                 borderRadius: BorderRadius.circular(
              //       //                     AppDimensions.height10(context) *
              //       //                         1.4)),
              //       //             contentPadding: EdgeInsets.zero,
              //       //             actionsPadding: EdgeInsets.zero,
              //       //             titlePadding: EdgeInsets.zero,
              //       //             title: Container(
              //       //               margin: const EdgeInsets.only(
              //       //                   top: 19,
              //       //                   right: 16,
              //       //                   left: 16,
              //       //                   bottom: 2),
              //       //               height:
              //       //                   AppDimensions.height10(context) * 2.2,
              //       //               width:
              //       //                   AppDimensions.width10(context) * 23.8,
              //       //               child: const Text(
              //       //                 "Exit hurdle?",
              //       //                 textAlign: TextAlign.center,
              //       //                 style: TextStyle(
              //       //                   fontSize: 17,
              //       //                   fontWeight: FontWeight.w400,
              //       //                 ),
              //       //               ),
              //       //             ),
              //       //             content: Container(
              //       //               margin: const EdgeInsets.only(
              //       //                   bottom: 19, left: 16, right: 16),
              //       //               height:
              //       //                   AppDimensions.height10(context) * 1.6,
              //       //               width: 238,
              //       //               child: const Text(
              //       //                 "Please select from the options below",
              //       //                 textAlign: TextAlign.center,
              //       //                 style: TextStyle(
              //       //                   fontSize: 13,
              //       //                   fontWeight: FontWeight.w400,
              //       //                 ),
              //       //               ),
              //       //             ),
              //       //             actions: <Widget>[
              //       //               Column(
              //       //                 children: [
              //       //                   // SizedBox(
              //       //                   //   height: AppDimensions.height10(
              //       //                   //           context) *
              //       //                   //       0.1,
              //       //                   //   child: Divider(
              //       //                   //     color: const Color(0XFF3C3C43)
              //       //                   //         .withOpacity(0.29),
              //       //                   //   ),
              //       //                   // ),
              //       //                   // SizedBox(
              //       //                   //   height: 42,
              //       //                   //   width: double.infinity,
              //       //                   //   child: TextButton(
              //       //                   //     onPressed: () async {
              //       //                   //       checkHurdle();
              //       //                   //       final SharedPreferences prefs =
              //       //                   //           await _prefs;
              //       //                   //       await prefs.setString(
              //       //                   //           'HurdleRoute', 'Impact');
              //       //                   //       if (selectAll == true ||
              //       //                   //           multiGoals.isNotEmpty) {
              //       //                   //         if (selectAll == true) {
              //       //                   //           saveGoalsToSharedPreferences(
              //       //                   //               allgoalsSelected);
              //       //                   //         } else {
              //       //                   //           saveGoalsToSharedPreferences(
              //       //                   //               multiGoals);
              //       //                   //         }
              //       //                   //       }
              //       //                   //     },
              //       //                   //     child: const Text(
              //       //                   //       'Exit & save progress',
              //       //                   //       style: TextStyle(
              //       //                   //           color: Color(0xFF007AFF),
              //       //                   //           fontSize: 17,
              //       //                   //           fontFamily: "Laila",
              //       //                   //           fontWeight:
              //       //                   //               FontWeight.w400),
              //       //                   //     ),
              //       //                   //   ),
              //       //                   // ),
              //       //                   SizedBox(
              //       //                     height: AppDimensions.height10(
              //       //                             context) *
              //       //                         0.1,
              //       //                     child: Divider(
              //       //                       color: const Color(0XFF3C3C43)
              //       //                           .withOpacity(0.29),
              //       //                     ),
              //       //                   ),
              //       //                   SizedBox(
              //       //                     height: 44,
              //       //                     width: double.infinity,
              //       //                     child: TextButton(
              //       //                       onPressed: () async {
              //       //                         checkHurdle();
              //       //                         final SharedPreferences prefs =
              //       //                             await _prefs;

              //       //                         await prefs
              //       //                             .remove('HurdleRoute');
              //       //                         await prefs
              //       //                             .remove('hurdleName');
              //       //                         await prefs
              //       //                             .remove('NameHurdle');
              //       //                         await prefs
              //       //                             .remove('hurdleStatement');
              //       //                         await prefs.remove('hurdleId');
              //       //                         await prefs
              //       //                             .remove('selected_goals');
              //       //                         await prefs
              //       //                             .remove("hurdle_selected");
              //       //                       },
              //       //                       child: const Text(
              //       //                         'Exit & delete progress',
              //       //                         style: TextStyle(
              //       //                             fontSize: 17,
              //       //                             fontFamily: "Laila",
              //       //                             fontWeight: FontWeight.w400,
              //       //                             color: Color(0xFF007AFF)),
              //       //                       ),
              //       //                     ),
              //       //                   ),
              //       //                   SizedBox(
              //       //                     height: AppDimensions.height10(
              //       //                             context) *
              //       //                         0.1,
              //       //                     child: Divider(
              //       //                       color: const Color(0XFF3C3C43)
              //       //                           .withOpacity(0.29),
              //       //                     ),
              //       //                   ),
              //       //                   Container(
              //       //                     height: 42,
              //       //                     width: double.infinity,
              //       //                     margin: EdgeInsets.only(
              //       //                         bottom: AppDimensions.height10(
              //       //                                 context) *
              //       //                             1.0),
              //       //                     child: TextButton(
              //       //                       onPressed: () {
              //       //                         Navigator.pop(context);
              //       //                       },
              //       //                       child: const Text(
              //       //                         'Cancel exit',
              //       //                         style: TextStyle(
              //       //                             color: Color(0xFF007AFF),
              //       //                             fontSize: 17,
              //       //                             fontFamily: "Laila",
              //       //                             fontWeight:
              //       //                                 FontWeight.w400),
              //       //                       ),
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ],
              //       //           ),
              //       //         ));
              //     },
              //     icon: Image.asset(
              //       'assets/images/Close.webp',
              //       // width: AppDimensions.width10(context) * 2.6,
              //       height: AppDimensions.height10(context) * 2.6,
              //       fit: BoxFit.contain,
              //     )),
            )
          ]),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.width10(context) * 6),
        child: AnimatedScaleButton(
          onTap: () async {
            if (widget.summary == true) {
              if (selectAll == true || multiGoals.length != 0) {
                if (selectAll == true) {
                  Hurdles().updateHurdle('userGoalId', allgoalsSelected);
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page: const summary_hurdles(delete_hurdle: false)));
                } else {
                  Hurdles().updateHurdle('userGoalId', multiGoals);
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page: const summary_hurdles(delete_hurdle: false)));
                }
              }
            } else {
              final SharedPreferences prefs = await _prefs;
              await prefs.setString('HurdleRoute', 'data');
              if (selectAll == true || multiGoals.length != 0) {
                if (selectAll == true) {
                  saveGoalsToSharedPreferences(allgoalsSelected);
                  Navigator.push(
                    context,
                    FadePageRoute(
                        page: const select_hurdle(
                      update: false,
                    )),
                  );
                } else {
                  saveGoalsToSharedPreferences(multiGoals);
                  Navigator.push(
                    context,
                    FadePageRoute(
                        page: const select_hurdle(
                      update: false,
                    )),
                  );
                }
              }
            }
          },
          child: Container(
            height: AppDimensions.height10(context) * 5.2,
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 1.0,
                bottom: AppDimensions.height10(context) * 2.6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  selectAll == true || multiGoals.length != 0
                      ? const Color(0xffFCC10D)
                      : const Color(0xffFCC10D).withOpacity(0.5),
                  selectAll == true || multiGoals.length != 0
                      ? const Color(0xffFDA210)
                      : const Color(0xffFDA210).withOpacity(0.5),
                ],
              ),
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 5.0),
            ),
            child: Center(
                child: Text(
              widget.summary
                  ? "Update Summary"
                  : selectAll == true
                      ? '(${allgoalsSelected.length}/${goals.length} goals selected) Next'
                      : '(${multiGoals.length}/${goals.length} goals selected) Next',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Laila',
                  fontSize: UpdatedDimensions.font10(context) * 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.webp'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: loading == false
            ? Container(
                child: Column(children: [
                  Container(
                    height: AppDimensions.height10(context) * 70.0,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 9.3,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: AppDimensions.width10(context) * 34.3,
                              height: AppDimensions.height10(context) * 7.75,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 8.7),
                              child: Center(
                                //Text alingment changes
                                child: GradientText(
                                  AppText().captureHurdle1Body,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Laila',
                                    fontSize:
                                        AppDimensions.font10(context) * 2.8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  colors: const [
                                    Color(0xffFA9934),
                                    Color(0xffEDD15E)
                                  ],
                                ),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                if (selectAll == false) {
                                  setState(() {
                                    selectAll = true;
                                    selectBox = -1;
                                    selectinActive = -1;
                                    selectedIndices.clear();
                                    selectedInActiveIndices.clear();
                                    multiGoals.clear();
                                  });
                                  for (int i = 0; i < active.length; i++) {
                                    selectedIndices.add(i);
                                    multiGoals.add(active[i]['id']);
                                  }
                                  for (int i = 0; i < inActive.length; i++) {
                                    selectedInActiveIndices.add(i);
                                    multiGoals.add(inActive[i]['id']);
                                  }
                                } else if (selectAll == true) {
                                  setState(() {
                                    selectAll = false;
                                    selectinActive = -1;
                                    selectBox = -1;
                                    selectedIndices.clear();
                                    selectedInActiveIndices.clear();
                                    selectedGoals.clear();
                                    multiGoals.clear();
                                  });
                                }
                              },
                              child: Container(
                                width: !smallScreen
                                    ? AppDimensions.width10(context) * 16.5
                                    : AppDimensions.width10(context) * 13.5,
                                height: !smallScreen
                                    ? AppDimensions.width10(context) * 16.5
                                    : AppDimensions.width10(context) * 13.5,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 1.5,
                                    top: AppDimensions.height10(context) * 2.9),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: selectAll == true
                                            ? AppDimensions.width10(context) *
                                                0.2
                                            : 0,
                                        color: selectAll == true
                                            ? Colors.white
                                            : Colors.transparent)),
                                padding: EdgeInsets.all(
                                    AppDimensions.width10(context) * 0.8),
                                child: AppCustomCircle().CustomContainer(
                                  context,
                                  border: Border.all(
                                      width:
                                          AppDimensions.width10(context) * 0.1,
                                      color: Colors.white),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffBE3FC6),
                                        Color(0xff642445)
                                      ]),
                                  // Container(
                                  //   width: !smallScreen
                                  //       ? AppDimensions.width10(context) * 15.1
                                  //       : AppDimensions.width10(context) * 13.1,
                                  //   height: !smallScreen
                                  //       ? AppDimensions.width10(context) * 15.1
                                  //       : AppDimensions.width10(context) * 13.1,
                                  //   decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //           width:
                                  //               AppDimensions.width10(context) *
                                  //                   0.1,
                                  //           color: Colors.white),
                                  //       gradient: const LinearGradient(
                                  //           begin: Alignment.topCenter,
                                  //           end: Alignment.bottomCenter,
                                  //           colors: [
                                  //             Color(0xffBE3FC6),
                                  //             Color(0xff642445)
                                  //           ])),
                                  child: Center(
                                    child: Text(
                                      'All goals',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              //width: AppDimensions.width10(context) * 12.4,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 1.5,
                                  top: AppDimensions.height10(context) * 2.0),
                              child: Center(
                                child: Text(
                                  AppText().activeGoals,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.2,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: !smallScreen
                                      ? AppDimensions.width10(context) * 1.5
                                      : AppDimensions.width10(context) * 6,
                                  top: AppDimensions.height10(context) * 1.0,
                                  right: AppDimensions.width10(context) * 1.5,
                                  bottom:
                                      AppDimensions.height10(context) * 2.0),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio:
                                        3.5 / 3, // Two items in each row

                                    mainAxisSpacing: 9.0,
                                    crossAxisSpacing: 3,
                                  ),
                                  itemCount: active.length,
                                  itemBuilder: ((context, index) {
                                    return AnimatedScaleButton(
                                      onTap: () {
                                        setState(() {
                                          if (selectedIndices.contains(index)) {
                                            multiGoals
                                                .remove(active[index]['id']);
                                            selectedIndices.remove(index);
                                          } else {
                                            selectedIndices.add(index);
                                            multiGoals.add(active[index]['id']);
                                          }
                                        });
                                        setState(() {
                                          selectAll = false;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: !smallScreen
                                                ? AppDimensions.width10(
                                                        context) *
                                                    2.5
                                                : AppDimensions.width10(
                                                        context) *
                                                    3),
                                        height: selectedIndices
                                                    .contains(index) ||
                                                selectAll == true
                                            ? AppDimensions.height10(context) *
                                                14.1
                                            : AppDimensions.height10(context) *
                                                13.1,
                                        width: selectedIndices
                                                    .contains(index) ||
                                                selectAll == true
                                            ? AppDimensions.height10(context) *
                                                14.1
                                            : AppDimensions.height10(context) *
                                                13.1,
                                        padding: EdgeInsets.all(
                                            AppDimensions.width10(context) *
                                                0.8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: selectedIndices
                                                          .contains(index) ||
                                                      selectAll == true
                                                  ? AppDimensions.width10(
                                                          context) *
                                                      0.2
                                                  : 0,
                                              color: selectedIndices
                                                          .contains(index) ||
                                                      selectAll == true
                                                  ? Colors.white
                                                  : Colors.transparent),
                                        ),
                                        child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  13.1,
                                          width:
                                              AppDimensions.height10(context) *
                                                  13.1,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: AppDimensions.width10(
                                                      context) *
                                                  0.8),
                                          // margin: EdgeInsets.only(
                                          //   right:
                                          //       AppDimensions.height10(context) * 4.5,
                                          // ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      0.1,
                                                  color: Colors.white),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffBE3FC6),
                                                    Color(0xff642445)
                                                  ])),
                                          child: Center(
                                            child: Text(
                                              active[index]['name'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                            Container(
                              //width: AppDimensions.width10(context) * 13.7,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.width10(context) * 19.5,
                                  left: AppDimensions.width10(context) * 2.8),
                              child: Center(
                                child: Text(
                                  AppText().inActiveGoals,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.2,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: !smallScreen
                                      ? AppDimensions.width10(context) * 1.5
                                      : AppDimensions.width10(context) * 6,
                                  top: AppDimensions.height10(context) * 1.0,
                                  right: AppDimensions.width10(context) * 1.5,
                                  bottom:
                                      AppDimensions.height10(context) * 2.0),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio:
                                        3.5 / 3, // Two items in each row

                                    mainAxisSpacing: 9.0,
                                    crossAxisSpacing: 3,
                                  ),
                                  itemCount: inActive.length,
                                  itemBuilder: ((context, index) {
                                    return AnimatedScaleButton(
                                      onTap: () {
                                        setState(() {
                                          if (selectedInActiveIndices
                                              .contains(index)) {
                                            multiGoals
                                                .remove(inActive[index]['id']);
                                            selectedInActiveIndices
                                                .remove(index);
                                          } else {
                                            multiGoals
                                                .add(inActive[index]['id']);
                                            selectedInActiveIndices.add(index);
                                          }
                                        });
                                        setState(() {
                                          selectAll = false;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: !smallScreen
                                                ? AppDimensions.width10(
                                                        context) *
                                                    2.5
                                                : AppDimensions.width10(
                                                        context) *
                                                    3),
                                        height: selectedInActiveIndices
                                                    .contains(index) ||
                                                selectAll == true
                                            ? AppDimensions.height10(context) *
                                                14.1
                                            : AppDimensions.height10(context) *
                                                13.1,
                                        width: selectedInActiveIndices
                                                    .contains(index) ||
                                                selectAll == true
                                            ? AppDimensions.width10(context) *
                                                14.1
                                            : AppDimensions.width10(context) *
                                                13.1,
                                        padding: EdgeInsets.all(
                                            AppDimensions.width10(context) *
                                                0.8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: selectedInActiveIndices
                                                          .contains(index) ||
                                                      selectAll == true
                                                  ? AppDimensions.width10(
                                                          context) *
                                                      0.2
                                                  : 0,
                                              color: selectedInActiveIndices
                                                          .contains(index) ||
                                                      selectAll == true
                                                  ? Colors.white
                                                  : Colors.transparent),
                                        ),
                                        child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  13.1,
                                          width:
                                              AppDimensions.width10(context) *
                                                  13.1,
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.2),
                                          // margin: EdgeInsets.only(
                                          //   right: AppDimensions.width10(context) *
                                          //       4.5,
                                          // ),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      0.1,
                                                  color: Colors.white),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffBE3FC6),
                                                    Color(0xff642445)
                                                  ])),
                                          child: Center(
                                            child: Text(
                                              inActive[index]['name'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                          ]),
                    ),
                  ),

                  // Container(
                  //   width: AppDimensions.width10(context) * 17.0,
                  //   height: AppDimensions.height10(context) * 0.5,
                  //   margin: EdgeInsets.only(
                  //       bottom: AppDimensions.height10(context) * 1.0),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(
                  //           AppDimensions.height10(context) * 2.0),
                  //       color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                  // ),
                ]),
              )
            : const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              ),
      ),
    );
  }
}
