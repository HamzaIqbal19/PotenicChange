import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/captureHurdles/captureHurdles_whatHurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Goal.dart';
import '../../API/Practice.dart';
import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import '../Goal Evaluation/practice_assesment_history.dart';
import '../Goal Evaluation/practice_progress.dart';
import '../Goal Evaluation/practice_score.dart';
import '../Goal Evaluation/progress_report.dart';
import '../ReviewPractice/practiceReview.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class missed_Menu extends StatefulWidget {
  final String pracName;
  const missed_Menu({
    super.key,
    required this.pracName,
  });

  @override
  State<missed_Menu> createState() => _missed_MenuState();
}

class _missed_MenuState extends State<missed_Menu> {
  String goalName = '';
  String pracName = '';
  String goalColor = '';
  String pracColor = '';
  String reportDate = '';
  int differenceInDays = 0;
  String subscripption = '';

  Future<void> getRecordedDate() async {
    final SharedPreferences prefs = await _prefs;
    print('Difference ${prefs.getString('record_date')!}');

    DateTime currentDate =
        DateTime.parse(DateTime.now().toString().substring(0, 10));
    DateTime date1 = DateTime.parse(prefs.getString('record_date')!);
    setState(() {
      differenceInDays = currentDate.difference(date1).inDays;
    });
    print('Difference $differenceInDays');
  }

