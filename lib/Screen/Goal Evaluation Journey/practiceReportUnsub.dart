import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/habitColors.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/identityComponent.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/inspirationComponents.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/reportCalender.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/widgets/sideWidgets.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/circle_container.dart';
import 'package:potenic_app/Widgets/circle_dates.dart';
import 'package:potenic_app/Widgets/menu_buttons.dart';

import '../../Widgets/calender.dart';
import '../../utils/app_dimensions.dart';

class progress_report_unsub extends StatelessWidget {
  const progress_report_unsub({super.key});

  @override
  Widget build(BuildContext context) {
    var options = [
      {'option1': 0},
      {'option2': 0},
      {'option3': 0},
      {'option4': 0},
      {'option5': 0},
    ];
    List<Color> outerColor = [
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096),
      const Color(0xFF546096)
    ];
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Buttons().backButton(context, () {
            Navigator.pop(context);
          })),
      extendBodyBehindAppBar: true,
      body: Container(
        foregroundDecoration:
            BoxDecoration(color: const Color(0xFF242424).withOpacity(0.5)),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/GoalReviewBg.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              sideWidget(context, true, 'Meditation'),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 5.0),
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 3.0,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.7),
                child: Text(
                  'You have been consistently doing\nyour practice for 20 active days ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 2.0,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
                child: Text(
                  //we will give duration of 20 days
                  'from [dd/mmm/yy] to [dd/mmm/yy]',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 1.6,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.9),
                child: Text(
                  'You are a rockstar! :)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 2.2,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: AppDimensions.width10(context) * 34.0,
                //height: AppDimensions.height10(context) * 11.2,
                margin:
                    EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 7.9,
                        height: AppDimensions.height10(context) * 7.94,
                        margin: EdgeInsets.only(
                            right: AppDimensions.width10(context) * 0.7,
                            left: AppDimensions.width10(context) * 0.5),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/orange_moon.webp'))),
                        child: Align(
                          alignment: const Alignment(1, 1.1),
                          child: Container(
                            width: AppDimensions.width10(context) * 4.9,
                            height: AppDimensions.height10(context) * 4.9,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: AppDimensions.width10(context) * 0.2,
                                  color: const Color(0xFFFFFFFF),
                                ),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse 158_wb.webp'))),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 23.9,
                        height: AppDimensions.height10(context) * 5.9,
                        margin: EdgeInsets.only(
                            left: AppDimensions.width10(context) * 0.4,
                            top: AppDimensions.height10(context) * 0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: AppDimensions.height10(context) * 3.0,
                              margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 0.1,
                              ),
                              child: Text(
                                'Control my anger',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                            SizedBox(
                              width: AppDimensions.width10(context) * 27.9,
                              height: AppDimensions.height10(context) * 2.7,
                              child: Text(
                                'Meditation ',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                    height: 1.2,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF156F6D)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                // width: AppDimensions.width10(context) * 2.1,
                //height: AppDimensions.height10(context) * 4.3,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                child: Image.asset(
                  'assets/images/Arrow.webp',
                  width: AppDimensions.width10(context) * 4.1,
                  height: AppDimensions.height10(context) * 4.3,
                ),
              ),
              Container(
                width: double.infinity,
                //padding: EdgeInsets.all(0),
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.7),
                // height: AppDimensions.height10(context) * 69.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/pro_report_bg#2.webp'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 7.0),
                      child: Text(
                        'Your identity statement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: UpdatedDimensions.font10(context) * 2.4,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 1; i++) ...[
                              identityComponent(
                                  context, i, 'is in control of my anger')
                            ]
                          ],
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Your inspirations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: UpdatedDimensions.font10(context) * 2.4,
                          height: 1.2,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    emptyInspiration(context),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 7.0),
                child: Text(
                  'You have completed 20\nactive days of practice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 2.4,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              calender(context, true, report, 20),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.7),
                child: Image.asset(
                  'assets/images/Arrow.webp',
                  width: AppDimensions.width10(context) * 4.1,
                  height: AppDimensions.height10(context) * 4.3,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
                child: Text(
                  'This is how you felt\nimplementing your new\npractice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: UpdatedDimensions.font10(context) * 2.4,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF437296)),
                ),
              ),
              habitComponent(context, options, outerColor, 'active', true),
              Container(
                width: double.infinity,
                height: AppDimensions.height10(context) * 22.9,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 12.1),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
                child: Container(
                  width: AppDimensions.width10(context) * 36.0,
                  height: AppDimensions.height10(context) * 16.9,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: AppDimensions.width10(context) * 36.0,
                        //height: AppDimensions.height10(context) * 1.9,
                        child: Text(
                          'Practice Assessment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: UpdatedDimensions.font10(context) * 1.6,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFF5F5F5)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 35.0,
                        //height: AppDimensions.height10(context) * 1.8,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.8,
                            bottom: AppDimensions.height10(context) * 1.2),
                        child: Text(
                          'Your latest 20 active day evaluation.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: UpdatedDimensions.font10(context) * 1.4,
                              height: 1.2,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFF5F5F5)),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          // if (noData != true) {
                          //   Navigator.push(
                          //       context,
                          //       FadePageRoute(
                          //           page: prac_score(
                          //             route: 'report',
                          //             secondaryRoute: '',
                          //             index: widget.index,
                          //           )));
                          // }
                        },
                        child: const ButtonFields(
                          fieldText: 'Practice score ',
                          iconVisible: true,
                          textColor: 0xff646464,
                          premium: true,
                          fieldText2: '(',
                          textColor2: 0xff8EA1B1,
                          fieldText3: '-',
                          fieldText4: '/5)',
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 38.4,
                          height: AppDimensions.height10(context) * 6.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.2),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFFFFFFFF)),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                          ),
                          child: Center(
                            child: Container(
                              //  width: AppDimensions.width10(context) * 7.2,
                              // height:
                              //     AppDimensions.height10(context) * 2.1,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.2),
                              child: Center(
                                child: Text(
                                  'Exit report',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          UpdatedDimensions.font10(context) *
                                              1.8,
                                      height: 1.2,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //
          // Column(
          //   children: [
          //     Container(
          //       width: AppDimensions.width10(context) * 40.872,
          //       height: AppDimensions.height10(context) * 11.0,
          //       margin: EdgeInsets.only(
          //           top: AppDimensions.height10(context) * 11.1,
          //           right: AppDimensions.width10(context) * 10.7),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //               topRight: Radius.circular(
          //                   AppDimensions.height10(context) * 2.0),
          //               bottomRight: Radius.circular(
          //                   AppDimensions.height10(context) * 2.0)),
          //           gradient: const LinearGradient(
          //               colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
          //       child: Container(
          //         width: AppDimensions.width10(context) * 24.3,
          //         height: AppDimensions.height10(context) * 7.0,
          //         alignment: Alignment.center,
          //         margin: EdgeInsets.only(
          //             top: AppDimensions.height10(context) * 2.0),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(
          //               width: AppDimensions.width10(context) * 24.3,
          //               height: AppDimensions.height10(context) * 2.6,
          //               child: Text(
          //                 'Practice progress report',
          //                 style: TextStyle(
          //                     fontSize: AppDimensions.font10(context) * 2.0,
          //                     height: AppDimensions.height10(context) * 0.12,
          //                     fontWeight: FontWeight.w700,
          //                     color: const Color(0xFFFFFFFF)),
          //               ),
          //             ),
          //             Container(
          //               width: AppDimensions.width10(context) * 3.3,
          //               height: AppDimensions.height10(context) * 0.2,
          //               margin: EdgeInsets.only(
          //                   bottom: AppDimensions.height10(context) * 1.7,
          //                   top: AppDimensions.height10(context) * 0.45),
          //               decoration:
          //                   const BoxDecoration(color: Color(0xFFFFFFFF)),
          //             ),
          //             SizedBox(
          //               width: AppDimensions.width10(context) * 10.1,
          //               height: AppDimensions.height10(context) * 2.4,
          //               child: Text(
          //                 'Meditation',
          //                 style: TextStyle(
          //                     fontSize: AppDimensions.font10(context) * 2.0,
          //                     height: AppDimensions.height10(context) * 0.12,
          //                     fontWeight: FontWeight.w400,
          //                     color: const Color(0xFFFFFFFF)),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 31.7,
          //       height: AppDimensions.height10(context) * 3.6,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 5.0),
          //       child: Text(
          //         'Congratulations!',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: AppDimensions.font10(context) * 3.0,
          //             height: 1.2,
          //             fontWeight: FontWeight.w700,
          //             color: const Color(0xFF437296)),
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 35.0,
          //       height: AppDimensions.height10(context) * 5.0,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 2.7),
          //       child: Text(
          //         'You have been consistently doing\nyour practice for 20 active days ',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: AppDimensions.font10(context) * 2.0,
          //             height: 1.2,
          //             fontWeight: FontWeight.w600,
          //             color: const Color(0xFF437296)),
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 35.0,
          //       height: AppDimensions.height10(context) * 3.3,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
          //       child: Text(
          //         //we will give duration of 20 days
          //         'from [dd/mmm/yy] to [dd/mmm/yy]',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: AppDimensions.font10(context) * 1.6,
          //             height: 1.2,
          //             fontWeight: FontWeight.w500,
          //             color: const Color(0xFF437296)),
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 25.5,
          //       height: AppDimensions.height10(context) * 3.9,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 1.9),
          //       child: Text(
          //         'You are a rockstar! :)',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: AppDimensions.font10(context) * 2.2,
          //             height: 1.2,
          //             fontWeight: FontWeight.w600,
          //             color: const Color(0xFF437296)),
          //       ),
          //     ),
          //     SizedBox(
          //       width: AppDimensions.width10(context) * 29.0,
          //       height: AppDimensions.height10(context) * 11.2,
          //       child: Row(
          //         children: [
          //           Container(
          //             width: AppDimensions.width10(context) * 10.4,
          //             height: AppDimensions.height10(context) * 11.2,
          //             margin: EdgeInsets.only(
          //                 right: AppDimensions.width10(context) * 0.7),
          //             decoration: const BoxDecoration(
          //                 image: DecorationImage(
          //                     image: AssetImage(
          //                         'assets/images/orange_flair.webp'))),
          //             child: Align(
          //               alignment: const Alignment(0.7, 0.4),
          //               child: Container(
          //                 width: AppDimensions.width10(context) * 4.9,
          //                 height: AppDimensions.height10(context) * 4.9,
          //                 decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     border: Border.all(
          //                       width: AppDimensions.width10(context) * 0.2,
          //                       color: const Color(0xFFFFFFFF),
          //                     ),
          //                     image: const DecorationImage(
          //                         image: AssetImage(
          //                             'assets/images/Ellipse 158.webp'))),
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: AppDimensions.width10(context) * 17.9,
          //             height: AppDimensions.height10(context) * 5.9,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   width: AppDimensions.width10(context) * 17.9,
          //                   height: AppDimensions.height10(context) * 3.0,
          //                   margin: EdgeInsets.only(
          //                       bottom: AppDimensions.height10(context) * 0.1),
          //                   child: Text(
          //                     'Control my anger',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         fontSize: AppDimensions.font10(context) * 2.0,
          //                         height: 1.2,
          //                         fontWeight: FontWeight.w600,
          //                         color: const Color(0xFF437296)),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: AppDimensions.width10(context) * 17.9,
          //                   height: AppDimensions.height10(context) * 2.7,
          //                   child: Text(
          //                     'Meditation ',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         fontSize: AppDimensions.font10(context) * 1.8,
          //                         height: 1.2,
          //                         fontWeight: FontWeight.w600,
          //                         color: const Color(0xFF156F6D)),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     Container(
          //       // width: AppDimensions.width10(context) * 2.1,
          //       //height: AppDimensions.height10(context) * 4.3,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
          //       child: Image.asset(
          //         'assets/images/Arrow.webp',
          //         width: AppDimensions.width10(context) * 4.1,
          //         height: AppDimensions.height10(context) * 4.3,
          //       ),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       //padding: EdgeInsets.all(0),
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 2.7),
          //       height: AppDimensions.height10(context) * 63.3,
          //       decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage('assets/images/pro_report_bg#2.webp'),
          //               fit: BoxFit.cover)),
          //       child: Column(
          //         children: [
          //           Container(
          //             width: AppDimensions.width10(context) * 27.4,
          //             height: AppDimensions.height10(context) * 2.9,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 7.0),
          //             child: Text(
          //               'New identity statement',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                   fontSize: AppDimensions.font10(context) * 2.4,
          //                   height: 1.2,
          //                   fontWeight: FontWeight.w600,
          //                   color: const Color(0xFFFFFFFF)),
          //             ),
          //           ),
          //           SizedBox(
          //             width: AppDimensions.width10(context) * 35.6,
          //             height: AppDimensions.height10(context) * 10.9,
          //             child: Stack(
          //               children: [
          //                 Align(
          //                   alignment: const Alignment(-0.875, -0.5),
          //                   child: Container(
          //                     width: AppDimensions.width10(context) * 2.5,
          //                     height: AppDimensions.height10(context) * 1.6,
          //                     decoration: const BoxDecoration(
          //                       image: DecorationImage(
          //                           image:
          //                               AssetImage('assets/images/colon.webp'),
          //                           fit: BoxFit.contain),
          //                     ),
          //                   ),
          //                 ),
          //                 Align(
          //                   alignment: const Alignment(1, 0),
          //                   child: Container(
          //                     width: AppDimensions.width10(context) * 34.7,
          //                     height: AppDimensions.height10(context) * 10.9,
          //                     margin: EdgeInsets.only(
          //                         top: AppDimensions.height10(context) * 1.9),
          //
          //                     ///color: Colors.amber,
          //                     child: Center(
          //                       child: Text(
          //                         "I am in control of my anger, and I see\nmyself as a calm individual who acts level\nheaded in tense situations...",
          //                         textAlign: TextAlign.center,
          //                         style: TextStyle(
          //                             fontStyle: FontStyle.italic,
          //                             // height: AppDimensions.height10(context) * 0.15,
          //                             fontSize:
          //                                 AppDimensions.font10(context) * 1.7,
          //                             fontWeight: FontWeight.w400,
          //                             color: const Color(0xFFFFFFFF)),
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //           Container(
          //             height: AppDimensions.height10(context) * 30.517,
          //             margin: EdgeInsets.only(
          //               top: AppDimensions.height10(context) * 3.0,
          //               // left: AppDimensions.width10(context) * 2.7
          //             ),
          //             child: SingleChildScrollView(
          //               scrollDirection: Axis.horizontal,
          //               child: Row(
          //                 children: [
          //                   Container(
          //                     width: AppDimensions.width10(context) * 33.153,
          //                     height: AppDimensions.height10(context) * 30.517,
          //                     margin: EdgeInsets.only(
          //                         left:
          //                             AppDimensions.height10(context) * 2.8098,
          //                         right:
          //                             AppDimensions.height10(context) * 1.098),
          //                     decoration: const BoxDecoration(
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Rectangle 148.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 33.153,
          //                     height: AppDimensions.height10(context) * 30.517,
          //                     margin: EdgeInsets.only(
          //                         right:
          //                             AppDimensions.height10(context) * 1.098),
          //                     decoration: const BoxDecoration(
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Rectangle 178.webp'))),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 27.2,
          //       height: AppDimensions.height10(context) * 5.369,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 7.0),
          //       child: Text(
          //         'You have completed 20 active days of practice',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: AppDimensions.font10(context) * 2.4,
          //             height: 1.2,
          //             fontWeight: FontWeight.w600,
          //             color: const Color(0xFF437296)),
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 38.5,
          //       height: AppDimensions.height10(context) * 84.569,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 3.7),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(
          //               AppDimensions.height10(context) * 2.0),
          //           color: const Color(0xFFFFFFFF)),
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             height: AppDimensions.height10(context) * 5.0,
          //           ),
          //           GestureDetector(
          //               onTap: () {},
          //               child: Circulardates(
          //                 size: AppDimensions.height10(context) * 24.0,
          //                 outerCircleContainers: [
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                   Container(
          //                     width: AppDimensions.width10(context) * 2.3,
          //                     height: AppDimensions.height10(context) * 2.3,
          //                     decoration: const BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/Tick_dates.webp'))),
          //                   ),
          //                 ],
          //                 centerContainer: Container(
          //                   height: AppDimensions.height10(context) * 18.6,
          //                   width: AppDimensions.width10(context) * 13.3,
          //                   margin: EdgeInsets.only(
          //                       left: AppDimensions.width10(context) * 3.0),
          //
          //                   // color: Colors.amber,
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       SizedBox(
          //                         width: AppDimensions.width10(context) * 13.3,
          //                         height: AppDimensions.height10(context) * 7.7,
          //                         child: Row(
          //                           children: [
          //                             SizedBox(
          //                               // margin: EdgeInsets.only(left: AppDimensions.width10(context)*1.0),
          //                               height:
          //                                   AppDimensions.height10(context) *
          //                                       7.7,
          //                               child: Text(
          //                                 '20',
          //                                 style: TextStyle(
          //                                     fontSize: AppDimensions.font10(
          //                                             context) *
          //                                         7.4,
          //                                     color: const Color(0xFF156F6D),
          //                                     fontWeight: FontWeight.w300),
          //                               ),
          //                             ),
          //                             Container(
          //                               height:
          //                                   AppDimensions.height10(context) *
          //                                       7.7,
          //                               alignment: Alignment.bottomCenter,
          //                               child: Text(
          //                                 '/20',
          //                                 style: TextStyle(
          //                                     fontSize: AppDimensions.font10(
          //                                             context) *
          //                                         2.4,
          //                                     color: const Color(0xFF646464),
          //                                     fontWeight: FontWeight.w300),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: AppDimensions.width10(context) * 9.3,
          //                         height: AppDimensions.height10(context) * 2.3,
          //                         child: Text(
          //                           'Active days',
          //                           style: TextStyle(
          //                               fontSize:
          //                                   AppDimensions.font10(context) * 1.8,
          //                               color: const Color(0xFF156F6D),
          //                               fontWeight: FontWeight.w500),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: AppDimensions.width10(context) * 9.3,
          //                         height: AppDimensions.height10(context) * 2.3,
          //                         child: Text(
          //                           'completed!',
          //                           style: TextStyle(
          //                               fontSize:
          //                                   AppDimensions.font10(context) * 1.8,
          //                               color: const Color(0xFF156F6D),
          //                               fontWeight: FontWeight.w500),
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               )),
          //           SizedBox(
          //             height: AppDimensions.height10(context) * 8.0,
          //             width: AppDimensions.width10(context) * 23,
          //             child: Center(
          //               child: RichText(
          //                   textAlign: TextAlign.center,
          //                   text: TextSpan(
          //                       style: TextStyle(
          //                         fontFamily: 'laila',
          //                         height: 1.2,
          //                         fontSize: AppDimensions.font10(context) * 1.4,
          //                         fontWeight: FontWeight.w500,
          //                         color: const Color(0xFF5B74A6),
          //                       ),
          //                       children: const [
          //                         TextSpan(
          //                             text: 'You have completed this\nover '),
          //                         TextSpan(
          //                             text: '2 months',
          //                             style: TextStyle(
          //                                 fontWeight: FontWeight.w700))
          //                       ])),
          //             ),
          //           ),
          //           Container(
          //               height: AppDimensions.height10(context) * 46.8,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(
          //                       AppDimensions.height10(context) * 2.0)),
          //               child: CalendarWithRadioButtons(
          //                 status: true,
          //                 dateStatus: const {
          //                   "2023-07-18": "completed",
          //                   "2023-07-19": "completed",
          //                   "2023-07-20": "completed",
          //                   "2023-07-21": "completed",
          //                   "2023-07-22": "completed",
          //                   "2023-07-23": "completed",
          //                   "2023-07-24": "completed",
          //                   "2023-07-25": "completed",
          //                   "2023-07-26": "completed",
          //                   "2023-07-27": "completed",
          //                   "2023-07-28": "completed",
          //                   "2023-07-29": "completed",
          //                   "2023-07-30": "completed",
          //                   "2023-07-31": "missed",
          //                   "2023-08-01": "completed",
          //                   "2023-08-02": "completed",
          //                   "2023-08-03": "completed",
          //                   "2023-08-04": "completed",
          //                   "2023-08-05": "completed",
          //                   "2023-08-06": "missed"
          //                 },
          //                 limitCalender: true,
          //               )),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       // width: AppDimensions.width10(context) * 2.1,
          //       //height: AppDimensions.height10(context) * 4.3,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 3.7),
          //       child: Image.asset(
          //         'assets/images/Arrow.webp',
          //         width: AppDimensions.width10(context) * 4.1,
          //         height: AppDimensions.height10(context) * 4.3,
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 27.2,
          //       height: AppDimensions.height10(context) * 8.5,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
          //       child: Text(
          //         'This is how you felt\nimplementing your new\npractice',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: AppDimensions.font10(context) * 2.4,
          //             height: 1.2,
          //             fontWeight: FontWeight.w600,
          //             color: const Color(0xFF437296)),
          //       ),
          //     ),
          //     Container(
          //       width: AppDimensions.width10(context) * 38.2,
          //       height: AppDimensions.height10(context) * 147.8,
          //       margin:
          //           EdgeInsets.only(top: AppDimensions.height10(context) * 4.0),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(
          //               AppDimensions.height10(context) * 2.0),
          //           color: const Color(0xFFFFFFFF)),
          //       child: Column(
          //         children: [
          //           Container(
          //             width: AppDimensions.width10(context) * 38.2,
          //             height: AppDimensions.height10(context) * 55.7,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.vertical(
          //                   top: Radius.circular(
          //                       AppDimensions.height10(context) * 2.0),
          //                 ),
          //                 gradient: const LinearGradient(
          //                     begin: Alignment.topCenter,
          //                     end: Alignment.bottomCenter,
          //                     colors: [
          //                       Color(0xFFEDF1FA),
          //                       Color(0xFFFCD9C3),
          //                       Color(0xFFFAB2A3),
          //                       Color(0xFFEB9FA3)
          //                     ])),
          //             child: Column(
          //               children: [
          //                 Container(
          //                     width: AppDimensions.width10(context) * 20.0,
          //                     height: AppDimensions.height10(context) * 20.0,
          //                     margin: EdgeInsets.only(
          //                         bottom: AppDimensions.height10(context) * 3.0,
          //                         top: AppDimensions.height10(context) * 4.0),
          //                     child: const CircularFormation(
          //                       size: 150,
          //                       circleColor: Colors.transparent,
          //                       selection: 5,
          //                       outerCircleColors: [
          //                         Color(0xFFE1C44F),
          //                         Color(0xFF7291A0),
          //                         Color(0xFF7291A0),
          //                         Color(0xFF7291A0),
          //                         Color(0xFF546096),
          //                         Color(0xFFFF6C2C),
          //                         Color(0xFFFF6C2C),
          //                         Color(0xFFFF6C2C),
          //                         Color(0xFFFF6C2C),
          //                         Color(0xFFFF6C2C),
          //                         Color(0xFFFF6C2C),
          //                         Color(0xFFFA9458),
          //                         Color(0xFFFA9458),
          //                         Color(0xFFFA9458),
          //                         Color(0xFFFA9458),
          //                         Color(0xFFFA9458),
          //                         Color(0xFFE1C44F),
          //                         Color(0xFFE1C44F),
          //                         Color(0xFFE1C44F),
          //                         Color(0xFFE1C44F),
          //                         // Add more colors as needed
          //                       ],
          //                     )),
          //                 Container(
          //                   width: AppDimensions.width10(context) * 8.4,
          //                   height: AppDimensions.height10(context) * 0.2,
          //                   margin: EdgeInsets.only(
          //                       top: AppDimensions.height10(context) * 0.9),
          //                   color: const Color(0xFFF5F5F5),
          //                 ),
          //                 Container(
          //                   width: AppDimensions.width10(context) * 30.9,
          //                   height: AppDimensions.height10(context) * 2.2,
          //                   margin: EdgeInsets.only(
          //                       top: AppDimensions.height10(context) * 3.0),
          //                   child: Center(
          //                     child: Text(
          //                       'Majority of the time',
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                           fontSize:
          //                               AppDimensions.font10(context) * 1.8,
          //                           fontWeight: FontWeight.w600,
          //                           color: const Color(0xFFFE6624)),
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   width: AppDimensions.width10(context) * 30.9,
          //                   height: AppDimensions.height10(context) * 6.8,
          //                   margin: EdgeInsets.only(
          //                       top: AppDimensions.height10(context) * 1.0),
          //                   child: Center(
          //                     child: Text(
          //                       '“I feel excited and\ngood in myself”',
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                           height:
          //                               AppDimensions.height10(context) * 0.15,
          //                           fontSize:
          //                               AppDimensions.font10(context) * 2.8,
          //                           fontWeight: FontWeight.w700,
          //                           color: const Color(0xFFFF6C2C)),
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.only(
          //                       top: AppDimensions.height10(context) * 1.2),
          //                   child: RichText(
          //                       text: TextSpan(
          //                           style: TextStyle(
          //                               fontSize:
          //                                   AppDimensions.font10(context) * 4.5,
          //                               fontFamily: 'laila',
          //                               height: 1.2,
          //                               fontWeight: FontWeight.w400,
          //                               color: const Color(0xFFFF6C2C)),
          //                           children: [
          //                         const TextSpan(text: '0'),
          //                         TextSpan(
          //                             text: '',
          //                             style: TextStyle(
          //                                 fontSize:
          //                                     AppDimensions.font10(context) *
          //                                         2.0))
          //                       ])),
          //                 ),
          //                 SizedBox(
          //                   width: AppDimensions.width10(context) * 10.5,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     children: List.generate(
          //                       0, // Replace 5 with the number of containers you want to create
          //                       (index) => Container(
          //                         width: AppDimensions.width10(context) * 1.5,
          //                         height: AppDimensions.height10(context) * 1.5,
          //                         margin: EdgeInsets.all(
          //                             AppDimensions.height10(context) * 0.3),
          //                         decoration: const BoxDecoration(
          //                             color: Color(0xFFFF6C2C),
          //                             shape: BoxShape.circle),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: AppDimensions.width10(context) * 10.5,
          //                   //height: AppDimensions.height10(context) * 1.5,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     children: List.generate(
          //                       0, // Replace 5 with the number of containers you want to create
          //                       (index) => Container(
          //                         width: AppDimensions.width10(context) * 1.5,
          //                         height: AppDimensions.height10(context) * 1.5,
          //                         margin: EdgeInsets.all(
          //                             AppDimensions.height10(context) * 0.3),
          //                         decoration: const BoxDecoration(
          //                             color: Color(0xFFFF6C2C),
          //                             shape: BoxShape.circle),
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 30.9,
          //             height: AppDimensions.height10(context) * 6.8,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             child: Center(
          //               child: Text(
          //                 '“I feel focused and\nmotivated”',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     height: AppDimensions.height10(context) * 0.15,
          //                     fontSize: AppDimensions.font10(context) * 2.8,
          //                     fontWeight: FontWeight.w700,
          //                     color: const Color(0xFFFA9458)),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 1.2),
          //             child: RichText(
          //                 text: TextSpan(
          //                     style: TextStyle(
          //                         fontSize: AppDimensions.font10(context) * 4.5,
          //                         fontFamily: 'laila',
          //                         height: 1.2,
          //                         fontWeight: FontWeight.w400,
          //                         color: const Color(0xFFFA9458)),
          //                     children: [
          //                   const TextSpan(text: '0'),
          //                   TextSpan(
          //                       text: '',
          //                       style: TextStyle(
          //                           fontSize:
          //                               AppDimensions.font10(context) * 2.0))
          //                 ])),
          //           ),
          //           SizedBox(
          //             width: AppDimensions.width10(context) * 10.5,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: List.generate(
          //                 5, // Replace 5 with the number of containers you want to create
          //                 (index) => Container(
          //                   width: AppDimensions.width10(context) * 1.5,
          //                   height: AppDimensions.height10(context) * 1.5,
          //                   margin: EdgeInsets.symmetric(
          //                       horizontal:
          //                           AppDimensions.height10(context) * 0.3),
          //                   decoration: const BoxDecoration(
          //                       color: Color(0xFFFA9458),
          //                       shape: BoxShape.circle),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 8.4,
          //             height: AppDimensions.height10(context) * 0.2,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             color: const Color(0xFFBDBDBD),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 17.7,
          //             height: AppDimensions.height10(context) * 3.4,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             child: Center(
          //               child: Text(
          //                 '“I feel ok”',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontSize: AppDimensions.font10(context) * 2.8,
          //                     fontWeight: FontWeight.w700,
          //                     color: const Color(0xFFE1C44F)),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 1.5),
          //             child: RichText(
          //                 text: TextSpan(
          //                     style: TextStyle(
          //                         fontSize: AppDimensions.font10(context) * 4.5,
          //                         fontFamily: 'laila',
          //                         height: 1.2,
          //                         fontWeight: FontWeight.w400,
          //                         color: const Color(0xFFE1C44F)),
          //                     children: [
          //                   const TextSpan(text: '0'),
          //                   TextSpan(
          //                       text: 'x',
          //                       style: TextStyle(
          //                           fontSize:
          //                               AppDimensions.font10(context) * 2.0))
          //                 ])),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 10.5,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 1.2),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: List.generate(
          //                 0, // Replace 5 with the number of containers you want to create
          //                 (index) => Container(
          //                   width: AppDimensions.width10(context) * 1.5,
          //                   height: AppDimensions.height10(context) * 1.5,
          //                   margin: EdgeInsets.symmetric(
          //                       horizontal:
          //                           AppDimensions.height10(context) * 0.3),
          //                   decoration: const BoxDecoration(
          //                       color: Color(0xFFE1C44F),
          //                       shape: BoxShape.circle),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 8.4,
          //             height: AppDimensions.height10(context) * 0.2,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             color: const Color(0xFFBDBDBD),
          //           ),
          //           Container(
          //             // width: AppDimensions.width10(context) * 17.7,
          //             height: AppDimensions.height10(context) * 6.8,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             child: Center(
          //               child: Text(
          //                 '“I feel alright, but\nslightly down”',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     height: AppDimensions.height10(context) * 0.15,
          //                     fontSize: AppDimensions.font10(context) * 2.8,
          //                     fontWeight: FontWeight.w700,
          //                     color: const Color(0xFF7291A0)),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 1.2),
          //             child: RichText(
          //                 text: TextSpan(
          //                     style: TextStyle(
          //                         fontSize: AppDimensions.font10(context) * 4.5,
          //                         fontFamily: 'laila',
          //                         height: 1.2,
          //                         fontWeight: FontWeight.w400,
          //                         color: const Color(0xFF7291A0)),
          //                     children: [
          //                   const TextSpan(text: '0'),
          //                   TextSpan(
          //                       text: '',
          //                       style: TextStyle(
          //                           fontSize:
          //                               AppDimensions.font10(context) * 2.0))
          //                 ])),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 10.5,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 1.2),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: List.generate(
          //                 0, // Replace 5 with the number of containers you want to create
          //                 (index) => Container(
          //                   width: AppDimensions.width10(context) * 1.5,
          //                   height: AppDimensions.height10(context) * 1.5,
          //                   margin: EdgeInsets.symmetric(
          //                       horizontal:
          //                           AppDimensions.height10(context) * 0.3),
          //                   decoration: const BoxDecoration(
          //                       color: Color(0xFF7291A0),
          //                       shape: BoxShape.circle),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 8.4,
          //             height: AppDimensions.height10(context) * 0.2,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             color: const Color(0xFFBDBDBD),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 34.1,
          //             //height: AppDimensions.height10(context) * 3.4,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 4.0),
          //             child: Center(
          //               child: Text(
          //                 '“I feel very low\n& irritated”',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     height: AppDimensions.height10(context) * 0.15,
          //                     fontSize: AppDimensions.font10(context) * 2.8,
          //                     fontWeight: FontWeight.w700,
          //                     color: const Color(0xFF546096)),
          //               ),
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 0.8),
          //             child: RichText(
          //                 text: TextSpan(
          //                     style: TextStyle(
          //                         fontSize: AppDimensions.font10(context) * 4.5,
          //                         fontFamily: 'laila',
          //                         height: 1.2,
          //                         fontWeight: FontWeight.w400,
          //                         color: const Color(0xFF546096)),
          //                     children: [
          //                   const TextSpan(text: '0'),
          //                   TextSpan(
          //                       text: '',
          //                       style: TextStyle(
          //                           fontSize:
          //                               AppDimensions.font10(context) * 2.0))
          //                 ])),
          //           ),
          //           Container(
          //             width: AppDimensions.width10(context) * 10.5,
          //             margin: EdgeInsets.only(
          //                 top: AppDimensions.height10(context) * 1.2),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: List.generate(
          //                 0, // Replace 5 with the number of containers you want to create
          //                 (index) => Container(
          //                   width: AppDimensions.width10(context) * 1.5,
          //                   height: AppDimensions.height10(context) * 1.5,
          //                   margin: EdgeInsets.symmetric(
          //                       horizontal:
          //                           AppDimensions.height10(context) * 0.3),
          //                   decoration: const BoxDecoration(
          //                       color: Color(0xFF546096),
          //                       shape: BoxShape.circle),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       width: double.infinity,
          //       height: AppDimensions.height10(context) * 22.9,
          //       margin: EdgeInsets.only(
          //           top: AppDimensions.height10(context) * 12.1),
          //       decoration: const BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: [Color(0xFF91698C), Color(0xFFC19CA7)])),
          //       child: Container(
          //         width: AppDimensions.width10(context) * 36.0,
          //         height: AppDimensions.height10(context) * 16.9,
          //         margin: EdgeInsets.only(
          //             top: AppDimensions.height10(context) * 2.0),
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               width: AppDimensions.width10(context) * 36.0,
          //               height: AppDimensions.height10(context) * 1.9,
          //               child: Text(
          //                 'Practice Assessment',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontSize: AppDimensions.font10(context) * 1.6,
          //                     height: 1.2,
          //                     fontWeight: FontWeight.w700,
          //                     color: const Color(0xFFF5F5F5)),
          //               ),
          //             ),
          //             Container(
          //               width: AppDimensions.width10(context) * 35.0,
          //               height: AppDimensions.height10(context) * 1.8,
          //               margin: EdgeInsets.only(
          //                   top: AppDimensions.height10(context) * 0.8,
          //                   bottom: AppDimensions.height10(context) * 1.2),
          //               child: Text(
          //                 'Your latest 20 active day evaluation.',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontSize: AppDimensions.font10(context) * 1.4,
          //                     height: 1.2,
          //                     fontWeight: FontWeight.w400,
          //                     color: const Color(0xFFF5F5F5)),
          //               ),
          //             ),
          //             const ButtonFields(
          //               fieldText: 'Practice score ',
          //               iconVisible: true,
          //               textColor: 0xff646464,
          //               fieldText2: '(',
          //               textColor2: 0xff8EA1B1,
          //               fieldText3: '-',
          //               premium: true,
          //               fieldText4: '/5)',
          //             ),
          //             GestureDetector(
          //               onTap: () {
          //                 //report(context);
          //               },
          //               child: Container(
          //                 width: AppDimensions.width10(context) * 36.0,
          //                 height: AppDimensions.height10(context) * 6.0,
          //                 margin: EdgeInsets.only(
          //                     top: AppDimensions.height10(context) * 1.2),
          //                 decoration: BoxDecoration(
          //                   border: Border.all(
          //                       width: AppDimensions.width10(context) * 0.1,
          //                       color: const Color(0xFFFFFFFF)),
          //                   borderRadius: BorderRadius.circular(
          //                       AppDimensions.height10(context) * 2.0),
          //                 ),
          //                 child: Center(
          //                   child: Container(
          //                     //  width: AppDimensions.width10(context) * 7.2,
          //                     height: AppDimensions.height10(context) * 2.1,
          //                     margin: EdgeInsets.only(
          //                         top: AppDimensions.height10(context) * 0.2),
          //                     child: Center(
          //                       child: Text(
          //                         'Exit report',
          //                         textAlign: TextAlign.center,
          //                         style: TextStyle(
          //                             fontSize:
          //                                 AppDimensions.font10(context) * 1.8,
          //                             height: 1.2,
          //                             fontWeight: FontWeight.w600,
          //                             color: const Color(0xFFFFFFFF)),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}

void report(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppDimensions.height10(context) * 2.0)),
    builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: AppDimensions.width10(context) * 39.4,
          height: AppDimensions.height10(context) * 51.3,
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.3),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFE1B3B7), Color(0XffC9B9CB)]),
            image: const DecorationImage(
                opacity: 0.7,
                image: AssetImage('assets/images/timeline_2.png'),
                fit: BoxFit.cover),
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          ),
          child: Column(
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              SizedBox(
                width: AppDimensions.width10(context) * 23.8,
                height: AppDimensions.height10(context) * 3.4,
                // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                child: Text(
                  'Congratulations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.font10(context) * 2.8,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 32.8,
                height: AppDimensions.height10(context) * 2.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
                child: Text(
                  'Your 20 active day report is ready',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensions.font10(context) * 2.0,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                //  width: AppDimensions.width10(context) * 33.8,
                // height: AppDimensions.height10(context) * 6.8,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
                child: Text(
                  'You have been consistently working on your\npractice for 20 active days now. We’ve put together\na practice report for you to review and evaluate\nyour journey.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: AppDimensions.font10(context) * 1.4,
                      color: const Color(0xff437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 23.7,
                height: AppDimensions.height10(context) * 25.5,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.2),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Report card.png')),
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                ),
              )
            ],
          ),
        )),
  );
}
