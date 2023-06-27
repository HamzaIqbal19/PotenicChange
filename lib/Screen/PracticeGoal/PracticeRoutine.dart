import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeReminder.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading2.dart';

class PracticeRoutine extends StatefulWidget {
  const PracticeRoutine({Key? key}) : super(key: key);

  @override
  State<PracticeRoutine> createState() => _PracticeRoutineState();
}

class _PracticeRoutineState extends State<PracticeRoutine> {
  bool buttonActive = false;
  int Count = 0;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var mygoal;
  var practiceName = "";

  @override
  void initState() {
    getGoalName();
    setState(() {
      count = 0;
    });
    super.initState();
  }

  getGoalName() async {
    print("hello world1224");
    final SharedPreferences prefs = await _prefs;
    var my_goal = prefs.getString("goalName");
    var practice_Name = prefs.getString('pracName');
    setState(() {
      mygoal = my_goal!;
      practiceName = practice_Name!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10(context) * 5.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Center(
              // alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3,
                  height: AppDimensions.height10(context) * 3,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
                  // Add code for performing close action
                },
              ),
            ),
            actions: [
              Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 3.0,
                    height: AppDimensions.height10(context) * 3.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeScreen(),
                    //   ),
                    // );
                    // Add code for performing close action
                  },
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.3),
                  child: Center(
                    child: Text(
                      "Practice Creation 3/3",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  child: Center(
                    child: Text(
                      mygoal,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.0,
                            right: AppDimensions.height10(context) * 1.0),
                        width: AppDimensions.height10(context) * 10.4,
                        height: AppDimensions.height10(context) * 11.2,
                        child: Image.asset(
                          "assets/images/createprac.webp",
                          fit: BoxFit.contain,
                        )),
                    Container(
                      child: Center(
                        child: Text(
                          practiceName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF156F6D),
                            fontSize: AppDimensions.height10(context) * 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.3,
                ),
                Container(
                  height: AppDimensions.height10(context) * 3.4,
                  width: AppDimensions.height10(context) * 36.4,
                  child: Center(
                    child: Text(
                      "Your routine commitment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) - 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: AppDimensions.height10(context) * 8.6,
                      width: AppDimensions.height10(context) * 37.2,
                      child: Center(
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text:
                                'It’s important to set a consistent routine that works for you. Please select time slots\n ',
                            style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'for 3 or more days.',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                  )),
                              // can add more TextSpans here...

                              // can add more TextSpans here...

                              // can add more TextSpans here...
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.1,
                ),
                Container(child: schedule(onCountChanged: (int count) {
                  setState(() {
                    Count = count;
                  });
                  print("Updated count: $count");
                })),
                SizedBox(
                  height: AppDimensions.height10(context) * 6.85,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedScaleButton(
                      onTap: () {
                        if (count >= 3) {
                          Navigator.pushReplacement(
                            context,
                            FadePageRoute2(
                              true,
                              exitPage: CreatePractice(),
                              enterPage: PracticeReminder(),
                            ),
                          );
                        } else {}
                        // print("successfull${widget.pracTitle}");
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),

                          gradient: count >= 3
                              ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                      Color(0xFFFCC10D),
                                      Color(0xFFFDA210)
                                    ])
                              : const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                      Color(0xFF828282),
                                      Color(0xFF828282)
                                    ]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                          child: Text(
                            "More than 2 days selected - Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 4.2,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
