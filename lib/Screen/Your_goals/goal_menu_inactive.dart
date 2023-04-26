import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';

import '../../utils/app_dimensions.dart';

class goal_menu_inactive extends StatefulWidget {
  final bool isActive;
  const goal_menu_inactive({
    super.key,
    required this.isActive,
  });

  @override
  State<goal_menu_inactive> createState() => _goal_menu_inactiveState();
}

class _goal_menu_inactiveState extends State<goal_menu_inactive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(top: AppDimensions.height10 * 01),
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: Text(
              'Goal Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.height10 * 2.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
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
                width: AppDimensions.height10 * 27.5,
                height: AppDimensions.height10 * 11.2,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 9.7,
                    right: AppDimensions.height10 * 8.3,
                    left: AppDimensions.height10 * 5.1),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: AppDimensions.height10 * 10.4,
                        height: AppDimensions.height10 * 11.2,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: AppDimensions.height10 * 7.9,
                            height: AppDimensions.height10 * 7.9,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/images/image3.png'),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(1, -0.4),
                      child: Container(
                        // color: Colors.amber,
                        width: AppDimensions.height10 * 17.1,
                        height: AppDimensions.height10 * 2.4,
                        child: Text(
                          'Control my anger',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 32.0,
                height: AppDimensions.height10 * 2.6,
                // margin: EdgeInsets.only(top: AppDimensions.height10 * 1.4),
                child: Center(
                  child: Text(
                    'What do you want to do?',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 2.2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff437296)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.4,
                height: AppDimensions.height10 * 14.7,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.4),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: Stack(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 37.4,
                      height: AppDimensions.height10 * 12.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/Rectangle 192.png'),
                            fit: BoxFit.cover,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 8.1,
                            height: AppDimensions.height10 * 8.1,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 1.6),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Nebula Pie.png'),
                              ),
                              // color: Colors.amber,
                            ),
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 2.8),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 20.9,
                            height: AppDimensions.height10 * 9.1,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // width: AppDimensions.height10 * 16.5,
                                    height: AppDimensions.height10 * 1.9,

                                    child: Text(
                                      'Goal level evaluation',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFFFFFF)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    // width: AppDimensions.height10 * 9.5,
                                    height: AppDimensions.height10 * 2.2,

                                    child: Text(
                                      'for 01 FEB 23!',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFFFFFF)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 20.9,
                                  height: AppDimensions.height10 * 5,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Evaluate how close you’re\ncurrently to living your goal',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: AppDimensions.height10 * 2.4,
                              height: AppDimensions.height10 * 1.31,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 0.8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  color: Color(0xFFFFFFFF),
                                  //width: AppDimensions.height10 * 2.6,
                                  //height: AppDimensions.height10 * 2.6,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.8, 0.875),
                      child: Container(
                        width: AppDimensions.height10 * 15.7,
                        height: AppDimensions.height10 * 1.3,
                        child: Row(
                          children: [
                            Text(
                              'Next score needed in ',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.1,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)),
                            ),
                            Text(
                              '-00',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.1,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff828282)),
                            ),
                            Text(
                              ' days',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.1,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff828282)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.975, -1.275),
                      child: Container(
                        width: AppDimensions.height10 * 18.0,
                        height: AppDimensions.height10 * 2.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                            color: Color(0xFFFFFFFF)),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 0.8,
                              top: AppDimensions.height10 * 0.5,
                              bottom: AppDimensions.height10 * 0.5),
                          child: Text(
                            'Score needed!',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF646464)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 36.4,
                height: AppDimensions.height10 * 6.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                padding: EdgeInsets.only(
                    left: AppDimensions.height10 * 2.0,
                    right: AppDimensions.height10 * 1.9),
                decoration: widget.isActive
                    ? BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xFFF0CB59),
                        border: Border.all(
                            color: Color(0xFFFFFFFF),
                            width: AppDimensions.height10 * 0.1),
                      )
                    : BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xFF828282),
                        border: Border.all(
                            color: Color(0xFFFFFFFF),
                            width: AppDimensions.height10 * 0.1),
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'This goal is ',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF)),
                          ),
                          widget.isActive
                              ? Text(
                                  'Active',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF156F6D)),
                                )
                              : Text(
                                  'Inactive',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFDE7A11)),
                                )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.isActive
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        goal_inactive(isActive: true)))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => goal_inactive(
                                          isActive: false,
                                        )));
                      },
                      child: Container(
                        width: AppDimensions.height10 * 3.6,
                        height: AppDimensions.height10 * 2.2,
                        child: Center(
                          child: Text(
                            'EDIT',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.4,
                height: AppDimensions.height10 * 0.1,
                color: Color(0xFFFFFFFF),
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 13.8,
                height: AppDimensions.height10 * 13.8,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/Ellipse 158.png'),
                  fit: BoxFit.contain,
                )),
                child: Center(
                  child: Text(
                    'Meditation',
                    style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.8,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 20.0,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 2.0,
                    bottom: AppDimensions.height10 * 8.4),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 6.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 18.5,
                            height: AppDimensions.height10 * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.99),
                            child: Text(
                              'Progress report  (00)',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 6.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 18.5,
                            height: AppDimensions.height10 * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.99),
                            child: Text(
                              'Timeline',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 6.0,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 18.5,
                            height: AppDimensions.height10 * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.99),
                            child: Text(
                              'Goal details',
                              style: TextStyle(
                                color: Color(0xff646464),
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
