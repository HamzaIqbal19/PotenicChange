import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/ReviewPractice/Activateyourstar.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Recording Practice Session/dashboardViewgoals.dart';

class PracticeFinished extends StatefulWidget {
  const PracticeFinished({Key? key}) : super(key: key);

  @override
  State<PracticeFinished> createState() => _PracticeFinishedState();
}

class _PracticeFinishedState extends State<PracticeFinished> {
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
              'assets/images/Back.png',
              width: AppDimensions.height10 * 3,
              height: AppDimensions.height10 * 3,
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
                width: AppDimensions.height10 * 3.0,
                height: AppDimensions.height10 * 3.0,
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
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
                image: AssetImage("assets/images/practicebackground.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.height10 * 8.9,
              ),
              Container(
                width: AppDimensions.height10 * 20.7,
                height: AppDimensions.height10 * 7.2,
                // padding: EdgeInsets.only(top: AppDimensions.height10 * 10),
                child: Center(
                  child: GradientText(
                    "Star & planet created! ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      // color: Colors.white,
                      fontSize: AppDimensions.height10 * 3,
                    ),
                    colors: [
                      const Color(0xFFFA9934),
                      const Color(0xFFEDD15E).withOpacity(0.90),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 2.2,
              ),
              Container(
                  // color: Colors.black,
                  height: AppDimensions.height10 * 5.1,
                  width: AppDimensions.height10 * 34.0,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "Please review and continue ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 2.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: AppDimensions.height10 * 5.7,
              ),
              Stack(
                children: [
                  Container(
                    child: Image(
                      image: const AssetImage('assets/images/anger.png'),
                      height: AppDimensions.height10 * 38.1,
                      width: AppDimensions.height10 * 35.3,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Align(
                      // alignment: Alignment.bottomCenter,

                      alignment: Alignment(0.49,AppDimensions.height10*0.016+1.4),
                      //heightFactor: 0.5,
                      child: Container(
                        // height: AppDimensions.height10*17.5,
                        // width:  AppDimensions.height10*17.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PracticeReview(),
                              ),
                            );
                          },
                          child: Image(
                            image: const AssetImage('assets/images/practicefinal.png'),
                            height: AppDimensions.height10*1.5 * 14.7,
                            width: AppDimensions.height10*1.5 * 14.7,

                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppDimensions.height10 * 13.7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      // color: Colors.blue,
                      width: AppDimensions.height10 * 5.0,
                      height: AppDimensions.height10 * 5.0,
                      child: Image.asset(
                        "assets/images/Moreactions.png",
                        fit: BoxFit.contain,
                      )),
                  GestureDetector(
                onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivateStar(),
                        )
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
            ],
          )
        ],
      ),
    );
  }
}
