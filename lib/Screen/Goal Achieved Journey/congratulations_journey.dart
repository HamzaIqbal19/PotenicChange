import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/constants/videothumbnail.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/new_progress_score.dart';
import 'package:potenic_app/Widgets/AppCustomCircle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_dimensions.dart';

class Congratulations_journey extends StatefulWidget {
  const Congratulations_journey({super.key});

  @override
  State<Congratulations_journey> createState() =>
      _Congratulations_journeyState();
}

class _Congratulations_journeyState extends State<Congratulations_journey> {
  int goalLevel = 0;
  var goalName;
  var practices;
  var identity;
  var color;
  var hurdles;
  var inspirations;
  var goalDetails;
  String day = '';
  String month = '';
  String year = '';
  int activePractices = 0;
  String subscriptions = '';

  bool loading = true;

  void _fetchGoalNames() async {
    AdminGoal.getUpdatedGoal().then((response) {
      print("Goal Achieved: ${response['userInspirations']}");
      if (response.length != 0) {
        setState(() {
          loading = false;
          goalDetails = response;
          goalName = response["name"];
          practices = response['userPractices'];
          subscriptions = response['subscriptionsStatus'];
          color = response["color"];
          hurdles = response['userHurdles'];
          identity = response["identityStatement"][0]['text'];
          goalLevel = response["goalLevel"];
          inspirations = response['userInspirations'];
          activePractices = response['activePracticesCount'];
          DateTime dateTime = DateTime.parse(response['createdAt']);
          day = dateTime.day.toString();
          month = dateTime.month.toString();
          year = dateTime.year.toString();
        });
        print("goalLevel = $goalDetails");
        print("isnpirations $inspirations");
      } else {
        setState(() {
          loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  static String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Unknown';
    }
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
                child: Buttons().closeButton(
              context,
              () {
                Navigator.pop(context);
              },
            )
                //  IconButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     icon: Image.asset(
                //       'assets/images/Close.webp',
                //       // width: AppDimensionsUpdated.width10(context) * 2.6,
                //       height: AppDimensionsUpdated.height10(context) * 2.6,
                //       fit: BoxFit.contain,
                //     )),
                )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/Background Congratulations.webp'),
                fit: BoxFit.cover)),
        child: loading == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      //height: AppDimensionsUpdated.height10(context) * 85.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_0.webp'),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    18.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Your journey with us',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            4.0,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.15,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFFBFBFB),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          5),
                                  child: Text(
                                    'We’ve put together your personal\ndevelopment journey for you.\n\nTake a look...',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      letterSpacing:
                                          AppDimensionsUpdated.height10(
                                                  context) *
                                              0.2,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          0.15,
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) *
                                              2,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFBFBFB),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          9.6),
                                  child: Center(
                                    child: Text(
                                      'When did it start?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: AppDimensionsUpdated.font10(
                                                  context) *
                                              2.4,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFFBFBFB),
                                          height: AppDimensionsUpdated.height10(
                                                  context) *
                                              0.12),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          3.7),
                                  child: Image.asset(
                                    'assets/images/Arrow.webp',
                                    width:
                                        AppDimensionsUpdated.width10(context) *
                                            4.3,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            4.3,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: AppDimensionsUpdated.height10(context) * 26.7,
                    // ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_1.webp'),
                              fit: BoxFit.cover)),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 1.6),
                          child: Center(
                            child: Text(
                              'You started your goal\nwith us on...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.4,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 5.6,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Center(
                                  child: Text(
                                    day,
                                    style: TextStyle(
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            9.6,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: -6,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB),
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Center(
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensionsUpdated.font10(
                                                          context) *
                                                      3.0,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: 'laila',
                                              color: const Color(0xFFFBFBFB),
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.12),
                                          children: [
                                        TextSpan(
                                            text:
                                                '${_getMonthName(int.parse(month))}\n',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(text: year),
                                      ])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 3.4,
                        ),
                        Container(
                          width: AppDimensionsUpdated.width10(context) * 26.8,
                          height: AppDimensionsUpdated.height10(context) * 26.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('$color' == '1'
                                    ? "assets/images/red_gradient.webp"
                                    : '$color' == '2'
                                        ? 'assets/images/orange_moon.webp'
                                        : '$color' == '3'
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : '$color' == '4'
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : '$color' == '5'
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : '$color' == '6'
                                                        ? "assets/images/Blue_gradient.webp"
                                                        : 'assets/images/orange_moon.webp'),
                                fit: BoxFit.contain),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          9.0,
                                  width: AppDimensionsUpdated.width10(context) *
                                      24.0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppDimensionsUpdated.height10(
                                              context) *
                                          2.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        goalName,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensionsUpdated.font10(
                                                        context) *
                                                    2.0,
                                            height:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    0.14,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff5B74A6)),
                                      ),
                                      SizedBox(
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            0.7,
                                      ),
                                      SizedBox(
                                        // color: Colors.green,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            4.0,
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            22.0,
                                        child: Text('"$identity"',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize:
                                                    AppDimensionsUpdated.font10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xff5B74A6))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          //  color: Colors.amber,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) *
                                  10.6),
                          child: Center(
                            child: Text(
                              'Practices created',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 3.7),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensionsUpdated.width10(context) * 4.1,
                            height:
                                AppDimensionsUpdated.height10(context) * 4.3,
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_2.webp'),
                              fit: BoxFit.cover)),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 10),
                          child: Text(
                            'Your implemented new\nbehaviour practices to fulfill\n your vision...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.4,
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.15),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 5.6,
                        ),
                        SizedBox(
                            child: Center(
                          child: Text('${practices.length}',
                              style: TextStyle(
                                  fontFamily: 'Laila',
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          9.6,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12)),
                        )),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 4.0,
                        ),
                        Container(
                          height: AppDimensionsUpdated.height10(context) * 14.8,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: int.parse('${practices.length}'),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return AnimatedScaleButton(
                                  onTap: () {},
                                  child: AppCustomCircle().CustomContainer(
                                    context,
                                    margin: EdgeInsets.only(
                                        left: index == 0
                                            ? AppDimensionsUpdated.width10(
                                                    context) *
                                                12.8
                                            : AppDimensionsUpdated.width10(
                                                    context) *
                                                1.2),
                                    border: Border.all(
                                        color: Colors.white,
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            0.2),
                                    image: DecorationImage(
                                        image: AssetImage(practices[index]
                                                    ['color'] ==
                                                '1'
                                            ? "assets/images/Ellipse orange_wb.webp"
                                            : practices[index]['color'] == '2'
                                                ? 'assets/images/Ellipse 158_wb.webp'
                                                : practices[index]['color'] ==
                                                        '3'
                                                    ? "assets/images/Ellipse 157_wb.webp"
                                                    : practices[index]
                                                                ['color'] ==
                                                            '4'
                                                        ? "assets/images/Ellipse light-blue_wb.webp"
                                                        : practices[index]
                                                                    ['color'] ==
                                                                '5'
                                                            ? "assets/images/Ellipse blue_wb.webp"
                                                            : 'assets/images/Ellipse 158_wb.webp'),
                                        fit: BoxFit.contain),
                                    // Container(
                                    //   height:
                                    //       AppDimensionsUpdated.height10(context) *
                                    //           13.8,
                                    //   width:
                                    //       AppDimensionsUpdated.width10(context) *
                                    //           13.8,
                                    //   margin: EdgeInsets.only(
                                    //       left: index == 0
                                    //           ? AppDimensionsUpdated.width10(
                                    //                   context) *
                                    //               12.2
                                    //           : AppDimensionsUpdated.width10(
                                    //                   context) *
                                    //               1.2),
                                    //   decoration: BoxDecoration(
                                    //       // color: Colors.amber,
                                    //       shape: BoxShape.circle,
                                    //       border: Border.all(
                                    //           color: Colors.white,
                                    //           width: AppDimensionsUpdated.width10(
                                    //                   context) *
                                    //               0.2),
                                    //       image: DecorationImage(
                                    //           image: AssetImage(practices[index]
                                    //                       ['color'] ==
                                    //                   '1'
                                    //               ? "assets/images/Ellipse orange_wb.webp"
                                    //               : practices[index]['color'] ==
                                    //                       '2'
                                    //                   ? 'assets/images/Ellipse 158_wb.webp'
                                    //                   : practices[index]
                                    //                               ['color'] ==
                                    //                           '3'
                                    //                       ? "assets/images/Ellipse 157_wb.webp"
                                    //                       : practices[index]
                                    //                                   ['color'] ==
                                    //                               '4'
                                    //                           ? "assets/images/Ellipse light-blue_wb.webp"
                                    //                           : practices[index]
                                    //                                       ['color'] ==
                                    //                                   '5'
                                    //                               ? "assets/images/Ellipse blue_wb.webp"
                                    //                               : 'assets/images/Ellipse 158_wb.webp'),
                                    //           fit: BoxFit.contain)),
                                    child: Center(
                                        child: Text(
                                      practices[index]['name'].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: AppDimensionsUpdated.font10(
                                                  context) *
                                              1.8,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              })),
                        ),
                        Container(
                          //  color: Colors.amber,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) *
                                  16.4),
                          child: Center(
                            child: Text(
                              'Hurdles faced',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 3.7),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensionsUpdated.width10(context) * 4.1,
                            height:
                                AppDimensionsUpdated.height10(context) * 4.3,
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_1.webp'),
                              fit: BoxFit.cover)),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 10.1,
                              bottom:
                                  AppDimensionsUpdated.height10(context) * 5.6),
                          child: Text(
                            'You recorded the following\nhurdles to fulfill your\nvision...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.4,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.15),
                          ),
                        ),
                        SizedBox(
                            child: Center(
                          child: Text('${hurdles.length}',
                              style: TextStyle(
                                  fontFamily: 'Laila',
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          9.6,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12)),
                        )),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 4,
                        ),
                        Container(
                          height: AppDimensionsUpdated.height10(context) * 18.8,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: int.parse('${hurdles.length}'),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return AnimatedScaleButton(
                                  onTap: () {},
                                  child: Container(
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            16.6,
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            17.2,
                                    padding: EdgeInsets.all(
                                        AppDimensionsUpdated.height10(context)),
                                    decoration: const BoxDecoration(
                                        //color: Colors.amber,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/hurdleGlare.webp'),
                                            fit: BoxFit.contain)),
                                    margin: EdgeInsets.only(
                                        left: index == 0
                                            ? AppDimensionsUpdated.width10(
                                                    context) *
                                                12.8
                                            : AppDimensionsUpdated.width10(
                                                    context) *
                                                1.2),
                                    child: Container(
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          16.6,
                                      width: AppDimensionsUpdated.height10(
                                              context) *
                                          17.2,
                                      decoration: const BoxDecoration(
                                          //color: Colors.amber,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/black_hole.webp'),
                                              fit: BoxFit.contain)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: AppDimensionsUpdated
                                                        .height10(context) *
                                                    1.7),
                                            //height: AppDimensionsUpdated.height10(context) * 1.9,
                                            child: Center(
                                              child: Text(
                                                hurdles[index]['hurdleName']
                                                    .toString()
                                                    .capitalizeFirst!,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        AppDimensionsUpdated
                                                                .font10(
                                                                    context) *
                                                            1.6,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: AppDimensionsUpdated
                                                        .height10(context) *
                                                    1.7),
                                            margin: EdgeInsets.only(
                                                top: AppDimensionsUpdated
                                                        .height10(context) *
                                                    0.4),
                                            child: Text(
                                              hurdles[index]['triggerStatment']
                                                  .toString()
                                                  .capitalizeFirst!,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      0.12,
                                                  fontSize: AppDimensionsUpdated
                                                          .font10(context) *
                                                      1.4,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) *
                                  14.695),
                          child: Center(
                            child: Text(
                              'Your inspirations',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 3.7),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensionsUpdated.width10(context) * 4.1,
                            height:
                                AppDimensionsUpdated.height10(context) * 4.3,
                          ),
                        ),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 10,
                        ),
                      ]),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_2.webp'),
                              fit: BoxFit.cover)),
                      child: Column(children: [
                        Container(
                          child: Text(
                            "This is your inspirations that\nyou created to boost your\nmotivation towards the vision\nof reaching your desired\ngoal...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.4,
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.15),
                          ),
                        ),
                        SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 5.6),
                        SizedBox(
                            child: Center(
                          child: Text('${inspirations.length}',
                              style: TextStyle(
                                  fontFamily: 'Laila',
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          9.6,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12)),
                        )),
                        SizedBox(
                            height: AppDimensionsUpdated.height10(context) * 5),
                        Container(
                          height: AppDimensionsUpdated.height10(context) * 15.1,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: int.parse('${inspirations.length}'),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return inspirations[index]['inspirationId'] == 2
                                    ? Container(
                                        padding: EdgeInsets.all(
                                            AppDimensions.width10(context) *
                                                1.5),
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            16.9,
                                        height: AppDimensionsUpdated.width10(
                                                context) *
                                            16.9,
                                        margin: EdgeInsets.only(
                                            left: index == 0
                                                ? AppDimensionsUpdated.width10(
                                                        context) *
                                                    12.8
                                                : AppDimensionsUpdated.width10(
                                                        context) *
                                                    0.6),
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: RadialGradient(colors: [
                                              Color(0xFFE9A594),
                                              Color(0xFFEEBEB2)
                                            ])),
                                        child: Center(
                                            child: Text(
                                          inspirations[index]['description'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensionsUpdated.font10(
                                                          context) *
                                                      1.6,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    : inspirations[index]['inspirationId'] == 4
                                        ? Container(
                                            padding: EdgeInsets.all(
                                                AppDimensions.width10(context) *
                                                    1.5),
                                            width: AppDimensionsUpdated.width10(
                                                    context) *
                                                16.9,
                                            height:
                                                AppDimensionsUpdated.width10(
                                                        context) *
                                                    16.9,
                                            margin: EdgeInsets.only(
                                                left: index == 0
                                                    ? AppDimensionsUpdated
                                                            .width10(context) *
                                                        12.8
                                                    : AppDimensionsUpdated
                                                            .width10(context) *
                                                        0.6),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/contentviewbg.png"),
                                                    fit: BoxFit.cover)),
                                            child: Center(
                                                child: Text(
                                              inspirations[index]
                                                  ['description'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: AppDimensionsUpdated
                                                          .font10(context) *
                                                      1.6,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            )),
                                          )
                                        : inspirations[index]['inspirationId'] ==
                                                3
                                            ? Container(
                                                padding: EdgeInsets.all(
                                                    AppDimensions.width10(context) *
                                                        1.5),
                                                width:
                                                    AppDimensionsUpdated.width10(context) *
                                                        16.9,
                                                height:
                                                    AppDimensionsUpdated.width10(context) *
                                                        16.9,
                                                margin: EdgeInsets.only(
                                                    left: index == 0
                                                        ? AppDimensionsUpdated.width10(
                                                                context) *
                                                            12.8
                                                        : AppDimensionsUpdated
                                                                .width10(context) *
                                                            0.6),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: inspirations[index]['inspirationId'] == 3
                                                            ? Videothumbnail().extractThumbnailUrl(inspirations[index]['destinationLink']) == ''
                                                                ? const AssetImage('assets/images/video.webp') as ImageProvider
                                                                : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirations[index]['destinationLink']) as String)
                                                            : const AssetImage('') as ImageProvider,
                                                        fit: BoxFit.cover)),
                                                child: inspirations[index]['inspirationId'] == 3
                                                    ? Videothumbnail().extractThumbnailUrl(inspirations[index]['destinationLink']) == ''
                                                        ? Container()
                                                        : SizedBox(
                                                            width:
                                                                10, // Set the desired width
                                                            height:
                                                                10, // Set the desired height
                                                            child: Image.asset(
                                                              'assets/images/videoicon1.png',
                                                              // fit: BoxFit
                                                              //     ., // Ensures the image fits within the box
                                                            ),
                                                          )
                                                    // : Container(
                                                    //     decoration: BoxDecoration(
                                                    //         image: DecorationImage(
                                                    //             image: AssetImage(
                                                    //                 'assets/images/videoicon.png',))),
                                                    //   )
                                                    : Container())
                                            : Container(
                                                width: AppDimensionsUpdated
                                                        .width10(context) *
                                                    16.9,
                                                height: AppDimensionsUpdated
                                                        .width10(context) *
                                                    16.9,
                                                margin: EdgeInsets.only(
                                                    left: index == 0
                                                        ? AppDimensionsUpdated
                                                                .width10(
                                                                    context) *
                                                            12.8
                                                        : AppDimensionsUpdated
                                                                .width10(
                                                                    context) *
                                                            0.6),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        AppDimensionsUpdated
                                                                .height10(
                                                                    context) *
                                                            1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              18),
                                                  child: FadeInImage(
                                                    placeholder: const AssetImage(
                                                        'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                    image: NetworkImage(
                                                        inspirations[index]
                                                                ['file']
                                                            .toString()),
                                                    fit: BoxFit.cover,
                                                    placeholderFit:
                                                        BoxFit.contain,
                                                  ),
                                                ),
                                              );
                                // : Container();
                                // Container(
                                //   width: AppDimensionsUpdated.width10(context) *
                                //       16.9,
                                //   height:
                                //       AppDimensionsUpdated.width10(context) *
                                //           16.9,
                                //   margin: EdgeInsets.only(
                                //       left: index == 0
                                //           ? AppDimensionsUpdated.width10(
                                //                   context) *
                                //               12.2
                                //           : AppDimensionsUpdated.width10(
                                //                   context) *
                                //               1.2),
                                //   decoration: BoxDecoration(
                                //     gradient: inspirations[index]
                                //                 ['inspirationId'] ==
                                //             2
                                //         ? const RadialGradient(colors: [
                                //             Color(0xFFE9A594),
                                //             Color(0xFFEEBEB2)
                                //           ])
                                //         : const RadialGradient(colors: [
                                //             Color(0xFFD9D9D9),
                                //             Color(0xFFD9D9D9)
                                //           ]),
                                //     shape: BoxShape.circle,
                                //     image: DecorationImage(
                                //       image: inspirations[index]
                                //                   ['inspirationId'] ==
                                //               4
                                //           ? AssetImage(
                                //               'assets/images/distraction content.webp')
                                //           : inspirations[index]
                                //                       ['inspirationId'] ==
                                //                   3
                                //               ? NetworkImage(Videothumbnail()
                                //                       .extractThumbnailUrl(
                                //                           inspirations[index][
                                //                               'destinationLink']))
                                //                   as ImageProvider
                                //               : AssetImage(
                                //                   'assets/images/video.webp'),
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ),
                                //   child: inspirations[index]['inspirationId'] ==
                                //           2
                                //       ? Container(
                                //           padding: EdgeInsets.symmetric(
                                //               horizontal:
                                //                   AppDimensionsUpdated.height10(
                                //                           context) *
                                //                       1.7),
                                //           height: AppDimensionsUpdated.height10(
                                //                   context) *
                                //               6.3,
                                //           child: Center(
                                //               child: Text(
                                //             inspirations[index]['description'],
                                //             overflow: TextOverflow.ellipsis,
                                //             maxLines: 2,
                                //             textAlign: TextAlign.center,
                                //             style: TextStyle(
                                //                 fontSize:
                                //                     AppDimensionsUpdated.font10(
                                //                             context) *
                                //                         1.6,
                                //                 fontWeight: FontWeight.w400,
                                //                 color: const Color(0xFFFFFFFF)),
                                //           )),
                                //         )
                                //       : inspirations[index]['inspirationId'] ==
                                //               1
                                //           ? Container(
                                //               padding: EdgeInsets.symmetric(
                                //                   horizontal:
                                //                       AppDimensionsUpdated
                                //                               .height10(
                                //                                   context) *
                                //                           1),
                                //               child: ClipRRect(
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                         AppDimensionsUpdated
                                //                                 .height10(
                                //                                     context) *
                                //                             18),
                                //                 child: FadeInImage(
                                //                   placeholder: const AssetImage(
                                //                       'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                //                   image: NetworkImage(
                                //                       inspirations[index]
                                //                               ['file']
                                //                           .toString()),
                                //                   fit: BoxFit.cover,
                                //                   placeholderFit:
                                //                       BoxFit.contain,
                                //                 ),
                                //               ),
                                //             )
                                //           : Container(),
                                // );
                              })),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) *
                                  13.6),
                          child: Center(
                            child: Text(
                              'Practice sessions recorded',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 3.7),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensionsUpdated.width10(context) * 4.1,
                            height:
                                AppDimensionsUpdated.height10(context) * 4.3,
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_1.webp'),
                              fit: BoxFit.cover)),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) *
                                  10.2),
                          child: Text(
                            'Your effort since joining us ...',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.4,
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.15),
                          ),
                        ),
                        SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 5.6),
                        SizedBox(
                          child: Center(
                            child: Text(
                              "$activePractices",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          9.6,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0,
                                  fontFamily: 'Laila',
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: AppDimensionsUpdated.height10(context) * 4),
                        Container(
                          width: AppDimensionsUpdated.width10(context) * 15.6,
                          height: AppDimensionsUpdated.height10(context) * 17.8,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Ellipse 158.webp')),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(children: [
                            SizedBox(
                              child: Center(
                                child: Text(
                                  'Active Days',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) *
                                              2.4,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing:
                                          AppDimensionsUpdated.height10(
                                                  context) *
                                              0,
                                      color: const Color(0xFFFBFBFB),
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          0.12),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 1.15),
                              child: Container(
                                width:
                                    AppDimensionsUpdated.width10(context) * 4.8,
                                height: AppDimensionsUpdated.height10(context) *
                                    4.8,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.green[900],
                                  size: 30,
                                ),
                              ),
                            )
                          ]),
                        ),
                        Container(
                          width: AppDimensionsUpdated.width10(context) * 16.784,
                          height: AppDimensionsUpdated.height10(context) * 4.4,
                          //  color: Colors.amber,
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 8.9),
                          child: Center(
                            child: Text(
                              'And now',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          2.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 3.7),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensionsUpdated.width10(context) * 4.1,
                            height:
                                AppDimensionsUpdated.height10(context) * 4.3,
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 10,
                        )
                      ]),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/journey_2.webp'),
                              fit: BoxFit.cover)),
                      child: Column(children: [
                        Container(
                          child: Text(
                            'Well Done &\nCongratulations',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.8,
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.16),
                          ),
                        ),
                        Container(
                          child: Text(
                            '\n\nYou have\nachieved your desired level!\n\nYou are living your vision and desired identity :)\n\nIt’s time to celebrate!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.0,
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.16),
                          ),
                        ),
                        SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 7.2),
                        SizedBox(
                          width: AppDimensionsUpdated.width10(context) * 35.8,
                          height: AppDimensionsUpdated.height10(context) * 36.8,
                          child: Stack(children: [
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.8,
                              height:
                                  AppDimensionsUpdated.height10(context) * 36.8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/congratsGoalBg.png"))),
                            ),
                            Align(
                              alignment: Alignment(0, -0.5),
                              child: Container(
                                width: AppDimensionsUpdated.width10(context) *
                                    26.8,
                                height: AppDimensionsUpdated.height10(context) *
                                    26.8,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('$color' == '1'
                                          ? "assets/images/red_gradient.webp"
                                          : '$color' == '2'
                                              ? 'assets/images/orange_moon.webp'
                                              : '$color' == '3'
                                                  ? "assets/images/lightGrey_gradient.webp"
                                                  : '$color' == '4'
                                                      ? "assets/images/lightBlue_gradient.webp"
                                                      : '$color' == '5'
                                                          ? "assets/images/medBlue_gradient.webp"
                                                          : '$color' == '6'
                                                              ? "assets/images/Blue_gradient.webp"
                                                              : 'assets/images/orange_moon.webp'),
                                      fit: BoxFit.contain),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // color: Colors.red,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            9.0,
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            24.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    2.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              goalName,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: AppDimensionsUpdated
                                                          .font10(context) *
                                                      2.0,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      0.14,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff5B74A6)),
                                            ),
                                            SizedBox(
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.7,
                                            ),
                                            SizedBox(
                                              // color: Colors.green,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      4.0,
                                              width:
                                                  AppDimensionsUpdated.width10(
                                                          context) *
                                                      22.0,
                                              child: Text('"$identity"',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      fontStyle: FontStyle
                                                          .italic,
                                                      fontSize:
                                                          AppDimensionsUpdated
                                                                  .font10(
                                                                      context) *
                                                              1.6,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff5B74A6))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.9),
                              child: Container(
                                width: AppDimensionsUpdated.width10(context) *
                                    12.5,
                                height: AppDimensionsUpdated.height10(context) *
                                    12.5,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/share_exp.webp'),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 8.0),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 8.8),
                          child: Center(
                            child: Text(
                              'What’s next?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          2.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top:
                                  AppDimensionsUpdated.height10(context) * 3.7),
                          child: Image.asset(
                            'assets/images/Arrow.webp',
                            width: AppDimensionsUpdated.width10(context) * 4.1,
                            height:
                                AppDimensionsUpdated.height10(context) * 4.3,
                          ),
                        ),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 10,
                        )
                      ]),
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(children: [
                        Container(
                          child: Text(
                            'What do you want to do next,\nnow that you are living\nyour goal and your desired\nidentity?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 2.2,
                                letterSpacing:
                                    AppDimensionsUpdated.height10(context) *
                                        0.2,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB),
                                height: AppDimensionsUpdated.height10(context) *
                                    0.15),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: new_progress_score(
                                        congratsScreen: true,
                                        dateChange: true,
                                        premium: subscriptions == 'active'
                                            ? true
                                            : false,
                                        evaluationIndex:
                                            prefs.getInt('selectedEval')!)));
                          },
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 29.0,
                            height:
                                AppDimensionsUpdated.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    5.0),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFFCC10D),
                                  Color(0xFFFDA210)
                                ]),
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        5.0)),
                            child: Center(
                              child: Text(
                                'Continue with goal',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) * 2,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            AdminGoal()
                                .updateUserGoalStatus('inactive')
                                .then((response) {
                              if (response == true) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const ViewDashboard(
                                      missed: false,
                                      name: '',
                                      update: false,
                                      helpfulTips: false,
                                      record: 0,
                                    )));
                                // _fetchGoalDetails();
                              } else if (response == 400) {
                                Navigator.pop(context);
                                // showAnimatedDialog(
                                //     animationType:
                                //         DialogTransitionType
                                //             .fadeScale,
                                //     curve: Curves
                                //         .easeInOut,
                                //     duration: const Duration(
                                //         seconds:
                                //             1),
                                //     context:
                                //         context,
                                //     builder: (BuildContext
                                //             context) =>
                                //         Container(
                                //           width:
                                //               AppDimensionsUpdated.width10(context) * 27.0,
                                //           height:
                                //               AppDimensionsUpdated.height10(context) * 18.2,
                                //           decoration:
                                //               BoxDecoration(borderRadius: BorderRadius.circular(AppDimensionsUpdated.height10(context) * 1.4)),
                                //           child:
                                //               AlertDialog(
                                //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensionsUpdated.height10(context) * 1.4)),
                                //             contentPadding: EdgeInsets.zero,
                                //             actionsPadding: EdgeInsets.zero,
                                //             titlePadding: EdgeInsets.zero,
                                //             title: Container(
                                //               margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.9, right: AppDimensionsUpdated.width10(context) * 1.6, left: AppDimensionsUpdated.width10(context) * 1.6, bottom: AppDimensionsUpdated.height10(context) * 0.2),
                                //               height: AppDimensionsUpdated.height10(context) * 2.2,
                                //               width: AppDimensionsUpdated.width10(context) * 23.8,
                                //               child: Text(
                                //                 "Turn off goal?",
                                //                 textAlign: TextAlign.center,
                                //                 style: TextStyle(
                                //                   fontSize: AppDimensionsUpdated.font10(context) * 1.7,
                                //                   fontWeight: FontWeight.w400,
                                //                 ),
                                //               ),
                                //             ),
                                //             content: Container(
                                //               margin: EdgeInsets.only(bottom: AppDimensionsUpdated.height10(context) * 1.5, left: AppDimensionsUpdated.width10(context) * 1.6, right: AppDimensionsUpdated.width10(context) * 1.6),
                                //               height: AppDimensionsUpdated.height10(context) * 3.4,
                                //               width: AppDimensionsUpdated.width10(context) * 23.8,
                                //               child: Text(
                                //                 "Goal status can only be changed after 60 days",
                                //                 textAlign: TextAlign.center,
                                //                 style: TextStyle(
                                //                   fontSize: AppDimensionsUpdated.font10(context) * 1.3,
                                //                   fontWeight: FontWeight.w400,
                                //                 ),
                                //               ),
                                //             ),
                                //             actions: <Widget>[
                                //               Column(
                                //                 children: [
                                //                   SizedBox(
                                //                     height: AppDimensionsUpdated.height10(context) * 0.1,
                                //                     child: Divider(
                                //                       color: const Color(0XFF3C3C43).withOpacity(0.29),
                                //                     ),
                                //                   ),
                                //                   Container(
                                //                     height: AppDimensionsUpdated.height10(context) * 4.2,
                                //                     width: double.infinity,
                                //                     color: const Color(0xFF007AFF),
                                //                     child: TextButton(
                                //                       onPressed: () {
                                //                         Navigator.pop(context);
                                //                       },
                                //                       child: Text(
                                //                         'OK',
                                //                         style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: AppDimensionsUpdated.font10(context) * 1.7, fontFamily: "Laila", fontWeight: FontWeight.w400),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: AppDimensionsUpdated.height10(context) * 0.1,
                                //                     child: Divider(
                                //                       color: const Color(0XFF3C3C43).withOpacity(0.29),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: AppDimensionsUpdated.height10(context) * 4.4,
                                //                     width: double.infinity,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         ));
                              }
                            });
                          },
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 29.0,
                            height:
                                AppDimensionsUpdated.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.8),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        5.0)),
                            child: Center(
                              child: Text(
                                'Stop goal',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.15,
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          1.8,
                                  color: const Color(0xFFFA9934),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensionsUpdated.height10(context) * 18,
                        )
                      ]),
                    ),

                    // Container()
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
    );
  }
}

