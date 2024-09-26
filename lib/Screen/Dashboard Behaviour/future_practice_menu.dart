import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practiceReportUnsub.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/timeline/timeline.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/goalAndPracticeName.dart';
import 'package:potenic_app/utils/app_texts.dart';
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

class futurePracticeMenu extends StatefulWidget {
  final String pracName;
  const futurePracticeMenu({
    super.key,
    required this.pracName,
  });

  @override
  State<futurePracticeMenu> createState() => _futurePracticeMenuState();
}

class _futurePracticeMenuState extends State<futurePracticeMenu> {
  String goalName = '';
  String pracName = '';
  String goalColor = '';
  String pracColor = '';
  String reportDate = '';
  int differenceInDays = 0;
  String subscripption = '';






  var pracDetails;

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) async {
      if (response.length != 0) {
        setState(() {
          pracDetails = response;
        });

        loadData();
      } else {}
    }).catchError((error) {});
  }

  bool loader = true;
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPracticeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
          context,
          FadePageRouteReverse(
            page: ViewDashboard(
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
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadePageRouteReverse(
                          page: ViewDashboard(
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
                      width: AppDimensions.height10(context) * 2.8,
                      height: AppDimensions.height10(context) * 2.8,
                      fit: BoxFit.contain,
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
          child: loader == false
              ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  //width: AppDimensions.width10(context) * 30.4,
                  height: AppDimensions.height10(context) * 18.9,
                  // color: Colors.grey.withOpacity(0.5),
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 6.2,
                      bottom: AppDimensions.height10(context) * 1.0),
                  child: Column(
                    children: [
                      Text(
                        AppText().pracMenu,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 2.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: AppDimensions.width10(context) * 30,
                        child: Center(
                          child: Text(
                            pracDetails['userGoal']['name'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                AppDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      goalAndPractice(
                          context, pracDetails['userGoal']['color'], pracDetails['color'], pracDetails['name']),
                    ],
                  ),
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
                            await prefs.setString(
                                'practice_review', 'record_session');
                          },
                          child: const ButtonFields(
                            fieldText: 'View practice settings',
                            iconVisible: true,
                            textColor: 0xff646464,
                            fieldText2: '',
                            textColor2: 0xffEA1B1,
                            premium: true,
                            fieldText3: '',
                            fieldText4: '',
                          ),
                        ),
                      ),

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
