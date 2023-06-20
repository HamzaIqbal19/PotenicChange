import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/review_habits_dashboard/dashboard.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ActivateStar extends StatefulWidget {
  const ActivateStar({Key? key}) : super(key: key);

  @override
  State<ActivateStar> createState() => _ActivateStarState();
}

class _ActivateStarState extends State<ActivateStar> {
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
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Activatestarbg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.height10(context) * 8.9,
              ),
              Container(
                width: AppDimensions.height10(context) * 28.3,
                height: AppDimensions.height10(context) * 7.2,
                // padding: EdgeInsets.only(top: AppDimensions.height10(context) * 10),
                child: Center(
                  child: GradientText(
                    "Activate your star ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      // color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 3,
                    ),
                    colors: [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFFFFFFF).withOpacity(0.90),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.5,
              ),
              Container(
                  // color: Colors.black,
                  height: AppDimensions.height10(context) * 13.2,
                  width: AppDimensions.height10(context) * 35.7,
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            "I desire to grow and improve my identity. By activating my star, I will be able to evaluate my chosen practice every 20 active days and evaluate my active goal progress monthly. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: AppDimensions.height10(context) * 3.6,
              ),
              Stack(
                children: [
                  Container(
                    child: Image(
                      image: const AssetImage(
                          'assets/images/angerwithoutreview.png'),
                      height: AppDimensions.height10(context) * 38.1,
                      width: AppDimensions.height10(context) * 35.3,
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
                          0.01, AppDimensions.height10(context) * 0.016 + 0.9),
                      //heightFactor: 0.5,
                      child: Container(
                        // height: AppDimensions.height10(context) *17.5,
                        // width:  AppDimensions.height10(context) *17.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dashBoard(),
                              ),
                            );
                          },
                          child: Image(
                            image:
                                const AssetImage('assets/images/Asfinger.png'),
                            height: AppDimensions.height10(context) * 16.0,
                            width: AppDimensions.height10(context) * 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      // color: Colors.black,

                      height: AppDimensions.height10(context) * 5.4,
                      width: AppDimensions.height10(context) * 27.4,
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                "To begin your journey press and hold here.  ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
