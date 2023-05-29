import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';

import '../../utils/app_dimensions.dart';
import '../PracticeGoal/Create Practice.dart';
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
                width: AppDimensions.height10 * 27.8,
                height: AppDimensions.height10 * 3.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 11.0),
                child: Center(
                  child: Text(
                    'Control My Anger',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFFFFFF)),
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
                          color: const Color(0xFFFFFFFF)),
                    ),
                    widget.isActive
                        ? Text(
                            'Active',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF156F6D)),
                          )
                        : Text(
                            'Inactive',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFDE7A11)),
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
                      decoration: const BoxDecoration(
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
                                  height: AppDimensions.height10 * 0.15,
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF437296)),
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
                                        color: const Color(0xFF464646)),
                                  )
                                : Text(
                                    '0',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 2.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF464646)),
                                  ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 11.4,
                      height: AppDimensions.height10 * 11.4,
                      decoration: const BoxDecoration(
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
                                  color: const Color(0xFF437296)),
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
                                            color: const Color(0xFF464646)),
                                      )
                                    : Text(
                                        '-',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF464646)),
                                      ),
                                Text(
                                  '/5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.0,
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
                  width: AppDimensions.height10 * 37.2,
                  height: AppDimensions.height10 * 2.9,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.7),
                  child: Center(
                    child: Text(
                      'Assign up to 5 practices:',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 2.4,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  )),
              Container(
                width: AppDimensions.height10 * 41.8,
                height: AppDimensions.height10 * 10.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 1.7),
                decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
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
                                  color: const Color(0xFFFFFFFF)),
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
                                            color: const Color(0xFFFFFFFF)))
                                    : Text('0',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 2.0,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF))),
                                Text('/20 active days',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.0,
                                        fontWeight: FontWeight.w300,
                                        // fontFamily: 'Poppins',
                                        color: const Color(0xFFF6F6F6))),
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
                        activeColor: const Color(0xFFFA9934),
                        inactiveColor: const Color(0xFF2F3A4B),
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PracticeReview()));
                          },
                          child: Image.asset(
                            'assets/images/BTN Back.png',
                            color: widget.isActive
                                ? const Color(0xFF828282)
                                : const Color(0xFFFFFFFF),
                            //width: AppDimensions.height10 * 2.6,
                            //height: AppDimensions.height10 * 2.6,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatePractice()));
                },
                child: Container(
                  width: AppDimensions.height10 * 13.4,
                  height: AppDimensions.height10 * 13.4,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: AppDimensions.height10 * 0.3,
                          color: const Color(0xFFFFFFFF))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppDimensions.height10 * 2.9,
                      ),
                      Text(
                        'Add new\npractice',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: AppDimensions.height10 * 0.15,
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      Image.asset(
                        'assets/images/Addgoal.png',
                        width: AppDimensions.height10 * 2.3,
                        height: AppDimensions.height10 * 2.3,
                      )
                    ],
                  ),
                ),
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
                            color: const Color(0xFF5B74A6)),
                      ),
                      Text(
                        'have been selected',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
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
                                            color: const Color(0XFF3C3C43)
                                                .withOpacity(0.29),
                                          ),
                                        ),
                                        Container(
                                          height: AppDimensions.height10 * 4.2,
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
                                            color: const Color(0XFF3C3C43)
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
                                                  color:
                                                      const Color(0xFF007AFF)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppDimensions.height10 * 0.1,
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
                          width: AppDimensions.height10 * 9.1,
                          height: AppDimensions.height10 * 9.1,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 3.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3, color: Colors.white),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 2.0,
                                height: AppDimensions.height10 * 2.0,
                                color: const Color(0xFFFFFFFF),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 0.4),
                                child: Text(
                                  'Stop',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
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
                                    const goal_inactive(isActive: true)));
                      },
                      child: Container(
                          width: AppDimensions.height10 * 9.1,
                          height: AppDimensions.height10 * 9.1,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 3.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3, color: const Color(0xFFFFA511)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.height10 * 1.8,
                                height: AppDimensions.height10 * 2.7,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 0.6),
                                decoration: const BoxDecoration(
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
