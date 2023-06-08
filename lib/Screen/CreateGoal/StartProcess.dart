import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_constants.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class StartProcess extends StatefulWidget {
  const StartProcess({Key? key}) : super(key: key);

  @override
  State<StartProcess> createState() => _StartProcessState();
}

class _StartProcessState extends State<StartProcess> {
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
        automaticallyImplyLeading: false,
        actions: [
          Center(
            // alignment: Alignment.center,

            child: IconButton(
              icon: Image.asset(
                'assets/images/Close.png',
                width: AppDimensions.height10 * 2.8,
                height: AppDimensions.height10 * 2.8,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                Navigator.pop(context);
                // Add code for performing close action
              },
            ),
          ),
          SizedBox(
            width: AppDimensions.width10,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/CreateGoal.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: AppDimensions.height10 * 5.7),
                child: Center(
                  child: GradientText(
                    "Goal Setting",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      // color: Colors.white,
                      fontSize: AppDimensions.height10 * 3,
                    ),
                    colors: const [
                      Color(0xFFFA9934),
                      Color(0xFFEDD15E),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 3.4,
              ),
              Container(
                  // color: Colors.black,
                  height: AppDimensions.height10 * 7.4,
                  width: AppDimensions.height10 * 36.6,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "Step 1: ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 2.4,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Create your ‘star’ (goal) ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 2.4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Center(
                child: Image(
                  image: const AssetImage('assets/images/image1.png'),
                  height: AppDimensions.height10 * 6.5,
                  width: AppDimensions.height10 * 6.5,
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 1.1,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Create a personal development goal based \n on your vision and why to help you with \n purpose and stay focused. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 2.7,
              ),
              Center(
                child: Image(
                  image: const AssetImage('assets/images/Line.png'),
                  // height: AppDimensions.height10 * 6.5,
                  width: AppDimensions.height10 * 6.5,
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 2.3,
              ),
              Container(
                  // color: Colors.black,
                  height: AppDimensions.height10 * 8.3,
                  width: AppDimensions.height10 * 36.6,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "Step 2: ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 2.4,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Assign your ‘planet’ (practice)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 2.4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Center(
                child: Image(
                  image: const AssetImage('assets/images/image2.png'),
                  height: AppDimensions.height10 * 4,
                  width: AppDimensions.height10 * 4,
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 1.3,
              ),
              Container(
                height: AppDimensions.height10 * 8.6,
                child: Center(
                  child: Text(
                    "Decide on a tool / practice you’ll be using \n and set your routine (you need to do this 3 \n or more times a week) ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 3.5,
              ),
              Container(
                height: AppDimensions.height10 * 5.6,
                child: Center(
                  child: Text(
                    "In 25 mins and less you’ll be on your \n way towards more clarity. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.9,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 1.7,
              ),
              Container(
                height: AppDimensions.height10 * 5,
                width: AppDimensions.height10 * 25.4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFCC10D), Color(0xFFFDA210)])),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        page: Categories(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Start your jouney',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.9,
                    ),
                  ),
                ),
              ),
              Container(
                height: AppDimensions.height10 * 5.6,
                child: Center(
                  child: Text(
                    "You can save and exit at any time. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.6,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
