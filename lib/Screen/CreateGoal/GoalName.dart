import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal-Why.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';

class GoalName extends StatefulWidget {
  const GoalName({Key? key}) : super(key: key);

  @override
  State<GoalName> createState() => _GoalNameState();
}

class _GoalNameState extends State<GoalName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10 * 5.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Center(
              // alignment: Alignment.center,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/Back.png',
                  width: AppDimensions.height10 * 3,
                  height: AppDimensions.height10 * 3,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    FadePageRoute(
                      page: const Categories(),
                    ),
                  );
                  // Add code for performing close action
                },
              ),
            ),
            actions: [
              Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 3.0,
                    height: AppDimensions.height10 * 3.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                      width: AppDimensions.height10 * 27.0,
                      height: AppDimensions.height10 * 21.0,
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        actionsPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 1.4)),
                        title: Container(
                          margin: EdgeInsets.only(
                              top: 19, right: 16, left: 16, bottom: 2),
                          // height: AppDimensions.height10 * 2.2,
                          width: AppDimensions.height10 * 23.8,
                          child: const Text(
                            "Exit onboarding?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        content: Container(
                          margin: EdgeInsets.only(
                              bottom: 19, left: 16, right: 16, top: 2),
                          height: 32,
                          width: 238,
                          child: const Text(
                            "Please select from the options below",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
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
                                      const Color(0XFF3C3C43).withOpacity(0.29),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: double.infinity,
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreenProgressSaved(
                                          log_status: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Exit & save progress',
                                    style: TextStyle(
                                        color: Color(0xFF007AFF),
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10 * 0.1,
                                child: Divider(
                                  color:
                                      const Color(0XFF3C3C43).withOpacity(0.29),
                                ),
                              ),
                              Container(
                                height: 44,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      FadePageRoute(
                                        page: const HomeScreen(
                                          log_status: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Exit & delete progress',
                                    style: TextStyle(
                                        fontSize: 17,
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
                                      const Color(0XFF3C3C43).withOpacity(0.29),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: AppDimensions.height10 * 27.0,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel exit',
                                    style: TextStyle(
                                        color: Color(0xFF007AFF),
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Add code for performing close action
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.png"),
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
                  padding: EdgeInsets.only(top: AppDimensions.height10 * 5.2),
                  child: Center(
                    child: Text(
                      "Star Creation 2/5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.5,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Control my anger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 1.9,
                ),
                Container(
                    // color: Colors.blue,
                    width: AppDimensions.height10 * 10.4,
                    height: AppDimensions.height10 * 7.6,
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10 * 1.5,
                        right: AppDimensions.height10 * 1.5),
                    child: Image.asset(
                      "assets/images/image3.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10 * 4.6,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Goal Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 1.0,
                ),
                Container(
                  height: AppDimensions.height10 * 2.2,
                  width: AppDimensions.height10 * 24.4,
                  child: Center(
                    child: Text(
                      "Enter the name of your goal ",
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 3.4,
                ),
                Container(
                  // height: AppDimensions.height10 * 10.5,
                  width: AppDimensions.height10 * 36.0,
                  // padding: EdgeInsets.only(
                  //     //  top: AppDimensions.height10 * 2,
                  //     // bottom: AppDimensions.height10 * 4.8,
                  //     left: AppDimensions.height10 * 0.0,
                  //     right: AppDimensions.height10 * 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppDimensions.height10 * 1.8))),
                  child: TextFormField(
                      // maxLength: 50,
                      maxLines: null,
                      minLines: null,

                      // expands: true,
                      // style: TextStyle(
                      //     fontSize: AppDimensions.height10 * 2.4,
                      //     fontWeight: FontWeight.w500,
                      //     color: const Color(0xFFFA9934)),
                      decoration: InputDecoration(
                          hintText: "Control my anger",
                          hintStyle: TextStyle(
                              fontSize: AppDimensions.height10 * 2.4,
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
                  height: AppDimensions.height10 * 0.5,
                ),
                Container(
                  // width: AppDimensions.height10*12.3,
                  width: AppDimensions.height10 * 34.7,
                  margin: EdgeInsets.only(right: AppDimensions.height10 * 1.3),

                  padding: EdgeInsets.only(
                      left: AppDimensions.height10 * 0.1,
                      right: AppDimensions.height10 * 20.1),
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
                            fontSize: AppDimensions.height10 * 1.4,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "50",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.1,
                ),
                Container(
                  height: AppDimensions.height10 * 4.2,
                  width: AppDimensions.height10 * 34.7,
                  margin: EdgeInsets.only(right: AppDimensions.height10 * 1.3),
                  child: Center(
                    child: Text(
                      "You can change the name of your practice later by going into your Dashboard.  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.6,
                      ),
                    ),
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10 * 26.3,
                      )
                    : SizedBox(
                        height: AppDimensions.height10 * 9.6,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10 * 5.0,
                        height: AppDimensions.height10 * 5.0,
                        child: GestureDetector(
                          onTap: () {
                            signupSheet(context, "Sign up / login", "login");
                          },
                          child: Image.asset(
                            "assets/images/Moreactions.png",
                            fit: BoxFit.contain,
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          FadePageRoute(
                            page: GoalWhy(),
                          ),
                        );
                      },
                      child: Container(
                        height: AppDimensions.height10 * 5,
                        width: AppDimensions.height10 * 31.3,
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
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10 * 2.5,
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
