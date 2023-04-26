import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';

class landing_hurdles extends StatelessWidget {
  const landing_hurdles({super.key});

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
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
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
                  width: AppDimensions.height10 * 34.3,
                  height: AppDimensions.height10 * 7.3,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 7.5,
                  ),
                  child: GradientText(
                    'My faced\nhurdles & obstacles',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 3.0,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 9.8,
                height: AppDimensions.height10 * 2.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.3),
                child: Text('New hurdle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'laila')),
              ),
              Container(
                width: AppDimensions.height10 * 19.6,
                height: AppDimensions.height10 * 23.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Blackhole.png'))),
                child: Align(
                  alignment: Alignment(-0.075, -0.48),
                  child: Icon(
                    Icons.add,
                    size: AppDimensions.height10 * 5.6,
                    color: Color(0xFFFFFFFFF),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hurdle_menu()),
                  );
                },
                child: Container(
                  width: AppDimensions.height10 * 19.6,
                  height: AppDimensions.height10 * 19.6,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 5.242,
                      left: AppDimensions.height10 * 3.106,
                      right: AppDimensions.height10 * 18.6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/black_hole.png'))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 7.1,
                        height: AppDimensions.height10 * 1.9,
                        child: Text(
                          'Husband',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        // width: AppDimensions.height10 * 1571,
                        // height: AppDimensions.height10 * 1.7,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                        child: Text(
                          'Makes a mistake',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.4,
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
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: AppDimensions.height10 * 34.3,
                  height: AppDimensions.height10 * 7.3,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 7.5,
                  ),
                  child: GradientText(
                    'My faced\nhurdles & obstacles',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 3.0,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 9.8,
                  height: AppDimensions.height10 * 2.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.3),
                  child: Text('New hurdle',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'laila')),
                ),
                Container(
                  width: AppDimensions.height10 * 19.6,
                  height: AppDimensions.height10 * 25.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Blackhole.png'))),
                  child: Align(
                    alignment: Alignment(-0.075, -0.48),
                    child: Icon(
                      Icons.add,
                      size: AppDimensions.height10 * 5.6,
                      color: Color(0xFFFFFFFFF),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 1.6,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 15.2,
                            height: AppDimensions.height10 * 15.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 2.5,
                                right: AppDimensions.height10 * 2.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Husband',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10 * 1571,
                                  // height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    'Makes a\nmistake',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 15.2,
                            height: AppDimensions.height10 * 15.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 2.5,
                                right: AppDimensions.height10 * 2.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      ' Mood',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10 * 1571,
                                  // height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    'Tiredness',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 15.2,
                            height: AppDimensions.height10 * 15.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 2.5,
                                right: AppDimensions.height10 * 2.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'People',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10 * 1571,
                                  // height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    'Children',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 15.2,
                            height: AppDimensions.height10 * 15.2,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.35,
                                left: AppDimensions.height10 * 2.5,
                                right: AppDimensions.height10 * 2.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Center(
                                    child: Text(
                                      'Event',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10 * 1571,
                                  // height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    'Work',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 15.2,
                            height: AppDimensions.height10 * 15.2,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.35,
                                left: AppDimensions.height10 * 2.5,
                                right: AppDimensions.height10 * 2.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Husband',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10 * 1571,
                                  // height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    'Makes a mistake',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 15.2,
                            height: AppDimensions.height10 * 15.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 2.5,
                                right: AppDimensions.height10 * 2.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.png'))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 7.1,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Husband',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10 * 1571,
                                  // height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    'Makes a mistake',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          // color: Colors.blue,
          padding: EdgeInsets.only(
              left: AppDimensions.height10 * 2.2,
              right: AppDimensions.height10 * 2.2),
          height: AppDimensions.height10 * 7.0,
          width: AppDimensions.height10 * 41.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: AppDimensions.height10 * 4.7,
                    height: AppDimensions.height10 * 4.7,
                    padding: EdgeInsets.only(
                        top: AppDimensions.height10 * 0.5,
                        bottom: AppDimensions.height10 * 0.5),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_filter_list.png',
                        width: AppDimensions.height10 * 4.7,
                        height: AppDimensions.height10 * 4.7,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10 * 0.5,
                  ),
                  Container(
                    width: AppDimensions.height10 * 11.5,
                    height: AppDimensions.height10 * 3.4,
                    margin:
                        EdgeInsets.only(right: AppDimensions.height10 * 1.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Goal:',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFA9934)),
                        ),
                        Container(
                          width: AppDimensions.height10 * 1.9,
                          height: AppDimensions.height10 * 2.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 0.8),
                          child: Center(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFA9934)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 2.4,
                          height: AppDimensions.height10 * 2.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 0.8,
                              bottom: AppDimensions.height10 * 0.3),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffFA9934),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: AppDimensions.height10 * 11.6,
                      height: AppDimensions.height10 * 3.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Type:',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 1.9,
                            height: AppDimensions.height10 * 2.4,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 0.8),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFA9934)),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 2.4,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 0.8,
                                bottom: AppDimensions.height10 * 0.3),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xffFA9934),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Container(
                width: AppDimensions.height10 * 4.7,
                height: AppDimensions.height10 * 4.7,
                padding: EdgeInsets.only(
                    top: AppDimensions.height10 * 0.5,
                    bottom: AppDimensions.height10 * 0.5),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Search.png',
                    width: AppDimensions.height10 * 5,
                    height: AppDimensions.height10 * 5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              //const Padding(padding: EdgeInsets.all(10))
            ],
          ),
        ),
      ),
    );
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
          margin: EdgeInsets.only(top: AppDimensions.height10 * 0.5),
          child: Text(
            'Menu',
            style: TextStyle(
                fontSize: AppDimensions.height10 * 2.0,
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
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
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
              width: AppDimensions.height10 * 17.62,
              height: AppDimensions.height10 * 17.33,
              margin: EdgeInsets.only(
                top: AppDimensions.height10 * 11.255,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/black_hole.png'))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppDimensions.height10 * 7.1,
                    height: AppDimensions.height10 * 1.9,
                    child: Text(
                      'Husband',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 1.6,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 7.471,
                    height: AppDimensions.height10 * 4.38,
                    margin:
                        EdgeInsets.only(top: AppDimensions.height10 * 0.773),
                    child: Text(
                      'Makes a\nmistake',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: AppDimensions.height10 * 32.0,
              height: AppDimensions.height10 * 2.6,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 7.313),
              child: Center(
                  child: Text(
                'What do you want to do?',
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),
            ),
            Container(
              width: AppDimensions.height10 * 36.0,
              height: AppDimensions.height10 * 21.5,
              margin: EdgeInsets.only(
                top: AppDimensions.height10 * 3.4,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppDimensions.height10 * 36.0,
                    height: AppDimensions.height10 * 6.0,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 23.9,
                          height: AppDimensions.height10 * 2.2,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 1.99),
                          child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View/Edit details',
                                style: TextStyle(
                                  color: Color(0xFF646464),
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 1.39,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 2.391),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/BTN Back.png',
                                //width: AppDimensions.height10 * 2.6,
                                //height: AppDimensions.height10 * 2.6,
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 17.0,
                    height: AppDimensions.height10 * 0.5,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                  ),
                  Container(
                    width: AppDimensions.height10 * 36.0,
                    height: AppDimensions.height10 * 6.0,
                    margin:
                        EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 2.4,
                          height: AppDimensions.height10 * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 0.5,
                          ),
                          child: Icon(
                            Icons.share,
                            color: Color(0xff646464),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 5.0,
                          height: AppDimensions.height10 * 2.2,
                          child: Center(
                              child: Text(
                            'Share',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF646464)),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 36.0,
                    height: AppDimensions.height10 * 6.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.height10 * 0.1,
                            color: Color(0xFFFFFFFF)),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xff464646)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 2.4,
                          height: AppDimensions.height10 * 2.4,
                          margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 0.5,
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10 * 5.3,
                          height: AppDimensions.height10 * 2.2,
                          child: Center(
                              child: Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
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
