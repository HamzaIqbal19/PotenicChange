import 'dart:async';
import 'dart:math';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class hurdles_goal_impact extends StatefulWidget {
  const hurdles_goal_impact({super.key});

  @override
  State<hurdles_goal_impact> createState() => _hurdles_goal_impactState();
}

class _hurdles_goal_impactState extends State<hurdles_goal_impact> {
  var goals = [];
  int selectBox = -1;
  int selectinActive = -1;
  bool selectAll = false;
  List<Map<String, dynamic>> Active = [];
  List<Map<String, dynamic>> inActive = [];
  bool Loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchUserGoal() {
    AdminGoal.getUserGoalByUserId().then((response) {
      setState(() {
        goals = response;
      });
      loadData();
      _newFunction();
    });
  }

  _newFunction() {
    print('FunctionCalled');
    for (int i = 0; i <= goals.length; i++) {
      if (goals[i]['isActive'] == true) {
        Active.add(goals[i]);
      } else {
        inActive.add(goals[i]);
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.height10(context) * 18.9,
            height: AppDimensions.height10(context) * 2.4,
            child: Row(
              children: [
                //increasing font size through out title in hurdles by 2 px
                //change was requested by clients
                GradientText(
                  'Capture Hurdle ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  ' 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w400,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () => showAnimatedDialog(
                      animationType: DialogTransitionType.fadeScale,
                      curve: Curves.easeInOut,
                      duration: Duration(seconds: 1),
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                            width: AppDimensions.height10(context) * 27.0,
                            height: AppDimensions.height10(context) * 24.0,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 1.4)),
                              contentPadding: EdgeInsets.zero,
                              actionsPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
                              title: Container(
                                margin: const EdgeInsets.only(
                                    top: 19, right: 16, left: 16, bottom: 2),
                                height: AppDimensions.height10(context) * 2.2,
                                width: AppDimensions.height10(context) * 23.8,
                                child: const Text(
                                  "Exit hurdle?",
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
                                height: AppDimensions.height10(context) * 1.6,
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
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height: 42,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: TextButton(
                                        onPressed: () {},
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
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 44,
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {},
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
                                    SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      child: Divider(
                                        color: const Color(0XFF3C3C43)
                                            .withOpacity(0.29),
                                      ),
                                    ),
                                    Container(
                                      height: 42,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  1.0),
                                      color: Colors.white,
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
                          )),
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
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
        child: Loading == false
            ? Column(children: [
                Container(
                  // width: AppDimensions.height10(context) * 36.0,
                  height: AppDimensions.height10(context) * 67.9,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 9.3,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 34.3,
                            height: AppDimensions.height10(context) * 7.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 8.7),
                            child: Center(
                              //Text alingment changes
                              child: GradientText(
                                'Which goals\nare impacted?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
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
                                });
                              } else if (selectAll == true) {
                                setState(() {
                                  selectAll = false;
                                  selectinActive = -1;
                                  selectBox = -1;
                                });
                              }
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 14.1,
                              height: AppDimensions.height10(context) * 14.1,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 2.1,
                                  right: AppDimensions.height10(context) * 19.8,
                                  top: AppDimensions.height10(context) * 2.9),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2,
                                      color: selectAll == true
                                          ? Colors.white
                                          : Colors.transparent)),
                              padding: EdgeInsets.all(
                                  AppDimensions.height10(context) * 0.5),
                              child: Container(
                                height: AppDimensions.height10(context) * 13.1,
                                width: AppDimensions.height10(context) * 13.1,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: AppDimensions.height10(context) *
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
                                    'All goals',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 12.4,
                            height: AppDimensions.height10(context) * 2.4,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 21.2,
                                left: AppDimensions.height10(context) * 2.8,
                                top: AppDimensions.height10(context) * 2.0),
                            child: Center(
                              child: Text(
                                'Active Goals',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 6,
                                top: AppDimensions.height10(context) * 1.0,
                                right: AppDimensions.height10(context) * 3,
                                bottom: AppDimensions.height10(context) * 2.0),
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
                                itemCount: Active.length,
                                itemBuilder: ((context, index) {
                                  return AnimatedScaleButton(
                                    onTap: () {
                                      setState(() {
                                        selectAll = false;
                                        selectinActive = index;
                                        selectBox = -1;
                                      });
                                      print(selectAll);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  3),
                                      height: selectinActive == index ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      width: selectinActive == index ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context) *
                                              0.8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: selectinActive == index ||
                                                    selectAll == true
                                                ? AppDimensions.height10(
                                                        context) *
                                                    0.2
                                                : 0,
                                            color: selectinActive == index ||
                                                    selectAll == true
                                                ? Colors.white
                                                : Colors.transparent),
                                      ),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                13.1,
                                        width: AppDimensions.height10(context) *
                                            13.1,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
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
                                            Active[index]['name'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 2.4,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 19.5,
                                left: AppDimensions.height10(context) * 2.8),
                            child: Center(
                              child: Text(
                                'Inactive Goals',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 6,
                                top: AppDimensions.height10(context) * 1.0,
                                right: AppDimensions.height10(context) * 3,
                                bottom: AppDimensions.height10(context) * 2.0),
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
                                        selectBox = index;
                                        selectinActive = -1;
                                        selectAll = false;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  3),
                                      height: selectBox == index ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      width: selectBox == index ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context) *
                                              0.8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: selectBox == index ||
                                                    selectAll == true
                                                ? AppDimensions.height10(
                                                        context) *
                                                    0.2
                                                : 0,
                                            color: selectBox == index ||
                                                    selectAll == true
                                                ? Colors.white
                                                : Colors.transparent),
                                      ),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                13.1,
                                        width: AppDimensions.height10(context) *
                                            13.1,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
                                                    context) *
                                                1.2),
                                        // margin: EdgeInsets.only(
                                        //   right: AppDimensions.height10(context) *
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
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
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
                Container(
                  width: AppDimensions.height10(context) * 25.4,
                  height: AppDimensions.height10(context) * 5.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.3,
                      bottom: AppDimensions.height10(context) * 2.6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFCC10D),
                        Color(0xffFDA210),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 5.0),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const select_hurdle(
                            update: false,
                          )),
                        );
                      },
                      child: Text(
                        '(5/5 goals selected) Next',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ),
                Container(
                  width: AppDimensions.height10(context) * 17.0,
                  height: AppDimensions.height10(context) * 0.5,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 2.0),
                      color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                ),
              ])
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
