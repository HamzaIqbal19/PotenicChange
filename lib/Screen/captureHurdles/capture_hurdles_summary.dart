import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_new_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class summary_hurdles extends StatefulWidget {
  final bool delete_hurdle;
  const summary_hurdles({super.key, required this.delete_hurdle});

  @override
  State<summary_hurdles> createState() => _summary_hurdlesState();
}

class _summary_hurdlesState extends State<summary_hurdles> {
  var hurdlesSummary;
  var hurdlesList;
  int? hurdleCat;
  bool Loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesSummary = response['hurdle'];
          hurdleCat = response['hurdle']['hurdleId'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  void _fetchHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesList = response['hurdle'];
        });
        _fetchHurdleSummary();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchHurdle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: widget.delete_hurdle
              ? Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        'assets/images/Back.webp',
                        width: AppDimensions.height10(context) * 3.0,
                        height: AppDimensions.height10(context) * 3.0,
                        fit: BoxFit.cover,
                      )),
                )
              : Container(),
          actions: [
            widget.delete_hurdle
                ? Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const dashBoard(
                                saved: false,
                                helpful_tips: false,
                                membership: true,
                                dashboard_ctrl: false,
                                cancel: false,
                                trial: false,
                              )));
                        },
                        icon: Image.asset(
                          'assets/images/Close.webp',
                          width: AppDimensions.height10(context) * 2.6,
                          height: AppDimensions.height10(context) * 2.6,
                          fit: BoxFit.cover,
                        )),
                  )
                : Container()
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.webp'),
                fit: BoxFit.cover)),
        child: Loading == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.delete_hurdle
                        ? Container()
                        : Container(
                            width: AppDimensions.height10(context) * 35.4,
                            height: AppDimensions.height10(context) * 9.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 6.0,
                                bottom:
                                    AppDimensions.height10(context) * 3.349),
                            child: GradientText(
                              'Well done for capturing your hurdle',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: const [
                                Color(0xffFA9934),
                                Color(0xffEDD15E)
                              ],
                            ),
                          ),
                    Container(
                      width: AppDimensions.height10(context) * 21.252,
                      height: AppDimensions.height10(context) * 21.322,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.height10(context) * 1.5),
                      margin: EdgeInsets.only(
                          top: widget.delete_hurdle
                              ? AppDimensions.height10(context) * 9.7
                              : 0,
                          bottom: AppDimensions.height10(context) * 3.828),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/black_hole.webp'))),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  //width: AppDimensions.height10(context) * 7.1,
                                  // height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    capitalizeFirstLetter(
                                        hurdlesSummary['hurdleName']),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  // width:   AppDimensions.height10(context)(context)* 1571,
                                  // height:   AppDimensions.height10(context)(context)* 1.7,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.6),
                                  child: Text(
                                    capitalizeFirstLetter(
                                        hurdlesSummary['triggerStatment']),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.8),
                            child: AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const hurdle_name(
                                      update: true,
                                    )));
                              },
                              child: Container(
                                  height: AppDimensions.height10(context) * 3.0,
                                  width: AppDimensions.height10(context) * 3.0,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          2.1),
                                  padding: EdgeInsets.all(
                                      AppDimensions.height10(context) * 0.5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: const ImageIcon(
                                    AssetImage('assets/images/edit_icon.webp'),
                                    color: Colors.white,
                                    //size: 10,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: AppDimensions.height10(context) * 32.6,
                      height: AppDimensions.height10(context) * 5.2,
                      child: Center(
                        child: Text(
                          'Your current\nthoughts and feelings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10(context) * 14.7,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.9),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              hurdlesSummary['thoughtsAndFeelings'].length,
                          itemBuilder: ((context, index) {
                            return Container(
                              height: AppDimensions.height10(context) * 14.5,
                              width: AppDimensions.height10(context) * 14.5,
                              padding: EdgeInsets.all(
                                  AppDimensions.height10(context) * 2),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff546096),
                                        Color(0xff54A7BC)
                                      ])),
                              child: Center(
                                child: Text(
                                  hurdlesSummary['thoughtsAndFeelings'][index],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                          })),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const felling_hurdles(
                            update: true,
                          )),
                        );
                      },
                      child: Container(
                          height: AppDimensions.height10(context) * 3.0,
                          width: AppDimensions.height10(context) * 3.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.1),
                          padding: EdgeInsets.all(
                              AppDimensions.height10(context) * 0.5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: const ImageIcon(
                            AssetImage('assets/images/edit_icon.webp'),
                            color: Colors.white,
                            //size: 10,
                          )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 32.6,
                      height: AppDimensions.height10(context) * 5.2,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.0),
                      child: Center(
                        child: Text(
                          'Which goals\nare impacted?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const hurdles_goal_impact(
                              summary: true,
                            )));
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 6.0,
                        width: AppDimensions.height10(context) * 37.5,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 4.0,
                            top: AppDimensions.height10(context) * 3.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFBFBFB),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 23.9,
                              height: AppDimensions.height10(context) * 2.2,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 1.99),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '${hurdlesSummary['userGoalId'].length} impacted goals',
                                    style: TextStyle(
                                      color: const Color(0xFF646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                            Container(
                                //width: AppDimensions.height10(context) * 2.4,
                                // height: AppDimensions.height10(context) * 1.39,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10(context) *
                                        2.391),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: const Color(0xFF437296),
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationThickness:
                                          AppDimensions.height10(context) * 0.2,
                                      fontSize:
                                          AppDimensions.height10(context) *
                                              1.4),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 32.6,
                      height: AppDimensions.height10(context) * 5.2,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.0),
                      child: Center(
                        child: Text(
                          'What or who has triggered\nyour hurdle?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.9),
                      height: AppDimensions.height10(context) * 13.1,
                      width: AppDimensions.height10(context) * 13.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.1,
                              color: Colors.white),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffBE3FC6), Color(0xff642445)])),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              hurdlesList[hurdleCat!]['hurdleName'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.8),
                            child: AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const select_hurdle(
                                    update: true,
                                  )),
                                );
                              },
                              child: Container(
                                  height: AppDimensions.height10(context) * 3.0,
                                  width: AppDimensions.height10(context) * 3.0,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.2),
                                  padding: EdgeInsets.all(
                                      AppDimensions.height10(context) * 0.6),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  child: const ImageIcon(
                                    AssetImage('assets/images/edit_icon.webp'),
                                    color: Colors.white,
                                    //size: 10,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10(context) * 37.8,
                        height: AppDimensions.height10(context) * 5.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedScaleButton(
                                onTap: () {
                                  return showAnimatedDialog(
                                      animationType:
                                          DialogTransitionType.fadeScale,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(seconds: 1),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SizedBox(
                                            width: AppDimensions.height10(
                                                    context) *
                                                27.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                21.4,
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
                                              contentPadding: EdgeInsets.zero,
                                              actionsPadding: EdgeInsets.zero,
                                              titlePadding: EdgeInsets.zero,
                                              title: Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions.height10(context) *
                                                          1.9,
                                                      right: AppDimensions.height10(context) *
                                                          1.6,
                                                      left: AppDimensions.height10(context) *
                                                          1.6,
                                                      bottom: AppDimensions.height10(context) *
                                                          0.2),
                                                  height: AppDimensions.height10(context) *
                                                      4.4,
                                                  width: AppDimensions.height10(context) *
                                                      23.8,
                                                  child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          style: TextStyle(
                                                              fontSize:
                                                                  AppDimensions.height10(context) *
                                                                      1.7,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              color: const Color(0xFF000000)),
                                                          children: const [
                                                            TextSpan(
                                                                text:
                                                                    'Are you sure you want\nto'),
                                                            TextSpan(
                                                              text: ' delete ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                    'this hurdle?')
                                                          ]))),
                                              content: Container(
                                                margin: EdgeInsets.only(
                                                    bottom:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.5,
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6),
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    23.8,
                                                child: Text(
                                                  "By clicking 'Yes' you confirm that this\nhurdle will be deleted permanently. ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.3,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      child: Divider(
                                                        color: const Color(
                                                                0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.2,
                                                      width: double.infinity,
                                                      color: const Color(
                                                          0xFF007AFF),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.7,
                                                              fontFamily:
                                                                  "Laila",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      child: Divider(
                                                        color: const Color(
                                                                0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.4,
                                                      width: double.infinity,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Hurdles()
                                                              .deleteUserHurdle(
                                                                  hurdlesSummary[
                                                                      'id'])
                                                              .then((response) {
                                                            if (response ==
                                                                true) {
                                                              Navigator.push(
                                                                  context,
                                                                  FadePageRoute(
                                                                      page:
                                                                          const landing_hurdles()));
                                                            }
                                                          });
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.7,
                                                              fontFamily:
                                                                  "Laila",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xFF007AFF)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      child: Divider(
                                                        color: const Color(
                                                                0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    width:
                                        AppDimensions.height10(context) * 15.7,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff464646),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  0.8),
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                              ),
                              widget.delete_hurdle
                                  ? Container()
                                  : AnimatedScaleButton(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const landing_hurdles()));
                                      },
                                      child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.0,
                                          width:
                                              AppDimensions.height10(context) *
                                                  19.7,
                                          margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  2.4),
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
                                                AppDimensions.height10(
                                                        context) *
                                                    5.0),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Finish & exit',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ))),
                                    ),
                            ])),
                    widget.delete_hurdle
                        ? SizedBox(
                            height: AppDimensions.height10(context) * 16.0,
                          )
                        : Container(
                            // width:   AppDimensions.height10(context)(context)* 34.0,
                            height: AppDimensions.height10(context) * 2.2,
                            // color: Colors.amber,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.0,
                              bottom: AppDimensions.height10(context) * 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Coming soon ',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Text(
                                  '‘Add positive alternatives’',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                    Container(
                      width: AppDimensions.height10(context) * 17.0,
                      height: AppDimensions.height10(context) * 0.5,
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                    )
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
