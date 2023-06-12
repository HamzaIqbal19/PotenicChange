import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_noPast_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class no_planned_session extends StatelessWidget {
  const no_planned_session({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 1.32),
                    child: Image.asset(
                      'assets/images/Asset 10 2.png',
                      height: AppDimensions.height10(context) * 4.0,
                      width: AppDimensions.height10(context) * 3.977,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 1.7),
                    child: Image.asset(
                      'assets/images/Add goal.png',
                      height: AppDimensions.height10(context) * 2.0,
                      width: AppDimensions.height10(context) * 2.1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 1.32),
                    child: Image.asset(
                      'assets/images/calendar_month_black_24dp 1.png',
                      height: AppDimensions.height10(context) * 2.4,
                      width: AppDimensions.height10(context) * 2.4,
                    ),
                  ),
                ],
              )
            ]),
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: const Navigation_Bar(
          bg_colored: false,
          membership: true,
          cancel: false,
          trial: false,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Mask Group.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
                width: double.infinity,
                height: AppDimensions.height10(context) * 19.2,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: AppDimensions.height10(context) * 19.2,
                          width: AppDimensions.height10(context) * 45.7,
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(-1, 1),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const no_past_session()));
                                  },
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 7.9,
                                    width:
                                        AppDimensions.height10(context) * 7.9,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            8.4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: AppDimensions.height10(
                                                    context) *
                                                0.3,
                                            color: Colors.white),
                                        color: Colors.transparent),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'MON',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.2,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFFBFBFB)),
                                        ),
                                        Text(
                                          '02.06',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.5,
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.5,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.332),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                color: Color(0xFFFBFBFB)),
                                          ),
                                          child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                              margin: EdgeInsets.only(
                                                  top: AppDimensions.height10(
                                                          context) *
                                                      0.332),
                                              // margin: const EdgeInsets.only(left: 1),
                                              child: Center(
                                                child: Text(
                                                  '0/2',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const view_goals(
                                          missed: false,
                                        )));
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 8.3,
                                    height:
                                        AppDimensions.height10(context) * 8.3,
                                    //  margin: EdgeInsets.only(right: 121, left: 121),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        color: Colors.transparent),
                                    child: Container(
                                      height:
                                          AppDimensions.height10(context) * 7.9,
                                      width:
                                          AppDimensions.height10(context) * 7.9,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.white),
                                          color: Colors.transparent),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                              alignment: const Alignment(0, 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'TUE',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '02.07',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.5,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.5,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: DottedBorder(
                                                        borderType:
                                                            BorderType.Circle,
                                                        color: Colors.white,
                                                        child: Center(
                                                          child: Text(
                                                            '0/0',
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.0,
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
                              ),
                              Align(
                                alignment: const Alignment(1, 1),
                                child: Container(
                                    height:
                                        AppDimensions.height10(context) * 7.9,
                                    width:
                                        AppDimensions.height10(context) * 7.9,
                                    margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 8.4,
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: AppDimensions.height10(
                                                    context) *
                                                0.3,
                                            color: Colors.white),
                                        color: Colors.transparent),
                                    child: Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'MON',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.2,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '03.07',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.5,
                                          width:
                                              AppDimensions.height10(context) *
                                                  2.5,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                color: Colors.white),
                                          ),
                                          child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.5,

                                              // margin: const EdgeInsets.only(left: 1),
                                              child: Center(
                                                child: Text(
                                                  '0/2',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        )
                                      ],
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 34.3,
                        height: AppDimensions.height10(context) * 4.9,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 18.9),
                        child: Text(
                          'No planned sessions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: AppDimensions.height10(context) * 0.12,
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 3.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Laila'),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 26.9,
                        height: AppDimensions.height10(context) * 5.8,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.2),
                        child: Text(
                          'There are no scheduled\npractices for this date.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              height: AppDimensions.height10(context) * 0.12,
                              fontFamily: 'Laila',
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const record_session(
                                past_session: false,
                              )));
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 10.1,
                          height: AppDimensions.height10(context) * 10.1,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.3,
                                  color: Colors.white)),
                          child: Center(
                            child: Text(
                              'View\npractice',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  height:
                                      AppDimensions.height10(context) * 0.12,
                                  fontFamily: 'laila',
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  //add 2 px font size from feedback
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ])))));
  }
}
