import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class multiple_goal_inactive extends StatefulWidget {
  final bool isActive;
  const multiple_goal_inactive({super.key, required this.isActive});

  @override
  State<multiple_goal_inactive> createState() => _multiple_goal_inactiveState();
}

class _multiple_goal_inactiveState extends State<multiple_goal_inactive> {
  @override
  Widget build(BuildContext context) {
    bool back_color = true;
    bool bt_switch = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
            child: TextButton(
              onPressed: () {
                setState(() {
                  bt_switch = true;
                });
              },
              child: Text(
                'Edit',
                style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.8,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
          )
        ],
      ),
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
                width: AppDimensions.height10 * 27.8,
                height: AppDimensions.height10 * 3.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 11.0),
                child: Center(
                  child: Text(
                    'Control My Anger',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 18.0,
                height: AppDimensions.height10 * 2.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Status: ',
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
              Container(
                width: AppDimensions.height10 * 26.8,
                height: AppDimensions.height10 * 11.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.height10 * 11.4,
                      height: AppDimensions.height10 * 11.4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 9.3,
                            height: AppDimensions.height10 * 3.4,
                            child: Text(
                              'No. of\nActive days',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF437296)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 6.3,
                            height: AppDimensions.height10 * 3.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.8),
                            child: Text(
                              '21',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 2.8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF464646)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 11.4,
                      height: AppDimensions.height10 * 11.4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 9.3,
                            height: AppDimensions.height10 * 3.4,
                            child: Text(
                              'Goal\nLevel',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF437296)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 6.3,
                            height: AppDimensions.height10 * 3.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF464646)),
                                ),
                                Text(
                                  '/5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.0,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF464646)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 37.2,
                  height: AppDimensions.height10 * 2.9,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.8),
                  child: Center(
                    child: Text(
                      'Assign up to 5 practices:',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.4,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  )),
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.9),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 5.4,
                      height: AppDimensions.height10 * 5.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 158.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10 * 18.6,
                      height: AppDimensions.height10 * 4.9,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 9.2,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 2.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/bin.png'))),
                          )
                        : SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  width: AppDimensions.height10 * 6.2,
                                  height: AppDimensions.height10 * 3.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10 * 2.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFA9934),
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10 * 5.2),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: AppDimensions.height10 * 2.6,
                                      height: AppDimensions.height10 * 2.6,
                                      margin: EdgeInsets.only(
                                          right: AppDimensions.height10 * 0.4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFFFFFF)),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 1.31,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 2.0),
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
                          )
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 5.4,
                      height: AppDimensions.height10 * 5.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse purple.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10 * 18.6,
                      height: AppDimensions.height10 * 4.9,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 9.2,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Count down',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 6.2,
                      height: AppDimensions.height10 * 3.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFA9934),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.2),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: AppDimensions.height10 * 2.6,
                          height: AppDimensions.height10 * 2.6,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 0.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10 * 2.4,
                        height: AppDimensions.height10 * 1.31,
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.0),
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
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 5.4,
                      height: AppDimensions.height10 * 5.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse orange.png'),
                        fit: BoxFit.contain,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10 * 18.6,
                      height: AppDimensions.height10 * 7.2,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 12.6,
                            height: AppDimensions.height10 * 4.5,
                            child: Text(
                              'Count temper\nepisodes',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 6.2,
                      height: AppDimensions.height10 * 3.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFA9934),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.2),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: AppDimensions.height10 * 2.6,
                          height: AppDimensions.height10 * 2.6,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 0.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10 * 2.4,
                        height: AppDimensions.height10 * 1.31,
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.0),
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
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                decoration: BoxDecoration(
                    color: Color(0xFF828282),
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 5.4,
                      height: AppDimensions.height10 * 5.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 158.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10 * 18.6,
                      height: AppDimensions.height10 * 4.9,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 9.2,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 6.2,
                      height: AppDimensions.height10 * 3.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFA9934),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.2),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: AppDimensions.height10 * 2.6,
                          height: AppDimensions.height10 * 2.6,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 0.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10 * 2.4,
                        height: AppDimensions.height10 * 1.31,
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.0),
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
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 5.4,
                      height: AppDimensions.height10 * 5.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse blue.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10 * 18.6,
                      height: AppDimensions.height10 * 4.9,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 12.6,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Mirror Practice',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 6.2,
                      height: AppDimensions.height10 * 3.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFA9934),
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 5.2),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: AppDimensions.height10 * 2.6,
                          height: AppDimensions.height10 * 2.6,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 0.4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10 * 2.4,
                        height: AppDimensions.height10 * 1.31,
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.0),
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
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                decoration: BoxDecoration(
                    color: Color(0xFF828282),
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 5.4,
                      height: AppDimensions.height10 * 5.4,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.2),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 158.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10 * 18.6,
                      height: AppDimensions.height10 * 4.9,
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 9.2,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10 * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: AppDimensions.height10 * 7.2,
                        height: AppDimensions.height10 * 3.4,
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.0),
                        child: Center(
                          child: Text(
                            'Incomplete',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFFFFF)),
                          ),
                        )),
                    Container(
                        width: AppDimensions.height10 * 2.4,
                        height: AppDimensions.height10 * 1.31,
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 2.0),
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
              Container(
                width: AppDimensions.height10 * 13.4,
                height: AppDimensions.height10 * 13.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 5.5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/circle_grey.png'))),
                child: Center(
                  child: Text(
                    'Add new\npractice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 31.3,
                  height: AppDimensions.height10 * 5.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 3.0,
                      bottom: AppDimensions.height10 * 24.9),
                  decoration: BoxDecoration(
                    color: Color(0xFF464646),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: AppDimensions.height10 * 2.4,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: AppDimensions.height10 * 0.8),
                        child: Text(
                          'Delete Goal',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Arial'),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: AppDimensions.height10 * 12.0,
          width: AppDimensions.height10 * 41.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: AppDimensions.height10 * 17.4,
                height: AppDimensions.height10 * 4.3,
                margin: EdgeInsets.only(left: AppDimensions.height10 * 2.6),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4/5 items',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5B74A6)),
                      ),
                      Text(
                        'have been selected',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5B74A6)),
                      ),
                    ],
                  ),
                ),
              ),
              widget.isActive
                  ? Container(
                      width: AppDimensions.height10 * 9.1,
                      height: AppDimensions.height10 * 9.1,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 3.3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.white),
                        boxShadow: List.filled(
                            4, BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25))),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFEBD0F),
                            Color(0xffFFA511),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 2.0,
                            height: AppDimensions.height10 * 2.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.7),
                            color: Color(0xFFFFFFFF),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.4),
                            child: Text(
                              'Stop',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          )
                        ],
                      ))
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    multiple_goal_inactive(isActive: true)));
                      },
                      child: Container(
                          width: AppDimensions.height10 * 9.1,
                          height: AppDimensions.height10 * 9.1,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 3.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 3, color: Color(0xFFFFA511)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 2.0,
                                height: AppDimensions.height10 * 2.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/start_icon.png'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.4),
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFFFA511)),
                                ),
                              )
                            ],
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