class RandomContainers extends StatefulWidget {
  const RandomContainers({super.key});

  @override
  _RandomContainersState createState() => _RandomContainersState();
}

class _RandomContainersState extends State<RandomContainers> {
  final List<Widget> _containers = [];

  final double _minPosition = 0;
  final double _maxPosition = 850.0;
  final int _numberOfContainers = 80;

  @override
  void initState() {
    super.initState();
    _generateContainers();
  }

  void _generateContainers() {
    _containers.clear();
    final random = Random();

    for (int i = 0; i < _numberOfContainers; i++) {
      double x =
          _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
      double y =
          _minPosition + random.nextDouble() * (_maxPosition - _minPosition);

      Widget container = Positioned(
        left: x,
        top: y,
        child: SizedBox(
          width: AppDimensionsUpdated.width10(context) * 6.5,
          height: AppDimensionsUpdated.height10(context) * 7.4,
          child: Stack(children: [
            Container(
              width: AppDimensionsUpdated.width10(context) * 6.5,
              height: AppDimensionsUpdated.height10(context) * 7.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Ellipse 158.webp')),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: SizedBox(
                width: AppDimensionsUpdated.width10(context) * 2.7,
                height: AppDimensionsUpdated.height10(context) * 3.4,
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'laila',
                            color: Colors.white,
                            fontSize:
                                AppDimensionsUpdated.font10(context) * 1.4,
                            fontWeight: FontWeight.w400),
                        children: [
                      const TextSpan(
                        text: 'Tue',
                      ),
                      TextSpan(
                          text: '01/07',
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 0.9))
                    ])),
              )),
            ),
            Align(
              alignment: const Alignment(0, 1.0),
              child: Container(
                width: AppDimensionsUpdated.width10(context) * 2.0,
                height: AppDimensionsUpdated.height10(context) * 2.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/task_comp.webp'))),
              ),
            )
          ]),
        ),
      );

      _containers.add(container);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: AppDimensionsUpdated.width10(context) * 60.0,
        height: AppDimensionsUpdated.height10(context) * 40.0,
        child: Stack(
          children: _containers,
        ),
      ),
    );
  }
}


