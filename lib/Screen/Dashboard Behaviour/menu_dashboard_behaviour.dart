import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';

import '../../Widgets/fading.dart';
import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/recordPracticeMenu.dart';
import 'dashboard_view_goals.dart';
import 'goal_menu_missed_session.dart';

class menu_behaviour extends StatelessWidget {
  final String goalName;
  final String pracName;
  final String goalColor;
  final String pracColor;
  const menu_behaviour(
      {super.key,
      required this.goalName,
      required this.pracName,
      required this.goalColor,
      required this.pracColor});

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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10(context) * 30.4,
                height: AppDimensions.height10(context) * 18.6,
                // color: Colors.grey.withOpacity(0.5),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 5.0,
                    bottom: AppDimensions.height10(context) * 1.0),
                child: Column(
                  children: [
                    Text(
                      'Practice Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 30,
                      child: Center(
                        child: Text(
                          goalName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 2.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 40.0,
                      height: AppDimensions.height10(context) * 11.2,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.6),
                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-0.84, -0.32),
                            child: Container(
                              width: AppDimensions.height10(context) * 7.9,
                              height: AppDimensions.height10(context) * 7.9,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(goalColor == '1'
                                        ? "assets/images/red_gradient.webp"
                                        : goalColor == '2'
                                            ? 'assets/images/orange_moon.webp'
                                            : goalColor == '3'
                                                ? "assets/images/lightGrey_gradient.webp"
                                                : goalColor == '4'
                                                    ? "assets/images/lightBlue_gradient.webp"
                                                    : goalColor == '5'
                                                        ? "assets/images/medBlue_gradient.webp"
                                                        : goalColor == '6'
                                                            ? "assets/images/Blue_gradient.webp"
                                                            : 'assets/images/orange_moon.webp'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-0.6, -0.2),
                            child: Container(
                                height: AppDimensions.height10(context) * 5.0,
                                width: AppDimensions.height10(context) * 4.6,
                                decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(pracColor == '1'
                                            ? "assets/images/Practice_Completed_1.webp"
                                            : pracColor == '2'
                                                ? 'assets/images/Practice_Completed_2.webp'
                                                : pracColor == '3'
                                                    ? "assets/images/Practice_Completed_3.webp"
                                                    : pracColor == '4'
                                                        ? "assets/images/Practice_Completed_4.webp"
                                                        : pracColor == '5'
                                                            ? "assets/images/Practice_Completed_4.webp"
                                                            : 'assets/images/Practice_Completed_1.webp'),
                                        fit: BoxFit.contain)),
                                child: Align(
                                    alignment: const Alignment(0, 1.125),
                                    child: Container(
                                      height: AppDimensions.height10(context) *
                                          0.98,
                                      width: AppDimensions.height10(context) *
                                          0.967,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context) *
                                              0.2),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff52855E)),
                                      child: Image.asset(
                                        'assets/images/tick_icon.webp',
                                        color: const Color(0xFFFFFFFF),
                                        height:
                                            AppDimensions.height10(context) *
                                                0.5,
                                        width: AppDimensions.height10(context) *
                                            0.5,
                                      ),
                                    ))),
                          ),
                          Align(
                            alignment: const Alignment(1.3, 6),
                            child: Container(
                              width: AppDimensions.height10(context) * 21,
                              height: AppDimensions.height10(context) * 10.6,
                              // color: Colors.amber.withOpacity(0.2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pracName,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 2.5,
                                    child: Text(
                                      'Session completed',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
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
                width: AppDimensions.height10(context) * 21.1,
                height: AppDimensions.height10(context) * 11.8,
                // color: Colors.amber,
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 9.6,
                      height: AppDimensions.height10(context) * 11.8,
                      //margin: EdgeInsets.only(bottom: 19),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 7.0,
                            height: AppDimensions.height10(context) * 7.0,
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
                                    width:
                                        AppDimensions.height10(context) * 0.3,
                                    color: Colors.white)),
                            child: Center(
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/visibility_black_24dp 1.webp',
                                      height:
                                          AppDimensions.height10(context) * 2.9,
                                      width: AppDimensions.height10(context) *
                                          21.9,
                                    ))),
                          ),
                          Text(
                            'Veiw/Edit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'session',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 9.3,
                      height: AppDimensions.height10(context) * 11.8,
                      //margin: EdgeInsets.only(bottom: 19),
                      child: Column(
                        children: [
                          AnimatedScaleButton(
                            onTap: () => showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
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
                                                left:
                                                    AppDimensions.height10(context) *
                                                        1.6,
                                                bottom:
                                                    AppDimensions.height10(context) *
                                                        0.2),
                                            height:
                                                AppDimensions.height10(context) *
                                                    2.2,
                                            width:
                                                AppDimensions.height10(context) *
                                                    23.8,
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontFamily: 'laila',
                                                        fontSize:
                                                            AppDimensions.height10(context) *
                                                                1.7,
                                                        fontWeight: FontWeight.w400,
                                                        color: const Color(0xFF000000)),
                                                    children: [
                                                      const TextSpan(
                                                          text:
                                                              'Are you sure?'),
                                                    ]))),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to change this\nscheduled session to missed?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
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
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
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
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 7.0,
                              height: AppDimensions.height10(context) * 7.0,
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
                                      width:
                                          AppDimensions.height10(context) * 0.3,
                                      color: Colors.white)),
                              child: Center(
                                child: Container(
                                  width: AppDimensions.height10(context) * 2.9,
                                  height: AppDimensions.height10(context) * 2.9,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Image.asset(
                                    'assets/images/ic_clear.webp',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Missed',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'session',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10(context) * 0.12,
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                height: AppDimensions.height10(context) * 0.1,
                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              ),
              Container(
                width: AppDimensions.height10(context) * 41.3,
                height: AppDimensions.height10(context) * 22.9,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.2),
                child: Stack(children: [
                  Align(
                    alignment: const Alignment(1, -1.3),
                    child: IconButton(
                        onPressed: () {
                          info_sheet(context);
                        },
                        icon: Image.asset(
                          'assets/images/ic_info_outline.webp',
                          height: AppDimensions.height10(context) * 3.0,
                          width: AppDimensions.height10(context) * 3.0,
                        )),
                  ),
                  Align(
                    alignment: const Alignment(0, -1),
                    child: Container(
                      width: AppDimensions.height10(context) * 36.0,
                      height: AppDimensions.height10(context) * 24.7,
                      child: Column(
                        children: [
                          Container(
                            height: AppDimensions.height10(context) * 5.9,
                            width: AppDimensions.height10(context) * 36.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.2),
                            child: Column(children: [
                              Container(
                                height: AppDimensions.height10(context) * 1.9,
                                child: Text(
                                  'Practice Assessment',
                                  style: TextStyle(
                                      //increase font size by 2 px
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xfff5f5f5)),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 0.2),
                                child: Text(
                                  'Here is your latest 20 active day evaluation.',
                                  style: TextStyle(
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xfff5f5f5)),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 0.3),
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.15,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
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
                                    bottom:
                                        AppDimensions.height10(context) * 1.2),
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
                height: AppDimensions.height10(context) * 0.1,
                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              ),

              Container(
                height: AppDimensions.height10(context) * 28.0,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 2.5,
                    top: AppDimensions.height10(context) * 3.0),
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
                          bottom: AppDimensions.height10(context) * 1.0,
                          top: AppDimensions.height10(context) * 1.0),
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
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.0),
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
