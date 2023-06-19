import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/AllGoals.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalCategory.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

List<String> goals_name = [
  'Happiness & Wellbeing',
  'Self Control',
  'Category Name',
  'Happiness & Wellbeing',
  'Self Control',
  'Category Name',
  'Happiness & Wellbeing',
  'Self Control',
  'Category Name',
];

class _CategoriesState extends State<Categories> {
  Future<List<String>>? _goalNamesFuture;
  List<Map<String, dynamic>>? goalCategories;
  late int count;
  bool Loading = true;

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() {
    AdminGoal.getAllCategoriesNames().then((response) {
      if (response.length != 0) {
        setState(() {
          Loading = false;
          goalCategories = response;
          count = response.length ~/ 2;
        });
        print("response123:$goalCategories");
      } else {
        setState(() {
          Loading = false;
        });
        print("response:$response");
      }
    }).catchError((error) {
      setState(() {
        Loading = false;
      });
      print("error");
    });
  }

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
                width: 28.0,
                height: 28.0,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                Navigator.pop(context);
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
          Loading == false
              ? Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.png"),
                fit: BoxFit.cover,
              ),
            ),
          )
              : Container(
            color: Colors.white,
          ),
          Loading == false
              ? Column(
            children: [
              Container(
                padding:
                EdgeInsets.only(top: AppDimensions.height10 * 4.2),
                child: Center(
                  child: Text(
                    "Star Creation 1/5",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 10.5,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Select Your Goal Category ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 2.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 1.6,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Which category does your goal belong to? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 6.7,
              ),
              SizedBox(
                height: AppDimensions.height10 * 14.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: min(
                      4,
                      goalCategories!
                          .length), // ensure itemCount doesn't exceed 4 or length of list
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppDimensions.height10 * 2.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GoalCategory(
                                      "Category Name",
                                      goalCategories?[index]["name"],
                                      goalCategories?[index]["id"],
                                    ),
                                  ),
                                );
                                print(
                                    '${goalCategories![index]["name"]}${goalCategories![index]["id"]}');
                              },
                              child: circles(
                                  circle_text: goalCategories![index]
                                  ["name"],
                                  circle_color1: 0xFFFC854F,
                                  circle_color2: 0xFFFAA960,
                                  circle_border: 3.0,
                                  circle_bordercolor: 0xFFFFFFFF,
                                  circle_height:
                                  AppDimensions.height10 * 13.4,
                                  circle_width:
                                  AppDimensions.height10 * 13.4,
                                  textfont: AppDimensions.height10 * 1.6,
                                  textcolor: 0xFFFFFFFF),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20.0),
                child: SizedBox(
                  height: AppDimensions.height10 * 14.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: max(4, goalCategories!.length - 4),
                      itemBuilder: ((context, index) {
                        return Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 2.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GoalCategory(
                                                "Category Name",
                                                goalCategories![index + 4]
                                                ["name"],
                                                goalCategories![index + 4]
                                                ["id"]),
                                      ),
                                    );
                                  },
                                  child: circles(
                                      circle_text:
                                      goalCategories![index + 4]
                                      ["name"],
                                      circle_color1: 0xFFFC854F,
                                      circle_color2: 0xFFFAA960,
                                      circle_border: 3.0,
                                      circle_bordercolor: 0xFFFFFFFF,
                                      circle_height:
                                      AppDimensions.height10 * 13.4,
                                      circle_width:
                                      AppDimensions.height10 * 13.4,
                                      textfont:
                                      AppDimensions.height10 * 1.6,
                                      textcolor: 0xFFFFFFFF),
                                )
                              ],
                            ),
                          ],
                        );
                      })),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 11.6,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllGoals(),
                    ),
                  );
                },
                child: circles(
                    circle_text: "View all \n goals",
                    circle_color1: 0xFFFC854F,
                    circle_color2: 0xFFFAA960,
                    circle_border: 3.0,
                    circle_bordercolor: 0xFFFFFFFF,
                    circle_height: AppDimensions.height10 * 10.0,
                    circle_width: AppDimensions.height10 * 10.0,
                    textfont: AppDimensions.height10 * 1.6,
                    textcolor: 0xFFFFFFFF),
              )
            ],
          )
              : Center(
            child: SpinKitFadingCircle(
              color: Color(0xFFB1B8FF),
              size: 80,
            ),
          ),
        ],
      ),
    );
  }
}











