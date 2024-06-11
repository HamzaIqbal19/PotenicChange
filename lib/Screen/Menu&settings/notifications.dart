import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import '../../Widgets/animatedButton.dart';
import '../../utils/app_dimensions.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  bool status = false;
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  List statements = ['None', '10 minutes', '20 minutes','30 minutes','1 hour'];
  List missedPractices = ['None', '10 minutes', '20 minutes','30 minutes','1 hour'];

  int selectedIndex = 0 ;
  int missedIndex = 0;
  

getReminderStatus(){
  PracticeGoalApi.getUserReminder().then((value){
    print("Reminder status: $value" );
    if(value!=null){
 setState(() {

      status= value['receiveNotification'];
      if(status!=false){
      status1= value['beforePractice'];
      if(status1!=false){
        selectedIndex = statements.indexOf(value['beforePracticeTime']);
      }


      
      status2= value['missedPractice'];
      if(status2!=false){
        missedIndex = missedPractices.indexOf(value['missedPracticeTime']);
      }
      
      status3= status2;
      status4= value['progressReport'];
      }
      
    });
    }
   
  } );
}

setUserReminder(name, reminder){
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
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                //width: AppDimensions.width10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.contain,
              )),
        ),
        centerTitle: true,
        title: SizedBox(
          width: AppDimensions.width10(context) * 17.0,
          height: AppDimensions.height10(context) * 4.8,
          child: Center(
            child: Text(
              'Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 1.8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: AppDimensions.width10(context) * 36.7,
              height: AppDimensions.height10(context) * 6.9,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: Colors.white),
              child: Container(
                width: AppDimensions.width10(context) * 33.4,
                height: AppDimensions.height10(context) * 6.0,
                padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: AppDimensions.width10(context) * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      //width: AppDimensions.width10(context) * 20.6,
                      height: AppDimensions.height10(context) * 1.9,
                      child: Text(
                        'Receive notifications',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF5B74A6)),
                      ),
                    ),
                    FlutterSwitch(
                      width: AppDimensions.width10(context) * 5.1,
                      height: AppDimensions.height10(context) * 3.1,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: const Color(0xFF34C759),
                      inactiveColor: const Color(0xFF2F3A4B),
                      value: status,
                      onToggle: (val) async{
                        setState(() {
                          status = val;
                          setUserReminder('receiveNotification', status);
                          if(val == false){
                          status1 = val;
                          status2 = val;
                          status3 = val;
                          status4 = val;
                          }
                         
                          // color3 = val;
                        });
                      // await checkNotificationPermission();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: AppDimensions.width10(context) * 37.4,
              height: AppDimensions.height10(context) * 30.7,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 3.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: AppDimensions.width10(context) * 11.4,
                      height: AppDimensions.height10(context) * 2.4,
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
                    width: AppDimensions.width10(context) * 37.4,
                    height: AppDimensions.height10(context) * 27.3,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.width10(context) * 33.4,
                          height: AppDimensions.height10(context) * 6.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: AppDimensions.width10(context) *
                                          0.1,
                                      color: const Color(0xFF000000)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 24.7,
                                height: AppDimensions.height10(context) * 4.7,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      //width: AppDimensions.width10(context) * 20.6,
                                      height:
                                          AppDimensions.height10(context) *
                                              1.9,
                                      child: Text(
                                        'Reminders before practice starts ',
                                        style: TextStyle(
                                            fontSize: AppDimensions.font10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showBottomSheet(const Key('missed'),context,statements, selectedIndex, (value){
                                          setState(() {
                                            selectedIndex = value;
                                          });
                                            setUserReminder('beforePracticeTime', statements[selectedIndex].toString(),);
                                        });
                                      },
                                      child: Container(
                                        width:
                                            AppDimensions.width10(context) *
                                                20.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.6),
                                        child: Text(
                                        selectedIndex!=0?"${statements[selectedIndex].toString()} before":  statements[selectedIndex].toString(),
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
                              FlutterSwitch(
                                width: AppDimensions.width10(context) * 5.1,
                                height: AppDimensions.height10(context) * 3.1,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                activeColor: const Color(0xFF34C759),
                                inactiveColor: const Color(0xFF2F3A4B),
                                value: status1,
                                onToggle: (val) {
                                  setState(() {
                                    status1 = val;
                                    setUserReminder('beforePractice', status1);
                                    // color3 = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 33.4,
                          height: AppDimensions.height10(context) * 6.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: AppDimensions.width10(context) *
                                          0.1,
                                      color: const Color(0xFF000000)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 24.7,
                                height: AppDimensions.height10(context) * 4.7,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      //width: AppDimensions.width10(context) * 20.6,
                                      height:
                                          AppDimensions.height10(context) *
                                              1.9,
                                      child: Text(
                                        'For missed practices remind me',
                                        style: TextStyle(
                                            fontSize: AppDimensions.font10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        _showBottomSheet(const Key('missed'),context, missedPractices, missedIndex, (value){
                                        setState(() {
                                          missedIndex = value;
                                        });
                                        setUserReminder('missedPracticeTime', missedPractices[missedIndex].toString());
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
                                       missedIndex!=0?"${missedPractices[missedIndex].toString()} after":  missedPractices[missedIndex].toString(),
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
                              FlutterSwitch(
                                width: AppDimensions.width10(context) * 5.1,
                                height: AppDimensions.height10(context) * 3.1,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                activeColor: const Color(0xFF34C759),
                                inactiveColor: const Color(0xFF2F3A4B),
                                value: status2,
                                onToggle: (val) {
                                  setState(() {
                                    status2 = val;
                                     setUserReminder('missedPractice', status2);
                                    // color3 = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 33.4,
                          height: AppDimensions.height10(context) * 7.3,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: AppDimensions.width10(context) *
                                          0.1,
                                      color: const Color(0xFF000000)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 24.7,
                                height: AppDimensions.height10(context) * 4.7,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      //width: AppDimensions.width10(context) * 20.6,
                                      height:
                                          AppDimensions.height10(context) *
                                              3.8,
                                      child: Text(
                                        'Check-ins and missed practice\nsessions',
                                        style: TextStyle(
                                            fontSize: AppDimensions.font10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FlutterSwitch(
                                width: AppDimensions.width10(context) * 5.1,
                                height: AppDimensions.height10(context) * 3.1,
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
                        SizedBox(
                          width: AppDimensions.width10(context) * 33.4,
                          height: AppDimensions.height10(context) * 5.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 24.7,
                                height: AppDimensions.height10(context) * 4.7,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      //width: AppDimensions.width10(context) * 20.6,
                                      height:
                                          AppDimensions.height10(context) *
                                              1.9,
                                      child: Text(
                                        'Progress Reports  ',
                                        style: TextStyle(
                                            fontSize: AppDimensions.font10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF5B74A6)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FlutterSwitch(
                                width: AppDimensions.width10(context) * 5.1,
                                height: AppDimensions.height10(context) * 3.1,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                activeColor: const Color(0xFF34C759),
                                inactiveColor: const Color(0xFF2F3A4B),
                                value: status4,
                                onToggle: (val) {
                                  setState(() {
                                    status4 = val;
                                    setUserReminder('progressReport', status4);
                                    // color3 = val;
                                  });
                                },
                              ),
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
              width: AppDimensions.width10(context) * 17.0,
              height: AppDimensions.height10(context) * 0.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 32.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 5.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(Key? key,BuildContext context, statements, selectedIndex,  onCountChanged) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return MyBottomSheet(key: key, statments: statements, onCountChanged: (int value) { 
        onCountChanged(value);
       }, selectedIndex: selectedIndex,);
    },
  );
}

class MyBottomSheet extends StatefulWidget {
  List statments;
  int selectedIndex;
  final ValueChanged<int> onCountChanged;
   MyBottomSheet({Key? key,required this.statments, required this.selectedIndex, required this.onCountChanged}):super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  
  
int _selectedIndex =0;

@override
void initState() {
  super.initState();
  setState(() {
     _selectedIndex = widget.selectedIndex;
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 33.3,
      color: const Color(0xFFFBFBFB), // Set the height of the bottom sheet
      child: Column(
        children: [
           Container(
            padding: EdgeInsets.only(
                left: AppDimensions.width10(context) * 1.0,
                right: AppDimensions.width10(context) * 1.9,
                top: AppDimensions.height10(context) * 1.2),
            width: AppDimensions.width10(context) * 41.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedScaleButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    // width: AppDimensions.width10(context) * 5.0,
                    height: AppDimensions.width10(context) * 3.1,
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.9,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFF2F80ED)),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                AnimatedScaleButton(
                  onTap: () {
                    widget.onCountChanged(_selectedIndex);
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    //width: AppDimensions.width10(context) * 2.9,
                    height: AppDimensions.width10(context) * 3.1,
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.9,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFF2F80ED)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFF828282)),
          
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 26,
              magnification: 1.2,
              useMagnifier: true,
              overAndUnderCenterOpacity:
                  0.6, // Set the height of each statement
              children: widget.statments
                  .map((statement) => Text(statement,
                      style: TextStyle(
                        color: const Color(0xFF282828),
                        fontSize: AppDimensions.font10(context) * 2.4,
                        fontWeight: FontWeight.w400,
                      )))
                  .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: AppDimensions.height10(context) * 0.1),
        ],
      ),
    );
  }
}
