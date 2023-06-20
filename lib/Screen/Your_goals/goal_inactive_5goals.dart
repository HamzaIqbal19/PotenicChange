import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../utils/app_dimensions.dart';

class multiple_goal_inactive extends StatefulWidget {
  final bool isActive;
  const multiple_goal_inactive({super.key, required this.isActive});

  @override
  State<multiple_goal_inactive> createState() => _multiple_goal_inactiveState();
}

class _multiple_goal_inactiveState extends State<multiple_goal_inactive> {
  bool status1 = true;
  bool status2 = true;
  bool status3 = true;
  bool status4 = false;
  bool status5 = true;
  bool color1 = true;
  bool color2 = true;
  bool color3 = true;
  bool color4 = false;
  bool color5 = true;
  bool bt_switch = false;
  @override
  Widget build(BuildContext context) {
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
                width: AppDimensions.height10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        actions: [
          bt_switch
              ? Row(
                  children: [
                    Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            bt_switch = false;
                          });
                        },
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF).withOpacity(0.5)),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            bt_switch = false;
                          });
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    )
                  ],
                )
              : Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        bt_switch = true;
                      });
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                )
        ],
      ),
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
                width: AppDimensions.height10(context) * 27.8,
                height: AppDimensions.height10(context) * 3.6,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 11.0),
                child: Center(
                  child: Text(
                    'Control My Anger',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 3.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 18.0,
                height: AppDimensions.height10(context) * 2.2,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFFFF)),
                    ),
                    widget.isActive
                        ? Text(
                            'Active',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF156F6D)),
                          )
                        : Text(
                            'Inactive',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFDE7A11)),
                          )
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 26.8,
                height: AppDimensions.height10(context) * 11.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 11.4,
                      height: AppDimensions.height10(context) * 11.4,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.3,
                            height: AppDimensions.height10(context) * 3.4,
                            child: Text(
                              'No. of\nActive days',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 6.3,
                            height: AppDimensions.height10(context) * 3.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.8),
                            child: Text(
                              '21',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF464646)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 11.4,
                      height: AppDimensions.height10(context) * 11.4,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.3,
                            height: AppDimensions.height10(context) * 3.4,
                            child: Text(
                              'Goal\nLevel',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 6.3,
                            height: AppDimensions.height10(context) * 3.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF464646)),
                                ),
                                Text(
                                  '/5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.0,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFF464646)),
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
                  width: AppDimensions.height10(context) * 37.2,
                  height: AppDimensions.height10(context) * 2.9,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.8),
                  child: Center(
                    child: Text(
                      'Assign up to 5 practices:',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.4,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  )),
              Container(
                width: AppDimensions.height10(context) * 41.8,
                height: AppDimensions.height10(context) * 10.0,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.9),
                decoration: BoxDecoration(
                    color:
                        color1 ? Colors.transparent : const Color(0xFF828282),
                    border: const Border(
                        top: BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.4,
                      height: AppDimensions.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.2),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 158.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 18.6,
                      height: AppDimensions.height10(context) * 4.9,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.2,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: const Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Delete practice?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 1.4,
                              height: AppDimensions.height10(context) * 1.6,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 10.6),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bin.png'))),
                            ),
                          )
                        : SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: FlutterSwitch(
                                    width:
                                        AppDimensions.height10(context) * 6.2,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    valueFontSize: 12.0,
                                    toggleSize: 18.0,
                                    activeColor: const Color(0xFFFA9934),
                                    inactiveColor: const Color(0xFF2F3A4B),
                                    value: status1,
                                    onToggle: (val) {
                                      setState(() {
                                        status1 = val;
                                        color1 = val;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.31,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        color: const Color(0xFFFFFFFF),
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
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
                width: AppDimensions.height10(context) * 41.8,
                height: AppDimensions.height10(context) * 10.0,
                decoration: BoxDecoration(
                    color:
                        color2 ? Colors.transparent : const Color(0xFF828282),
                    border: const Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.4,
                      height: AppDimensions.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.2),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse purple.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 18.6,
                      height: AppDimensions.height10(context) * 4.9,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.2,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Count down',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: const Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Delete practice?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 1.4,
                              height: AppDimensions.height10(context) * 1.6,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 10.6),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bin.png'))),
                            ),
                          )
                        : SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: FlutterSwitch(
                                    width:
                                        AppDimensions.height10(context) * 6.2,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    valueFontSize: 12.0,
                                    toggleSize: 18.0,
                                    activeColor: const Color(0xFFFA9934),
                                    inactiveColor: const Color(0xFF2F3A4B),
                                    value: status2,
                                    onToggle: (val) {
                                      setState(() {
                                        status2 = val;
                                        color2 = val;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.31,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        color: const Color(0xFFFFFFFF),
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
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
                width: AppDimensions.height10(context) * 41.8,
                height: AppDimensions.height10(context) * 10.0,
                decoration: BoxDecoration(
                    color:
                        color3 ? Colors.transparent : const Color(0xFF828282),
                    border: const Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.4,
                      height: AppDimensions.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.2),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse orange.png'),
                        fit: BoxFit.contain,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 18.6,
                      height: AppDimensions.height10(context) * 7.2,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 12.6,
                            height: AppDimensions.height10(context) * 4.5,
                            child: Text(
                              'Count temper\nepisodes',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: const Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Delete practice?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 1.4,
                              height: AppDimensions.height10(context) * 1.6,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 10.6),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bin.png'))),
                            ),
                          )
                        : SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: FlutterSwitch(
                                    width:
                                        AppDimensions.height10(context) * 6.2,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    valueFontSize: 12.0,
                                    toggleSize: 18.0,
                                    activeColor: const Color(0xFFFA9934),
                                    inactiveColor: const Color(0xFF2F3A4B),
                                    value: status3,
                                    onToggle: (val) {
                                      setState(() {
                                        status3 = val;
                                        color3 = val;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.31,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        color: const Color(0xFFFFFFFF),
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
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
                width: AppDimensions.height10(context) * 41.8,
                height: AppDimensions.height10(context) * 10.0,
                decoration: BoxDecoration(
                    color:
                        color4 ? Colors.transparent : const Color(0xFF828282),
                    border: const Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.4,
                      height: AppDimensions.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.2),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 158.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 18.6,
                      height: AppDimensions.height10(context) * 4.9,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.2,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: const Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Delete practice?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 1.4,
                              height: AppDimensions.height10(context) * 1.6,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 10.6),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bin.png'))),
                            ),
                          )
                        : SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: FlutterSwitch(
                                    width:
                                        AppDimensions.height10(context) * 6.2,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    valueFontSize: 12.0,
                                    toggleSize: 18.0,
                                    activeColor: const Color(0xFFFA9934),
                                    inactiveColor: const Color(0xFF2F3A4B),
                                    value: status4,
                                    onToggle: (val) {
                                      setState(() {
                                        status4 = val;
                                        color4 = val;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.31,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        color: const Color(0xFFFFFFFF),
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
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
                width: AppDimensions.height10(context) * 41.8,
                height: AppDimensions.height10(context) * 10.0,
                decoration: BoxDecoration(
                    color:
                        color5 ? Colors.transparent : const Color(0xFF828282),
                    border: const Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.4,
                      height: AppDimensions.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.2),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse blue.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 18.6,
                      height: AppDimensions.height10(context) * 4.9,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 12.6,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Mirror Practice',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: const Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Delete practice?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 1.4,
                              height: AppDimensions.height10(context) * 1.6,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 10.6),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bin.png'))),
                            ),
                          )
                        : SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: FlutterSwitch(
                                    width:
                                        AppDimensions.height10(context) * 6.2,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    valueFontSize: 12.0,
                                    toggleSize: 18.0,
                                    activeColor: const Color(0xFFFA9934),
                                    inactiveColor: const Color(0xFF2F3A4B),
                                    value: status5,
                                    onToggle: (val) {
                                      setState(() {
                                        status5 = val;
                                        color5 = val;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.31,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            2.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/BTN Back.png',
                                        color: const Color(0xFFFFFFFF),
                                        //width: AppDimensions.height10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
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
                width: AppDimensions.height10(context) * 41.8,
                height: AppDimensions.height10(context) * 10.0,
                decoration: const BoxDecoration(
                    color: Color(0xFF828282),
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFFFFFFF), width: 1))),
                child: Row(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.4,
                      height: AppDimensions.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 2.2),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/Ellipse 158.png'),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 18.6,
                      height: AppDimensions.height10(context) * 4.9,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 9.2,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Meditation',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 2.7,
                            child: Row(
                              children: [
                                Text('21',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF))),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.5),
                                  child: Text('/20 active days',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.0,
                                          fontWeight: FontWeight.w300,
                                          // fontFamily: 'Poppins',
                                          color: const Color(0xFFF6F6F6))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bt_switch
                        ? GestureDetector(
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      width: AppDimensions.height10(context) *
                                          27.0,
                                      height: AppDimensions.height10(context) *
                                          18.2,
                                      child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9,
                                              right:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.6,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Delete practice?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  23.8,
                                          child: Text(
                                            "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                            child: Container(
                              width: AppDimensions.height10(context) * 1.4,
                              height: AppDimensions.height10(context) * 1.6,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 10.6),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/bin.png'))),
                            ),
                          )
                        : Row(
                            children: [
                              Container(
                                  width: AppDimensions.height10(context) * 7.2,
                                  height: AppDimensions.height10(context) * 3.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: Center(
                                    child: Text(
                                      'Incomplete',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFFFFFF)),
                                    ),
                                  )),
                              Container(
                                  width: AppDimensions.height10(context) * 2.4,
                                  height:
                                      AppDimensions.height10(context) * 1.31,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      'assets/images/BTN Back.png',
                                      color: const Color(0xFFFFFFFF),
                                      //width: AppDimensions.height10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          )
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 13.4,
                height: AppDimensions.height10(context) * 13.2,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 5.5),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/circle_grey.png'))),
                child: Center(
                  child: Text(
                    'Add new\npractice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                          width: AppDimensions.height10(context) * 27.0,
                          height: AppDimensions.height10(context) * 24.6,
                          child: AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            actionsPadding: EdgeInsets.zero,
                            titlePadding: EdgeInsets.zero,
                            title: Container(
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.9,
                                  right: AppDimensions.height10(context) * 1.6,
                                  left: AppDimensions.height10(context) * 1.6,
                                  bottom:
                                      AppDimensions.height10(context) * 0.2),
                              height: AppDimensions.height10(context) * 4.4,
                              width: AppDimensions.height10(context) * 23.8,
                              child: Text(
                                "Are you sure you want\nto delete this goal?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            content: Container(
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.5,
                                  left: AppDimensions.height10(context) * 1.6,
                                  right: AppDimensions.height10(context) * 1.6),
                              height: AppDimensions.height10(context) * 6.4,
                              width: AppDimensions.height10(context) * 23.8,
                              child: Text(
                                "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this goal won't berecoverable. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.3,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 4.2,
                                    width: double.infinity,
                                    color: const Color(0xFF007AFF),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 4.4,
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF007AFF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 0.1,
                                    child: Divider(
                                      color: const Color(0XFF3C3C43)
                                          .withOpacity(0.29),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                child: Container(
                    width: AppDimensions.height10(context) * 31.3,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.0,
                        bottom: AppDimensions.height10(context) * 12.7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF464646),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: AppDimensions.height10(context) * 2.4,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 0.8),
                          child: Text(
                            'Delete Goal',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Arial'),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: AppDimensions.height10(context) * 12.0,
          width: AppDimensions.height10(context) * 41.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: AppDimensions.height10(context) * 17.4,
                height: AppDimensions.height10(context) * 4.3,
                margin: EdgeInsets.only(
                    left: AppDimensions.height10(context) * 2.6),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4/5 items',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF5B74A6)),
                      ),
                      Text(
                        'have been selected',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF5B74A6)),
                      ),
                    ],
                  ),
                ),
              ),
              widget.isActive
                  ? GestureDetector(
                      onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                                width: AppDimensions.height10(context) * 27.0,
                                height: AppDimensions.height10(context) * 18.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 1.4)),
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  actionsPadding: EdgeInsets.zero,
                                  titlePadding: EdgeInsets.zero,
                                  title: Container(
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.9,
                                        right: AppDimensions.height10(context) *
                                            1.6,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                0.2),
                                    height:
                                        AppDimensions.height10(context) * 2.2,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Text(
                                      "Turn off goal?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  content: Container(
                                    margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        right: AppDimensions.height10(context) *
                                            1.6),
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Text(
                                      "Are you sure you want to turn off the\ngoal? If you do, it will become inactive.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          child: Divider(
                                            color: const Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.2,
                                          width: double.infinity,
                                          color: const Color(0xFF007AFF),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          child: Divider(
                                            color: const Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.4,
                                          width: double.infinity,
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF007AFF)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.1,
                                          child: Divider(
                                            color: const Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                      child: Container(
                          width: AppDimensions.height10(context) * 9.1,
                          height: AppDimensions.height10(context) * 9.1,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10(context) * 3.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: Colors.white),
                            boxShadow: List.filled(
                                4,
                                const BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25))),
                            gradient: const LinearGradient(
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
                                width: AppDimensions.height10(context) * 2.0,
                                height: AppDimensions.height10(context) * 2.0,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 2.7),
                                color: const Color(0xFFFFFFFF),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 0.4),
                                child: Text(
                                  'Stop',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              )
                            ],
                          )),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const multiple_goal_inactive(
                                        isActive: true)));
                      },
                      child: Container(
                          width: AppDimensions.height10(context) * 9.1,
                          height: AppDimensions.height10(context) * 9.1,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10(context) * 3.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3, color: const Color(0xFFFFA511)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10(context) * 2.0,
                                height: AppDimensions.height10(context) * 2.0,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/start_icon.png'))),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 0.4),
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFA511)),
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

// class SwitchScreen extends StatefulWidget {
//   @override
//   SwitchClass createState() => new SwitchClass();
// }

// class SwitchClass extends State {
//   bool isSwitched = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           CustomSwitch(
//             value: isSwitched,
//             activeColor: Colors.blue,
//             onChanged: (value) {
//               print("VALUE : $value");
//               setState(() {
//                 isSwitched = value;
//               });
//             },
//           ),
//           SizedBox(
//             height: 15.0,
//           ),
//           Text(
//             'Value : $isSwitched',
//             style: TextStyle(color: Colors.red, fontSize: 25.0),
//           )
//         ]);
//   }
// }