// class RandomNonOverlappingContainers extends StatefulWidget {
//   @override
//   _RandomNonOverlappingContainersState createState() =>
//       _RandomNonOverlappingContainersState();
// }

// class _RandomNonOverlappingContainersState
//     extends State<RandomNonOverlappingContainers> {
//   List<Widget> _containers = [];

//   final double _minPosition = 50.0;
//   final double _maxPosition = 250.0;
//   final int _numberOfContainers = 10;

//   @override
//   void initState() {
//     super.initState();
//     _generateContainers();
//   }

//  bool _isOverlap(Offset position) {
//   for (var container in _containers) {
//     if (container.key?.currentContext == null) continue; // check for null value
//     final RenderBox box = container.key.currentContext.findRenderObject();
//     final containerRect = box.localToGlobal(Offset.zero) & box.size;
//     if (containerRect.contains(position)) {
//       return true;
//     }
//   }
//   return false;
// }

//   void _generateContainers() {
//     _containers.clear();
//     final random = Random();

//     for (int i = 0; i < _numberOfContainers; i++) {
//       double x = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
//       double y = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);

//       Offset position = Offset(x, y);

//       while (_isOverlap(position)) {
//         x = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
//         y = _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
//         position = Offset(x, y);
//       }

//       Widget container = Positioned(
//         key: UniqueKey(),
//         left: x,
//         top: y,
//         child: Container(
//             width: AppDimensionsUpdated.width10(context) * 6.5,
//           height: AppDimensionsUpdated.height10(context) * 7.4,
//           color: Colors.blue,
//         ),
//       );

//       _containers.add(container);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: _containers,
//       ),
//     );
//   }
// }