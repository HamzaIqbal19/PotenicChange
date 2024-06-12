
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/formattedTime.dart';

dashboardPlaceHolder(BuildContext context, past, current, next, final VoidCallback action1,final VoidCallback action2,final VoidCallback action3){
  return SizedBox(
      width: double.infinity,
      height: UpdatedDimensions.height10(context) * 19.2,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: UpdatedDimensions.height10(context) *
                    19.2,
                width:
                UpdatedDimensions.width10(context) * 45.7,
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-1, 1),
                      child: AnimatedScaleButton(
                        onTap: action1,
                        child: Container(
                          height: UpdatedDimensions.height10(
                              context) *
                              7.9,
                          width: UpdatedDimensions.height10(
                              context) *
                              7.9,
                          margin: EdgeInsets.only(
                              top: UpdatedDimensions.height10(
                                  context) *
                                  8.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 3,
                                  color: Colors.white),
                              color: Colors.transparent),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(
                                getFormattedDay(past)
                                    .substring(0, 3),
                                style: TextStyle(
                                    fontSize: UpdatedDimensions
                                        .font10(
                                        context) *
                                        1.2,
                                    fontWeight:
                                    FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '${getFormattedDate(past).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(past).split('-').reversed.join().substring(2, 4)}',
                                style: const TextStyle(
                                    color: Colors.white),
                              ),
                              Container(
                                height: UpdatedDimensions
                                    .height10(
                                    context) *
                                    2.7,
                                width:
                                UpdatedDimensions.width10(
                                    context) *
                                    2.7,
                                margin:
                                const EdgeInsets.only(
                                    top: 3.32),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      color:
                                      Colors.white),
                                ),
                                child: Container(
                                    width: UpdatedDimensions
                                        .width10(
                                        context) *
                                        1.7,
                                    height: UpdatedDimensions
                                        .height10(
                                        context) *
                                        1.5,
                                    margin: EdgeInsets.only(
                                        top: UpdatedDimensions
                                            .height10(
                                            context) *
                                            0.2),
                                    // margin: const EdgeInsets.only(left: 1),
                                    child: const Center(
                                      child: Text(
                                        '0/2',
                                        style: TextStyle(
                                            fontSize: 10,
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
                    ),
                    Align(
                      alignment: const Alignment(0, 0),
                      child: Container(
                        width: UpdatedDimensions.width10(
                            context) *
                            8.3,
                        height: UpdatedDimensions.height10(
                            context) *
                            8.3,
                        //  margin: EdgeInsets.only(right: 121, left: 121),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width:
                                UpdatedDimensions.width10(
                                    context) *
                                    0.1,
                                color: Colors.white),
                            color: Colors.transparent),
                        child: Container(
                          height: UpdatedDimensions.height10(
                              context) *
                              7.9,
                          width: UpdatedDimensions.height10(
                              context) *
                              7.9,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: UpdatedDimensions
                                      .width10(
                                      context) *
                                      0.3,
                                  color: Colors.white),
                              color: Colors.transparent),
                          child: Stack(children: [
                            Align(
                              alignment:
                              const Alignment(0, 0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  Text(
                                    getFormattedDay(
                                        current)
                                        .substring(0, 3),
                                    style: TextStyle(
                                        fontSize: UpdatedDimensions
                                            .height10(
                                            context) *
                                            1.4,
                                        fontWeight:
                                        FontWeight
                                            .w600,
                                        color:
                                        Colors.white),
                                  ),
                                  Text(
                                    '${getFormattedDate(current).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(current).split('-').reversed.join().substring(2, 4)}',
                                    style: TextStyle(
                                        color:
                                        Colors.white,
                                        fontSize: UpdatedDimensions
                                            .height10(
                                            context) *
                                            1.3,
                                        fontWeight:
                                        FontWeight
                                            .w400),
                                  ),
                                  Container(
                                      height:
                                      UpdatedDimensions
                                          .height10(
                                          context) *
                                          2.5,
                                      width: UpdatedDimensions
                                          .height10(
                                          context) *
                                          2.5,
                                      margin: EdgeInsets.only(
                                          top: UpdatedDimensions
                                              .height10(
                                              context) *
                                              0.202),
                                      decoration:
                                      const BoxDecoration(
                                        shape: BoxShape
                                            .circle,
                                      ),
                                      child: DottedBorder(
                                        borderType:
                                        BorderType
                                            .Circle,
                                        color:
                                        Colors.white,
                                        child: Center(
                                          child: Text(
                                            '0/0',
                                            style: TextStyle(
                                                fontSize:
                                                UpdatedDimensions.font10(
                                                    context),
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                color: Colors
                                                    .white),
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
                    Align(
                      alignment: const Alignment(1, 1),
                      child: AnimatedScaleButton(
                        onTap: action2,
                        child: Container(
                            height: UpdatedDimensions
                                .height10(context) *
                                7.9,
                            width: UpdatedDimensions.height10(
                                context) *
                                7.9,
                            margin: const EdgeInsets.only(
                              top: 84,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: UpdatedDimensions
                                        .width10(
                                        context) *
                                        0.3,
                                    color: Colors.white),
                                color:
                                Colors.transparent),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              children: [
                                Text(
                                  getFormattedDay(next)
                                      .substring(0, 3),
                                  style: TextStyle(
                                      fontSize: UpdatedDimensions
                                          .font10(
                                          context) *
                                          1.2,
                                      fontWeight:
                                      FontWeight.w600,
                                      color:
                                      Colors.white),
                                ),
                                Text(
                                  '${getFormattedDate(next).split('-').reversed.join().substring(0, 2)}.${getFormattedDate(next).split('-').reversed.join().substring(2, 4)}',
                                  style: const TextStyle(
                                      color:
                                      Colors.white),
                                ),
                                Container(
                                  height: UpdatedDimensions
                                      .height10(
                                      context) *
                                      2.7,
                                  width: UpdatedDimensions
                                      .width10(
                                      context) *
                                      2.7,
                                  margin: const EdgeInsets
                                      .only(top: 3.32),
                                  decoration:
                                  BoxDecoration(
                                    shape:
                                    BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color:
                                        Colors.white),
                                  ),
                                  child: Container(
                                      width: UpdatedDimensions
                                          .height10(
                                          context) *
                                          1.7,
                                      height: UpdatedDimensions
                                          .height10(
                                          context) *
                                          1.5,
                                      margin:
                                      const EdgeInsets
                                          .only(
                                          top: 3.32),
                                      // margin: const EdgeInsets.only(left: 1),
                                      child: Center(
                                        child: Text(
                                          '0/2',
                                          style: TextStyle(
                                              fontSize: UpdatedDimensions
                                                  .font10(
                                                  context),
                                              fontWeight:
                                              FontWeight
                                                  .w400,
                                              color: Colors
                                                  .white),
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
              // width: 343,
              // height: 49,
              margin: EdgeInsets.only(
                top: UpdatedDimensions.height10(context) *
                    14.9,
              ),
              child: Center(
                child: Text(
                  'All your practices\nare inactive',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                      UpdatedDimensions.font10(context) *
                          3.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Laila'),
                ),
              ),
            ),
            Container(
              // width: 269,
              // height: 58,
              margin: EdgeInsets.only(
                  top: UpdatedDimensions.height10(context) *
                      1.8),
              child: Center(
                child: Text(
                  "You don’t have any active or\nplanned practices. Please view\nyour current goals to manage\nand update your practices.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Laila',
                      fontSize:
                      UpdatedDimensions.font10(context) *
                          1.8,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            AnimatedScaleButton(
              onTap: action3,
              child: Container(
                  height:
                  UpdatedDimensions.height10(context) *
                      5.0,
                  width: UpdatedDimensions.width10(context) *
                      24.3,
                  margin: EdgeInsets.only(
                      top: UpdatedDimensions.height10(
                          context) *
                          4.6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCC10D),
                          Color(0xffFDA210),
                        ]),
                    borderRadius: BorderRadius.circular(
                        UpdatedDimensions.height10(context) *
                            5.0),
                  ),
                  child: Center(
                    child: Text(
                      'View all goals',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: UpdatedDimensions.font10(
                              context) *
                              1.6,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Laila'),
                    ),
                  )),
            )
          ])));
}

