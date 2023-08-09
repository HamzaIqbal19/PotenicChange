// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';

import 'package:potenic_app/Screen/PracticeGoal/PracticeRoutine.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Practice.dart';
import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';
import '../../Widgets/fading2.dart';
import '../HomeScreen/HomeScreen.dart';
import '../ReviewPractice/practiceReview.dart';

class PracticeName extends StatefulWidget {
  // final String message;

  final bool comingFromEditScreen;

  const PracticeName({super.key, required this.comingFromEditScreen});

  @override
  State<PracticeName> createState() => _PracticeNameState();
}

String capitalizeFirstLetter(String text) {
  if (text == null || text.isEmpty) {
    return '';
  }
  return text[0].toUpperCase() + text.substring(1);
}

class _PracticeNameState extends State<PracticeName> {
  var mygoal = TextEditingController();
  var practiceName = TextEditingController();
  var practice = TextEditingController();
  var color;

  @override
  void initState() {
    getGoalName();
    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getGoalName() async {
    print("hello world1224");
    final SharedPreferences prefs = await _prefs;
    var my_goal = prefs.getString("goalName");
    var practice_Name = prefs.getString('pracName');
    var goalColor = prefs.getString('goalColor');
    setState(() {
      color = goalColor;
      mygoal.text = my_goal!;
      practice.text = practice_Name!;
      practiceName.text = capitalizeFirstLetter(practice_Name);
    });
    print('=======================>$color');
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
                    Navigator.pushReplacement(
                      context,
                      FadePageRoute(
                        page: const HomeScreen(
                          login: true,
                        ),
                      ),
                    );
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.comingFromEditScreen
                    ? AssetImage("assets/images/GoalReviewBg.webp")
                    : AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      widget.comingFromEditScreen
                          ? "View and edit mode"
                          : "Practice Creation 2/3",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  width: AppDimensions.height10(context) * 30,
                  child: Center(
                    child: Text(
                      mygoal.text.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
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
                      width: AppDimensions.height10(context) * 7.9,
                      height: AppDimensions.height10(context) * 7.9,
                      // color: Colors.amber,

                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-3, 0),
                            child: Container(
                              width: AppDimensions.height10(context) * 7.9,
                              height: AppDimensions.height10(context) * 7.9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(color == '1'
                                        ? "assets/images/red_gradient.webp"
                                        : color == '2'
                                            ? 'assets/images/orange_moon.webp'
                                            : color == '3'
                                                ? "assets/images/lightGrey_gradient.webp"
                                                : color == '4'
                                                    ? "assets/images/lightBlue_gradient.webp"
                                                    : color == '5'
                                                        ? "assets/images/medBlue_gradient.webp"
                                                        : color == '6'
                                                            ? "assets/images/Blue_gradient.webp"
                                                            : 'assets/images/orange_moon.webp'),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1.5, 0),
                            child: Container(
                              height: AppDimensions.height10(context) * 4.9,
                              width: AppDimensions.height10(context) * 4.9,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse 158_wb.webp'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        //width: AppDimensions.height10(context) * 22,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.5),
                        child: practice.text.toString().length > 20
                            ? Text(
                                capitalizeFirstLetter(
                                  practice.text.substring(0, 19) + '...',
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: widget.comingFromEditScreen
                                      ? Color(0xff437296)
                                      : Color(0xFF156F6D),
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              )
                            : Text(
                                capitalizeFirstLetter(
                                  practice.text.toString(),
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF156F6D),
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              )),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 7.1,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Practice Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: widget.comingFromEditScreen
                            ? Color(0xff437296)
                            : Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.8,
                ),
                Container(
                  height: AppDimensions.height10(context) * 2.2,
                  width: AppDimensions.height10(context) * 28.4,
                  child: Center(
                    child: Text(
                      "Enter the name of your practice",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                          color: widget.comingFromEditScreen
                              ? Color(0xff437296)
                              : Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.3,
                ),
                Container(
                  height: AppDimensions.height10(context) * 10.5,
                  width: AppDimensions.height10(context) * 36.0,
                  padding: EdgeInsets.only(
                    left: AppDimensions.height10(context) * 2.0,
                    top: AppDimensions.height10(context) * 1.0,
                    right: AppDimensions.height10(context) * 0.5,
                    bottom: AppDimensions.height10(context) * 0.5,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(
                          AppDimensions.height10(context) * 1.8))),
                  child: TextFormField(
                      maxLines: null,
                      minLines: null,
                      maxLength: 80,
                      controller: practiceName,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.4,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFA9934)),
                      decoration: InputDecoration(
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          contentPadding: EdgeInsets.zero,
                          // hintText: "${practice.text.toString()}",
                          hintStyle: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.4,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFA9934)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)))),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  // width: AppDimensions.height10(context)*12.3,
                  width: AppDimensions.height10(context) * 34.7,

                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 1.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Character count:",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.4,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "80",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.1,
                ),
                Container(
                  height: AppDimensions.height10(context) * 4.2,
                  width: AppDimensions.height10(context) * 34.7,
                  margin: EdgeInsets.only(
                      right: AppDimensions.height10(context) * 1.3),
                  child: Center(
                    child: Text(
                      "You can change the name of your practice later by going into your Dashboard.  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.6,
                      ),
                    ),
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 26.3,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 11.2,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // widget.comingFromEditScreen
                    //       ? Container(
                    //           width: AppDimensions.height10(context) * 10.0,
                    //           height: AppDimensions.height10(context) * 5.0,
                    //           decoration: myTextFields[0]['text'] != ""
                    //               ? BoxDecoration(
                    //                   color: Colors.white,
                    //                   border:
                    //                       Border.all(color: Color(0xffFA9934)),
                    //                   borderRadius: const BorderRadius.all(
                    //                       Radius.circular(50.0)),
                    //                 )
                    //               : BoxDecoration(
                    //                   // color: Color(0xFFFF7D50),
                    //                   border: Border.all(
                    //                       color: const Color(0xff282828)),
                    //                   color: Colors.transparent,
                    //                   borderRadius: const BorderRadius.all(
                    //                       Radius.circular(50.0)),
                    //                 ),
                    //           child: AnimatedScaleButton(
                    //             onTap: () {
                    //               //   signupSheet(context, "Sign up / login", "login");
                    //             },
                    //             child: Center(
                    //                 child: Text(
                    //               "Reset",
                    //               style: TextStyle(
                    //                   fontFamily: "Laila",
                    //                   fontWeight: FontWeight.w600,
                    //                   color: myTextFields[0]['text'] != ""
                    //                       ? Color(0xffFA9934)
                    //                       : Color(0xff282828),
                    //                   fontSize:
                    //                       AppDimensions.height10(context) * 1.8),
                    //             )),
                    //           ))
                    //       :

                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: Image.asset(
                          "assets/images/Moreactions.webp",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      width: AppDimensions.height10(context) * 2.0,
                    ),

                    AnimatedScaleButton(
                      onTap: () async {
                        print("updating the practice $practiceName");
                        if (widget.comingFromEditScreen) {
                          final SharedPreferences prefs = await _prefs;
                          var goal_Name = prefs.setString(
                              'pracName', practiceName.text.toString());
                          PracticeGoalApi()
                              .updateUserPractice('name', practiceName.text)
                              .then((value) {
                            if (value == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PracticeReview(),
                                  ));
                            }
                          });
                        } else {
                          if (practiceName.text != '') {
                            final SharedPreferences prefs = await _prefs;
                            var goal_Name = prefs.setString(
                                'pracName', practiceName.text.toString());
                            Navigator.push(
                              context,
                              FadePageRoute2(
                                true,
                                exitPage: PracticeName(
                                  comingFromEditScreen: false,
                                ),
                                enterPage: PracticeRoutine(),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                          child: Text(
                            widget.comingFromEditScreen ? "Save" : "Next",
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
                  height: AppDimensions.height10(context) * 2.5,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )
        ],
      ),
    );
  }
}
