import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../utils/app_dimensions.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  bool status = true;
  bool status1 = true;
  bool status2 = true;
  bool status3 = true;
  bool status4 = true;
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
                width: AppDimensions.height10 * 2.6,
                height: AppDimensions.height10 * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        centerTitle: true,
        title: SizedBox(
          width: AppDimensions.height10 * 17.0,
          height: AppDimensions.height10 * 4.8,
          child: Center(
            child: Text(
              'Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.height10 * 1.8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: AppDimensions.height10 * 36.7,
              height: AppDimensions.height10 * 6.9,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 15.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  color: Colors.white),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: AppDimensions.height10 * 33.4,
                  height: AppDimensions.height10 * 6.0,
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: AppDimensions.height10 * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        //width: AppDimensions.height10 * 20.6,
                        height: AppDimensions.height10 * 1.9,
                        child: Text(
                          'Receive notifications',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF5B74A6)),
                        ),
                      ),
                      FlutterSwitch(
                        width: AppDimensions.height10 * 5.1,
                        height: AppDimensions.height10 * 3.1,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        activeColor: const Color(0xFF34C759),
                        inactiveColor: const Color(0xFF2F3A4B),
                        value: status,
                        onToggle: (val) {
                          setState(() {
                            status1 = val;
                            status = val;
                            status2 = val;
                            status3 = val;
                            status4 = val;
                            // color3 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 37.4,
              height: AppDimensions.height10 * 30.7,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: AppDimensions.height10 * 11.4,
                      height: AppDimensions.height10 * 2.4,
                      child: Text(
                        'Preferences',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.0,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFFFBFBFB)),
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 37.4,
                    height: AppDimensions.height10 * 27.3,
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 6.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xFF000000)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 24.7,
                                  height: AppDimensions.height10 * 4.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //width: AppDimensions.height10 * 20.6,
                                        height: AppDimensions.height10 * 1.9,
                                        child: Text(
                                          'Reminders before practice starts ',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF5B74A6)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showBottomSheet(context);
                                        },
                                        child: Container(
                                          width: AppDimensions.height10 * 20.6,
                                          height: AppDimensions.height10 * 2.2,
                                          margin: EdgeInsets.only(
                                              top:
                                                  AppDimensions.height10 * 0.6),
                                          child: Text(
                                            '10 minutes before',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.6,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0XFF8C648A)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                FlutterSwitch(
                                  width: AppDimensions.height10 * 5.1,
                                  height: AppDimensions.height10 * 3.1,
                                  valueFontSize: 12.0,
                                  toggleSize: 18.0,
                                  activeColor: const Color(0xFF34C759),
                                  inactiveColor: const Color(0xFF2F3A4B),
                                  value: status1,
                                  onToggle: (val) {
                                    setState(() {
                                      status1 = val;
                                      // color3 = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 6.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xFF000000)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 24.7,
                                  height: AppDimensions.height10 * 4.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //width: AppDimensions.height10 * 20.6,
                                        height: AppDimensions.height10 * 1.9,
                                        child: Text(
                                          'For missed practices remind me',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF5B74A6)),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10 * 20.6,
                                        height: AppDimensions.height10 * 2.2,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10 * 0.6),
                                        child: Text(
                                          '1 hour after',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF8C648A)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                FlutterSwitch(
                                  width: AppDimensions.height10 * 5.1,
                                  height: AppDimensions.height10 * 3.1,
                                  valueFontSize: 12.0,
                                  toggleSize: 18.0,
                                  activeColor: const Color(0xFF34C759),
                                  inactiveColor: const Color(0xFF2F3A4B),
                                  value: status2,
                                  onToggle: (val) {
                                    setState(() {
                                      status2 = val;
                                      // color3 = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 7.3,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10 * 0.1,
                                        color: const Color(0xFF000000)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 24.7,
                                  height: AppDimensions.height10 * 4.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        //width: AppDimensions.height10 * 20.6,
                                        height: AppDimensions.height10 * 3.8,
                                        child: Text(
                                          'Check-ins and missed practice\nsessions',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF5B74A6)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FlutterSwitch(
                                  width: AppDimensions.height10 * 5.1,
                                  height: AppDimensions.height10 * 3.1,
                                  valueFontSize: 12.0,
                                  toggleSize: 18.0,
                                  activeColor: const Color(0xFF34C759),
                                  inactiveColor: const Color(0xFF2F3A4B),
                                  value: status3,
                                  onToggle: (val) {
                                    setState(() {
                                      status3 = val;
                                      // color3 = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: AppDimensions.height10 * 33.4,
                            height: AppDimensions.height10 * 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 24.7,
                                  height: AppDimensions.height10 * 4.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        //width: AppDimensions.height10 * 20.6,
                                        height: AppDimensions.height10 * 1.9,
                                        child: Text(
                                          'Progress Reports  ',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF5B74A6)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FlutterSwitch(
                                  width: AppDimensions.height10 * 5.1,
                                  height: AppDimensions.height10 * 3.1,
                                  valueFontSize: 12.0,
                                  toggleSize: 18.0,
                                  activeColor: const Color(0xFF34C759),
                                  inactiveColor: const Color(0xFF2F3A4B),
                                  value: status4,
                                  onToggle: (val) {
                                    setState(() {
                                      status4 = val;
                                      // color3 = val;
                                    });
                                  },
                                ),
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
              width: AppDimensions.height10 * 17.0,
              height: AppDimensions.height10 * 0.5,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 32.5),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 5.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return MyBottomSheet();
    },
  ).then((value) {
    if (value != null) {
      // Do something with the selected statement
      print(value);
    }
  });
}

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;
  final List<String> _statements = [
    'None',
    '10 minutes before',
    '20 minutes before',
    '30 minutes before',
    '1hour before',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10 * 23.8,
      color: const Color(0xFF282828), // Set the height of the bottom sheet
      child: Column(
        children: [
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 20,
              magnification: 1.1,
              useMagnifier: true,
              overAndUnderCenterOpacity:
                  0.8, // Set the height of each statement
              children: _statements
                  .map((statement) => Text(statement,
                      style: TextStyle(
                        color: const Color(0xFFFBFBFB),
                        fontSize: AppDimensions.height10 * 2.2,
                        fontWeight: FontWeight.w400,
                      )))
                  .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                  //activity_duration = _statements[_selectedIndex];
                  // _selected_activity = _statements[_selectedIndex];
                });
              },
            ),
          ),
          SizedBox(height: AppDimensions.height10 * 0.1),
        ],
      ),
    );
  }
}
