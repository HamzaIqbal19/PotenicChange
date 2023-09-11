import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../PracticeGoal/Create Practice.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class multiple_goal_inactive extends StatefulWidget {
  const multiple_goal_inactive({
    super.key,
  });

  @override
  State<multiple_goal_inactive> createState() => _multiple_goal_inactiveState();
}

class _multiple_goal_inactiveState extends State<multiple_goal_inactive> {
  // bool status = false;

  // bool color = true;
  int totalItemsOn = 0;
  bool bt_switch = false;
  String subscriptions = '';
  bool update = false;

  bool Loader = true;
  var goalDetails;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void onToggleSwitch(int index1, bool val) {
    setState(() {
      print('================Val========$val');
      // if (totalItemsOn < 5) {
      if (goalDetails['userPractices'][index1]['isActive'] == true &&
          val == false) {
        // Check if the totalItemsOn is less than 5 before incrementing
        if (totalItemsOn < 5) {
          print("==========================");
          // print(goalDetails['userPractices'][index1]['id']);

          showAnimatedDialog(
              animationType: DialogTransitionType.fadeScale,
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 1),
              context: context,
              builder: (BuildContext context) => Container(
                    width: AppDimensions.height10(context) * 27.0,
                    height: AppDimensions.height10(context) * 18.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.4)),
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 1.4)),
                      contentPadding: EdgeInsets.zero,
                      actionsPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.zero,
                      title: Container(
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.9,
                            right: AppDimensions.height10(context) * 1.6,
                            left: AppDimensions.height10(context) * 1.6,
                            bottom: AppDimensions.height10(context) * 0.2),
                        height: AppDimensions.height10(context) * 2.2,
                        width: AppDimensions.height10(context) * 23.8,
                        child: Text(
                          "Turn off practice?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.7,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      content: Container(
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 1.5,
                            left: AppDimensions.height10(context) * 1.6,
                            right: AppDimensions.height10(context) * 1.6),
                        height: AppDimensions.height10(context) * 3.4,
                        width: AppDimensions.height10(context) * 23.8,
                        child: Text(
                          "Are you sure you want to turn off the\npractice? If you do, it will become inactive.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              height: AppDimensions.height10(context) * 0.1,
                              child: Divider(
                                color:
                                    const Color(0XFF3C3C43).withOpacity(0.29),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10(context) * 4.2,
                              width: double.infinity,
                              color: const Color(0xFF007AFF),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontFamily: "Laila",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 0.1,
                              child: Divider(
                                color:
                                    const Color(0XFF3C3C43).withOpacity(0.29),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 4.4,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  // setState(() {
                                  //   Loader = true;
                                  // });
                                  PracticeGoalApi()
                                      .updateUserPracticeStatus(
                                          'inactive',
                                          goalDetails['userPractices'][index1]
                                              ['id'])
                                      .then((response) {
                                    print(goalDetails['userPractices'][index1]
                                        ['name']);
                                    if (response == true) {
                                      Navigator.pop(context);
                                      _fetchGoalDetails();
                                      print("Status Updated");
                                    }
                                  });
                                  totalItemsOn++;
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.7,
                                      fontFamily: "Laila",
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF007AFF)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimensions.height10(context) * 0.1,
                              child: Divider(
                                color:
                                    const Color(0XFF3C3C43).withOpacity(0.29),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));

          print(
              totalItemsOn); // Increment the counter as the item is being switched on
        } else {
          print(totalItemsOn);

          // If totalItemsOn is already 5, prevent switching on the toggle
          return;
        }
      }
      // If the item is currently on and is being switched off
      else if (goalDetails['userPractices'][index1]['isActive'] == false &&
          val == true) {
        print("==========================");
        // print(goalDetails['userPractices'][index1]['id']);

        // setState(() {
        //   Loader = true;
        // });
        PracticeGoalApi()
            .updateUserPracticeStatus(
                'active', goalDetails['userPractices'][index1]['id'])
            .then((response) {
          print(goalDetails['userPractices'][index1]['name']);
          if (response == true) {
            totalItemsOn--;
            _fetchGoalDetails();
            print("Status Updated");
          } else if (response == 400) {
            showAnimatedDialog(
                animationType: DialogTransitionType.fadeScale,
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                context: context,
                builder: (BuildContext context) => Container(
                      width: AppDimensions.height10(context) * 27.0,
                      height: AppDimensions.height10(context) * 23.6,
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 1.4)),
                        contentPadding: EdgeInsets.zero,
                        actionsPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        title: Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.9,
                                bottom: AppDimensions.height10(context) * 0.2),
                            height: AppDimensions.height10(context) * 4.4,
                            width: AppDimensions.height10(context) * 23.8,
                            child: Center(
                              child: Text(
                                'Maximum active practice limit\nreached',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.7,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                        content: Container(
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.5,
                              left: AppDimensions.height10(context) * 1.6,
                              right: AppDimensions.height10(context) * 1.6),
                          width: AppDimensions.height10(context) * 23.8,
                          child: Text(
                            subscriptions == 'inactive'
                                ? "You can't activate a new practice for\nthis goal because you already have\nreached the maximum number of 3\nactive practices. You must stop one of\nyour active practices to start a new one."
                                : "You can't activate a new practice for\nthis goal because you already have\nreached the maximum number of 5\nactive practices. You must stop one of\nyour active practices to start a new one.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          Column(
                            children: [
                              SizedBox(
                                height: AppDimensions.height10(context) * 0.1,
                                child: Divider(
                                  color:
                                      const Color(0XFF3C3C43).withOpacity(0.29),
                                ),
                              ),
                              Container(
                                height: AppDimensions.height10(context) * 4.4,
                                width: double.infinity,
                                color: const Color(0xFF007AFF),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 0.1,
                                child: Divider(
                                  color:
                                      const Color(0XFF3C3C43).withOpacity(0.29),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 4.4,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
          }
        });
        // goalDetails['userPractices'][index1]['status'] = val;
        print(
            totalItemsOn); // Decrement the counter as the item is being switched off
      }
      goalDetails['userPractices'][index1]['practiceStatus'] = val;
    });
  }

  Future<void> _fetchGoalDetails() async {
    final SharedPreferences prefs = await _prefs;

    AdminGoal.getUserGoalById(prefs.get('goal_num')).then((response) {
      print(response);
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
          totalItemsOn = response["activePracticesCount"];
          subscriptions = response['subscriptionsStatus'];
        });
        print(response['subscriptionsStatus']);
        // print("FunctionCalled");
        // totalActivePractices();
        // print(goalDetails = response[1]);
        // print(
        //     "==========================${goalDetails['userPractices'][0]['practiceStatus']}");
        loadData();
        print(response);
      } else {
        loadData();
      }
    }).catchError((error) {
      // loadData();
      print("error");
    }).whenComplete(() {
      loadData();
    });
  }

