
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:potenic_app/utils/formattedTime.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


noSessions(BuildContext context,data,controller,past, current, next, final VoidCallback action1,final VoidCallback action2){
  return SizedBox(
      width: double.infinity,
      height:
      UpdatedDimensions.height10(context) * 19.2,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              //  color: Colors.red,
              height: UpdatedDimensions.height10(
                  context) *
                  19.2,
              // width: UpdatedDimensions.width10(context) * 39.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                child: Row(
                  children: [
                    AnimatedScaleButton(
                      onTap: action1,
                      child: Container(
                        height: UpdatedDimensions
                            .height10(
                            context) *
                            7.9,
                        width:
                        UpdatedDimensions.width10(
                            context) *
                            7.9,
                        margin: EdgeInsets.only(
                            top: UpdatedDimensions
                                .height10(
                                context) *
                                8.4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3,
                              color:
                              Colors.white),
                          gradient: const LinearGradient(
                              begin: Alignment
                                  .topCenter,
                              end: Alignment
                                  .bottomCenter,
                              colors: [
                                Color(0xffF5F1E0),
                                Color(0xffEDDC97)
                              ]),
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Text(
                              getFormattedDay(
                                  past)
                                  .substring(
                                  0, 3),
                              style: TextStyle(
                                  fontSize: UpdatedDimensions
                                      .font10(
                                      context) *
                                      1.2,
                                  fontWeight:
                                  FontWeight
                                      .w600,
                                  color: const Color(
                                      0xff5B74A6)),
                            ),
                            Text(
                              '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                              style: TextStyle(
                                  fontSize: UpdatedDimensions
                                      .font10(
                                      context) *
                                      1.4,
                                  fontWeight:
                                  FontWeight
                                      .w400,
                                  color: const Color(
                                      0xff5B74A6)),
                            ),
                            Container(
                              height: UpdatedDimensions
                                  .height10(
                                  context) *
                                  2.5,
                              width: UpdatedDimensions
                                  .height10(
                                  context) *
                                  2.5,
                              decoration: const BoxDecoration(
                                  shape: BoxShape
                                      .circle,
                                  color: Color(
                                      0xff156F6D)),
                              child: SizedBox(
                                  width: UpdatedDimensions
                                      .width10(
                                      context) *
                                      1.7,
                                  height: UpdatedDimensions
                                      .height10(
                                      context) *
                                      1.5,

                                  // margin: const EdgeInsets.only(left: 1),
                                  child: Center(
                                    child: Text(
                                      '${data['previousCompletePractice']}/${data['previousTotalPractice']}',
                                      style: TextStyle(
                                          fontSize:
                                          UpdatedDimensions.font10(context) *
                                              1.0,
                                          fontWeight:
                                          FontWeight
                                              .w400,
                                          color: Colors
                                              .white),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width:
                      UpdatedDimensions.height10(
                          context) *
                          8.3,
                      height:
                      UpdatedDimensions.height10(
                          context) *
                          8.3,
                      margin:
                      const EdgeInsets.only(
                          right: 121,
                          left: 121),
                      padding:
                      const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1,
                              color:
                              Colors.white),
                          color:
                          Colors.transparent),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     FadePageRoute(
                          //         page: const view_goals(
                          //             missed: false)));
                        },
                        child: Container(
                          height: UpdatedDimensions
                              .height10(
                              context) *
                              7.9,
                          width: UpdatedDimensions
                              .width10(
                              context) *
                              7.9,
                          decoration: BoxDecoration(
                              shape:
                              BoxShape.circle,
                              border: Border.all(
                                  width: 3,
                                  color: Colors
                                      .white),
                              gradient: const LinearGradient(
                                  begin: Alignment
                                      .topCenter,
                                  end: Alignment
                                      .bottomCenter,
                                  colors: [
                                    Color(
                                        0xffCCCCCA),
                                    Color(
                                        0xff5E5D5C)
                                  ])),
                          child: Stack(
                              alignment: Alignment
                                  .center,
                              children: [
                                Align(
                                  alignment:
                                  const Alignment(
                                      0, 0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        getFormattedDay(
                                            current)
                                            .substring(
                                            0,
                                            3),
                                        style: TextStyle(
                                            height: UpdatedDimensions.height10(context) *
                                                0.12,
                                            fontSize: UpdatedDimensions.font10(context) *
                                                1.2,
                                            fontWeight: FontWeight
                                                .w600,
                                            color:
                                            const Color(0xFFFBFBFB)),
                                      ),
                                      Text(
                                        '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                        style: TextStyle(
                                            height: UpdatedDimensions.height10(context) *
                                                0.12,
                                            color: const Color(
                                                0xFFFBFBFB),
                                            fontSize: UpdatedDimensions.font10(context) *
                                                1.4,
                                            fontWeight:
                                            FontWeight.w400),
                                      ),
                                      Container(
                                          height: UpdatedDimensions.height10(context) *
                                              2.5,
                                          width: UpdatedDimensions.height10(context) *
                                              2.5,
                                          margin: EdgeInsets.only(
                                              top: UpdatedDimensions.height10(context) *
                                                  0.3),
                                          decoration:
                                          const BoxDecoration(
                                            shape:
                                            BoxShape.circle,
                                          ),
                                          child:
                                          DottedBorder(
                                            borderType:
                                            BorderType.Circle,
                                            color:
                                            Colors.white,
                                            child:
                                            Center(
                                              child:
                                              Text(
                                                '0/0',
                                                style: TextStyle(fontSize: UpdatedDimensions.font10(context) * 1.0, fontWeight: FontWeight.w400, color: Colors.white),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: action2,
                      child: Container(
                          height:
                          UpdatedDimensions
                              .height10(
                              context) *
                              7.9,
                          width: UpdatedDimensions
                              .width10(
                              context) *
                              7.9,
                          margin: EdgeInsets.only(
                            top: UpdatedDimensions
                                .height10(
                                context) *
                                8.4,
                          ),
                          decoration:
                          BoxDecoration(
                            shape:
                            BoxShape.circle,
                            border: Border.all(
                                width: UpdatedDimensions
                                    .width10(
                                    context) *
                                    0.3,
                                color:
                                Colors.white),
                            gradient: const LinearGradient(
                                begin: Alignment
                                    .topCenter,
                                end: Alignment
                                    .bottomCenter,
                                colors: [
                                  Color(
                                      0xffF5F1E0),
                                  Color(
                                      0xffEDDC97)
                                ]),
                          ),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                            children: [
                              Text(
                                getFormattedDay(
                                    next)
                                    .substring(
                                    0, 3),
                                style: TextStyle(
                                    fontSize:
                                    UpdatedDimensions.font10(
                                        context) *
                                        1.2,
                                    fontWeight:
                                    FontWeight
                                        .w400,
                                    color: const Color(
                                        0xff5B74A6)),
                              ),
                              Text(
                                '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                style: TextStyle(
                                    fontSize:
                                    UpdatedDimensions.font10(
                                        context) *
                                        1.4,
                                    fontWeight:
                                    FontWeight
                                        .w400,
                                    color: const Color(
                                        0xff5B74A6)),
                              ),
                              Container(
                                height: UpdatedDimensions
                                    .height10(
                                    context) *
                                    2.5,
                                width: UpdatedDimensions
                                    .width10(
                                    context) *
                                    2.5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape
                                        .circle,
                                    color: Color(
                                        0xff156F6D)),
                                child: SizedBox(
                                    width: UpdatedDimensions
                                        .width10(
                                        context) *
                                        1.7,
                                    height: UpdatedDimensions
                                        .height10(
                                        context) *
                                        1.5,

                                    // margin: const EdgeInsets.only(left: 1),
                                    child: Center(
                                      child: Text(
                                        '${data['nextCompletePractice']}/${data['nextTotalPratice']}',
                                        style: TextStyle(
                                            fontSize: UpdatedDimensions.font10(context) *
                                                1.0,
                                            fontWeight: FontWeight
                                                .w400,
                                            color:
                                            Colors.white),
                                      ),
                                    )),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width:
              UpdatedDimensions.width10(context) *
                  34.3,
              height: UpdatedDimensions.height10(
                  context) *
                  4.9,
              margin: EdgeInsets.only(
                  top: UpdatedDimensions.height10(
                      context) *
                      18.9),
              child: Center(
                child: Text(
                  AppText().noSession,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                      UpdatedDimensions.font10(
                          context) *
                          3.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Laila'),
                ),
              ),
            ),
            SizedBox(
              width: UpdatedDimensions.width10(
                  context) *
                  26.9,
              height: UpdatedDimensions.height10(
                  context) *
                  5.8,
              child: Center(
                child: Text(
                  AppText().noSessionBody,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Laila',
                      height: UpdatedDimensions
                          .height10(
                          context) *
                          0.15,
                      fontSize:
                      UpdatedDimensions.font10(
                          context) *
                          1.8,
                      fontWeight:
                      FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: UpdatedDimensions.height10(
                  context) *
                  1.4,
            ),
            AnimatedScaleButton(
              onTap: () async {
                Navigator.push(
                    context,
                    FadePageRoute(
                        page:
                        const record_session(
                          past_session: true,
                        )));
                final SharedPreferences prefs =
                await _prefs;
                prefs.setString(
                    'record_date',
                    getFormattedDate(current)
                        .toString());
              },
              child: Container(
                width: UpdatedDimensions.width10(
                    context) *
                    10.1,
                height: UpdatedDimensions.height10(
                    context) *
                    10.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                        width:
                        UpdatedDimensions.width10(
                            context) *
                            0.3,
                        color: Colors.white)),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Container(
                        height:
                        UpdatedDimensions.height10(
                            context) *
                            3.5,
                        width:
                        UpdatedDimensions.width10(
                            context) *
                            3.5,
                        padding: EdgeInsets.all(
                            UpdatedDimensions.height10(
                                context) *
                                0.6),
                        decoration: BoxDecoration(
                            shape:
                            BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color:
                                Colors.white),
                            color: Colors.transparent),
                        child: Image.asset(
                          'assets/images/Add goal.webp',
                          height: UpdatedDimensions
                              .height10(
                              context) *
                              2.9,
                          width: UpdatedDimensions
                              .width10(
                              context) *
                              2.9,
                        )),
                    Center(
                      child: Text(
                        'Add\npractice',
                        textAlign:
                        TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'laila',
                            fontSize: UpdatedDimensions
                                .font10(
                                context) *
                                1.4,
                            fontWeight:
                            FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ])));
}