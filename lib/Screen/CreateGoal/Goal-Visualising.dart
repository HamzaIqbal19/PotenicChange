import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal%20Finished.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';

class Visualising extends StatefulWidget {
  const Visualising({Key? key}) : super(key: key);

  @override
  State<Visualising> createState() => _VisualisingState();
}

class _VisualisingState extends State<Visualising> {
  int times = 2;

  void increment() {
    times = times + 1;
  }

  bool focus = false;
  late inner_text InnerText;
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
                  Navigator.pop(context, true);
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
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      "Star Creation 5/5",
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
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                    // color: Colors.blue,
                    width: AppDimensions.height10(context) * 10.4,
                    height: AppDimensions.height10(context) * 7.6,
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.height10(context) * 1.5),
                    child: Image.asset(
                      "assets/images/image3.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Visualising Your New Self",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  // height: AppDimensions.height10(context) * 4.9,
                  width: AppDimensions.height10(context) * 37.2,
                  child: Center(
                    child: Text(
                      "What does it look like? What are you \n  doing? What emotions do you have and \n how does it feel?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  width: AppDimensions.height10(context) * 38.2,
                  height: AppDimensions.height10(context) * 33.0,
                  child: Stack(children: [
                    Container(
                        width: AppDimensions.height10(context) * 38.2,
                        height: AppDimensions.height10(context) * 33.0,
                        padding: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 1.1,
                            right: AppDimensions.height10(context) * 1.1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white,
                                width: AppDimensions.height10(context) * 0.2),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppDimensions.height10(context) * 1.8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SizedBox(
                                height: AppDimensions.height10(context) * 31.0,
                                width: AppDimensions.height10(context) * 36.2,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      for (int i = 1; i <= times; i++) ...[
                                        Column(
                                          children: <Widget>[
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    focus == true;
                                                  });
                                                },
                                                child: inner_text(
                                                  keys: '$i',
                                                  head_text:
                                                      '$i. I picture myself....',
                                                  body_text: '',
                                                  delete: false,
                                                  length: 150,
                                                  onChanged: (String value) {},
                                                )),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.4,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: AppDimensions.height10(
                                                          context) *
                                                      2.0,
                                                  right: AppDimensions.height10(
                                                          context) *
                                                      13.6),
                                              child: Row(
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      "Character count: ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF464646),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.3,
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "200",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xFF464646),
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.3,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.9,
                                            ),
                                          ],
                                        )
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        //alignment: Alignment.bottomCenter,
                        alignment: const Alignment(0.01, 1.155),
                        //heightFactor: 0.5,
                        child: Container(
                          height: AppDimensions.height10(context) * 4.7,
                          width: AppDimensions.height10(context) * 4.7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFB1B8FF), Color(0xFFC5CAFF)]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4, left: 4, right: 4, bottom: 4),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    increment();
                                    print(times);
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'assets/images/Addgoal.png',
                                    height:
                                        AppDimensions.height10(context) * 4.7,
                                    width:
                                        AppDimensions.height10(context) * 4.7,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 12.2,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 5.0,
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
                        Navigator.pushReplacement(
                          context,
                          FadePageRoute(
                            page: const GoalFinished(),
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
