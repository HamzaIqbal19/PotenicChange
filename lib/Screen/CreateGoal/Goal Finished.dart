import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading2.dart';

class GoalFinished extends StatefulWidget {
  const GoalFinished({Key? key}) : super(key: key);

  @override
  State<GoalFinished> createState() => _GoalFinishedState();
}

class _GoalFinishedState extends State<GoalFinished> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
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
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/finalGoal.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 10),
                child: Center(
                  child: GradientText(
                    "Star Created!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      // color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3,
                    ),
                    colors: const [
                      Color(0xFFFA9934),
                      Color(0xFFEDD15E),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.0,
              ),
              Container(
                  // color: Colors.black,
                  height: AppDimensions.height10(context) * 21.8,
                  width: AppDimensions.height10(context) * 34.0,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "You’ve created your first personal \n development goal and have taken the initial \n key steps towards self-fulfilment. \n \n Now, let’s create a practice to help you \n achieve this goal. You’ll be able to assess \n  how effective it’s been for you and if it’s not  working, you can change it to another \n practice. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: "LaiLa",
                              fontSize: AppDimensions.height10(context) * 1.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadePageRoute2(
                          true,
                          exitPage: GoalFinished(),
                          enterPage: const StarReview(),
                        ),
                      );
                    },
                    child: Container(
                      child: Image(
                        image: const AssetImage('assets/images/anger.webp'),
                        height: AppDimensions.height10(context) * 38.1,
                        width: AppDimensions.height10(context) * 35.3,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      // alignment: Alignment.bottomCenter,
                      alignment: Alignment(
                          0.01, AppDimensions.height10(context) * 0.015 + 1),
                      //heightFactor: 0.5,
                      child: Container(
                        height: AppDimensions.height10(context) * 17.5,
                        width: AppDimensions.height10(context) * 17.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              FadePageRoute2(
                                true,
                                exitPage: GoalFinished(),
                                enterPage: const CreatePractice(),
                              ),
                            );
                          },
                          child: Image(
                            image:
                                const AssetImage('assets/images/practice.webp'),
                            height: AppDimensions.height10(context) * 17.5,
                            width: AppDimensions.height10(context) * 17.5,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 6.16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppDimensions.height10(context) * 1.6,
                  ),
                  Container(
                      // color: Colors.blue,
                      width: AppDimensions.height10(context) * 5.0,
                      height: AppDimensions.height10(context) * 5.0,
                      child: Image.asset(
                        "assets/images/Moreactions.webp",
                        fit: BoxFit.contain,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
