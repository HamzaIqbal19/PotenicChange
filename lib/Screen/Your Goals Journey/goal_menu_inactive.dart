import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/new_progress_score.dart';
import 'package:potenic_app/Screen/Goal%20Review%20Journey/StarReview.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeName.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/practiceReview.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Timeline%20Journey/component/imageComponent.dart';
import 'package:potenic_app/Screen/Timeline%20Journey/timeline.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_inactive_5goals.dart';
import 'package:potenic_app/Widgets/AppCustomCircle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';
import 'veiw_all_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class goal_menu_inactive extends StatefulWidget {
  final bool isActive;
  final bool goal_evaluation;
  const goal_menu_inactive({
    super.key,
    required this.isActive,
    required this.goal_evaluation,
  });

  @override
  State<goal_menu_inactive> createState() => _goal_menu_inactiveState();
}

class _goal_menu_inactiveState extends State<goal_menu_inactive> {
  bool loader = true;
  var goalDetails;
  String goalName = '';
  List<dynamic> activePractices = [];

  int color = 0;
  String pracName = '';
  int pracColor = 0;
  String route = '';
  String subscriptions = '';
  String inputDate = '';
  String level = '';
  List messages = [
    "I’m not making any progress",
    "I'm making small steps\nforward",
    "I’m making considerable steps forward",
    "I’m almost there",
    "I’m continuously living my why"
  ];

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void getSubscription() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      subscriptions = prefs.getString('subscriptionStatus')!;
    });
  }

  void onDoneLoading() {
    setState(() {
      loader = false;
    });
  }

  Future<void> _fetchGoalDetails() async {
    final SharedPreferences prefs = await _prefs;

    AdminGoal.getUserGoalById(prefs.get('goal_num'))
        .then((response) async {
          if (response.length != 0) {
            setState(() {
              goalDetails = response;
              inputDate = response['goalEvaluations'].length == 0
                  ? ""
                  : response['goalEvaluations']
                                      [response['goalEvaluations'].length - 1]
                                  ['endDate']
                              .toString() !=
                          'null'
                      ? response['goalEvaluations']
                          [response['goalEvaluations'].length - 1]['endDate']
                      : "";
              level = response['goalEvaluations'].length == 0
                  ? ''
                  : response['goalEvaluations']
                                  [response['goalEvaluations'].length - 1]
                              ['totalPoint'] ==
                          null
                      ? ''
                      : response['goalEvaluations']
                                  [response['goalEvaluations'].length - 1]
                              ['totalPoint']
                          .toString();
            });
            for (int j = 0; j < goalDetails['userPractices'].length; j++) {
              if (goalDetails['userPractices'][j]['isActive'] == true) {
                activePractices.add(goalDetails['userPractices'][j]);
              }
            }

            loadData();
          } else {
            loadData();
          }
        })
        .catchError((error) {})
        .whenComplete(() {
          //loadData();
        });
  }

  getRoute() async {
    final SharedPreferences prefs = await _prefs;

    var menuRoute = prefs.getString('goal_menu_route');
    setState(() {
      route = menuRoute!;
    });
  }

  String formatDate(String inputDate) {
    DateTime date = DateTime.parse(inputDate);
    String formattedDate =
        "${date.day} ${_getMonthName(date.month)} ${date.year}";
    return formattedDate;
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  @override
  void initState() {
    super.initState();
    getSubscription();
    _fetchGoalDetails();
    getRoute();
  }

  int goalLevel = 2;
  @override
  Widget build(BuildContext context) {
    //bool premium = false;
    return WillPopScope(
      onWillPop: () {
        if (route != 'your_goal') {
          Navigator.push(
              context,
              FadePageRouteReverse(
                  page: const ViewDashboard(
                missed: false,
                name: '',
                update: false,
                helpfulTips: false,
                record: 0,
              )));
        } else {
          Navigator.push(
              context, FadePageRouteReverse(page: const view_all_goals_menu()));
        }

        return Future.value(true);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              Buttons().closeButton(context, () {
                if (route != 'your_goal') {
                  Navigator.push(
                      context,
                      FadePageRouteReverse(
                          page: const ViewDashboard(
                        missed: false,
                        name: '',
                        update: false,
                        helpfulTips: false,
                        record: 0,
                      )));
                } else {
                  Navigator.push(context,
                      FadePageRouteReverse(page: const view_all_goals_menu()));
                }
              })
            ]),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/prac_assesment.webp'),
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
                        // color: Colors.amber,
                        //width: AppDimensions.width10(context) * 17.1,
                        height: AppDimensions.height10(context) * 2.2,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 5.2,

                          // right: AppDimensions.width10(context) * 12.1
                        ),
                        child: Center(
                          child: Text(
                            'Goal Menu',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffffffff)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 32.1,
                        //height: AppDimensions.height10(context) * 2.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5,
                            left: AppDimensions.width10(context) * 12.2,
                            right: AppDimensions.width10(context) * 12.1),
                        child: Text(
                          goalDetails['name'],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.2,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffffffff)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: AppDimensions.width10(context) * 6.56,
                          height: AppDimensions.height10(context) * 6.56,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.03),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  goalDetails['color'] == '1'
                                      ? "assets/images/red_gradient.webp"
                                      : goalDetails['color'] == '2'
                                          ? 'assets/images/orange_moon.webp'
                                          : goalDetails['color'] == '3'
                                              ? "assets/images/lightGrey_gradient.webp"
                                              : goalDetails['color'] == '4'
                                                  ? "assets/images/lightBlue_gradient.webp"
                                                  : goalDetails['color'] == '5'
                                                      ? "assets/images/medBlue_gradient.webp"
                                                      : goalDetails['color'] ==
                                                              '6'
                                                          ? "assets/images/Blue_gradient.webp"
                                                          : 'assets/images/orange_moon.webp',
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          if (subscriptions != 'active') {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: new_progress_score(
                                  premium: false,
                                  evaluationIndex: 0,
                                  dateChange: false,
                                )));
                          } else {
                            if (goalDetails['goalStatus'] == "active" &&
                                goalDetails['goalEvaluations'].length != 0) {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: new_progress_score(
                                    premium: subscriptions == 'active'
                                        ? true
                                        : false,
                                    evaluationIndex:
                                        goalDetails['goalEvaluations'].length -
                                            1,
                                    dateChange: false,
                                  )));
                            } else {
                              if (goalDetails['goalEvaluations'].length != 0) {
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Goal evaluation for this month is not active!!")));
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Evaluation is only availabe for active goals!!")));
                            }
                          }
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 38.4,
                          height: AppDimensions.height10(context) * 14.7,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.81),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: const Color(0xFFF5F5F5)),
                          child: Stack(
                            children: [
                              Container(
                                width: AppDimensions.width10(context) * 38.4,
                                height: AppDimensions.height10(context) * 12.0,
                                decoration: subscriptions == 'active'
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Rectangle 192.webp'),
                                          fit: BoxFit.cover,
                                        ))
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        gradient: LinearGradient(colors: [
                                          const Color(0xFFFF7975),
                                          const Color(0xFFF9DCC0).withOpacity(0)
                                        ])),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: goalLevel == 2
                                          ? AppDimensions.width10(context) *
                                              10.135
                                          : AppDimensions.width10(context) *
                                              10.1,
                                      height: goalLevel == 2
                                          ? AppDimensions.width10(context) *
                                              10.135
                                          : AppDimensions.width10(context) *
                                              10.1,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.width10(context) *
                                                  0.6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(level == '1'
                                              ? 'assets/images/Nebula pie 1.webp'
                                              : level == '2'
                                                  ? 'assets/images/Nebula pie 2.webp'
                                                  : level == '3'
                                                      ? 'assets/images/Nebula pie 3.webp'
                                                      : level == '4'
                                                          ? 'assets/images/Nebula pie 4.webp'
                                                          : level == '5'
                                                              ? 'assets/images/Nebula pie 5.webp'
                                                              : "assets/images/Nebula Pie.webp"),
                                        ),
                                        // color: Colors.amber,
                                      ),
                                      child: Align(
                                        alignment: goalLevel != 0
                                            ? const Alignment(0, -0.1)
                                            : const Alignment(0, -0.07),
                                        child: Text(
                                          level == '0' || level == ''
                                              ? '-'
                                              : level,
                                          style: TextStyle(
                                              fontSize: subscriptions ==
                                                      'active'
                                                  ? goalLevel == 0
                                                      ? AppDimensions.font10(
                                                              context) *
                                                          2.8
                                                      : AppDimensions.font10(
                                                              context) *
                                                          2.0
                                                  : AppDimensions.font10(
                                                          context) *
                                                      2.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF464646)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 20.9,
                                      // height:
                                      //     AppDimensions.height10(context) * 9.1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              // width: AppDimensions.width10(context) * 16.5,
                                              // height: AppDimensions.height10(
                                              //         context) *
                                              //     1.9,

                                              child: Text(
                                                'Goal level evaluation',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            2.0,
                                                    fontWeight: FontWeight.w700,
                                                    color: subscriptions ==
                                                            'active'
                                                        ? const Color(
                                                            0xFFFFFFFF)
                                                        : const Color(
                                                            0xFF464646)),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              // width: AppDimensions.width10(context) * 9.5,
                                              // height: AppDimensions.height10(
                                              //         context) *
                                              //     2.2,

                                              child: Text(
                                                inputDate == ''
                                                    ? ''
                                                    : 'for ${formatDate(inputDate)}!',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.7,
                                                    fontWeight: FontWeight.w500,
                                                    color: subscriptions ==
                                                            'active'
                                                        ? const Color(
                                                            0xFFFFFFFF)
                                                        : const Color(
                                                            0xFF464646)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    20.9,
                                            height: AppDimensions.height10(
                                                    context) *
                                                5,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              subscriptions == 'active'
                                                  ? level == "0" || level == ''
                                                      ? 'Score needed'
                                                      : messages[
                                                          int.parse(level) - 1]
                                                  : 'Only available to Premium\nCustomers',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.7,
                                                  fontWeight: FontWeight.w400,
                                                  color: subscriptions ==
                                                          'active'
                                                      ? const Color(0xFFFFFFFF)
                                                      : const Color(
                                                          0xFF464646)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: AppDimensions.width10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.31,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                0.8),
                                        child: Image.asset(
                                          'assets/images/BTN Back.webp',
                                          color: Colors.black.withOpacity(0.5),
                                          //width: AppDimensions.width10(context) * 2.6,
                                          //height: AppDimensions.height10(context) * 2.6,
                                          fit: BoxFit.cover,
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const Alignment(-0.8, 0.9),
                                child: SizedBox(
                                  //width: AppDimensions.width10(context) * 19.5,
                                  //height: AppDimensions.height10(context) * 1.8,
                                  child: subscriptions != 'active'
                                      ? Text(
                                          'Next score needed in 30 days',
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff464646)),
                                        )
                                      : goalDetails['nextEvaluationInDays'] == 0
                                          ? Text(
                                              'You can now evaluate your progress',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff464646)),
                                            )
                                          : Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Next score needed in ',
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.6,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff464646)),
                                                ),
                                                Text(
                                                  '-${goalDetails['nextEvaluationInDays']}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.6,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: const Color(
                                                          0xff464646)),
                                                ),
                                                Text(
                                                  ' days',
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.6,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff464646)),
                                                ),
                                              ],
                                            ),
                                ),
                              ),
                              widget.goal_evaluation
                                  ? Container()
                                  : goalDetails['goalLevel'] != 0 ||
                                          goalDetails['goalLevel'] != null
                                      ? Container()
                                      : Align(
                                          alignment:
                                              const Alignment(-0.975, -1.275),
                                          child: Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    11.9,
                                            // height: AppDimensions.height10(
                                            //         context) *
                                            //     2.9,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0),
                                                color: const Color(0xFFFFFFFF)),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      0.8,
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      0.5,
                                                  bottom:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.5),
                                              child: Text(
                                                'Score needed!',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.7,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF646464)),
                                              ),
                                            ),
                                          ),
                                        )
                            ],
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const multiple_goal_inactive()));
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 38.4,
                          height: AppDimensions.height10(context) * 6.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0),
                          padding: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 2.0,
                              right: AppDimensions.width10(context) * 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: const Color(0xFFF5F5F5),
                            border: Border.all(
                                color: const Color(0xFFFFFFFF),
                                width: AppDimensions.width10(context) * 0.1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontFamily: 'Laila',
                                          fontSize:
                                              AppDimensions.font10(context) * 2,
                                          fontWeight: FontWeight.w500,
                                          color: goalDetails['goalStatus'] ==
                                                  "active"
                                              ? const Color(0xFF156F6D)
                                              : const Color(0xFFDE7A11)),
                                      children: [
                                    const TextSpan(text: 'This goal is '),
                                    TextSpan(
                                        text: capitalizeFirstLetter(
                                            goalDetails['goalStatus']),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ])),
                              SizedBox(
                                child: Center(
                                  child: Text(
                                    'View',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF437296),
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 0.1,
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.0),
                      ),
                      SizedBox(
                        child: SizedBox(
                          height: AppDimensions.height10(context) * 18,
                          // width: AppDimensions.width10(context) * 45.4,

                          // color: Colors.amber,
                          child: goalDetails['goalStatus'] != "active"
                              ? ListView.builder(
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppDimensions.width10(context) * 2),
                                  itemCount:
                                      goalDetails['userPractices'].length,
                                  itemBuilder: ((context, index) {
                                    return AnimatedScaleButton(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const PracticeReview()));

                                        final SharedPreferences prefs =
                                            await _prefs;
                                        await prefs.setString(
                                            'practice_review', 'goal_menu');
                                        await prefs.setInt(
                                            'prac_num',
                                            goalDetails['userPractices'][index]
                                                ['id']);
                                      },
                                      child: AppCustomCircle().CustomContainer(
                                        context,
                                        padding: EdgeInsets.all(
                                            AppDimensions.width10(context) *
                                                0.8),
                                        margin: EdgeInsets.only(
                                            left:
                                                AppDimensions.width10(context)),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        image: DecorationImage(
                                          image: AssetImage(practiceImages(
                                              goalDetails['userPractices']
                                                      [index]['color']
                                                  .toString())),
                                          fit: BoxFit.contain,
                                        ),
                                        // Container(
                                        //   width: AppDimensions.height10(context) *
                                        //       13.8,
                                        //   height:
                                        //       AppDimensions.height10(context) *
                                        //           13.8,
                                        //   padding: EdgeInsets.all(
                                        //       AppDimensions.width10(context) *
                                        //           0.8),
                                        //   margin: EdgeInsets.only(
                                        //       left:
                                        //           AppDimensions.width10(context)),
                                        //   decoration: BoxDecoration(
                                        //       border: Border.all(
                                        //           color: Colors.white, width: 2),
                                        //       shape: BoxShape.circle,
                                        //       image: DecorationImage(
                                        //         image: AssetImage(practiceImages(
                                        //             goalDetails['userPractices']
                                        //                     [index]['color']
                                        //                 .toString())),
                                        //         fit: BoxFit.contain,
                                        //       )),
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              AppDimensions.height10(context)),
                                          child: Center(
                                            child: Text(
                                              goalDetails['userPractices']
                                                  [index]['name'],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }))
                              : ListView.builder(
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppDimensions.width10(context) * 1.7),
                                  itemCount: activePractices.length,
                                  itemBuilder: ((context, index) {
                                    return AnimatedScaleButton(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const practiceMenu(
                                              goal_eval: false,
                                              completed: false,
                                            )));

                                        final SharedPreferences prefs =
                                            await _prefs;
                                        await prefs.setInt('prac_num',
                                            activePractices[index]['id']);
                                        await prefs.setString(
                                            'prac_menu_route', 'goal_menu');
                                      },
                                      child: AppCustomCircle().CustomContainer(
                                        context,
                                        padding: EdgeInsets.all(
                                            AppDimensions.width10(context) *
                                                0.8),
                                        margin: EdgeInsets.only(
                                            left:
                                                AppDimensions.width10(context)),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        image: DecorationImage(
                                          image: AssetImage(practiceImages(
                                              activePractices[index]['color']
                                                  .toString())),
                                          fit: BoxFit.contain,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              AppDimensions.width10(context)),
                                          child: Center(
                                            child: Text(
                                              activePractices[index]['name'],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.height10(context) * 0.1,
                        color: const Color(0xFFFFFFFF).withOpacity(0.5),
                        // margin: EdgeInsets.only(
                        //     top: AppDimensions.height10(context) * 2.2),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 38.4,
                        height: AppDimensions.height10(context) * 20.0,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.0,
                          //bottom: AppDimensions.height10(context) * 8.4
                        ),
                        child: Column(
                          children: [
                            AnimatedScaleButton(
                              onTap: () async {
                                final SharedPreferences prefs = await _prefs;
                                if (subscriptions == 'active') {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: timeline(
                                        goalId: prefs.get('goal_num'),
                                        pracId: null,
                                      )));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "This feature is only available for premium members")));
                                }
                              },
                              child: ButtonFields(
                                fieldText: subscriptions == 'active'
                                    ? 'Timeline'
                                    : 'Timeline (Premium only)',
                                iconVisible: true,
                                textColor: 0xff646464,
                                premium: subscriptions == 'active',
                                fieldText2: '',
                                textColor2: 0xffEA1B1,
                                fieldText3: '',
                                fieldText4: '',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const StarReview(
                                      route: 'menu',
                                    )));
                              },
                              child: const ButtonFields(
                                fieldText: 'Goal details',
                                iconVisible: true,
                                textColor: 0xff646464,
                                fieldText2: '',
                                textColor2: 0xffEA1B1,
                                fieldText3: '',
                                fieldText4: '',
                                premium: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.goal_evaluation
                          ? Container(
                              width: AppDimensions.width10(context) * 17.0,
                              height: AppDimensions.height10(context) * 0.5,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 14.1,
                                  bottom:
                                      AppDimensions.height10(context) * 1.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.3)),
                            )
                          : SizedBox(
                              height: AppDimensions.height10(context) * 8.4,
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