  void getRecorDetails() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      goalName = prefs.getString('dash_goalName')!;
      pracColor = prefs.getString('dash_pracColor')!;
      pracName = prefs.getString('dash_pracName')!;
      goalColor = prefs.getString('dash_goalColor')!;
    });
    print(prefs.getString('dash_pracName'));
  }

  void getSubscription() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      subscripption = prefs.getString('subscriptionStatus')!;
    });
    print("SubscriptionStatus ${prefs.getString('subscriptionStatus')}");
  }

  var pracDetails;

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) async {
      if (response.length != 0) {
        print(
            "---------------------------------PRACTICE RESPONSE===>$response");
        setState(() {
          pracDetails = response;
          reportDate = response['lastReportSentDate'] ?? '';
        });

        loadData();
        print(pracName + pracColor);
        AdminGoal.getUserGoalById(response['userGoalId']).then(
          (value) {
            if (value.length != 0) {
              print("---------------------------------Goal RESPONSE===>$value");
              setState(() {
                goalName = value["name"];
              });
            }
          },
        );
        if (response["goalEvaluations"] != null) {
          final SharedPreferences prefs = await _prefs;

          await prefs.setInt('goal_eval_id', response["goalEvaluations"]["id"]);
        }
        print("---------------------------------");
        print("response123:${response["color"]}");
      } else {
        // loadData();
        print("response:$response");
      }
    }).catchError((error) {
      // loadData();
      print("hell");
    });
  }

  bool Loader = true;
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getRecordedDate();
    getRecorDetails();
    getSubscription();
    _fetchPracticeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          FadePageRoute(
            page: view_goals(
              missed: false,
              name: '',
              update: false,
              helpfulTips: false,
              record: differenceInDays,
            ),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            // title: Align(
            //   alignment: Alignment.center,
            //   child: Text(
            //     'Practice Menu',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadePageRoute(
                          page: view_goals(
                            missed: false,
                            name: '',
                            update: false,
                            helpfulTips: false,
                            record: differenceInDays,
                          ),
                        ),
                      );
                    },
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      width: 26,
                      height: 26,
                      fit: BoxFit.cover,
                    )),
              )
            ]),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 30.4,
                        height: AppDimensions.height10(context) * 18.6,
                        // color: Colors.grey.withOpacity(0.5),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 5.0,
                            bottom: AppDimensions.height10(context) * 1.0),
                        child: Column(
                          children: [
                            Text(
                              'Practice Menu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 30,
                              child: Center(
                                child: Text(
                                  goalName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 40.0,
                              height: AppDimensions.height10(context) * 11.2,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.6),
                              // color: Colors.blue,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const Alignment(-0.84, -0.32),
                                    child: Container(
                                      width:
                                          AppDimensions.height10(context) * 7.9,
                                      height:
                                          AppDimensions.height10(context) * 7.9,
                                      decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        image: DecorationImage(
                                            image: AssetImage(goalColor == '1'
                                                ? "assets/images/red_gradient.webp"
                                                : goalColor == '2'
                                                    ? 'assets/images/orange_moon.webp'
                                                    : goalColor == '3'
                                                        ? "assets/images/lightGrey_gradient.webp"
                                                        : goalColor == '4'
                                                            ? "assets/images/lightBlue_gradient.webp"
                                                            : goalColor == '5'
                                                                ? "assets/images/medBlue_gradient.webp"
                                                                : goalColor ==
                                                                        '6'
                                                                    ? "assets/images/Blue_gradient.webp"
                                                                    : 'assets/images/orange_moon.webp'),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(-0.6, -0.2),
                                    child: Container(
                                      height:
                                          AppDimensions.height10(context) * 5.0,
                                      width:
                                          AppDimensions.height10(context) * 4.6,
                                      decoration: BoxDecoration(
                                          //color: Colors.amber,
                                          image: DecorationImage(
                                              image: AssetImage(pracColor == '1'
                                                  ? "assets/images/Missed_1.webp"
                                                  : pracColor == '2'
                                                      ? 'assets/images/Missed_2.webp'
                                                      : pracColor == '3'
                                                          ? "assets/images/Missed_3.webp"
                                                          : pracColor == '4'
                                                              ? "assets/images/Missed_4.webp"
                                                              : pracColor == '5'
                                                                  ? "assets/images/Missed_4.webp"
                                                                  : 'assets/images/Missed_1.webp'),
                                              fit: BoxFit.contain)),
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(1.3, 6),
                                    child: SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 21,
                                      height: AppDimensions.height10(context) *
                                          10.6,
                                      // color: Colors.amber.withOpacity(0.2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pracName,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.5,
                                            child: Text(
                                              'Session missed',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xffEB5757)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: emotions(
                                summary: false,
                                pracName: widget.pracName,
                                record: false,
                                selected: 0,
                              )));
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 9.36,
                          height: AppDimensions.height10(context) * 12.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.9),
                          child: Column(
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 7.0,
                                height: AppDimensions.height10(context) * 7.0,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffFCC10D),
                                          Color(0xffFDA210),
                                        ]),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            AppDimensions.height10(context) *
                                                13.9)),
                                    border: Border.all(
                                        width: AppDimensions.height10(context) *
                                            0.3,
                                        color: Colors.white)),
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.add_task,
                                    color: Colors.white,
                                    // fill: AppDimensions.height10(context) * 0.10,
                                    size: AppDimensions.height10(context) * 2.8,
                                  ),
                                )),
                              ),
                              SizedBox(
                                // color: Colors.red,
                                height: AppDimensions.height10(context) * 4.921,
                                width: AppDimensions.height10(context) * 9.36,
                                child: Center(
                                  child: Text(
                                    'Record\npractice',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.12,
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: AppDimensions.height10(context) * 36.0,
                      //   child: Divider(
                      //     thickness: AppDimensions.height10(context) * 0.1,
                      //     height: AppDimensions.height10(context) * 0.1,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 0.1,
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 41.3,
                        height: AppDimensions.height10(context) * 22.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.2),
                        child: Stack(children: [
                          Align(
                            alignment: const Alignment(1, -1.3),
                            child: IconButton(
                                onPressed: () {
                                  info_sheet(context);
                                },
                                icon: Image.asset(
                                  'assets/images/ic_info_outline.webp',
                                  height: AppDimensions.height10(context) * 3.0,
                                  width: AppDimensions.height10(context) * 3.0,
                                )),
                          ),
                          Align(
                            alignment: const Alignment(0, -1),
                            child: SizedBox(
                              width: AppDimensions.height10(context) * 36.0,
                              height: AppDimensions.height10(context) * 24.7,
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 5.9,
                                    width:
                                        AppDimensions.height10(context) * 36.0,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.2),
                                    child: Column(children: [
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        child: Text(
                                          'Practice Assessment',
                                          style: TextStyle(
                                              //increase font size by 2 px
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xfff5f5f5)),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.2),
                                        child: Text(
                                          'Here is your latest 20 active day evaluation.',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xfff5f5f5)),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.3),
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.15,
                                                    color: const Color(
                                                        0xfff5f5f5)),
                                                children: [
                                              const TextSpan(
                                                  text:
                                                      'Next assessment is in '),
                                              TextSpan(
                                                  text:
                                                      '${pracDetails['activeDays'] - 20} active days.',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700))
                                            ])),
                                      )
                                    ]),
                                  ),
                                  Column(
                                    children: [
                                      AnimatedScaleButton(
                                        onTap: () {
                                          if (pracDetails['report'] == true &&
                                              subscripption == 'active') {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page:
                                                        const progress_report()));
                                          } else if (subscripption !=
                                              'active') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Practice report is only available for premium members.")));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Practice report is not active")));
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.2),
                                          child: button_feilds(
                                            feild_text: 'Progress report',
                                            icon_viible: true,
                                            text_color: 0xff646464,
                                            feild_text_2: reportDate != ''
                                                ? '   ${formatDate(reportDate)}'
                                                : '',
                                            text_color_2: 0xff8EA1B1,
                                            feild_text_3: '',
                                            feild_text_4: '',
                                          ),
                                        ),
                                      ),
                                      AnimatedScaleButton(
                                        onTap: () {
                                          if (pracDetails['report'] == true) {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const prac_score(
                                                  route: 'pracice_menu_missed',
                                                  index: 0,
                                                )));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Practice score is not active")));
                                          }
                                        },
                                        child: button_feilds(
                                          feild_text: 'Evaluation level ',
                                          icon_viible: true,
                                          text_color: 0xff646464,
                                          feild_text_2: '(',
                                          text_color_2: 0xff8EA1B1,
                                          feild_text_3: pracDetails[
                                                          'practiceLevel'] ==
                                                      null ||
                                                  pracDetails[
                                                          'practiceLevel'] ==
                                                      0
                                              ? '-'
                                              : pracDetails[
                                                          'practiceEvaluations']
                                                      ['totalPoint']
                                                  .toString(),
                                          feild_text_4: '/5)',
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 0.1,
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                      ),

                      Container(
                        height: AppDimensions.height10(context) * 28.0,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 2.5,
                            top: AppDimensions.height10(context) * 3.0),
                        child: Column(
                          children: [
                            AnimatedScaleButton(
                              onTap: () {
                                //   if (pracDetails['report'] == true) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const practice_progress(
                                      days: 30,
                                      route: 'pracice_menu_missed',
                                    )));
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text(
                                //               "Practice progress is not active")));
                                // }
                              },
                              child: const button_feilds(
                                feild_text: 'View practice progress',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: '',
                                text_color_2: 0xff8EA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.0,
                                  top: AppDimensions.height10(context) * 1.0),
                              child: AnimatedScaleButton(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const PracticeReview()));
                                  final SharedPreferences prefs = await _prefs;
                                  var pracName = prefs.setString(
                                      'practice_review', 'practice_missed');
                                },
                                child: const button_feilds(
                                  feild_text: 'View practice settings',
                                  icon_viible: true,
                                  text_color: 0xff646464,
                                  feild_text_2: '',
                                  text_color_2: 0xffEA1B1,
                                  feild_text_3: '',
                                  feild_text_4: '',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                      AppDimensions.height10(context) * 1.0),
                              child: AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const practice_assesment()));
                                },
                                child: const button_feilds(
                                  feild_text: 'view upcoming schedules',
                                  icon_viible: true,
                                  text_color: 0xff646464,
                                  feild_text_2: '',
                                  text_color_2: 0xffEA1B1,
                                  feild_text_3: '',
                                  feild_text_4: '',
                                ),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {},
                              child: const button_feilds(
                                feild_text: 'Practice assesment history',
                                icon_viible: true,
                                text_color: 0xff646464,
                                feild_text_2: '',
                                text_color_2: 0xffEA1B1,
                                feild_text_3: '',
                                feild_text_4: '',
                              ),
                            )
                          ],
                        ),
                      ),
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
    );
  }
}
