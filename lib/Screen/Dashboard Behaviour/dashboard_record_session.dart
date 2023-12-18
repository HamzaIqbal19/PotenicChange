import 'dart:async';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/loaders/practice_session_recorded.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../Your_goals/veiw_all_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class record_session extends StatefulWidget {
  final bool past_session;
  const record_session({
    super.key,
    required this.past_session,
  });

  @override
  State<record_session> createState() => _record_sessionState();
}

class _record_sessionState extends State<record_session> {
  var allGoals;
  var allPractice;
  List<Map<String, dynamic>> activePractices = [];
  bool Loader = true;
  @override
  void initState() {
    super.initState();
    // fetchGoalsByDay();
    _fetchGoalNames();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserActiveGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          allGoals = response;
        });

        for (int i = 0; i < allGoals.length; i++) {
          List<dynamic> Practices = [];
          for (int j = 0; j < allGoals[i]['userPractices'].length; j++) {
            if (allGoals[i]['userPractices'][j]['isActive'] == true) {
              Practices.add(allGoals[i]['userPractices'][j]);
            }
          }

          activePractices.add({"practices": Practices});
        }
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
      print("error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                   // width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.contain,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/prac_assesment.webp'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Loader == false
              ? Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: AppDimensions.height10(context) * 6.8,
                          width: AppDimensions.width10(context) * 21.7,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 10.0,
                              bottom: AppDimensions.height10(context) * 4.2),
                          child: Center(
                              child: Text(
                            widget.past_session
                                ? 'Record Practice\nSession'
                                : 'View Practice\nSchedules',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'laila'),
                          )),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: allGoals.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: ((context, index) {
                            return Container(
                              height: AppDimensions.height10(context) * 31.3,
                              //width: AppDimensions.width10(context) * 46.4,

                              margin: EdgeInsets.only(

                                  bottom:
                                      AppDimensions.height10(context) * 3.2),
                              child: Stack(
                                  children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        width: AppDimensions.width10(context) *
                                            26.8,
                                        height: AppDimensions.height10(context) *
                                            26.8,
                                        margin: EdgeInsets.only(
                                          left: AppDimensions.width10(context) * 2.3,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppDimensions.height10(context) *
                                                    2),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(allGoals[index]
                                                            ['color'] ==
                                                        '1'
                                                    ? "assets/images/red_gradient.webp"
                                                    : allGoals[index]['color'] ==
                                                            '2'
                                                        ? 'assets/images/orange_moon.webp'
                                                        : allGoals[index]
                                                                    ['color'] ==
                                                                '3'
                                                            ? "assets/images/lightGrey_gradient.webp"
                                                            : allGoals[index]['color'] ==
                                                                    '4'
                                                                ? "assets/images/lightBlue_gradient.webp"
                                                                : allGoals[index]
                                                                            ['color'] ==
                                                                        '5'
                                                                    ? "assets/images/medBlue_gradient.webp"
                                                                    : allGoals[index]['color'] == '6'
                                                                        ? "assets/images/Blue_gradient.webp"
                                                                        : 'assets/images/orange_moon.webp'),
                                                colorFilter: const ColorFilter.mode(Color.fromRGBO(0, 0, 0, 0.5), BlendMode.dstATop),
                                                fit: BoxFit.cover)),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                7.5,
                                          ),
                                          Text(
                                            allGoals[index]['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    2.0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff5B74A6)),
                                          ),
                                          SizedBox(
                                            height:
                                                AppDimensions.height10(context),
                                          ),
                                          Text(
                                              allGoals[index]
                                                      ['identityStatement'][0]
                                                  ['text'],
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff5B74A6))),
                                        ]))),
                                Container(

                                  child: ListView.builder(
                                      // physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.past_session
                                          ? activePractices[index]['practices']
                                              .length
                                          : allGoals[index]['userPractices']
                                              .length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: ((context, index1) {
                                        return Align(
                                          alignment: const Alignment(1, 1),
                                          child: AnimatedScaleButton(
                                            onTap: () async {
                                              widget.past_session
                                                  ? Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page: emotions(
                                                        summary: false,
                                                        pracName: widget
                                                                .past_session
                                                            ? activePractices[
                                                                        index][
                                                                    'practices']
                                                                [index1]['name']
                                                            : allGoals[index][
                                                                    'userPractices']
                                                                [
                                                                index1]['name'],
                                                        record: true,
                                                        selected: 0,
                                                      )))
                                                  : Navigator.pushReplacement(
                                                      context,
                                                      FadePageRoute(
                                                          page:
                                                              const PracticeReview()));

                                              final SharedPreferences prefs =
                                                  await _prefs;
                                              await prefs.setInt('goal_num',
                                                  allGoals[index]['id']);
                                              if (widget.past_session == true) {
                                                await prefs.setInt(
                                                    'prac_num',
                                                    activePractices[index]
                                                            ['practices']
                                                        [index1]['id']);
                                              } else {
                                                await prefs.setInt(
                                                    'prac_num',
                                                    allGoals[index]
                                                            ['userPractices']
                                                        [index1]['id']);
                                              }

                                              await prefs.setString(
                                                  'practice_review',
                                                  'record_session');
                                            },
                                            child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  13.8,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  13.8,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.5),
                                              margin: EdgeInsets.only(
                                                left: index1 == 0? AppDimensions.height10(
                                                    context) *
                                                    2.9: 0,
                                                  right: AppDimensions.height10(
                                                          context) *
                                                      1.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: widget.past_session
                                                        ? AssetImage(activePractices[index]['practices'][index1]['color']
                                                                    .toString() ==
                                                                '1'
                                                            ? "assets/images/Ellipse orange.webp"
                                                            : activePractices[index]['practices'][index1]['color']
                                                                        .toString() ==
                                                                    '2'
                                                                ? 'assets/images/Ellipse 158.webp'
                                                                : activePractices[index]['practices'][index1]['color'].toString() ==
                                                                        '3'
                                                                    ? "assets/images/Ellipse 157.webp"
                                                                    : activePractices[index]['practices'][index1]['color'].toString() ==
                                                                            '4'
                                                                        ? "assets/images/Ellipse light-blue.webp"
                                                                        : activePractices[index]['practices'][index1]['color'].toString() ==
                                                                                '5'
                                                                            ? "assets/images/Ellipse blue.webp"
                                                                            : 'assets/images/Ellipse 158.webp')
                                                        : AssetImage(allGoals[index]['userPractices']
                                                                        [index1]
                                                                    ['color'] ==
                                                                '1'
                                                            ? "assets/images/Ellipse orange.webp"
                                                            : allGoals[index]['userPractices'][index1]['color'] == '2'
                                                                ? 'assets/images/Ellipse 158.webp'
                                                                : allGoals[index]['userPractices'][index1]['color'] == '3'
                                                                    ? "assets/images/Ellipse 157.webp"
                                                                    : allGoals[index]['userPractices'][index1]['color'] == '4'
                                                                        ? "assets/images/Ellipse light-blue.webp"
                                                                        : allGoals[index]['userPractices'][index1]['color'] == '5'
                                                                            ? "assets/images/Ellipse blue.webp"
                                                                            : 'assets/images/Ellipse 158.webp'),
                                                    fit: BoxFit.cover),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  widget.past_session
                                                      ? activePractices[index]
                                                                  ['practices']
                                                              [index1]['name']
                                                          .toString()
                                                      : allGoals[index]
                                                              ['userPractices']
                                                          [index1]['name'],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: 'laila',
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.8,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                ),
                              ]),
                            );
                          }),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 8.4,
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedScaleButton(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              FadePageRoute(page: const view_all_goals_menu()));
                        },
                        child: Container(
                          height: AppDimensions.height10(context) * 5.5,
                          margin: EdgeInsets.symmetric(
                              vertical: AppDimensions.height10(context) * 3.4),
                          child: Container(
                            height: AppDimensions.height10(context) * 5.2,
                            width: AppDimensions.width10(context) * 24.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 5.0)),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFFCC10D),
                                      Color(0xFFFDA210)
                                    ])),
                            child: Center(
                                child: Text(
                              'View all your goals',
                              style: TextStyle(
                                  color: const Color(0xFFFBFBFB),
                                  fontSize: AppDimensions.font10(context) * 1.8,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const practice_session_shimmer(),
        ),
      ),
    );
  }
}
