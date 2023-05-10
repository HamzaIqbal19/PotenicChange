import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/goal_criteria.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/practice_progress.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/progress_report.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/menu_buttons.dart';

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
                width: AppDimensions.height10 * 2.6,
                height: AppDimensions.height10 * 2.6,
                fit: BoxFit.cover,
              )),
        ),
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
        ],
      ),
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
                height: AppDimensions.height10 * 18.2,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 5.2,
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppDimensions.height10 * 2.4,
                      child: Text(
                        'Practice Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: AppDimensions.height10 * 2.4,
                      child: Text(
                        'Control my anger',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 21.0,
                      height: AppDimensions.height10 * 9.3,
                      // color: Colors.amber,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: AppDimensions.height10 * 8.36,
                              height: AppDimensions.height10 * 9.3,
                              decoration: const BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group 9398.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-0.495, -0.2),
                            child: Container(
                              height: AppDimensions.height10 * 4.1,
                              width: AppDimensions.height10 * 4.06,
                              decoration: const BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/image2.png'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.7, -0.3),
                            child: Container(
                              width: AppDimensions.height10 * 10.6,
                              height: AppDimensions.height10 * 2.4,
                              child: Text(
                                'Meditation',
                                style: TextStyle(
                                    color: const Color(0xff156F6D),
                                    fontSize: AppDimensions.height10 * 2.0,
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
              //   width: AppDimensions.height10 * 32.0,
              //   height: AppDimensions.height10 * 2.6,
              //   margin: EdgeInsets.only(bottom: AppDimensions.height10 * 2.7),
              //   child: Text(
              //     'What do you want to do?',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: AppDimensions.height10 * 2.2,
              //         fontWeight: FontWeight.w600,
              //         color: const Color(0xff437296)),
              //   ),
              // ),
              Container(
                width: AppDimensions.height10 * 9.36,
                height: AppDimensions.height10 * 12.0,
                //color: Colors.amber,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1.7),
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
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppDimensions.height10 * 13.9)),
                          border: Border.all(
                              width: AppDimensions.height10 * 0.3,
                              color: Colors.white)),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const emotions(
                                        summary: false,
                                      )));
                        },
                        child: Icon(
                          Icons.add_task,
                          color: Colors.white,
                          // fill: AppDimensions.height10 * 0.10,
                          size: AppDimensions.height10 * 2.8,
                        ),
                      )),
                    ),
                    Container(
                      // color: Colors.red,
                      height: AppDimensions.height10 * 4.921,
                      width: AppDimensions.height10 * 9.36,
                      child: Text(
                        'Record\npractice',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
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
                        onPressed: () {},
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
                      height: goal_eval
                          ? AppDimensions.height10 * 24.7
                          : AppDimensions.height10 * 18.8,
                      child: Column(
                        children: [
                          Container(
                            height: goal_eval
                                ? AppDimensions.height10 * 5.9
                                : AppDimensions.height10 * 4.4,
                            width: AppDimensions.height10 * 36.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10 * 1.2),
                            child: Column(children: [
                              Container(
                                height: AppDimensions.height10 * 1.9,
                                child: Text(
                                  'Practice Assessment',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xfff5f5f5)),
                                ),
                              ),
                              goal_eval
                                  ? Container(
                                      height: AppDimensions.height10 * 1.7,
                                      child: Text(
                                        'Here is your latest 20 active day evaluation.',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xfff5f5f5)),
                                      ),
                                    )
                                  : Container(),
                              Container(
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: goal_eval
                                        ? AppDimensions.height10 * 0.3
                                        : AppDimensions.height10 * 0.8),
                                child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xfff5f5f5)),
                                        children: [
                                      TextSpan(
                                          text: goal_eval
                                              ? 'Next assessment is in'
                                              : 'You can evaluate your progress in '),
                                      const TextSpan(
                                          text: '-19 active days.',
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                progress_report()));
                                  },
                                  child: button_feilds(
                                    feild_text: 'Progress report',
                                    icon_viible: goal_eval ? true : false,
                                    text_color: 0xff828282,
                                    feild_text_2: goal_eval ? ' DD/MMM/YY' : '',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              your_why(evaluation: true)));
                                },
                                child: button_feilds(
                                  feild_text: goal_eval
                                      ? 'Evaluation level (2/5)'
                                      : 'Practice score (-/5)',
                                  icon_viible: goal_eval ? true : false,
                                  text_color: 0xff828282,
                                  feild_text_2: '',
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
                width: AppDimensions.height10 * 36.0,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 2.5,
                    top: AppDimensions.height10 * 3.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const practice_progress()));
                      },
                      child: const button_feilds(
                        feild_text: 'View practice progress',
                        icon_viible: true,
                        text_color: 0xff646464,
                        feild_text_2: '',
                      ),
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
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const practice_assesment()));
                      },
                      child: const button_feilds(
                        feild_text: 'Practice assesment history',
                        icon_viible: true,
                        text_color: 0xff646464,
                        feild_text_2: '',
                      ),
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
