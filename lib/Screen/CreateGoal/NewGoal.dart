import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class NewGoal extends StatefulWidget {
  const NewGoal({Key? key}) : super(key: key);

  @override
  State<NewGoal> createState() => _NewGoalState();
}

class _NewGoalState extends State<NewGoal> {
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

          // SingleChildScrollView(
          //   child: ,
          // )
          Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.2),
                child: Center(
                  child: Text(
                    "Star Creation 1/5",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 1.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 2.7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppDimensions.height10(context) * 3.6,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "All Goals ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: AppDimensions.height10(context) * 2.8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 1.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppDimensions.height10(context) * 3.6,
                  ),
                  Container(
                    // height: AppDimensions.height10(context) *7.1,
                    child: Text(
                      "Which category does your goal belong to? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.blue,
                height: AppDimensions.height10(context) * 65.795,
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimensions.height10(context) * 3.6,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.4),
                              child: circles(
                                  circle_text: '',
                                  circle_color1: 0xFFFC854F,
                                  circle_color2: 0xFFFAA960,
                                  circle_border: 1,
                                  circle_bordercolor: 0xFFFFFFFF,
                                  circle_height:
                                      AppDimensions.height10(context) * 2.5,
                                  circle_width:
                                      AppDimensions.height10(context) * 2.5,
                                  textfont: 0,
                                  textcolor: 0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10(context) * 1.24,
                            ),
                            Container(
                              // color: Colors.yellow,
                              height: AppDimensions.height10(context) * 2.4,
                              child: Text(
                                "Self Control ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.0,
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 41.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  circles(
                                      circle_text: "Anger Management ",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                  circles(
                                      circle_text: "Consume \n Less \n Drugs",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  circles(
                                      circle_text: "Eat More Healthy ",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                  circles(
                                      circle_text: "Consume \n Less \n Drugs",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  circles(
                                      circle_text: "Anger Management ",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                  circles(
                                      circle_text: "Consume \n Less \n Drugs",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimensions.height10(context) * 3.6,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.4),
                              child: circles(
                                  circle_text: '',
                                  circle_color1: 0xFFFC854F,
                                  circle_color2: 0xFFFAA960,
                                  circle_border: 1,
                                  circle_bordercolor: 0xFFFFFFFF,
                                  circle_height:
                                      AppDimensions.height10(context) * 2.5,
                                  circle_width:
                                      AppDimensions.height10(context) * 2.5,
                                  textfont: 0,
                                  textcolor: 0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10(context) * 1.24,
                            ),
                            Container(
                              // color: Colors.yellow,
                              height: AppDimensions.height10(context) * 2.4,
                              child: Text(
                                "Self Control ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.0,
                        ),
                        Container(
                          height: AppDimensions.height10(context) * 41.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  circles(
                                      circle_text: "Anger Management ",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                  circles(
                                      circle_text: "Consume \n Less \n Drugs",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  circles(
                                      circle_text: "Eat More Healthy ",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                  circles(
                                      circle_text: "Consume \n Less \n Drugs",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  circles(
                                      circle_text: "Anger Management ",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                  circles(
                                      circle_text: "Consume \n Less \n Drugs",
                                      circle_color1: 0xFFFFFFFF,
                                      circle_color2: 0xFFFFFFFF,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFEE8E6F,
                                      circle_height:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      circle_width:
                                          AppDimensions.height10(context) *
                                              13.4,
                                      textfont:
                                          AppDimensions.height10(context) * 1.6,
                                      textcolor: 0xFFFA9934),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
