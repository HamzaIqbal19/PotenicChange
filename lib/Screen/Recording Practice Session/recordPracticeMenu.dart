import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/goal_criteria.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_progress.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/progress_report.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';
import '../../Widgets/menu_buttons.dart';
import '../Goal Evaluation/practice_score.dart';

class practiceMenu extends StatelessWidget {
  final bool goal_eval;
  const practiceMenu({super.key, required this.goal_eval});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.png',
                width: AppDimensions.height10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Close.png',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/prac_assesment.png'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: AppDimensions.height10(context) * 30.4,
                    height: AppDimensions.height10(context) * 18.2,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 2.4,
                          child: Text(
                            'Practice Menu',
                            style: TextStyle(
                                color: Colors.white,
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 2.4,
                          child: Text(
                            'Control my anger',
                            style: TextStyle(
                                color: Colors.white,
                                height: AppDimensions.height10(context) * 0.12,
                                fontSize: AppDimensions.height10(context) * 2.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 21.0,
                          height: AppDimensions.height10(context) * 9.3,
                          // color: Colors.amber,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.6),
                          // color: Colors.blue,
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(-1, 0),
                                child: Container(
                                  width: AppDimensions.height10(context) * 8.36,
                                  height: AppDimensions.height10(context) * 9.3,
                                  decoration: const BoxDecoration(
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image3.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(-0.495, -0.2),
                                child: Container(
                                  height: AppDimensions.height10(context) * 4.1,
                                  width: AppDimensions.height10(context) * 4.06,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(colors: [
                                        Color(0xFFB3F0D1),
                                        Color(0xFF1A481C)
                                      ])),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.7, -0.3),
                                child: Container(
                                  width: AppDimensions.height10(context) * 10.6,
                                  height: AppDimensions.height10(context) * 2.4,
                                  child: Text(
                                    'Meditation',
                                    style: TextStyle(
                                        color: const Color(0xff156F6D),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: AppDimensions.height10(context) * 32.0,
                  //   height: AppDimensions.height10(context) * 2.6,
                  //   margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 2.7),
                  //   child: Text(
                  //     'What do you want to do?',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         fontSize: AppDimensions.height10(context) * 2.2,
                  //         fontWeight: FontWeight.w600,
                  //         color: const Color(0xff437296)),
                  //   ),
                  // ),
                  Container(
                    width: AppDimensions.height10(context) * 9.36,
                    height: AppDimensions.height10(context) * 12.0,
                    //color: Colors.amber,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.6),
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
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context) * 13.9)),
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.3,
                                  color: Colors.white)),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const emotions(
                                    summary: false,
                                  )));
                            },
                            child: Icon(
                              Icons.add_task,
                              color: Colors.white,
                              // fill: AppDimensions.height10(context) * 0.10,
                              size: AppDimensions.height10(context) * 2.8,
                            ),
                          )),
                        ),
                        Container(
                          // color: Colors.red,
                          height: AppDimensions.height10(context) * 4.921,
                          width: AppDimensions.height10(context) * 9.36,
                          child: Center(
                            child: Text(
                              'Record\npractice',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height:
                                      AppDimensions.height10(context) * 0.12,
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: AppDimensions.height10(context) * 0.1,
                    color: const Color(0xFFFFFFFF).withOpacity(0.5),
                    // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 41.3,
                    height: AppDimensions.height10(context) * 22.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.2),
                    child: Stack(children: [
                      Align(
                        alignment: const Alignment(1, -1.3),
                        child: IconButton(
                            onPressed: () {
                              info_sheet(context);
                            },
                            icon: Image.asset(
                              'assets/images/ic_info_outline.png',
                              height: AppDimensions.height10(context) * 3.0,
                              width: AppDimensions.height10(context) * 3.0,
                            )),
                      ),
                      Align(
                        alignment: const Alignment(0, -1),
                        child: Container(
                          width: AppDimensions.height10(context) * 36.0,
                          height: goal_eval
                              ? AppDimensions.height10(context) * 24.7
                              : AppDimensions.height10(context) * 18.8,
                          child: Column(
                            children: [
                              Container(
                                height: goal_eval
                                    ? AppDimensions.height10(context) * 5.9
                                    : AppDimensions.height10(context) * 4.4,
                                width: AppDimensions.height10(context) * 36.0,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.2),
                                child: Column(children: [
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'Practice Assessment',
                                      style: TextStyle(
                                          //increase font size by 2 px
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.8,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xfff5f5f5)),
                                    ),
                                  ),
                                  goal_eval
                                      ? Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          child: Text(
                                            'Here is your latest 20 active day evaluation.',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xfff5f5f5)),
                                          ),
                                        )
                                      : Container(),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 1.7,
                                    margin: EdgeInsets.only(
                                        top: goal_eval
                                            ? AppDimensions.height10(context) *
                                                0.3
                                            : AppDimensions.height10(context) *
                                                0.8),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontFamily: 'laila',
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xfff5f5f5)),
                                            children: [
                                          TextSpan(
                                              text: goal_eval
                                                  ? 'Next assessment is in'
                                                  : 'You can evaluate your progress in '),
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
                                            AppDimensions.height10(context) *
                                                1.2),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const progress_report()));
                                      },
                                      child: button_feilds(
                                        feild_text: 'Progress report',
                                        icon_viible: goal_eval ? true : false,
                                        text_color: 0xff646464,
                                        feild_text_2:
                                            goal_eval ? ' DD/MMM/YY' : '',
                                        text_color_2: 0xff8EA1B1,
                                        feild_text_3: '',
                                        feild_text_4: '',
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const prac_score()));
                                    },
                                    child: button_feilds(
                                      feild_text: goal_eval
                                          ? 'Evaluation level '
                                          : 'Practice score ',
                                      icon_viible: goal_eval ? true : false,
                                      text_color: 0xff646464,
                                      feild_text_2: '(',
                                      text_color_2: 0xff8EA1B1,
                                      feild_text_3: goal_eval ? '2' : '-',
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
                    width: AppDimensions.height10(context) * 36.0,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 2.5,
                        top: AppDimensions.height10(context) * 3.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                FadePageRoute(page: const practice_progress()));
                          },
                          child: const button_feilds(
                            feild_text: 'View practice progress',
                            icon_viible: true,
                            text_color: 0xff646464,
                            feild_text_2: '',
                            text_color_2: 0xff8EA1B1,
                            feild_text_4: '',
                            feild_text_3: '',
                          ),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const practice_assesment()));
                          },
                          child: const button_feilds(
                            feild_text: 'Practice assesment history',
                            icon_viible: true,
                            text_color: 0xff646464,
                            feild_text_2: '',
                            text_color_2: 0xffEA1B1,
                            feild_text_3: '',
                            feild_text_4: '',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            OfflineBuilder(
                debounceDuration: Duration(milliseconds: 3),
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: AppDimensions.height10(context) * 3.0,
                          color:
                              connected ? Color(0xFF27AE60) : Color(0xFFFE6624),
                          child: Center(
                            child: Text(
                              connected ? 'Back Online' : 'You’re Offline',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFBFBFB)),
                            ),
                          ),
                        ),
                      ))
                    ],
                  );
                },
                child: Container())
          ])),
    );
  }
}

