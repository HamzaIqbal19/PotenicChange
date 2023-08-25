import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_score.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'progress_report.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class practice_assesment extends StatefulWidget {
  const practice_assesment({super.key});

  @override
  State<practice_assesment> createState() => _practice_assesmentState();
}

class _practice_assesmentState extends State<practice_assesment> {
  var goalDetails;
  var pracDetails;
  bool Loader = true;

  void fetchGoalDetails() async {
    final SharedPreferences prefs = await _prefs;

    AdminGoal.getUserGoalById(prefs.get('goal_num')).then((response) async {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
          pracDetails = response['userPractices'];
        });
        print('Practices<==================>$pracDetails');
        loadData();
        print(response);
      } else {
        loadData();
      }
    }).catchError((error) {
      print("error");
    }).whenComplete(() {});
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchGoalDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                width: AppDimensions.height10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Close.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/prac_assesment.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Loader == false
            ? SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                    // width: AppDimensions.height10(context) * 27.9,
                    // alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 5.2),
                    child: const Text(
                      'Practice Assessment History',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 2.5,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          pracDetails.length, // Half of the items, rounded up
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 41.3,
                              height: AppDimensions.height10(context) * 22.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.0),
                              child: Stack(children: [
                                Align(
                                  alignment: const Alignment(1, -1.1),
                                  child: AnimatedScaleButton(
                                      onTap: () {
                                        info_sheet(context);
                                      },
                                      child: Image.asset(
                                        'assets/images/ic_info_outline.webp',
                                        height:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        width: AppDimensions.height10(context) *
                                            3.0,
                                      )),
                                ),
                                Align(
                                  alignment: const Alignment(0, -1),
                                  child: SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 36.0,
                                    height:
                                        AppDimensions.height10(context) * 24.7,
                                    child: Column(
                                      children: [
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.9,
                                          width:
                                              AppDimensions.height10(context) *
                                                  36.0,
                                          margin: EdgeInsets.only(
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.2),
                                          child: Column(children: [
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.1,
                                              child: Text(
                                                'Practice Assessment',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.8,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xfff5f5f5)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              child: Text(
                                                'Here is your latest 20 active day evaluation.',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xfff5f5f5)),
                                              ),
                                            ),
                                            Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              margin: EdgeInsets.only(
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      0.3),
                                              child: RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          fontFamily: 'laila',
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.15,
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xfff5f5f5)),
                                                      children: [
                                                    const TextSpan(
                                                        text:
                                                            'Next assessment is in'),
                                                    TextSpan(
                                                        text: pracDetails[index]
                                                                        [
                                                                        'practiceTotalActiveDays'] ==
                                                                    0 ||
                                                                pracDetails[index]
                                                                        [
                                                                        'practiceTotalActiveDays'] ==
                                                                    null
                                                            ? '-20 active days.'
                                                            : '${pracDetails[index]['practiceTotalActiveDays'] - 20} active days.',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))
                                                  ])),
                                            )
                                          ]),
                                        ),
                                        Column(
                                          children: [
                                            AnimatedScaleButton(
                                              onTap: () {
                                                if (pracDetails[index]
                                                        ['report'] ==
                                                    true) {
                                                  Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page:
                                                              const progress_report()));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Practice report is not active")));
                                                }
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.2),
                                                child: const button_feilds(
                                                  feild_text: 'Progress report',
                                                  icon_viible: true,
                                                  text_color: 0xff646464,
                                                  feild_text_2: ' DD/MMM/YY',
                                                  text_color_2: 0xff8EA1B1,
                                                  feild_text_3: '',
                                                  feild_text_4: '',
                                                ),
                                              ),
                                            ),
                                            AnimatedScaleButton(
                                              onTap: () {
                                                if (pracDetails[index]
                                                        ['report'] ==
                                                    true) {
                                                  Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page:
                                                              const prac_score(
                                                        saved: false,
                                                      )));
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Practice score is not active")));
                                                }
                                              },
                                              child: const button_feilds(
                                                feild_text: 'Evaluation level ',
                                                icon_viible: true,
                                                text_color: 0xff646464,
                                                feild_text_2: '(',
                                                text_color_2: 0xff8EA1B1,
                                                feild_text_3: '2',
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
                            ),
                          ],
                        );
                      }),
                ],
              ))
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
