import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class Congratulations_journey extends StatefulWidget {
  const Congratulations_journey({super.key});

  @override
  State<Congratulations_journey> createState() =>
      _Congratulations_journeyState();
}

class _Congratulations_journeyState extends State<Congratulations_journey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/Background Congratulations.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 32.7,
                height: AppDimensions.height10 * 37.7,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 29.6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: AppDimensions.height10 * 24.7,
                      height: AppDimensions.height10 * 7.2,
                      // color: Colors.amber,
                      child: Center(
                        child: Text(
                          'Your journey\nwith us',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 3.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFBFBFB),
                              height: AppDimensions.height10 * 0.12),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 32.7,
                      height: AppDimensions.height10 * 14.6,
                      // color: Colors.amber,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 4.8),
                      child: Align(
                        alignment: Alignment(0, -0.8),
                        child: Text(
                          'We’ve put together your\npersonal development\njourney for you.\nTake a look...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.4,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFBFBFB),
                              height: AppDimensions.height10 * 0.12),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 19.1,
                      height: AppDimensions.height10 * 2.2,
                      //  color: Colors.amber,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.5),
                      child: Center(
                        child: Text(
                          'When did it start?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFBFBFB),
                              height: AppDimensions.height10 * 0.12),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                      child: Image.asset(
                        'assets/images/Arrow.png',
                        width: AppDimensions.height10 * 4.1,
                        height: AppDimensions.height10 * 4.3,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 26.7,
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 85.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 34.7,
                    height: AppDimensions.height10 * 10.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 4.7),
                    child: Center(
                      child: Text(
                        'You started your\ngoal with\nus on...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 13.5,
                    height: AppDimensions.height10 * 14.4,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 5.7,
                          height: AppDimensions.height10 * 14.4,
                          child: Center(
                            child: Text(
                              '11',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 5.0,
                                  fontWeight: FontWeight.w300,
                                  // letterSpacing: AppDimensions.height10 * 0,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFFBFBFB),
                                  height: AppDimensions.height10 * 0.12),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 7.2,
                          height: AppDimensions.height10 * 8.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 4.0),
                          color: Colors.amber,
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFBFBFB),
                                        height: AppDimensions.height10 * 0.12),
                                    children: [
                                  TextSpan(
                                      text: 'Jun\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(text: '2020')
                                ])),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 26.8,
                    height: AppDimensions.height10 * 26.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/anger_3.png'))),
                  ),
                  Container(
                    width: AppDimensions.height10 * 24.0,
                    height: AppDimensions.height10 * 2.2,
                    //  color: Colors.amber,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 9.8),
                    child: Center(
                      child: Text(
                        'Practices created',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 3.2),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2.9,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 34.7,
                    height: AppDimensions.height10 * 14.8,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 9.0),
                    child: Text(
                      'You implemented new\nbehaviour practices to\nreach your goal...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.12),
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10 * 32.9,
                    height: AppDimensions.height10 * 34.9,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment(0, -1),
                        child: SizedBox(
                            width: AppDimensions.height10 * 5.7,
                            height: AppDimensions.height10 * 14.4,
                            child: Center(
                              child: Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 9.6,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFFFBFBFB),
                                      height: AppDimensions.height10 * 0.12)),
                            )),
                      ),
                      Align(
                        alignment: const Alignment(0.1, 1),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.8,
                            width: AppDimensions.height10 * 13.8,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse orange.png'),
                                    fit: BoxFit.contain)),
                            child: Center(
                                child: Text(
                              'Count\ntemper\nepisodes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1, 0.175),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.8,
                            width: AppDimensions.height10 * 13.8,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse 157.png'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text(
                              'Count\ndown',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-1, 0.3),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.8,
                            width: AppDimensions.height10 * 13.8,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Ellipse 158.png'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text(
                              'Meditation',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: AppDimensions.height10 * 15.0,
                    height: AppDimensions.height10 * 2.242,
                    //  color: Colors.amber,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 15.695),
                    child: Center(
                      child: Text(
                        'Hurdles faced',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 3.354),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2.9,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 34.7,
                    height: AppDimensions.height10 * 14.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 2.8,
                        bottom: AppDimensions.height10 * 7.3),
                    child: Text(
                      'You faced and\nrecorded these\nhurdles to reach your goal...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.12),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 38.9,
                    height: AppDimensions.height10 * 34.9,
                    //  color: Colors.grey,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment(0, -1),
                        child: SizedBox(
                            width: AppDimensions.height10 * 5.7,
                            height: AppDimensions.height10 * 14.4,
                            child: Center(
                              child: Text('4',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 9.6,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFFFBFBFB),
                                      height: AppDimensions.height10 * 0.12)),
                            )),
                      ),
                      Align(
                        alignment: const Alignment(-0.6, 1),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.contain)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  //height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'People',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 7.471,
                                  // height: AppDimensions.height10 * 4.38,

                                  child: Text(
                                    'Children',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.425, 0.8),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.contain)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  //height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'EVENT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 7.471,
                                  // height: AppDimensions.height10 * 4.38,

                                  child: Text(
                                    'Work',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(1, -0.25),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text(
                              'Count\ndown',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-1, -0.175),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: AppDimensions.height10 * 13.245,
                            width: AppDimensions.height10 * 13.23,
                            decoration: const BoxDecoration(
                                //color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'),
                                    fit: BoxFit.cover)),
                            child: Center(
                                child: Text(
                              'Meditation',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    width: AppDimensions.height10 * 22.7,
                    height: AppDimensions.height10 * 2.242,
                    //  color: Colors.amber,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 15.695),
                    child: Center(
                      child: Text(
                        'Your inspirations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 2.6),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 3.1,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 35.5,
                    height: AppDimensions.height10 * 21.6,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 8.5),
                    child: Text(
                      'This is your\ninspirational board\nthat you created to\nboost your motivation\nto reach your desired\ngoal...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.12),
                    ),
                  ),
                  SizedBox(
                      width: AppDimensions.height10 * 5.7,
                      height: AppDimensions.height10 * 14.4,
                      child: Center(
                        child: Text('4',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppDimensions.height10 * 9.6,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFFBFBFB),
                                height: AppDimensions.height10 * 0.12)),
                      )),
                  Container(
                    width: double.infinity,
                    height: AppDimensions.height10 * 22.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Video_Subtract.png'))),
                          margin:
                              EdgeInsets.only(left: AppDimensions.height10 * 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 8.253,
                                height: AppDimensions.height10 * 8.253,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 0.68),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/video_image.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                width: AppDimensions.height10 * 10.5,
                                height: AppDimensions.height10 * 4.0,
                                // margin: EdgeInsets.only(
                                //     bottom: AppDimensions.height10 * 1.0),
                                child: Text(
                                  'Music Eye Of\nThe Tiger ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 1.5,
                                      height: AppDimensions.height10 * 0.12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.height10 * 3.8,
                                child: Divider(
                                  thickness: AppDimensions.height10 * 0.1,
                                  height: AppDimensions.height10 * 0.1,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 6.3,
                                height: AppDimensions.height10 * 1.7,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.0),
                                child: Text(
                                  'Survivors',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 1.4,
                                      height: AppDimensions.height10 * 0.12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Rectangle 10.png'),
                                  fit: BoxFit.cover)),
                          margin:
                              EdgeInsets.only(left: AppDimensions.height10 * 1),
                        ),
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Image_Subtract.png'))),
                          margin:
                              EdgeInsets.only(left: AppDimensions.height10 * 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 6.75,
                                height: AppDimensions.height10 * 6.687,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.49),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/link_image.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                width: AppDimensions.height10 * 15.7,
                                height: AppDimensions.height10 * 5.41,
                                margin: EdgeInsets.only(
                                    bottom: AppDimensions.height10 * 1.418),
                                child: Center(
                                  child: Text(
                                    'Finding clarity\nand peace through\nthe storm ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: AppDimensions.height10 * 1.4,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10 * 15.0,
                                height: AppDimensions.height10 * 3.4,
                                child: Center(
                                  child: Text(
                                    'www.angermanagment\ncom',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: AppDimensions.height10 * 1.1,
                                        height: AppDimensions.height10 * 0.12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 18.0,
                          height: AppDimensions.height10 * 22.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 1.5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Video_Subtract.png'))),
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 1,
                              right: AppDimensions.height10 * 1),
                          child: Center(
                            child: Container(
                              width: AppDimensions.height10 * 15.5,
                              height: AppDimensions.height10 * 14.46,
                              // margin: EdgeInsets.only(
                              //     top: AppDimensions.height10 * 2.839),
                              child: Center(
                                child: Text(
                                  'Lorem ipsum dolor sit\namet, consectetur\nadipiscing elit.\nAenean quis aliquam\nligula, sit amet viverra\nnibh. Quisque finibus\nvolutpat dapibus.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: AppDimensions.height10 * 1.4,
                                      height: AppDimensions.height10 * 0.12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 25.8,
                    height: AppDimensions.height10 * 2.2,
                    //  color: Colors.amber,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 6.5),
                    child: Center(
                      child: Text(
                        'Practice sessions recorded',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFBFBFB),
                            height: AppDimensions.height10 * 0.12),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 3.2),
                    child: Image.asset(
                      'assets/images/Arrow.png',
                      width: AppDimensions.height10 * 4.1,
                      height: AppDimensions.height10 * 4.3,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10 * 2.9,
                  ),
                  Divider(
                    thickness: AppDimensions.height10 * 0.1,
                    height: AppDimensions.height10 * 0.1,
                    color: Color(0xFF0000000),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 89.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Container(
                    width: AppDimensions.height10 * 35.5,
                    height: AppDimensions.height10 * 21.6,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 6.3),
                    child: Text(
                      'Your effort\nsince joining us ...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFBFBFB),
                          height: AppDimensions.height10 * 0.12),
                    ),
                  ),
                ]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_2.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [Container()]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [Container()]),
              ),
              Container(
                // width: AppDimensions.height10 * 41.5,
                height: AppDimensions.height10 * 89.5,

                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/journey_1.png'),
                        fit: BoxFit.cover)),
                child: Column(children: [Container()]),
              ),
              // Container()
            ],
          ),
        ),
      ),
    );
  }
}

class RandomContainers extends StatefulWidget {
  @override
  _RandomContainersState createState() => _RandomContainersState();
}

class _RandomContainersState extends State<RandomContainers> {
  List<Widget> _containers = [];

  final double _minPosition = 50.0;
  final double _maxPosition = 250.0;
  final int _numberOfContainers = 10;

  @override
  void initState() {
    super.initState();
    _generateContainers();
  }

  void _generateContainers() {
    _containers.clear();
    final random = Random();

    for (int i = 0; i < _numberOfContainers; i++) {
      double x =
          _minPosition + random.nextDouble() * (_maxPosition - _minPosition);
      double y =
          _minPosition + random.nextDouble() * (_maxPosition - _minPosition);

      Widget container = Positioned(
        left: x,
        top: y,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      );

      _containers.add(container);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _containers,
      ),
    );
  }
}