  void totalActivePractices() {
    for (int i = 0; i >= goalDetails['userPractices'].length; i++) {
      if (goalDetails['userPractices'][i]['isActive'] == true) {
        setState(() {
          totalItemsOn = totalItemsOn + 1;
        });
      } else if (goalDetails['userPractices'][i]['isActive'] == false) {
        print(totalItemsOn);
      }
      print(totalItemsOn);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalDetails();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRoute(
                page: const goal_menu_inactive(
                    isActive: false, goal_evaluation: false)));
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page: const goal_menu_inactive(
                        isActive: false,
                        goal_evaluation: false,
                      )));
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
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
                                color:
                                    const Color(0xFFFFFFFF).withOpacity(0.5)),
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
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 30.8,
                        // color: Colors.amber,
                        height: AppDimensions.height10(context) * 3.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 11.0),
                        child: Center(
                          child: Text(
                            goalDetails['name'],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
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
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Status: ',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                            Text(
                              capitalizeFirstLetter(goalDetails['goalStatus']),
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  fontWeight: FontWeight.w700,
                                  color: goalDetails['goalStatus'] == "active"
                                      ? const Color(0xFF156F6D)
                                      : const Color(0xFFDE7A11)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 26.8,
                        height: AppDimensions.height10(context) * 11.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 11.4,
                              height: AppDimensions.height10(context) * 11.4,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFDFBE0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 9.3,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    child: Text(
                                      'No. of\nActive days',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF437296)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 6.3,
                                    height:
                                        AppDimensions.height10(context) * 3.3,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            0.8),
                                    child: Text(
                                      goalDetails['goalTotalActiveDays']
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.8,
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
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFDFBE0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 9.3,
                                    height:
                                        AppDimensions.height10(context) * 3.4,
                                    child: Text(
                                      'Goal\nLevel',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF437296)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 6.3,
                                    height:
                                        AppDimensions.height10(context) * 3.3,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            0.8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          goalDetails['goalLevel'] == 0
                                              ? '-'
                                              : goalDetails['goalLevel']
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.0,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF464646)),
                                        ),
                                        Text(
                                          '/5',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.0,
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
                              subscriptions == 'inactive'
                                  ? 'Assign up to 3 practices:'
                                  : 'Assign up to 5 practices:',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.4,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.7),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        )),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: goalDetails['userPractices'].length,
                            itemBuilder: ((context, index) {
                              bool status = goalDetails['userPractices'][index]
                                          ['practiceStatus'] ==
                                      'active'
                                  ? true
                                  : false;
                              bool color = status;
                              return Container(
                                //  width: AppDimensions.height10(context) * 41.8,
                                height: AppDimensions.height10(context) * 10.0,

                                decoration: BoxDecoration(
                                    color: color
                                        ? Colors.transparent
                                        : const Color(0xFF828282),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: Color(0xFFFFFFFF),
                                            width: 1))),
                                child: Row(
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.height10(context) * 5.4,
                                      height:
                                          AppDimensions.height10(context) * 5.4,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              color: const Color(0xFFFBFBFB)),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(goalDetails['userPractices']
                                                        [index]['color'] ==
                                                    '1'
                                                ? "assets/images/Ellipse orange_wb.webp"
                                                : goalDetails['userPractices']
                                                            [index]['color'] ==
                                                        '2'
                                                    ? 'assets/images/Ellipse 158_wb.webp'
                                                    : goalDetails['userPractices']
                                                                    [index]
                                                                ['color'] ==
                                                            '3'
                                                        ? "assets/images/Ellipse 157_wb.webp"
                                                        : goalDetails['userPractices']
                                                                        [index]
                                                                    ['color'] ==
                                                                '4'
                                                            ? "assets/images/Ellipse light-blue_wb.webp"
                                                            : goalDetails['userPractices']
                                                                            [index]
                                                                        ['color'] ==
                                                                    '5'
                                                                ? "assets/images/Ellipse blue_wb.webp"
                                                                : 'assets/images/Ellipse 158_wb.webp'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Container(
                                      width: AppDimensions.height10(context) *
                                          18.6,
                                      height:
                                          AppDimensions.height10(context) * 4.9,
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  0.8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            // width: AppDimensions.height10(context) *
                                            //     9.2,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.2,
                                            child: Text(
                                              goalDetails['userPractices']
                                                  [index]['name'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.7,
                                            child: Row(
                                              children: [
                                                Text('21',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFFFBFBFB))),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.4),
                                                  child: Text('/20 active days',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.3,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          // fontFamily: 'Poppins',
                                                          color: const Color(
                                                              0xFFF6F6F6))),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    bt_switch
                                        ? AnimatedScaleButton(
                                            onTap: () => showAnimatedDialog(
                                                animationType:
                                                    DialogTransitionType
                                                        .fadeScale,
                                                curve: Curves.easeInOut,
                                                duration:
                                                    const Duration(seconds: 1),
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    showDeleteAlert(
                                                        context,
                                                        goalDetails[
                                                                'userPractices']
                                                            [index]['id'])),
                                            child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      10.6),
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/bin.webp'))),
                                            ),
                                          )
                                        : SizedBox(
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.0),
                                                  child: FlutterSwitch(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            6.2,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            3.4,
                                                    valueFontSize: 12.0,
                                                    toggleSize: 18.0,
                                                    activeColor:
                                                        const Color(0xFFFA9934),
                                                    inactiveColor:
                                                        const Color(0xFF2F3A4B),
                                                    value: goalDetails[
                                                                'userPractices']
                                                            [index]['isActive']
                                                        ? true
                                                        : false,
                                                    onToggle: (val) {
                                                      print(
                                                          "Toggle value $val");
                                                      onToggleSwitch(
                                                          index, val);
                                                    }, // Call the onToggleSwitch function
                                                  ),
                                                ),
                                                Container(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.4,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.31,
                                                    margin: EdgeInsets.only(
                                                        left: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Image.asset(
                                                        'assets/images/BTN Back.webp',
                                                        color: const Color(
                                                            0xFFFFFFFF),
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
                              );
                            })),
                      ),
                      AnimatedScaleButton(
                        onTap: () async {
                          final SharedPreferences prefs = await _prefs;
                          var goalName =
                              prefs.setString('goalName', goalDetails['name']);
                          var goalId =
                              prefs.setInt('goal_num', goalDetails['id']);
                          var route =
                              prefs.setString('goal_route', 'view_all_goals_2');
                          Navigator.push(context,
                              FadePageRoute(page: const CreatePractice()));
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 13.4,
                          height: AppDimensions.height10(context) * 13.4,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 5.0,
                              bottom: AppDimensions.height10(context) * 38.9),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.3,
                                  color: const Color(0xFFFFFFFF))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                // width: AppDimensions.height10(context) * 5.8,
                                height: AppDimensions.height10(context) * 5.8,
                                child: Center(
                                  child: Text(
                                    'Add new\npractice',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.15,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/images/Addgoal.webp',
                                width: AppDimensions.height10(context) * 2.3,
                                height: AppDimensions.height10(context) * 2.3,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Loader == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    update
                        ? updateBox(
                            headText: 'Goal Actice',
                            bodyText: '${goalDetails['name']}',
                            onTap1: () {
                              showAnimatedDialog(
                                  animationType: DialogTransitionType.fadeScale,
                                  curve: Curves.easeInOut,
                                  duration: const Duration(seconds: 1),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return goalActive(context);
                                  });
                            },
                            functionText: 'Undo',
                            edit: false)
                        //  Container(
                        //     width: AppDimensions.height10(context) * 38.259,
                        //     height: AppDimensions.height10(context) * 9.707,
                        //     margin: EdgeInsets.symmetric(
                        //         horizontal:
                        //             AppDimensions.height10(context) * 1.6,
                        //         vertical:
                        //             AppDimensions.height10(context) * 2.0),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(
                        //             AppDimensions.height10(context) * 2.0),
                        //         gradient: const LinearGradient(
                        //             begin: Alignment.topCenter,
                        //             end: Alignment.bottomCenter,
                        //             colors: [
                        //               Color(0xFFD4B7B9),
                        //               Color(0xFF91698C)
                        //             ])),
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Container(
                        //           margin: EdgeInsets.only(
                        //               left: AppDimensions.height10(context) *
                        //                   1.261),
                        //           width:
                        //               AppDimensions.height10(context) * 4.437,
                        //           height:
                        //               AppDimensions.height10(context) * 4.437,
                        //           decoration: const BoxDecoration(
                        //               image: DecorationImage(
                        //                   image: AssetImage(
                        //                       'assets/images/circle_tick.webp'))),
                        //         ),
                        //         Container(
                        //           //width: AppDimensions.height10(context) * 6.9,
                        //           height: AppDimensions.height10(context) * 3.6,
                        //           margin: EdgeInsets.only(
                        //               left: AppDimensions.height10(context) *
                        //                   1.232),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               SizedBox(
                        //                 //width: AppDimensions.height10(context) * 4.2,
                        //                 height:
                        //                     AppDimensions.height10(context) *
                        //                         1.4,
                        //                 child: Text(
                        //                   'Goal Active',
                        //                   style: TextStyle(
                        //                       fontSize: AppDimensions.height10(
                        //                               context) *
                        //                           1.3,
                        //                       fontWeight: FontWeight.w500,
                        //                       color: const Color(0xFFFFFFFF)),
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: AppDimensions.height10(context) *
                        //                     18.0,
                        //                 height:
                        //                     AppDimensions.height10(context) *
                        //                         2.2,
                        //                 child: Text(
                        //                   goalDetails['name'],
                        //                   overflow: TextOverflow.ellipsis,
                        //                   style: TextStyle(
                        //                       fontSize: AppDimensions.height10(
                        //                               context) *
                        //                           1.8,
                        //                       fontWeight: FontWeight.w500,
                        //                       color: const Color(0xFFFFFFFF)),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         AnimatedScaleButton(
                        //           onTap: () {
                        //             showAnimatedDialog(
                        //                 animationType:
                        //                     DialogTransitionType.fadeScale,
                        //                 curve: Curves.easeInOut,
                        //                 duration: const Duration(seconds: 1),
                        //                 context: context,
                        //                 builder: (BuildContext context) {
                        //                   return goalActive(context);
                        //                 });
                        //           },
                        //           child: Container(
                        //             width:
                        //                 AppDimensions.height10(context) * 8.1,
                        //             height:
                        //                 AppDimensions.height10(context) * 6.0,
                        //             margin: EdgeInsets.only(
                        //                 left: AppDimensions.height10(context) *
                        //                     4.5),
                        //             decoration: BoxDecoration(
                        //               border: Border.all(
                        //                   color: const Color(0xFFFFFFFF),
                        //                   width: 1),
                        //               borderRadius: BorderRadius.circular(
                        //                   AppDimensions.height10(context) *
                        //                       2.0),
                        //             ),
                        //             child: Center(
                        //               child: Text(
                        //                 'Undo',
                        //                 style: TextStyle(
                        //                     fontSize: AppDimensions.height10(
                        //                             context) *
                        //                         1.8,
                        //                     fontWeight: FontWeight.w500,
                        //                     color: const Color(0xFFFFFFFF)),
                        //               ),
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   )

                        : Container(),
                    Container(
                      color: const Color(0xFFFBFBFB),
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
                                    subscriptions == 'inactive'
                                        ? '$totalItemsOn/3 items'
                                        : '$totalItemsOn/5 items',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF5B74A6)),
                                  ),
                                  Text(
                                    'have been selected',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF5B74A6)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          goalDetails['isActive']
                              ? AnimatedScaleButton(
                                  onTap: () => showAnimatedDialog(
                                      animationType:
                                          DialogTransitionType.fadeScale,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(seconds: 1),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                27.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                18.2,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4)),
                                            child: AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
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
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6,
                                                    bottom:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.2),
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.2,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    23.8,
                                                child: Text(
                                                  "Turn off goal?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
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
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.6),
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                width: AppDimensions.height10(
                                                        context) *
                                                    23.8,
                                                child: Text(
                                                  "Are you sure you want to turn off the\ngoal? If you do, it will become inactive.",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
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
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      child: Divider(
                                                        color: const Color(
                                                                0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.2,
                                                      width: double.infinity,
                                                      color: const Color(
                                                          0xFF007AFF),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xFFFFFFFF),
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.7,
                                                              fontFamily:
                                                                  "Laila",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      child: Divider(
                                                        color: const Color(
                                                                0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          4.4,
                                                      width: double.infinity,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          AdminGoal()
                                                              .updateUserGoalStatus(
                                                                  'inactive')
                                                              .then((response) {
                                                            if (response ==
                                                                true) {
                                                              print(
                                                                  "Goal Inactive");
                                                              setState(() {
                                                                Loader = true;
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                              _fetchGoalDetails();
                                                            } else if (response ==
                                                                400) {
                                                              Navigator.pop(
                                                                  context);
                                                              showAnimatedDialog(
                                                                  animationType:
                                                                      DialogTransitionType
                                                                          .fadeScale,
                                                                  curve: Curves
                                                                      .easeInOut,
                                                                  duration:
                                                                      const Duration(
                                                                          seconds:
                                                                              1),
                                                                  context:
                                                                      context,
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      Container(
                                                                        width: AppDimensions.height10(context) *
                                                                            27.0,
                                                                        height: AppDimensions.height10(context) *
                                                                            18.2,
                                                                        decoration:
                                                                            BoxDecoration(borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
                                                                        child:
                                                                            AlertDialog(
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          actionsPadding:
                                                                              EdgeInsets.zero,
                                                                          titlePadding:
                                                                              EdgeInsets.zero,
                                                                          title:
                                                                              Container(
                                                                            margin: EdgeInsets.only(
                                                                                top: AppDimensions.height10(context) * 1.9,
                                                                                right: AppDimensions.height10(context) * 1.6,
                                                                                left: AppDimensions.height10(context) * 1.6,
                                                                                bottom: AppDimensions.height10(context) * 0.2),
                                                                            height:
                                                                                AppDimensions.height10(context) * 2.2,
                                                                            width:
                                                                                AppDimensions.height10(context) * 23.8,
                                                                            child:
                                                                                Text(
                                                                              "Turn off goal?",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                fontSize: AppDimensions.height10(context) * 1.7,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          content:
                                                                              Container(
                                                                            margin: EdgeInsets.only(
                                                                                bottom: AppDimensions.height10(context) * 1.5,
                                                                                left: AppDimensions.height10(context) * 1.6,
                                                                                right: AppDimensions.height10(context) * 1.6),
                                                                            height:
                                                                                AppDimensions.height10(context) * 3.4,
                                                                            width:
                                                                                AppDimensions.height10(context) * 23.8,
                                                                            child:
                                                                                Text(
                                                                              "Goal status can only be changed after 60 days",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                fontSize: AppDimensions.height10(context) * 1.3,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          actions: <
                                                                              Widget>[
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: AppDimensions.height10(context) * 0.1,
                                                                                  child: Divider(
                                                                                    color: const Color(0XFF3C3C43).withOpacity(0.29),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: AppDimensions.height10(context) * 4.2,
                                                                                  width: double.infinity,
                                                                                  color: const Color(0xFF007AFF),
                                                                                  child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'OK',
                                                                                      style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: AppDimensions.height10(context) * 1.7, fontFamily: "Laila", fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: AppDimensions.height10(context) * 0.1,
                                                                                  child: Divider(
                                                                                    color: const Color(0XFF3C3C43).withOpacity(0.29),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: AppDimensions.height10(context) * 4.4,
                                                                                  width: double.infinity,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ));
                                                            }
                                                          });
                                                        },
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.7,
                                                              fontFamily:
                                                                  "Laila",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xFF007AFF)),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.1,
                                                      child: Divider(
                                                        color: const Color(
                                                                0XFF3C3C43)
                                                            .withOpacity(0.29),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                  child: Container(
                                      width:
                                          AppDimensions.height10(context) * 9.1,
                                      height:
                                          AppDimensions.height10(context) * 9.1,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  3.3),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3, color: Colors.white),
                                        boxShadow: List.filled(
                                            4,
                                            const BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.25))),
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
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    2.7),
                                            color: const Color(0xFFFFFFFF),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    0.4),
                                            child: Text(
                                              'Stop',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          )
                                        ],
                                      )),
                                )
                              : AnimatedScaleButton(
                                  onTap: () {
                                    AdminGoal()
                                        .updateUserGoalStatus('active')
                                        .then((response) {
                                      if (response == true) {
                                        setState(() {
                                          Loader = true;
                                          update = true;
                                        });
                                        _fetchGoalDetails();
                                      } else if (response == 400) {
                                        showAnimatedDialog(
                                            animationType:
                                                DialogTransitionType.fadeScale,
                                            curve: Curves.easeInOut,
                                            duration:
                                                const Duration(seconds: 1),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return goalActive(context);
                                            });
                                      }
                                    });
                                  },
                                  child: Container(
                                      width:
                                          AppDimensions.height10(context) * 9.1,
                                      height:
                                          AppDimensions.height10(context) * 9.1,
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  3.3),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 3,
                                            color: const Color(0xFFFFA511)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/start_icon.webp'))),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    0.4),
                                            child: Text(
                                              'Start',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFA511)),
                                            ),
                                          )
                                        ],
                                      )),
                                )
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
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

