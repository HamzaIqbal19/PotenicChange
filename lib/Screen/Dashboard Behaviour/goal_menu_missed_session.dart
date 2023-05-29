import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/captureHurdles/captureHurdles_whatHurdles.dart';

import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';

class missed_Menu extends StatelessWidget {
  const missed_Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
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
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: 26,
                    height: 26,
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
                                          'assets/images/Med Habit Practice (1).png'),
                                      fit: BoxFit.contain)),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1.3, 6),
                            child: SizedBox(
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
                                  SizedBox(
                                    height: AppDimensions.height10 * 2.5,
                                    child: Text(
                                      'Session missed',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffEB5757)),
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

              GestureDetector(
                onTap: () {},
                child: Container(
                  width: AppDimensions.height10 * 9.36,
                  height: AppDimensions.height10 * 12.0,
                  margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1.9),
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
                          onTap: () {},
                          child: Icon(
                            Icons.add_task,
                            color: Colors.white,
                            // fill: AppDimensions.height10 * 0.10,
                            size: AppDimensions.height10 * 2.8,
                          ),
                        )),
                      ),
                      SizedBox(
                        // color: Colors.red,
                        height: AppDimensions.height10 * 4.921,
                        width: AppDimensions.height10 * 9.36,
                        child: Center(
                          child: Text(
                            'Record\npractice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: AppDimensions.height10 * 0.12,
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: AppDimensions.height10 * 36.0,
              //   child: Divider(
              //     thickness: AppDimensions.height10 * 0.1,
              //     height: AppDimensions.height10 * 0.1,
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
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/ic_info_outline.png',
                          height: AppDimensions.height10 * 3.0,
                          width: AppDimensions.height10 * 3.0,
                        )),
                  ),
                  Align(
                    alignment: const Alignment(0, -1),
                    child: SizedBox(
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
                              SizedBox(
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
                                    text_color: 0xff828282,
                                    feild_text_2: ' DD/MMM/YY',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const button_feilds(
                                  feild_text: 'Evaluation level (2/5)',
                                  icon_viible: true,
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
                    const button_feilds(
                      feild_text: 'Practice assesment history',
                      icon_viible: true,
                      text_color: 0xff646464,
                      feild_text_2: '',
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
