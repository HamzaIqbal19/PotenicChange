import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../utils/app_dimensions.dart';
//import 'package:custom_switch/custom_switch.dart';

class goal_inactive extends StatefulWidget {
  final bool isActive;
  const goal_inactive({super.key, required this.isActive});

  @override
  State<goal_inactive> createState() => _goal_inactiveState();
}

class _goal_inactiveState extends State<goal_inactive> {
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
        actions: [
          Center(
            child: TextButton(
              onPressed: () {},
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
                            child: widget.isActive
                                ? Text(
                                    '10',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.8,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF464646)),
                                  )
                                : Text(
                                    '0',
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
                                widget.isActive
                                    ? Text(
                                        '1',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF464646)),
                                      )
                                    : Text(
                                        '-',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
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
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.7),
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
                                widget.isActive
                                    ? Text('10',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFFFFFFF)))
                                    : Text('0',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFFFFFFF))),
                                Text('/20 active days',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.0,
                                        fontWeight: FontWeight.w300,
                                        // fontFamily: 'Poppins',
                                        color: Color(0xFFF6F6F6))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: AppDimensions.height10 * 2.0),
                      child: FlutterSwitch(
                        width: AppDimensions.height10 * 6.2,
                        height: AppDimensions.height10 * 3.4,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        activeColor: Color(0xFFFA9934),
                        inactiveColor: Color(0xFF2F3A4B),
                        value: status4,
                        onToggle: (val) {
                          setState(() {
                            status4 = val;
                          });
                        },
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
                            color: widget.isActive
                                ? Color(0xFF828282)
                                : Color(0xFFFFFFFF),
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
                margin: EdgeInsets.only(top: AppDimensions.height10 * 5.0),
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
              GestureDetector(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                          width: AppDimensions.height10 * 27.0,
                          height: AppDimensions.height10 * 24.6,
                          child: AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            actionsPadding: EdgeInsets.zero,
                            titlePadding: EdgeInsets.zero,
                            title: Container(
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.9,
                                  right: AppDimensions.height10 * 1.6,
                                  left: AppDimensions.height10 * 1.6,
                                  bottom: AppDimensions.height10 * 0.2),
                              height: AppDimensions.height10 * 4.4,
                              width: AppDimensions.height10 * 23.8,
                              child: Text(
                                "Are you sure you want\nto delete this goal?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            content: Container(
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10 * 1.5,
                                  left: AppDimensions.height10 * 1.6,
                                  right: AppDimensions.height10 * 1.6),
                              height: AppDimensions.height10 * 6.4,
                              width: AppDimensions.height10 * 23.8,
                              child: Text(
                                "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this goal won't berecoverable. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.3,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color:
                                          Color(0XFF3C3C43).withOpacity(0.29),
                                    ),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 4.2,
                                    width: double.infinity,
                                    color: Color(0xFF007AFF),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color:
                                          Color(0XFF3C3C43).withOpacity(0.29),
                                    ),
                                  ),
                                  Container(
                                    height: AppDimensions.height10 * 4.4,
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF007AFF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimensions.height10 * 0.1,
                                    child: Divider(
                                      color:
                                          Color(0XFF3C3C43).withOpacity(0.29),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                child: Container(
                    width: AppDimensions.height10 * 31.3,
                    height: AppDimensions.height10 * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 3.0,
                        bottom: AppDimensions.height10 * 32.8),
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
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 0.8),
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
              ),
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
                        '1/5 items',
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
                  ? GestureDetector(
                      onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                                width: AppDimensions.height10 * 27.0,
                                height: AppDimensions.height10 * 18.2,
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  actionsPadding: EdgeInsets.zero,
                                  titlePadding: EdgeInsets.zero,
                                  title: Container(
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10 * 1.9,
                                        right: AppDimensions.height10 * 1.6,
                                        left: AppDimensions.height10 * 1.6,
                                        bottom: AppDimensions.height10 * 0.2),
                                    height: AppDimensions.height10 * 2.2,
                                    width: AppDimensions.height10 * 23.8,
                                    child: Text(
                                      "Turn off goal?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.7,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  content: Container(
                                    margin: EdgeInsets.only(
                                        bottom: AppDimensions.height10 * 1.5,
                                        left: AppDimensions.height10 * 1.6,
                                        right: AppDimensions.height10 * 1.6),
                                    height: AppDimensions.height10 * 3.4,
                                    width: AppDimensions.height10 * 23.8,
                                    child: Text(
                                      "Are you sure you want to turn off the\ngoal? If you do, it will become inactive.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: AppDimensions.height10 * 0.1,
                                          child: Divider(
                                            color: Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                        Container(
                                          height: AppDimensions.height10 * 4.2,
                                          width: double.infinity,
                                          color: Color(0xFF007AFF),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppDimensions.height10 * 0.1,
                                          child: Divider(
                                            color: Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                        Container(
                                          height: AppDimensions.height10 * 4.4,
                                          width: double.infinity,
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF007AFF)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppDimensions.height10 * 0.1,
                                          child: Divider(
                                            color: Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                      child: Container(
                          width: AppDimensions.height10 * 9.1,
                          height: AppDimensions.height10 * 9.1,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 3.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: Colors.white),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 2.0,
                                height: AppDimensions.height10 * 2.0,
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
                          )),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    goal_inactive(isActive: true)));
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
                                width: AppDimensions.height10 * 1.8,
                                height: AppDimensions.height10 * 2.7,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 0.6),
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
