import 'package:flutter/material.dart';

import '../../Widgets/fading.dart';
import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/recordPracticeMenu.dart';
import 'dashboard_view_goals.dart';
import 'goal_menu_missed_session.dart';

class menu_behaviour extends StatelessWidget {
  const menu_behaviour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     'Practice Menu',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //         fontWeight: FontWeight.w600),
          //   ),
          // ),
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 30.4,
                height: AppDimensions.height10 * 18.6,
                // color: Colors.grey.withOpacity(0.5),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 5.0,
                    bottom: AppDimensions.height10 * 1.0),
                child: Column(
                  children: [
                    Text(
                      'Practice Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Control my anger',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: AppDimensions.height10 * 40.0,
                      height: AppDimensions.height10 * 11.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.6),
                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: AppDimensions.height10 * 10.4,
                              height: AppDimensions.height10 * 11.2,
                              decoration: const BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group 9398.png'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-0.6, -0.2),
                            child: Container(
                                height: AppDimensions.height10 * 5.0,
                                width: AppDimensions.height10 * 4.6,
                                decoration: const BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse pearl_1.png'),
                                        fit: BoxFit.contain)),
                                child: Align(
                                    alignment: const Alignment(0, 1.125),
                                    child: Container(
                                      height: AppDimensions.height10 * 0.98,
                                      width: AppDimensions.height10 * 0.967,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10 * 0.2),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff52855E)),
                                      child: Image.asset(
                                        'assets/images/tick_icon.png',
                                        color: const Color(0xFFFFFFFF),
                                        height: AppDimensions.height10 * 0.5,
                                        width: AppDimensions.height10 * 0.5,
                                      ),
                                    ))),
                          ),
                          Align(
                            alignment: const Alignment(1.3, 6),
                            child: Container(
                              width: AppDimensions.height10 * 21,
                              height: AppDimensions.height10 * 10.6,
                              // color: Colors.amber.withOpacity(0.2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Count temper episodes ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 2.5,
                                    child: Text(
                                      'Session completed',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff156F6D)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: AppDimensions.height10 * 21.1,
                height: AppDimensions.height10 * 11.8,
                // color: Colors.amber,
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 9.6,
                      height: AppDimensions.height10 * 11.8,
                      //margin: EdgeInsets.only(bottom: 19),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 7.0,
                            height: AppDimensions.height10 * 7.0,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFCC10D),
                                      Color(0xffFDA210),
                                    ]),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.3,
                                    color: Colors.white)),
                            child: Center(
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/visibility_black_24dp 1.png',
                                      height: AppDimensions.height10 * 2.9,
                                      width: AppDimensions.height10 * 21.9,
                                    ))),
                          ),
                          Text(
                            'Veiw/Edit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'session',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 9.3,
                      height: AppDimensions.height10 * 11.8,
                      //margin: EdgeInsets.only(bottom: 19),
                      child: Column(
                        children: [
                          Container(
                              width: AppDimensions.height10 * 7.0,
                              height: AppDimensions.height10 * 7.0,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffFCC10D),
                                        Color(0xffFDA210),
                                      ]),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: AppDimensions.height10 * 0.3,
                                      color: Colors.white)),
                              child: Center(
                                child: GestureDetector(
                                    onTap: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Container(
                                              width:
                                                  AppDimensions.height10 * 27.0,
                                              height:
                                                  AppDimensions.height10 * 18.2,
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppDimensions
                                                                    .height10 *
                                                                1.4)),
                                                contentPadding: EdgeInsets.zero,
                                                actionsPadding: EdgeInsets.zero,
                                                titlePadding: EdgeInsets.zero,
                                                title: Container(
                                                    margin: EdgeInsets.only(
                                                        top: AppDimensions.height10 *
                                                            1.9,
                                                        right: AppDimensions.height10 *
                                                            1.6,
                                                        left: AppDimensions.height10 *
                                                            1.6,
                                                        bottom: AppDimensions
                                                                .height10 *
                                                            0.2),
                                                    height:
                                                        AppDimensions.height10 *
                                                            2.2,
                                                    width: AppDimensions.height10 *
                                                        23.8,
                                                    child: RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize:
                                                                    AppDimensions.height10 *
                                                                        1.7,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                color: const Color(0xFF000000)),
                                                            children: [
                                                              const TextSpan(
                                                                  text:
                                                                      'Are you sure?'),
                                                            ]))),
                                                content: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10 *
                                                          1.5,
                                                      left: AppDimensions
                                                              .height10 *
                                                          1.6,
                                                      right: AppDimensions
                                                              .height10 *
                                                          1.6),
                                                  height:
                                                      AppDimensions.height10 *
                                                          3.4,
                                                  width:
                                                      AppDimensions.height10 *
                                                          23.8,
                                                  child: Text(
                                                    "Are you sure you want to change this\nscheduled session to missed?",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10 *
                                                          1.3,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: AppDimensions
                                                                .height10 *
                                                            0.1,
                                                        child: Divider(
                                                          color: const Color(
                                                                  0XFF3C3C43)
                                                              .withOpacity(
                                                                  0.29),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: AppDimensions
                                                                .height10 *
                                                            4.2,
                                                        width: double.infinity,
                                                        color: const Color(
                                                            0xFF007AFF),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                FadePageRoute(
                                                                    page:
                                                                        const view_goals(
                                                                  missed: true,
                                                                )));
                                                          },
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                color: const Color(
                                                                    0xFFFFFFFF),
                                                                fontSize: AppDimensions
                                                                        .height10 *
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
                                                                .height10 *
                                                            0.1,
                                                        child: Divider(
                                                          color: const Color(
                                                                  0XFF3C3C43)
                                                              .withOpacity(
                                                                  0.29),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: AppDimensions
                                                                .height10 *
                                                            4.4,
                                                        width: double.infinity,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .height10 *
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
                                                                .height10 *
                                                            0.1,
                                                        child: Divider(
                                                          color: const Color(
                                                                  0XFF3C3C43)
                                                              .withOpacity(
                                                                  0.29),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                    child: Container(
                                      width: AppDimensions.height10 * 2.9,
                                      height: AppDimensions.height10 * 2.9,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      child: Image.asset(
                                        'assets/images/ic_clear.png',
                                      ),
                                    )),
                              )),
                          Text(
                            'Missed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'session',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 360,
              //   child: Divider(
              //     thickness: 1,
              //     height: 1,
              //     color: Colors.white,
              //   ),
              // ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                // margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
              ),
              Container(
                width: AppDimensions.height10 * 41.3,
                height: AppDimensions.height10 * 22.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Stack(children: [
                  Align(
                    alignment: const Alignment(1, -1.3),
                    child: IconButton(
                        onPressed: () {
                          info_sheet(context);
                        },
                        icon: Image.asset(
                          'assets/images/ic_info_outline.png',
                          height: AppDimensions.height10 * 3.0,
                          width: AppDimensions.height10 * 3.0,
                        )),
                  ),
                  Align(
                    alignment: const Alignment(0, -1),
                    child: Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 24.7,
                      child: Column(
                        children: [
                          Container(
                            height: AppDimensions.height10 * 5.9,
                            width: AppDimensions.height10 * 36.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 1.2),
                            child: Column(children: [
                              Container(
                                height: AppDimensions.height10 * 1.9,
                                child: Text(
                                  'Practice Assessment',
                                  style: TextStyle(
                                      //increase font size by 2 px
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xfff5f5f5)),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.2),
                                child: Text(
                                  'Here is your latest 20 active day evaluation.',
                                  style: TextStyle(
                                      height: AppDimensions.height10 * 0.15,
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xfff5f5f5)),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.3),
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            height:
                                                AppDimensions.height10 * 0.15,
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xfff5f5f5)),
                                        children: [
                                      const TextSpan(
                                          text: 'Next assessment is in'),
                                      const TextSpan(
                                          text: ' -19 active days.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700))
                                    ])),
                              )
                            ]),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.2),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const button_feilds(
                                    feild_text: 'Progress report',
                                    icon_viible: true,
                                    text_color: 0xff646464,
                                    feild_text_2: ' DD/MMM/YY',
                                    text_color_2: 0xff8EA1B1,
                                    feild_text_3: '',
                                    feild_text_4: '',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const button_feilds(
                                  feild_text: 'Evaluation level ',
                                  icon_viible: true,
                                  text_color: 0xff646464,
                                  feild_text_2: '(',
                                  text_color_2: 0xff8EA1B1,
                                  feild_text_3: '2',
                                  feild_text_4: '/5)',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                // margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
              ),

              Container(
                height: AppDimensions.height10 * 28.0,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 2.5,
                    top: AppDimensions.height10 * 3.0),
                child: Column(
                  children: [
                    const button_feilds(
                      feild_text: 'View practice progress',
                      icon_viible: true,
                      text_color: 0xff646464,
                      feild_text_2: '',
                      text_color_2: 0xffEA1B1,
                      feild_text_3: '',
                      feild_text_4: '',
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10 * 1.0,
                          top: AppDimensions.height10 * 1.0),
                      child: const button_feilds(
                        feild_text: 'View practice settings',
                        icon_viible: true,
                        text_color: 0xff646464,
                        feild_text_2: '',
                        text_color_2: 0xffEA1B1,
                        feild_text_3: '',
                        feild_text_4: '',
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                      child: const button_feilds(
                        feild_text: 'Veiw upcoming schedules',
                        icon_viible: true,
                        text_color: 0xff646464,
                        feild_text_2: '',
                        text_color_2: 0xffEA1B1,
                        feild_text_3: '',
                        feild_text_4: '',
                      ),
                    ),
                    const button_feilds(
                      feild_text: 'Practice assesment history',
                      icon_viible: true,
                      text_color: 0xff646464,
                      feild_text_2: '',
                      text_color_2: 0xffEA1B1,
                      feild_text_3: '',
                      feild_text_4: '',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
