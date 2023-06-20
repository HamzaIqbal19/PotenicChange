import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class landing_hurdles extends StatelessWidget {
  final bool multiple_hurdle;
  const landing_hurdles({super.key, required this.multiple_hurdle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image:
                AssetImage('assets/images/capture_hurdles_landing_goals.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => landing_hurdles_2()),
                  );
                },
                child: Container(
                  width: AppDimensions.height10(context) * 34.3,
                  height: AppDimensions.height10(context) * 8.2,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 7.5,
                  ),
                  child: multiple_hurdle
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GradientText(
                              'My faced hurdles ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 3.0,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GradientText(
                                  '& obstacles ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 3.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  colors: [
                                    Color(0xffFA9934),
                                    Color(0xffEDD15E)
                                  ],
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 3.0,
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/ic_info_outline_orange.png')))),
                              ],
                            )
                          ],
                        )
                      : GradientText(
                          'My faced\nhurdles & obstacles ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 3.0,
                            fontWeight: FontWeight.w700,
                          ),
                          colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                        ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 9.8,
                height: AppDimensions.height10(context) * 2.2,
                margin: EdgeInsets.only(
                    top: multiple_hurdle
                        ? AppDimensions.height10(context) * 1.6
                        : AppDimensions.height10(context) * 1.8,
                    left: AppDimensions.height10(context) * 0.5),
                child: Text('New hurdle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'laila')),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(
                      top: multiple_hurdle
                          ? AppDimensions.height10(context) * 3.0
                          : AppDimensions.height10(context) * 2.6,
                      left: AppDimensions.height10(context) * 0.4),
                  child: Icon(
                    Icons.add,
                    size: AppDimensions.height10(context) * 5.6,
                    color: Color(0xFFFFFFFFF),
                  ),
                ),
              ),
              multiple_hurdle
                  ? Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: AppDimensions.height10(context) * 17.6,
                                height:
                                    AppDimensions.height10(context) * 18.207,
                                margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 21.942,
                                  left: AppDimensions.height10(context) * 3.106,
                                  // right: AppDimensions.height10(context) * 18.6
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Text(
                                        'Wine bar',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.6),
                                      child: Text(
                                        'Drinking too much\nmakes me more\nagressive',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => hurdle_menu()),
                                );
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 17.6,
                                height:
                                    AppDimensions.height10(context) * 18.207,
                                margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 21.942,
                                  left: AppDimensions.height10(context) * 3.106,
                                  //right: AppDimensions.height10(context) * 18.6
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Text(
                                        'Negative thought',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.6),
                                      child: Text(
                                        'I don’t deserve to be\nhappy',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => hurdle_menu()),
                                );
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 17.6,
                                height:
                                    AppDimensions.height10(context) * 18.207,
                                margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.367,
                                  left: AppDimensions.height10(context) * 3.106,
                                  // right: AppDimensions.height10(context) * 18.6
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      //width: AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Text(
                                        'Past Event',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.6),
                                      child: Text(
                                        'My first husband left\nme and the children for\nanother woman',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => hurdle_menu()),
                                );
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 17.6,
                                height:
                                    AppDimensions.height10(context) * 18.207,
                                margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.367,
                                  left: AppDimensions.height10(context) * 3.106,
                                  //right: AppDimensions.height10(context) * 18.6
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Text(
                                        'Husband',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.6),
                                      child: Text(
                                        'Makes a mistake',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => hurdle_menu()),
                        );
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 19.6,
                        height: AppDimensions.height10(context) * 19.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 21.942,
                            left: AppDimensions.height10(context) * 3.106,
                            right: AppDimensions.height10(context) * 18.6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/black_hole.png'))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 7.1,
                              height: AppDimensions.height10(context) * 1.9,
                              child: Text(
                                'Husband',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              // width: AppDimensions.height10(context) * 1571,
                              // height: AppDimensions.height10(context) * 1.7,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.6),
                              child: Text(
                                'Makes a mistake',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          )),
    );
  }
}

