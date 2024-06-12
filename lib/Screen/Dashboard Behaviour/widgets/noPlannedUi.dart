
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:potenic_app/utils/formattedTime.dart';

noPlannedUi(BuildContext context, data,controller,past, current, next, final VoidCallback action1,final VoidCallback action2,final VoidCallback action3){
  return SizedBox(
      width: double.infinity,
      height:
      UpdatedDimensions.height10(context) * 19.2,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              child: Container(
                height: UpdatedDimensions.height10(
                    context) *
                    19.2,
                margin: const EdgeInsets.only(
                    right: 20),
                width: UpdatedDimensions.width10(
                    context) *
                    45.7,
                child: Stack(
                  children: [
                    Align(
                      alignment:
                      const Alignment(-1, 1),
                      child: AnimatedScaleButton(
                        onTap: action1,
                        child: Container(
                          height: UpdatedDimensions
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
                                  8.4),
                          decoration: BoxDecoration(
                              shape:
                              BoxShape.circle,
                              border: Border.all(
                                  width: UpdatedDimensions
                                      .width10(
                                      context) *
                                      0.3,
                                  color: Colors
                                      .white),
                              color: Colors
                                  .transparent),
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
                                    fontSize:
                                    UpdatedDimensions.font10(
                                        context) *
                                        1.2,
                                    fontWeight:
                                    FontWeight
                                        .w600,
                                    color: const Color(
                                        0xFFFBFBFB)),
                              ),
                              Text(
                                '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                style: TextStyle(
                                    fontSize:
                                    UpdatedDimensions.font10(
                                        context) *
                                        1.4,
                                    fontWeight:
                                    FontWeight
                                        .w400,
                                    color: Colors
                                        .white),
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
                                margin: EdgeInsets.only(
                                    top: UpdatedDimensions
                                        .height10(
                                        context) *
                                        0.332),
                                decoration:
                                BoxDecoration(
                                  shape: BoxShape
                                      .circle,
                                  border: Border.all(
                                      width: UpdatedDimensions.width10(
                                          context) *
                                          0.1,
                                      color: const Color(
                                          0xFFFBFBFB)),
                                ),
                                child: Container(
                                    width: UpdatedDimensions.width10(
                                        context) *
                                        1.7,
                                    height: UpdatedDimensions.height10(
                                        context) *
                                        1.5,
                                    margin: EdgeInsets.only(
                                        top: UpdatedDimensions.height10(
                                            context) *
                                            0.332),
                                    // margin: const EdgeInsets.only(left: 1),
                                    child: Center(
                                      child: Text(
                                        '${data['previousCompletePractice']}/${data['previousTotalPractice']}',
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
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment:
                      const Alignment(0, 0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     FadePageRoute(
                          //         page: const view_goals(
                          //       missed: false,
                          //     )));
                        },
                        child: Container(
                          width: UpdatedDimensions
                              .width10(
                              context) *
                              8.3,
                          height: UpdatedDimensions
                              .height10(
                              context) *
                              8.3,
                          //  margin: EdgeInsets.only(right: 121, left: 121),
                          padding:
                          const EdgeInsets
                              .all(4),
                          decoration: BoxDecoration(
                              shape:
                              BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: Colors
                                      .white),
                              color: Colors
                                  .transparent),
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
                                shape: BoxShape
                                    .circle,
                                border: Border.all(
                                    width: 3,
                                    color: Colors
                                        .white),
                                color: Colors
                                    .transparent),
                            child: Stack(
                                alignment:
                                Alignment
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
                                          getFormattedDay(current).substring(
                                              0,
                                              3),
                                          style: TextStyle(
                                              fontSize: UpdatedDimensions.font10(context) *
                                                  1.2,
                                              fontWeight:
                                              FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                          style: TextStyle(
                                              color: Colors
                                                  .white,
                                              fontSize: UpdatedDimensions.font10(context) *
                                                  1.4,
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                        Container(
                                            height: UpdatedDimensions.height10(context) *
                                                2.5,
                                            width: UpdatedDimensions.width10(context) *
                                                2.5,
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
                                                child: Text(
                                                  '0/0',
                                                  style: TextStyle(fontSize: UpdatedDimensions.font10(context) * 1.0, fontWeight: FontWeight.w400, color: Colors.white),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment:
                      const Alignment(1, 1),
                      child: AnimatedScaleButton(
                        onTap: action2,
                        child: Container(
                            height:
                            UpdatedDimensions.height10(
                                context) *
                                7.9,
                            width:
                            UpdatedDimensions.height10(
                                context) *
                                7.9,
                            margin:
                            EdgeInsets.only(
                              top: UpdatedDimensions
                                  .height10(
                                  context) *
                                  8.4,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape
                                    .circle,
                                border: Border.all(
                                    width: UpdatedDimensions.height10(
                                        context) *
                                        0.3,
                                    color: Colors
                                        .white),
                                color: Colors
                                    .transparent),
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
                                      UpdatedDimensions.font10(context) *
                                          1.2,
                                      fontWeight:
                                      FontWeight
                                          .w600,
                                      color: Colors
                                          .white),
                                ),
                                Text(
                                  '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                  style: TextStyle(
                                      fontSize:
                                      UpdatedDimensions.font10(context) *
                                          1.4,
                                      fontWeight:
                                      FontWeight
                                          .w400,
                                      color: Colors
                                          .white),
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
                                  decoration:
                                  BoxDecoration(
                                    shape: BoxShape
                                        .circle,
                                    border: Border.all(
                                        width: UpdatedDimensions.height10(
                                            context) *
                                            0.1,
                                        color: Colors
                                            .white),
                                  ),
                                  child: SizedBox(
                                      width: UpdatedDimensions.width10(
                                          context) *
                                          1.7,
                                      height:
                                      UpdatedDimensions.width10(context) *
                                          1.5,

                                      // margin: const EdgeInsets.only(left: 1),
                                      child:
                                      Center(
                                        child:
                                        Text(
                                          '${data['nextCompletePractice']}/${data['nextTotalPratice']}',
                                          style: TextStyle(
                                              fontSize: UpdatedDimensions.font10(context) *
                                                  1.0,
                                              fontWeight:
                                              FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      )),
                                )
                              ],
                            )),
                      ),
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
              child: Text(
                AppText().noPlanned,
                textAlign: TextAlign.center,
                style: TextStyle(
                    height:
                    UpdatedDimensions.height10(
                        context) *
                        0.12,
                    color: Colors.white,
                    fontSize:
                    UpdatedDimensions.font10(
                        context) *
                        3.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Laila'),
              ),
            ),
            Container(
              width:
              UpdatedDimensions.width10(context) *
                  26.9,
              height: UpdatedDimensions.height10(
                  context) *
                  5.8,
              margin: EdgeInsets.only(
                  top: UpdatedDimensions.height10(
                      context) *
                      0.2),
              child: Text(
                AppText().noPlannedBody,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    height:
                    UpdatedDimensions.height10(
                        context) *
                        0.12,
                    fontFamily: 'Laila',
                    fontSize:
                    UpdatedDimensions.font10(
                        context) *
                        1.8,
                    fontWeight: FontWeight.w600),
              ),
            ),
            AnimatedScaleButton(
              onTap: action3,
              child: Container(
                width: UpdatedDimensions.width10(
                    context) *
                    10.1,
                height: UpdatedDimensions.height10(
                    context) *
                    10.1,
                margin: EdgeInsets.only(
                    top: UpdatedDimensions.height10(
                        context) *
                        1.4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                        width:
                        UpdatedDimensions.width10(
                            context) *
                            0.3,
                        color: Colors.white)),
                child: Center(
                  child: Text(
                    'View\npractice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        height: UpdatedDimensions
                            .height10(
                            context) *
                            0.12,
                        fontFamily: 'laila',
                        fontSize:
                        UpdatedDimensions.font10(
                            context) *
                            1.6,
                        //add 2 px font size from feedback
                        fontWeight:
                        FontWeight.w600),
                  ),
                ),
              ),
            ),
          ])));
}