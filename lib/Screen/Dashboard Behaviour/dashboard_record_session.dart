import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_practice_summary.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class record_session extends StatelessWidget {
  final bool past_session;
  const record_session({super.key, required this.past_session});

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
                  past_session
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
                scrollDirection: Axis.horizontal,
                child: Container(
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
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/orange_moon.webp'),
                                    colorFilter: ColorFilter.mode(
                                        Color.fromRGBO(0, 0, 0, 0.5),
                                        BlendMode.dstATop),
                                    fit: BoxFit.cover)),
                            child: Stack(children: [
                              Align(
                                  alignment: const Alignment(0, -0.5),
                                  child: Text(
                                    'Control my anger',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xff5B74A6)),
                                  )),
                              Align(
                                alignment: const Alignment(0, -0.2),
                                child: Text(
                                    '“I am someone who is in\n control of my anger”',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff5B74A6))),
                              ),
                            ]))),
                    Align(
                      alignment: const Alignment(0, 1),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 2.9),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                past_session
                                // ? Navigator.push(
                                //     context,
                                //     FadePageRoute(
                                //         page: emotions(summary: false)))
                                :
                                Navigator.push(context,
                                    FadePageRoute(page: PracticeReview()));
                              },
                              child: Container(
                                height: AppDimensions.height10(context) * 13.8,
                                width: AppDimensions.height10(context) * 13.8,
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 1.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse 158.webp'),
                                      fit: BoxFit.cover),
                                ),
                                child: Center(
                                  child: Text(
                                    'Meditation',
                                    style: TextStyle(
                                        fontFamily: 'laila',
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10(context) * 13.8,
                              width: AppDimensions.height10(context) * 13.8,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10(context) * 1.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse orange.webp'),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Text(
                                  'Count\ntemper\nepisodes',
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10(context) * 13.8,
                              width: AppDimensions.height10(context) * 13.8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse purple.webp'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Text(
                                  'Count\ndown',
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                height: AppDimensions.height10(context) * 30.2,
                width: AppDimensions.height10(context) * 31.5,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 3.4,
                    left: AppDimensions.height10(context) * 2.3),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: AppDimensions.height10(context) * 26.8,
                          height: AppDimensions.height10(context) * 26.8,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/blue_sun.webp'),
                                  colorFilter: ColorFilter.mode(
                                      Color.fromRGBO(0, 0, 0, 0.5),
                                      BlendMode.dstATop),
                                  fit: BoxFit.cover)),
                          child: Stack(children: [
                            Align(
                                alignment: const Alignment(0, -0.5),
                                child: Text(
                                  'Be more confident',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff5B74A6)),
                                )),
                            Align(
                              alignment: const Alignment(0, -0.2),
                              child: Text(
                                  'I am someone who is in\n confident in my abilities',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5B74A6))),
                            ),
                          ])),
                    ),
                    Align(
                      alignment: const Alignment(0, 1),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 2.9),
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 13.8,
                                    width:
                                        AppDimensions.height10(context) * 13.8,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            1.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse 158.webp'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Meditation',
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 13.8,
                                    width:
                                        AppDimensions.height10(context) * 13.8,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse blue.webp'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Talk to\nstrangers',
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    )
                  ],
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
