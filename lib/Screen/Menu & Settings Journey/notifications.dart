import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/widgets/notificationBottomSheet.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/widgets/switchs.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import '../../Widgets/animatedButton.dart';
import '../../utils/app_dimensions.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {


  List notificationStatus = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List notificationTitles = [
    'Goal evaluation ',
    'Progress reports',
    'Motivational messages',
    'Hurdle reminders',
    'Inspiration reminders'
  ];
  List statements = [
    'None',
    '10 minutes',
    '20 minutes',
    '30 minutes',
    '1 hour'
  ];
  List missedPractices = [
    'None',
    '10 minutes',
    '20 minutes',
    '30 minutes',
    '1 hour'
  ];

  int selectedIndex = 0;
  int missedIndex = 0;

  getReminderStatus() {
    PracticeGoalApi.getUserReminder().then((value) {
      if (value != null) {
        setState(() {
          notificationStatus[0] = value['receiveNotification'];
          if (notificationStatus[0] != false) {
            notificationStatus[1] = value['beforePractice'];
            if (notificationStatus[1] != false) {
              selectedIndex = statements.indexOf(value['beforePracticeTime']);
            }

            notificationStatus[2] = value['missedPractice'];
            if (notificationStatus[2] != false) {
              missedIndex =
                  missedPractices.indexOf(value['missedPracticeTime']);
            }

            notificationStatus[3] = value['goalEvaluation'];
            notificationStatus[4] = value['progressReport'];
            notificationStatus[5] = value['motivationalMessages'];
            notificationStatus[6] = value['hurdleReminder'];
            notificationStatus[7] = value['inspirationReminder'];
            setState(() {

            });
          }
        });
      }
    });
  }

  setPreferences(index,val){
    if(index == 0){
      setUserReminder('goalEvaluation', val);
    }else if(index == 1){
      setUserReminder('progressReport', val);
    }else if(index == 2){
      setUserReminder('motivationalMessages', val);
    }else if(index == 3){
      setUserReminder('hurdleReminder', val);
    }else {
      setUserReminder('inspirationReminder', val);
    }

  }

  setUserReminder(name, reminder) {
    PracticeGoalApi().updateUserReminder(name, reminder);
  }

  @override
  void initState() {
    super.initState();
    getReminderStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Buttons().backButton(context, () {
          Navigator.pop(context);
        }),
        centerTitle: true,
        // title: SizedBox(
        //   width: AppDimensions.width10(context) * 17.0,
        //   height: AppDimensions.height10(context) * 4.8,
        //   child: Center(
        //     child: Text(
        //       'Notifications',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //           fontSize: AppDimensions.font10(context) * 1.8,
        //           fontWeight: FontWeight.w600,
        //           color: Colors.white),
        //     ),
        //   ),
        // ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: AppDimensions.width10(context) * 38.4,
          
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
                    color: Colors.white),
                child: Container(
                  width: AppDimensions.width10(context) * 33.4,
                  //height: AppDimensions.height10(context) * 6.0,
                  padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.width10(context) * 1.5,
                      horizontal: AppDimensions.width10(context) * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      notificationSwitch(context, 'Receive notifications', notificationStatus[0], (val) async {
                        setState(() {
                          notificationStatus[0] = val;
                          setUserReminder('receiveNotification', notificationStatus[0]);
                          if (val == false) {
                            notificationStatus[2] = val;
                            notificationStatus[2] = val;
                            notificationStatus[3] = val;
                            notificationStatus[4] = val;
                          }
                        });
                        // await checkNotificationPermission();
                      },),
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 38.4,
               // height: AppDimensions.height10(context) * 30.7,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 3.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        child: Text(
                          'Practice sessions',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 38.4,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.0),
                      padding:  EdgeInsets.symmetric(vertical: AppDimensions.width10(context) * 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: AppDimensions.width10(context) * 33.4,
                            height: AppDimensions.height10(context) * 6.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width:
                                            AppDimensions.width10(context) * 0.1,
                                        color: const Color(0xFF000000)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 24.7,
                                 // height: AppDimensions.height10(context) * 4.7,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //width: AppDimensions.width10(context) * 20.6,
                                        // height:
                                        //     AppDimensions.height10(context) * 1.9,
                                        child: Text(
                                          'Reminders before practice starts ',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.font10(context) *
                                                      1.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF5B74A6)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showBottomSheet(
                                              const Key('missed'),
                                              context,
                                              statements,
                                              selectedIndex, (value) {
                                            setState(() {
                                              selectedIndex = value;
                                            });
                                            setUserReminder(
                                              'beforePracticeTime',
                                              statements[selectedIndex]
                                                  .toString(),
                                            );
                                          });
                                        },
                                        child: Container(
                                          width: AppDimensions.width10(context) *
                                              20.6,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.6),
                                          child: Text(
                                            selectedIndex != 0
                                                ? "${statements[selectedIndex].toString()} before"
                                                : statements[selectedIndex]
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.6,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0XFF8C648A)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                switchWidget(context, notificationStatus[1], (val){
                                  setState(() {
                                    notificationStatus[1] = val;
                                    setUserReminder('beforePractice', notificationStatus[1]);
                                  });
                                }),
          
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: AppDimensions.width10(context) * 33.4,
                            height: AppDimensions.height10(context) * 6.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 24.7,
                                 // height: AppDimensions.height10(context) * 4.7,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //width: AppDimensions.width10(context) * 20.6,
                                        // height:
                                        //     AppDimensions.height10(context) * 1.9,
                                        child: Text(
                                          'For missed practices remind me',
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.font10(context) *
                                                      1.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0XFF5B74A6)),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _showBottomSheet(
                                              const Key('missed'),
                                              context,
                                              missedPractices,
                                              missedIndex, (value) {
                                            setState(() {
                                              missedIndex = value;
                                            });
                                            setUserReminder(
                                                'missedPracticeTime',
                                                missedPractices[missedIndex]
                                                    .toString());
                                          });
                                        },
                                        child: Container(
                                          width: AppDimensions.width10(context) *
                                              20.6,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.6),
                                          child: Text(
                                            missedIndex != 0
                                                ? "${missedPractices[missedIndex].toString()} after"
                                                : missedPractices[missedIndex]
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.6,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0XFF8C648A)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                switchWidget(context, notificationStatus[2], (val){
                                  setState(() {
                                    notificationStatus[2] = val;
                                    setUserReminder('missedPractice', notificationStatus[2]);
                                  });
                                }),
          
                              ],
                            ),
                          ),
          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 38.4,
                // height: AppDimensions.height10(context) * 30.7,
                margin:
                EdgeInsets.only(top: AppDimensions.height10(context) * 3.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        child: Text(
                          'Preferences',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 38.4,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.0),
                      padding:  EdgeInsets.symmetric(vertical: AppDimensions.width10(context) * 1.5, horizontal: AppDimensions.width10(context) * 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          color: Colors.white),
                      child: ListView.builder(padding: EdgeInsets.zero,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),itemCount: 5,itemBuilder: (context,index){
                        return Container(
                          width: AppDimensions.width10(context) * 33.4,
                          height: AppDimensions.height10(context) * 6.0,
                          decoration:index == 4?const BoxDecoration(): BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width:
                                      AppDimensions.width10(context) * 0.1,
                                      color: const Color(0xFF000000)))),
                          child: notificationSwitch(context, notificationTitles[index], notificationStatus[index+3], (val){
                            setState(() {
                              notificationStatus[index+3] = val;
                              setPreferences(index,val);
                             // setUserReminder('beforePractice', notificationStatus[1]);
                            });
                          }),
                        );
                      })
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


void _showBottomSheet(
    Key? key, BuildContext context, statements, selectedIndex, onCountChanged) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return MyBottomSheet(
        key: key,
        statments: statements,
        onCountChanged: (int value) {
          onCountChanged(value);
        },
        selectedIndex: selectedIndex,
      );
    },
  );
}
