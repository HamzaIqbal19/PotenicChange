import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class record_session extends StatelessWidget {
  const record_session({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
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
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppDimensions.height10 * 6.8,
                width: AppDimensions.height10 * 21.7,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 5.3,
                    bottom: AppDimensions.height10 * 4.2),
                child: Center(
                    child: Text(
                  'Record Practice\nSession',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 2.8,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'laila'),
                )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: AppDimensions.height10 * 31.3,
                  width: AppDimensions.height10 * 46.4,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10 * 2.3,
                      bottom: AppDimensions.height10 * 3.2),
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            width: AppDimensions.height10 * 26.8,
                            height: AppDimensions.height10 * 26.8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/oraange_sun.png'),
                                    colorFilter: ColorFilter.mode(
                                        Color.fromRGBO(0, 0, 0, 0.5),
                                        BlendMode.dstATop),
                                    fit: BoxFit.cover)),
                            child: Stack(children: [
                              Align(
                                  alignment: Alignment(0, -0.5),
                                  child: Text(
                                    'Control my anger',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff5B74A6)),
                                  )),
                              Align(
                                alignment: Alignment(0, -0.2),
                                child: Text(
                                    '“I am someone who is in\n control of my anger”',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff5B74A6))),
                              ),
                            ]))),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Container(
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.9),
                        child: Row(
                          children: [
                            Container(
                              height: AppDimensions.height10 * 13.8,
                              width: AppDimensions.height10 * 13.8,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 1.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse 158.png'),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Text(
                                  'Meditation',
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10 * 13.8,
                              width: AppDimensions.height10 * 13.8,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 1.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse orange.png'),
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                child: Text(
                                  'Count\ntemper\nepisodes',
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10 * 13.8,
                              width: AppDimensions.height10 * 13.8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse purple.png'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Text(
                                  'Count\ndown',
                                  style: TextStyle(
                                      fontFamily: 'laila',
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                height: AppDimensions.height10 * 30.2,
                width: AppDimensions.height10 * 31.5,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 3.4,
                    left: AppDimensions.height10 * 2.3),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: AppDimensions.height10 * 26.8,
                          height: AppDimensions.height10 * 26.8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/blue_sun.png'),
                                  colorFilter: ColorFilter.mode(
                                      Color.fromRGBO(0, 0, 0, 0.5),
                                      BlendMode.dstATop),
                                  fit: BoxFit.cover)),
                          child: Stack(children: [
                            Align(
                                alignment: Alignment(0, -0.5),
                                child: Text(
                                  'Be more confident',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff5B74A6)),
                                )),
                            Align(
                              alignment: Alignment(0, -0.2),
                              child: Text(
                                  'I am someone who is in\n confident in my abilities',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff5B74A6))),
                            ),
                          ])),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 2.9),
                              child: Row(
                                children: [
                                  Container(
                                    height: AppDimensions.height10 * 13.8,
                                    width: AppDimensions.height10 * 13.8,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10 * 1.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse 158.png'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Meditation',
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            fontSize:
                                                AppDimensions.height10 * 1.8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 13.8,
                                    width: AppDimensions.height10 * 13.8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse blue.png'),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Talk to\nstrangers',
                                        style: TextStyle(
                                            fontFamily: 'laila',
                                            fontSize:
                                                AppDimensions.height10 * 1.8,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    )
                  ],
                ),
              ),
              Container(
                  height: AppDimensions.height10 * 5.0,
                  width: AppDimensions.height10 * 24.3,
                  margin: EdgeInsets.only(bottom: AppDimensions.height10 * 0.6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCC10D),
                          Color(0xffFDA210),
                        ]),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all goals',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'poppins'),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
