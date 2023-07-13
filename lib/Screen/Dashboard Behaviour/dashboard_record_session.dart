import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_practice_summary.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class record_session extends StatefulWidget {
  final bool past_session;
  const record_session({super.key, required this.past_session});

  @override
  State<record_session> createState() => _record_sessionState();
}

class _record_sessionState extends State<record_session> {
  var allGoals;
  var allPractice;
  @override
  void initState() {
    super.initState();
    fetchGoalsByDay();
  }

  void fetchGoalsByDay() {
    AdminGoal.getUserGoalByDay('Monday').then((response) {
      if (response != "") {
        print(response);
        setState(() {
          allGoals = response;
        });
      }
      print('______________________________-----------------------');
      print(allGoals.length);
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
                  onPressed: () {},
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
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppDimensions.height10(context) * 6.8,
                width: AppDimensions.height10(context) * 21.7,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 5.3,
                    bottom: AppDimensions.height10(context) * 4.2),
                child: Center(
                    child: Text(
                  widget.past_session
                      ? 'Record Practice\nSession'
                      : 'View Practice\nSchedules',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'laila'),
                )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allGoals.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Container(
                      height: AppDimensions.height10(context) * 31.3,
                      width: AppDimensions.height10(context) * 46.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.3,
                          bottom: AppDimensions.height10(context) * 3.2),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                width: AppDimensions.height10(context) * 26.8,
                                height: AppDimensions.height10(context) * 26.8,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(allGoals[index]
                                                    ['color'] ==
                                                '1'
                                            ? "assets/images/red_gradient.webp"
                                            : allGoals[index]['color'] == '2'
                                                ? 'assets/images/orange_moon.webp'
                                                : allGoals[index]['color'] ==
                                                        '3'
                                                    ? "assets/images/lightGrey_gradient.webp"
                                                    : allGoals[index]
                                                                ['color'] ==
                                                            '4'
                                                        ? "assets/images/lightBlue_gradient.webp"
                                                        : allGoals[index]
                                                                    ['color'] ==
                                                                '5'
                                                            ? "assets/images/medBlue_gradient.webp"
                                                            : allGoals[index]['color'] ==
                                                                    '6'
                                                                ? "assets/images/Blue_gradient.webp"
                                                                : 'assets/images/orange_moon.webp'),
                                        colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(0, 0, 0, 0.5),
                                            BlendMode.dstATop),
                                        fit: BoxFit.cover)),
                                child:
                                    Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 6.0,
                                  ),
                                  Text(
                                    allGoals[index]['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10(context),
                                  ),
                                  Text(
                                      allGoals[index]['identityStatement'][0]
                                          ['text'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff5B74A6))),
                                ]))),
                        Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 2.9),
                          child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  allGoals[index]['userPractices'].length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: ((context, index1) {
                                return Align(
                                  alignment: const Alignment(1, 1),
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        past_session
                                        // ? Navigator.push(
                                        //     context,
                                        //     FadePageRoute(
                                        //         page: emotions(summary: false)))
                                        :
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: PracticeReview()));
                                      },
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                13.8,
                                        width: AppDimensions.height10(context) *
                                            13.8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
                                                    context) *
                                                0.5),
                                        margin: EdgeInsets.only(
                                            right: AppDimensions.height10(
                                                    context) *
                                                1.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(allGoals[index]
                                                              ['userPractices']
                                                          [index1]['color'] ==
                                                      '1'
                                                  ? "assets/images/Ellipse orange.webp"
                                                  : allGoals[index]['userPractices']
                                                                  [index1]
                                                              ['color'] ==
                                                          '2'
                                                      ? 'assets/images/Ellipse 158.webp'
                                                      : allGoals[index]['userPractices']
                                                                      [index1]
                                                                  ['color'] ==
                                                              '3'
                                                          ? "assets/images/Ellipse 157.webp"
                                                          : allGoals[index]['userPractices']
                                                                          [index1]
                                                                      ['color'] ==
                                                                  '4'
                                                              ? "assets/images/Ellipse light-blue.webp"
                                                              : allGoals[index]['userPractices'][index1]['color'] == '5'
                                                                  ? "assets/images/Ellipse blue.webp"
                                                                  : 'assets/images/Ellipse 158.webp'),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Center(
                                          child: Text(
                                            allGoals[index]['userPractices']
                                                [index1]['name'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'laila',
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
                      ]),
                    );
                  },
                ),
              ),
              Container(
                  height: AppDimensions.height10(context) * 5.0,
                  width: AppDimensions.height10(context) * 24.3,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 0.6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCC10D),
                          Color(0xffFDA210),
                        ]),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 5.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all goals',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 1.6,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'poppins'),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
