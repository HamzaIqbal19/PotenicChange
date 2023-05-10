import 'package:flutter/material.dart';

import '../../Widgets/menu_buttons.dart';
import '../../utils/app_dimensions.dart';
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
        decoration: BoxDecoration(
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
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 4.2,
                    bottom: AppDimensions.height10 * 3.2),
                child: Column(
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 2.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: AppDimensions.height10 * 21.0,
                      height: AppDimensions.height10 * 11.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 4.6),
                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(-1, 0),
                            child: Container(
                              width: AppDimensions.height10 * 10.4,
                              height: AppDimensions.height10 * 11.2,
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Group 9398.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.4, -0.2),
                            child: Container(
                                height: AppDimensions.height10 * 5.0,
                                width: AppDimensions.height10 * 4.6,
                                decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Ellipse pearl.png'),
                                        fit: BoxFit.contain)),
                                child: Align(
                                    alignment: const Alignment(0, 1.125),
                                    child: Container(
                                      height: AppDimensions.height10 * 0.98,
                                      width: AppDimensions.height10 * 0.967,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10 * 0.7),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Image.asset(
                                        'assets/images/tick_icon.png',
                                        height: AppDimensions.height10 * 0.5,
                                        width: AppDimensions.height10 * 0.5,
                                      ),
                                    ))),
                          ),
                          Align(
                            alignment: Alignment(1.9, 0),
                            child: Container(
                              width: AppDimensions.height10 * 14.0,
                              height: AppDimensions.height10 * 14.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Count temper episodes ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 2.5,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10 * 0.6),
                                    child: Text(
                                      'Completed',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff156F6D)),
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
                width: AppDimensions.height10 * 32.0,
                height: AppDimensions.height10 * 2.6,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 2.0),
                child: Text(
                  'What do you want to do?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.2,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff437296)),
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
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  missed_Menu()));
                                    },
                                    child: Container(
                                      width: AppDimensions.height10 * 2.9,
                                      height: AppDimensions.height10 * 2.9,
                                      decoration: BoxDecoration(
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
                width: AppDimensions.height10 * 41.3,
                height: AppDimensions.height10 * 22.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                child: Stack(children: [
                  Align(
                    alignment: Alignment(1, -1.3),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/ic_info_outline.png',
                          height: AppDimensions.height10 * 3.0,
                          width: AppDimensions.height10 * 3.0,
                        )),
                  ),
                  Align(
                    alignment: Alignment(0, -1),
                    child: Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 18.8,
                      child: Column(
                        children: [
                          Container(
                            height: AppDimensions.height10 * 4.4,
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
                                      color: Color(0xfff5f5f5)),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.8),
                                child: Text(
                                  'You can evaluate your progress in -19 active days.',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xfff5f5f5)),
                                ),
                              )
                            ]),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.2),
                                child: button_feilds(
                                  feild_text: 'Progress report',
                                  icon_viible: false,
                                  text_color: 0xff828282,
                                  feild_text_2: '',
                                ),
                              ),
                              button_feilds(
                                feild_text: 'Practice score (-/5)',
                                icon_viible: false,
                                text_color: 0xff828282,
                                feild_text_2: '',
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
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.1),
                width: AppDimensions.height10 * 36.0,
                child: Divider(
                  thickness: AppDimensions.height10 * 0.1,
                  height: AppDimensions.height10 * 0.1,
                  color: Colors.white,
                ),
              ),
              Container(
                height: AppDimensions.height10 * 28.0,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 2.5,
                    top: AppDimensions.height10 * 3.0),
                child: Column(
                  children: [
                    button_feilds(
                      feild_text: 'View practice progress',
                      icon_viible: true,
                      text_color: 0xff646464,
                      feild_text_2: '',
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10 * 1.0,
                          top: AppDimensions.height10 * 1.0),
                      child: button_feilds(
                        feild_text: 'View practice settings',
                        icon_viible: true,
                        text_color: 0xff646464,
                        feild_text_2: '',
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                      child: button_feilds(
                        feild_text: 'Veiw upcoming schedules',
                        icon_viible: true,
                        text_color: 0xff646464,
                        feild_text_2: '',
                      ),
                    ),
                    button_feilds(
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