Widget goalActive(BuildContext context) {
  return Container(
    width: AppDimensions.height10(context) * 27.0,
    height: AppDimensions.height10(context) * 23.6,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
          margin: EdgeInsets.only(
              top: AppDimensions.height10(context) * 1.9,
              bottom: AppDimensions.height10(context) * 0.2),
          height: AppDimensions.height10(context) * 4.4,
          width: AppDimensions.height10(context) * 23.8,
          child: Center(
            child: Text(
              'Maximum active goal limit\nreached',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.height10(context) * 1.7,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
      content: Container(
        margin: EdgeInsets.only(
            bottom: AppDimensions.height10(context) * 1.5,
            left: AppDimensions.height10(context) * 1.6,
            right: AppDimensions.height10(context) * 1.6),
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "You can't start this goal because you\nalready have the maximum  active\ngoals. You must stop one of your active\goals to start a new one.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.3,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            Container(
              height: AppDimensions.height10(context) * 4.4,
              width: double.infinity,
              color: const Color(0xFF007AFF),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.7,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 4.4,
              width: double.infinity,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget showDeleteAlert(BuildContext context, id) {
  return SizedBox(
    width: AppDimensions.height10(context) * 27.0,
    height: AppDimensions.height10(context) * 18.2,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        margin: EdgeInsets.only(
            top: AppDimensions.height10(context) * 1.9,
            right: AppDimensions.height10(context) * 1.6,
            left: AppDimensions.height10(context) * 1.6,
            bottom: AppDimensions.height10(context) * 0.2),
        height: AppDimensions.height10(context) * 2.2,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Delete practice?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      content: Container(
        margin: EdgeInsets.only(
            bottom: AppDimensions.height10(context) * 1.5,
            left: AppDimensions.height10(context) * 1.6,
            right: AppDimensions.height10(context) * 1.6),
        height: AppDimensions.height10(context) * 4.8,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Are you sure you want to delete your\nlast practice? If you do so, your data will\nbe lost.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.3,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            Container(
              height: AppDimensions.height10(context) * 4.2,
              width: double.infinity,
              color: const Color(0xFF007AFF),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'No',
                    style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: AppDimensions.height10(context) * 1.7,
                        fontFamily: "Laila",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 4.4,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  PracticeGoalApi().deleteUserPracticeById(id).then((response) {
                    if (response == true) {
                      print("Practice deleted");
                      Navigator.push(context,
                          FadePageRoute(page: const multiple_goal_inactive()));
                    }
                  });
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.7,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF007AFF)),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