class landing_hurdles_2 extends StatelessWidget {
  const landing_hurdles_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
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
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image:
                  AssetImage('assets/images/capture_hurdles_landing_goals.png'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                Container(
                  width: AppDimensions.height10(context) * 34.3,
                  height: AppDimensions.height10(context) * 7.3,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 7.5,
                  ),
                  child: GradientText(
                    'My faced\nhurdles & obstacles',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 3.0,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensions.height10(context) * 9.8,
                  height: AppDimensions.height10(context) * 2.2,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.0),
                  child: Text('New hurdle',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'laila')),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.0,
                        left: AppDimensions.height10(context) * 0.4),
                    child: Icon(
                      Icons.add,
                      size: AppDimensions.height10(context) * 5.6,
                      color: Color(0xFFFFFFFFF),
                    ),
                  ),
                ),
                Container(
                  height: AppDimensions.height10(context) * 37.896,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 21.0,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 15.2,
                              height: AppDimensions.height10(context) * 15.2,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 2.5,
                                  right: AppDimensions.height10(context) * 2.2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/black_hole.png'))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 7.1,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'Husband',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    // width: AppDimensions.height10(context) * 1571,
                                    // height: AppDimensions.height10(context) * 1.7,
                                    child: Text(
                                      'Makes a\nmistake',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 15.2,
                              height: AppDimensions.height10(context) * 15.2,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 2.5,
                                  right: AppDimensions.height10(context) * 2.2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/black_hole.png'))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 7.1,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Center(
                                      child: Text(
                                        ' Mood',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: AppDimensions.height10(context) * 1571,
                                    // height: AppDimensions.height10(context) * 1.7,
                                    child: Text(
                                      'Tiredness',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 15.2,
                                height: AppDimensions.height10(context) * 15.2,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.5,
                                    right:
                                        AppDimensions.height10(context) * 2.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Center(
                                        child: Text(
                                          'People',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      child: Text(
                                        'Children',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 15.2,
                                height: AppDimensions.height10(context) * 15.2,
                                margin: EdgeInsets.only(
                                    //  top: AppDimensions.height10(context) * 2.35,
                                    left: AppDimensions.height10(context) * 2.5,
                                    right:
                                        AppDimensions.height10(context) * 2.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Center(
                                        child: Text(
                                          'Event',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      child: Text(
                                        'Work',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0),
                          child: Row(
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 15.2,
                                height: AppDimensions.height10(context) * 15.2,
                                margin: EdgeInsets.only(
                                    // top: AppDimensions.height10(context) * 2.35,
                                    left: AppDimensions.height10(context) * 2.5,
                                    right:
                                        AppDimensions.height10(context) * 2.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Text(
                                        'Husband',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      child: Text(
                                        'Makes a mistake',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 15.2,
                                height: AppDimensions.height10(context) * 15.2,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.5,
                                    right:
                                        AppDimensions.height10(context) * 2.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/black_hole.png'))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 7.1,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Text(
                                        'Husband',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.height10(context) * 1571,
                                      // height: AppDimensions.height10(context) * 1.7,
                                      child: Text(
                                        'Makes a mistake',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.4,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            // color: Colors.blue,
            padding: EdgeInsets.only(
                left: AppDimensions.height10(context) * 2.2,
                right: AppDimensions.height10(context) * 2.2),
            height: AppDimensions.height10(context) * 7.0,
            width: AppDimensions.height10(context) * 41.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 2.4,
                      height: AppDimensions.height10(context) * 2.4,
                      // padding: EdgeInsets.only(
                      //     top: AppDimensions.height10(context) * 0.5,
                      //     bottom: AppDimensions.height10(context) * 0.5),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/ic_filter_list.png',
                          width: AppDimensions.height10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimensions.height10(context) * 0.5,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 11.5,
                        height: AppDimensions.height10(context) * 3.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 1.0),
                            border: Border.all(
                                width: AppDimensions.height10(context) * 0.1,
                                color: Color(0xFFE0E0E0))),
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.3,
                            right: AppDimensions.height10(context) * 1.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 1.0),
                              child: Text(
                                'Goal:',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFA9934)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 1.9,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.8),
                              child: Center(
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFA9934)),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.8,
                                  bottom:
                                      AppDimensions.height10(context) * 0.3),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xffFA9934),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showTagSheet(context);
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 11.6,
                        height: AppDimensions.height10(context) * 3.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 1.0),
                            border: Border.all(
                                width: AppDimensions.height10(context) * 0.1,
                                color: Color(0xFFE0E0E0))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 1.0),
                              child: Text(
                                'Type:',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFA9934)),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 1.9,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.8),
                              child: Center(
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFA9934)),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 2.4,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 0.8,
                                  bottom:
                                      AppDimensions.height10(context) * 0.3),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xffFA9934),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: AppDimensions.height10(context) * 3.9,
                        height: AppDimensions.height10(context) * 3.4,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Clec',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.4,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              color: Color(0xFFFA9934).withOpacity(0.30)),
                        ),
                      ),
                    )
                  ],
                ),

                Container(
                  width: AppDimensions.height10(context) * 4.9,
                  height: AppDimensions.height10(context) * 5.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/Search.png',
                      width: AppDimensions.height10(context) * 5,
                      height: AppDimensions.height10(context) * 5,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                //const Padding(padding: EdgeInsets.all(10))
              ],
            ),
          ),
        ));
  }
}