void info_sheet(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10(context) * 41.4,
          height: AppDimensions.height10(context) * 54.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.height10(context) * 2.0)),
              color: Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                alignment: Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.height10(context) * 1.5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.9,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.png',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                // width: AppDimensions.height10(context) * 28.7,
                height: AppDimensions.height10(context) * 3.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Practice Assessment',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.8,
                      letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 36.7,
                //height: AppDimensions.height10(context) * 26.9,
                //  color: Colors.grey,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'laila',
                          fontSize: AppDimensions.height10(context) * 1.47,
                          height: AppDimensions.height10(context) * 0.15,
                          //  letterSpacing: AppDimensions.height10(context),
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF437296)),
                      children: [
                        TextSpan(
                            text:
                                'For each practice, you can evaluate your last 20 active days, and asses it to see if it is working for you or not.\n\n'),
                        TextSpan(
                            text: 'Practice Assessment ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(
                            text:
                                'is broken down into two main\nsections:\n\n'),
                        TextSpan(
                            text: '1.Progress Report\n',
                            style: TextStyle(
                                fontSize:
                                    AppDimensions.height10(context) * 1.5)),
                        TextSpan(text: 'See your '),
                        TextSpan(
                            text: 'overall practice progress',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(
                            text:
                                ', gain visibility on\nhow your personal development journey is going and\nwhether you’re making any progress to towards your\ngoal.\n\n'),
                        TextSpan(
                            text: '2.Practice Score\n',
                            style: TextStyle(
                                fontSize:
                                    AppDimensions.height10(context) * 1.5)),
                        TextSpan(text: 'Here you can'),
                        TextSpan(
                            text: ' assess your practice effectiveness ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(text: 'based on our scoring criteria.')
                      ]),
                ),
              ),
            ],
          )),
    ),
  );
}
