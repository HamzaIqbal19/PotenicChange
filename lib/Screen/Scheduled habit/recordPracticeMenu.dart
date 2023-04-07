import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeEmotions.dart';

import '../../utilities/app_contants.dart';

class practiceMenu extends StatelessWidget {
  const practiceMenu({super.key});

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
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Appconstants.bg_image_dashboard),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: 304,
                height: 182,
                margin: EdgeInsets.only(top: 42, bottom: 32),
                child: Column(
                  children: [
                    Text(
                      'Practice Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 210,
                      height: 112,
                      margin: EdgeInsets.only(top: 46),
                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(-1, 0),
                            child: Container(
                              width: 104,
                              height: 112,
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
                              height: 49,
                              width: 49,
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Circle Button 1.0.png'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Align(
                            alignment: Alignment(1, -0.3),
                            child: Container(
                              width: 106,
                              height: 24,
                              child: Text(
                                'Meditation',
                                style: TextStyle(
                                    color: Color(0xff156F6D),
                                    fontSize: 20,
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
                width: 320,
                height: 26,
                margin: EdgeInsets.only(bottom: 27),
                child: Text(
                  'What do you want to do?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff437296)),
                ),
              ),
              Container(
                width: 93.6,
                height: 117,
                margin: EdgeInsets.only(bottom: 19),
                child: Column(
                  children: [
                    Container(
                      width: 79,
                      height: 79,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffFCC10D),
                                Color(0xffFDA210),
                              ]),
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => emotions()));
                        },
                        child: SizedBox(
                          height: 25.75,
                          width: 23.4,
                          child: Icon(
                            Icons.add_task,
                            color: Colors.white,
                            fill: 1.0,
                          ),
                        ),
                      )),
                    ),
                    Text(
                      'Record\npractice',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 360,
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 413,
                height: 229,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      height: 44,
                      width: 360,
                      margin: EdgeInsets.only(bottom: 12),
                      child: Column(children: [
                        Container(
                          child: Text(
                            'Practice Assessment',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xfff5f5f5)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            'You can evaluate your progress in -19 active days.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfff5f5f5)),
                          ),
                        )
                      ]),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12),
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
              Container(
                margin: EdgeInsets.only(top: 21),
                width: 360,
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 280,
                margin: EdgeInsets.only(bottom: 25, top: 30),
                child: Column(
                  children: [
                    button_feilds(
                      feild_text: 'View practice progress',
                      icon_viible: true,
                      text_color: 0xff646464,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      child: button_feilds(
                        feild_text: 'View practice settings',
                        icon_viible: true,
                        text_color: 0xff646464,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
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

class button_feilds extends StatelessWidget {
  final String feild_text;
  final bool icon_viible;
  final int text_color;
  const button_feilds(
      {super.key,
      required this.feild_text,
      required this.icon_viible,
      required this.text_color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      height: 60,
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                feild_text,
                style: TextStyle(
                  color: Color(text_color),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Container(
              width: 24,
              margin: EdgeInsets.only(right: 23.91),
              child: icon_viible
                  ? Icon(
                      Icons.arrow_forward,
                      color: Color(0xff646464),
                    )
                  : Container())
        ],
      ),
    );
  }
}
