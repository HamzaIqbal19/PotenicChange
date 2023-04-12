import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEmotions.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/menu_buttons.dart';

class practiceMenu extends StatelessWidget {
  const practiceMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
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
                height: AppDimensions.height10 * 18.2,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 4.2,
                    bottom: AppDimensions.height10 * 2.2),
                child: Column(
                  children: [
                    Container(
                      height: AppDimensions.height10 * 2.4,
                      child: Text(
                        'Practice Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600),
                      ),
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
                              height: AppDimensions.height10 * 10.2,
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
                            alignment: Alignment(-0.395, -0.2),
                            child: Container(
                              height: AppDimensions.height10 * 4.9,
                              width: AppDimensions.height10 * 4.9,
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/image2.png'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Align(
                            alignment: Alignment(1.1, -0.3),
                            child: Container(
                              width: AppDimensions.height10 * 10.6,
                              height: AppDimensions.height10 * 2.4,
                              child: Text(
                                'Meditation',
                                style: TextStyle(
                                    color: Color(0xff156F6D),
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
              Container(
                width: AppDimensions.height10 * 32.0,
                height: AppDimensions.height10 * 2.6,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 2.7),
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
                width: AppDimensions.height10 * 9.36,
                height: AppDimensions.height10 * 12.0,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1),
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
                                  builder: (context) => emotions(
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
              SizedBox(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 0.1,
                child: Divider(
                  thickness: AppDimensions.height10 * 0.1,
                  height: AppDimensions.height10 * 0.1,
                  color: Colors.white,
                ),
              ),
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
                                ),
                              ),
                              button_feilds(
                                feild_text: 'Practice score (-/5)',
                                icon_viible: false,
                                text_color: 0xff828282,
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
                // margin: EdgeInsets.only(top: AppDimensions.height10 * 2.1),
                width: AppDimensions.height10 * 36.0,
                child: Divider(
                  thickness: AppDimensions.height10 * 0.1,
                  height: AppDimensions.height10 * 0.1,
                  color: Colors.white,
                ),
              ),
              Container(
                height: AppDimensions.height10 * 28.0,
                width: AppDimensions.height10 * 36.0,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 2.5,
                    top: AppDimensions.height10 * 3.0),
                child: Column(
                  children: [
                    button_feilds(
                      feild_text: 'View practice progress',
                      icon_viible: true,
                      text_color: 0xff646464,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: AppDimensions.height10 * 1.0,
                          top: AppDimensions.height10 * 1.0),
                      child: button_feilds(
                        feild_text: 'View practice settings',
                        icon_viible: true,
                        text_color: 0xff646464,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                      child: button_feilds(
                        feild_text: 'Veiw upcoming schedules',
                        icon_viible: true,
                        text_color: 0xff646464,
                      ),
                    ),
                    button_feilds(
                      feild_text: 'Practice assesment history',
                      icon_viible: true,
                      text_color: 0xff646464,
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