class hurdle_menu extends StatelessWidget {
  const hurdle_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
          child: Text(
            'Menu',
            style: TextStyle(
                fontSize: AppDimensions.height10(context) * 2.0,
                fontWeight: FontWeight.w600,
                color: Color(0xfffbfbfb)),
          ),
        ),
        centerTitle: true,
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/practicebackground.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimensions.height10(context) * 17.62,
              height: AppDimensions.height10(context) * 17.33,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 11.255,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/black_hole.png'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppDimensions.height10(context) * 7.1,
                    height: AppDimensions.height10(context) * 1.9,
                    child: Text(
                      'Husband',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 1.6,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 7.471,
                    height: AppDimensions.height10(context) * 4.38,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 0.773),
                    child: Text(
                      'Makes a\nmistake',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 32.0,
              height: AppDimensions.height10(context) * 2.6,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 7.313),
              child: Center(
                  child: Text(
                'What do you want to do?',
                style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
            ),
            Container(
              width: AppDimensions.height10(context) * 36.0,
              height: AppDimensions.height10(context) * 21.5,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 3.4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 6.0,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 23.9,
                          height: AppDimensions.height10(context) * 2.2,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.99),
                          child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View/Edit details',
                                style: TextStyle(
                                  color: Color(0xFF646464),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        Container(
                            width: AppDimensions.height10(context) * 2.4,
                            height: AppDimensions.height10(context) * 1.39,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.391),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/BTN Back.png',
                                //width: AppDimensions.height10(context) * 2.6,
                                //height: AppDimensions.height10(context) * 2.6,
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 17.0,
                    height: AppDimensions.height10(context) * 0.5,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 6.0,
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 0.5,
                          ),
                          child: Icon(
                            Icons.share,
                            color: Color(0xff646464),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 5.0,
                          height: AppDimensions.height10(context) * 2.2,
                          child: Center(
                              child: Text(
                            'Share',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF646464)),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 6.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.height10(context) * 0.1,
                            color: Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Color(0xff464646)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 0.5,
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 5.3,
                          height: AppDimensions.height10(context) * 2.2,
                          child: Center(
                              child: Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffffffff)),
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_showBottomSheet(BuildContext context) {
  String goal = 'Goal Name';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.height10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10(context) * 0.1,
                                color: Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

_showTagSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.height10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10(context) * 0.1,
                                color: Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        //magnification: 1.1,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'People / person 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'Negative thought 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'Place 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
