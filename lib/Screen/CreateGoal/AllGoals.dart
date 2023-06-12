import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class AllGoals extends StatefulWidget {
  const AllGoals({Key? key}) : super(key: key);

  @override
  State<AllGoals> createState() => _AllGoalsState();
}

class _AllGoalsState extends State<AllGoals> {
  bool SearchIcon = false;

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Categories.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "All Goals ",
                        textAlign: TextAlign.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height:   AppDimensions.height10(context)*7.1,
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
                height: AppDimensions.height10(context) * 65.695,
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                              width: AppDimensions.height10(context) * 0.8,
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
                                      circle_text: "Eat More \n Healthy ",
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
                                      circle_text: "Quit \n Smoking",
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
                                      circle_text:
                                          "Reduce \n Chocolate \n Consumption",
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
                                      circle_text: "Reduce \n Screen Time",
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
                    SizedBox(
                      height: AppDimensions.height10(context) * 3.1,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              width: AppDimensions.height10(context) * 0.8,
                            ),
                            Container(
                              // color: Colors.yellow,
                              height: AppDimensions.height10(context) * 2.4,
                              child: Text(
                                "Happiness & Wellbeing ",
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
                                      circle_text: "Eat More \n Healthy ",
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
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: EdgeInsets.only(
              left: AppDimensions.height10(context) * 2.2,
              right: AppDimensions.height10(context) * 2.2),
          height: AppDimensions.height10(context) * 7.0,
          width: AppDimensions.height10(context) * 41.4,
          child: SearchIcon == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 3.6,
                          width: AppDimensions.height10(context) * 31.3,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF767680).withOpacity(0.12),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10(context)))),
                          child: Center(
                            child: TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF3C3C43).withOpacity(0.6),
                                    fontFamily: 'Laila',
                                    fontSize:
                                        AppDimensions.height10(context) * 1.7,
                                    height:
                                        AppDimensions.height10(context) * 0.15),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(0.0),
                                    prefixIcon: Image.asset(
                                      'assets/images/Light.png',
                                      width:
                                          AppDimensions.height10(context) * 1.5,
                                      height:
                                          AppDimensions.height10(context) * 1.5,

                                      // fit: BoxFit.contain,
                                      // fit: BoxFit.contain,
                                    ),
                                    suffixIcon: Image.asset(
                                      'assets/images/cancel.png',
                                      width:
                                          AppDimensions.height10(context) * 2.3,
                                      height:
                                          AppDimensions.height10(context) * 2.3,
                                      // fit: BoxFit.contain,
                                    ),
                                    hintText: "Search",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)))),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          SearchIcon = false;
                        });
                      },
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.7,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF007AFF),
                        ),
                      ),
                    ),

                    //const Padding(padding: EdgeInsets.all(10))
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 4.7,
                          height: AppDimensions.height10(context) * 4.7,
                          padding: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.5,
                              bottom: AppDimensions.height10(context) * 0.5),
                          child: Image.asset(
                            'assets/images/Add.png',
                            width: AppDimensions.height10(context) * 4.7,
                            height: AppDimensions.height10(context) * 4.7,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 0.5,
                        ),
                        Text(
                          'Create a new goal! ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFA9934),
                            // fontFamily: ,
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: AppDimensions.height10(context) * 4.7,
                      height: AppDimensions.height10(context) * 4.7,
                      padding: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.5,
                          bottom: AppDimensions.height10(context) * 0.5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            SearchIcon = true;
                          });
                        },
                        child: Image.asset(
                          'assets/images/Search.png',
                          width: AppDimensions.height10(context) * 5,
                          height: AppDimensions.height10(context) * 5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    //const Padding(padding: EdgeInsets.all(10))
                  ],
                ),
        ),
      ),
    );
  }
}
