// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:potenic_app/Screen/PracticeGoal/PracticeRoutine.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading2.dart';

class PracticeName extends StatefulWidget {
  final String title;
  final String Circletitle;
  final String pracId;
  // final String message;

  PracticeName(this.title, this.Circletitle, this.pracId);

  @override
  State<PracticeName> createState() => _PracticeNameState();
}

class _PracticeNameState extends State<PracticeName> {
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
                  'assets/images/Back.png',
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
                    'assets/images/Close.png',
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
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      "Practice Creation 2/3",
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
                      "Control my anger",
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
                          "assets/images/createprac.png",
                          fit: BoxFit.contain,
                        )),
                    Container(
                      child: Center(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF156F6D),
                            fontSize: AppDimensions.height10(context) * 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.6,
                ),
                Container(
                  child: Center(
                    child: Text(
                      widget.Circletitle,
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
                          color: const Color(0xFFFFFFFF)),
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
                    // top: AppDimensions.height10(context) * 2,
                    bottom: AppDimensions.height10(context) * 1.0,
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
                      decoration: InputDecoration(
                          counterText: "",
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          contentPadding: EdgeInsets.zero,
                          hintText: widget.title,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: Image.asset(
                          "assets/images/Moreactions.png",
                          fit: BoxFit.contain,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          FadePageRoute2(
                            exitPage: PracticeName('', '', ''),
                            enterPage: PracticeRoutine(
                              pracId: widget.pracId,
                              pracTitle: widget.title,
                            ),
                          ),
                        );
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
                            "Next",
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
