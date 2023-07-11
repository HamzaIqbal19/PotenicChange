import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/AllGoals.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalCategory.dart';
import 'package:potenic_app/Screen/CreateGoal/random_circle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'Loaders/categories_shimmer.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List<String>>? _goalNamesFuture;
  List<Map<String, dynamic>>? goalCategories;
  ScrollController scrollController = ScrollController();
  late int count;
  bool Loading = true;

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchGoalNames() {
    AdminGoal.getAllCategoriesNames().then((response) {
      if (response.length != 0) {
        setState(() {
          goalCategories = response;
          count = response.length ~/ 2;
        });
        loadData();
        print("response123:$goalCategories");
      } else {
        loadData();
        print("response:$response");
      }
    }).catchError((error) {
      loadData();
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
                'assets/images/Close.webp',
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
            width: AppDimensions.width10(context),
          )
        ],
      ),
      body: Stack(
        children: [
          // Loading == false
          //     ?
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // : Container(
          //     color: Colors.white,
          //   ),
          Loading == false
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.2),
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
                      height: AppDimensions.height10(context) * 10.5,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Select Your Goal Category ",
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
                      height: AppDimensions.height10(context) * 1.6,
                    ),
                    Container(
                      child: Center(
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
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 6.7,
                    ),

                    // Stack(
                    //   children: [
                    //     RandomCircles(),
                    //   ],
                    // ),

                    SizedBox(
                      height: AppDimensions.height10(context) * 14.0,

                      // child: Listener(

                      // This callback is triggered whenever the user drags their finger
                      // onPointerMove: (details) {
                      //   // This is the global position of the finger on the screen
                      //   double globalPositionX = details.position.dx;
                      //
                      //   // This is the width of the screen
                      //   double screenWidth = MediaQuery.of(context).size.width;
                      //
                      //   // This is the threshold distance from the edge of the ListView. If the user's finger is
                      //   // within this distance, the ListView should start scrolling
                      //   double threshold = 100;
                      //
                      //   // Calculate the distance from the user's finger to the left and right edges of the ListView
                      //   double distanceToLeft = globalPositionX;
                      //   double distanceToRight = screenWidth - globalPositionX;
                      //   // print("object:${distanceToLeft > threshold}");
                      //   if (distanceToLeft <100) {
                      //     print("IF distanceToLeft:$distanceToLeft,threshold:$threshold");
                      //     // If the user's finger is near the left edge of the ListView, scroll to the left
                      //     scrollController.jumpTo(scrollController.offset + 5);
                      //   } else if (distanceToRight > 150) {
                      //     print("ELSE IF distanceToLeft:$distanceToLeft,threshold:$threshold");
                      //     // If the user's finger is near the right edge of the ListView, scroll to the right
                      //     scrollController.jumpTo(scrollController.offset - 5);
                      //   }
                      // },
                      // onPointerDown: ,
                      child: ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: min(4, goalCategories!.length),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 2.0,
                                  ),
                                  DragTarget<Map<String, dynamic>>(
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return LongPressDraggable<
                                          Map<String, dynamic>>(
                                        data: goalCategories![index],
                                        child: AnimatedScaleButton(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              FadePageRoute(
                                                page: GoalCategory(
                                                  "Category Name",
                                                  goalCategories![index]
                                                      ["name"],
                                                  goalCategories![index]["id"],
                                                ),
                                              ),
                                            );
                                          },
                                          child: circles(
                                              circle_text:
                                                  goalCategories![index]
                                                      ["name"],
                                              circle_color1: 0xFFFC854F,
                                              circle_color2: 0xFFFAA960,
                                              circle_border: 3.0,
                                              circle_bordercolor: 0xFFFFFFFF,
                                              circle_height:
                                                  AppDimensions.height10(
                                                          context) *
                                                      13.4,
                                              circle_width:
                                                  AppDimensions.height10(
                                                          context) *
                                                      13.4,
                                              textfont: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              textcolor: 0xFFFFFFFF),
                                        ),
                                        feedback: circles(
                                            circle_text: goalCategories![index]
                                                ["name"],
                                            circle_color1: 0xFFFC854F,
                                            circle_color2: 0xFFFAA960,
                                            circle_border: 3.0,
                                            circle_bordercolor: 0xFFFFFFFF,
                                            circle_height: AppDimensions
                                                    .height10(context) *
                                                13.4,
                                            circle_width:
                                                AppDimensions.height10(
                                                        context) *
                                                    13.4,
                                            textfont: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            textcolor: 0xFFFFFFFF),
                                        childWhenDragging:
                                            Container(), // empty container when dragging
                                      );
                                    },

                                    onWillAccept: (data) =>
                                        true, // Always accept for this demo
                                    onAccept: (data) {
                                      setState(() {
                                        // Swap the two items in the list
                                        int indexData = goalCategories!
                                            .indexWhere((element) =>
                                                element["id"] == data["id"]);
                                        var temp = goalCategories![index];
                                        goalCategories![index] =
                                            goalCategories![indexData];
                                        goalCategories![indexData] = temp;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      // )listner
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20.0),
                      child: SizedBox(
                        height: AppDimensions.height10(context) * 14.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: min(4, goalCategories!.length - 4),
                          itemBuilder: (context, index) {
                            final dataIndex = index + 4;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.0,
                                    ),
                                    DragTarget<Map<String, dynamic>>(
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return LongPressDraggable<
                                            Map<String, dynamic>>(
                                          data: goalCategories![dataIndex],
                                          child: AnimatedScaleButton(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                FadePageRoute(
                                                  page: GoalCategory(
                                                    "Category Name",
                                                    goalCategories![dataIndex]
                                                        ["name"],
                                                    goalCategories![dataIndex]
                                                        ["id"],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: circles(
                                                circle_text:
                                                    goalCategories![dataIndex]
                                                        ["name"],
                                                circle_color1: 0xFFFC854F,
                                                circle_color2: 0xFFFAA960,
                                                circle_border: 3.0,
                                                circle_bordercolor: 0xFFFFFFFF,
                                                circle_height: AppDimensions
                                                        .height10(context) *
                                                    13.4,
                                                circle_width:
                                                    AppDimensions.height10(
                                                            context) *
                                                        13.4,
                                                textfont:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                textcolor: 0xFFFFFFFF),
                                          ),
                                          feedback: circles(
                                              circle_text:
                                                  goalCategories![dataIndex]
                                                      ["name"],
                                              circle_color1: 0xFFFC854F,
                                              circle_color2: 0xFFFAA960,
                                              circle_border: 3.0,
                                              circle_bordercolor: 0xFFFFFFFF,
                                              circle_height:
                                                  AppDimensions.height10(
                                                          context) *
                                                      13.4,
                                              circle_width:
                                                  AppDimensions.height10(
                                                          context) *
                                                      13.4,
                                              textfont: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              textcolor: 0xFFFFFFFF),
                                          childWhenDragging:
                                              Container(), // empty container when dragging
                                        );
                                      },

                                      onWillAccept: (data) =>
                                          true, // Always accept for this demo
                                      onAccept: (data) {
                                        setState(() {
                                          // Swap the two items in the list
                                          int indexData = goalCategories!
                                              .indexWhere((element) =>
                                                  element["id"] == data["id"]);
                                          var temp = goalCategories![dataIndex];
                                          goalCategories![dataIndex] =
                                              goalCategories![indexData];
                                          goalCategories![indexData] = temp;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: AppDimensions.height10(context) * 11.6,
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          FadePageRoute(
                            page: AllGoals(),
                          ),
                        );
                      },
                      child: circles(
                          circle_text: "View all \n goals",
                          circle_color1: 0xFFFC854F,
                          circle_color2: 0xFFFAA960,
                          circle_border: 3.0,
                          circle_bordercolor: 0xFFFFFFFF,
                          circle_height: AppDimensions.height10(context) * 10.0,
                          circle_width: AppDimensions.height10(context) * 10.0,
                          textfont: AppDimensions.height10(context) * 1.6,
                          textcolor: 0xFFFFFFFF),
                    )
                  ],
                )
              : const categories_shimmer(),
        ],
      ),
    );
  }
}
