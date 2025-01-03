import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/GoalCategory.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:provider/provider.dart';
import 'AllGoals.dart';
import 'Loaders/categories_shimmer.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, dynamic>>? goalCategories;
  ScrollController scrollController = ScrollController();
  late int count;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return '';
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  Goal goal = Goal(
    name: 'Enter goal name',
    reason: [
      {"key": "reason1", "text": ""},
    ],
    identityStatement: [
      {"key": "reason1", "text": ""},
    ],
    visualizingYourSelf: [
      {"key": "reason1", "text": ""},
    ],
    userId: 13,
    goalId: 0,
    goalCategoryId: 0,
  );

  void _fetchGoalNames() {
    AdminGoal.getAllCategoriesNames().then((response) {
      if (response.length != 0) {
        setState(() {
          goalCategories = response;
          count = response.length ~/ 2;
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title:
            appBarTitle(context, loading ? '' : AppText().starCreate1, false),
        actions: [
          Buttons().closeButton(context, () {
            Navigator.pop(context);
          }),
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
          loading == false
              ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 10.5),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 10.5,
                    ),
                    Center(
                      child: Text(
                        AppText().selectCategory,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 2.8,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 1.6,
                    ),
                    Center(
                      child: Text(
                        AppText().selectCategoryBody,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 1.9,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 6.7,
                    ),
                    SizedBox(
                      height: AppDimensions.height10(context) * 14.0,
                      child: ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: min(5, goalCategories!.length),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 2.0,
                                  ),
                                  DragTarget<Map<String, dynamic>>(
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return LongPressDraggable<
                                          Map<String, dynamic>>(
                                        data: goalCategories![index],
                                        feedback: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                13.4,
                                            width:
                                                AppDimensions.width10(context) *
                                                    13.4,
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppDimensions.width10(
                                                            context) *
                                                        0.2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                //borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                                                border: Border.all(
                                                    width: 3.0,
                                                    color: Color(0xFFFFFFFF)),
                                                gradient: const LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xFFFC854F),
                                                      Color(0xFFFAA960)
                                                    ])),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.width10(
                                                          context) *
                                                      10.9,
                                                  child: Text(
                                                    goalCategories![index]
                                                        ["name"],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.6,
                                                      color: Color(0xFFFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),

                                        // circles(
                                        //     circle_text: goalCategories![index]
                                        //         ["name"],
                                        //     circle_color1: 0xFFFC854F,
                                        //     circle_color2: 0xFFFAA960,
                                        //     circle_border: 3.0,
                                        //     circle_bordercolor: 0xFFFFFFFF,
                                        //     // circle_height:
                                        //     //     AppDimensions.height10(
                                        //     //             context) *
                                        //     //         13.4,
                                        //     // circle_width:
                                        //     //  AppDimensions.width10(context) *
                                        //     //    13.4,
                                        //     textfont:
                                        //         AppDimensions.font10(context) *
                                        //             1.6,
                                        //     textcolor: 0xFFFFFFFF),
                                        // childWhenDragging: Container(),
                                        child: AnimatedScaleButton(
                                          onTap: () {
                                            goalProvider.setGoal(goal);
                                            goalProvider.updateGoalCategoryId(
                                                goalCategories![index]["id"]);
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
                                          child: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  13.4,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  13.4,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      AppDimensions.width10(
                                                              context) *
                                                          0.2),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  //borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                                                  border: Border.all(
                                                      width: 3.0,
                                                      color: Color(0xFFFFFFFF)),
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        Color(0xFFFC854F),
                                                        Color(0xFFFAA960)
                                                      ])),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.width10(
                                                                context) *
                                                            10.9,
                                                    child: Text(
                                                      capitalizeFirstLetter(
                                                          goalCategories![index]
                                                              ["name"]),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.6,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          // circles(
                                          //     circle_text:
                                          //         capitalizeFirstLetter(
                                          //             goalCategories![index]
                                          //                 ["name"]),
                                          //     circle_color1: 0xFFFC854F,
                                          //     circle_color2: 0xFFFAA960,
                                          //     circle_border: 3.0,
                                          //     circle_bordercolor: 0xFFFFFFFF,
                                          //     // circle_height:
                                          //     //     AppDimensions.height10(
                                          //     //             context) *
                                          //     //         13.4,
                                          //     // circle_width:
                                          //     //     AppDimensions.width10(
                                          //     //             context) *
                                          //     //         13.4,
                                          //     textfont: AppDimensions.font10(
                                          //             context) *
                                          //         1.6,
                                          //     textcolor: 0xFFFFFFFF),
                                        ),
                                        // empty container when dragging
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
                          padding: EdgeInsets.zero,
                          itemCount: min(5, goalCategories!.length - 5),
                          itemBuilder: (context, index) {
                            final dataIndex = index + 5;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 2.0,
                                    ),
                                    DragTarget<Map<String, dynamic>>(
                                      builder: (context, candidateData,
                                          rejectedData) {
                                        return LongPressDraggable<
                                            Map<String, dynamic>>(
                                          data: goalCategories![dataIndex],
                                          feedback: Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  13.4,
                                              width: AppDimensions.width10(
                                                      context) *
                                                  13.4,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      AppDimensions.width10(
                                                              context) *
                                                          0.2),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  //borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                                                  border: Border.all(
                                                      width: 3.0,
                                                      color: Color(0xFFFFFFFF)),
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        Color(0xFFFC854F),
                                                        Color(0xFFFAA960)
                                                      ])),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        AppDimensions.width10(
                                                                context) *
                                                            10.9,
                                                    child: Text(
                                                      goalCategories![dataIndex]
                                                          ["name"],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.6,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),

                                          // circles(
                                          //     circle_text:
                                          //         goalCategories![dataIndex]
                                          //             ["name"],
                                          //     circle_color1: 0xFFFC854F,
                                          //     circle_color2: 0xFFFAA960,
                                          //     circle_border: 3.0,
                                          //     circle_bordercolor: 0xFFFFFFFF,
                                          //     // circle_height:
                                          //     //     AppDimensions.height10(
                                          //     //             context) *
                                          //     //         13.4,
                                          //     // circle_width:
                                          //     //     AppDimensions.width10(
                                          //     //             context) *
                                          //     //         13.4,
                                          //     textfont: AppDimensions.font10(
                                          //             context) *
                                          //         1.6,
                                          //     textcolor: 0xFFFFFFFF),
                                          childWhenDragging: Container(),
                                          child: AnimatedScaleButton(
                                            onTap: () {
                                              goalProvider.setGoal(goal);
                                              goalProvider.updateGoalCategoryId(
                                                  goalCategories![dataIndex]
                                                      ["id"]);
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
                                            child: Container(
                                                height:
                                                    AppDimensions.height10(context) *
                                                        13.4,
                                                width: AppDimensions.width10(
                                                        context) *
                                                    13.4,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        AppDimensions.width10(
                                                                context) *
                                                            0.2),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    //borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                                                    border: Border.all(
                                                        width: 3.0,
                                                        color:
                                                            Color(0xFFFFFFFF)),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                          Color(0xFFFC854F),
                                                          Color(0xFFFAA960)
                                                        ])),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              10.9,
                                                      child: Text(
                                                        goalCategories![
                                                            dataIndex]["name"],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.6,
                                                          color:
                                                              Color(0xFFFFFFFF),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),

                                            // circles(
                                            //     circle_text:
                                            //         capitalizeFirstLetter(
                                            //       goalCategories![dataIndex]
                                            //           ["name"],
                                            //     ),
                                            //     circle_color1: 0xFFFC854F,
                                            //     circle_color2: 0xFFFAA960,
                                            //     circle_border: 3.0,
                                            //     circle_bordercolor: 0xFFFFFFFF,
                                            //     // circle_height: AppDimensions
                                            //     //         .height10(context) *
                                            //     //     13.4,
                                            //     // circle_width:
                                            //     //     AppDimensions.width10(
                                            //     //             context) *
                                            //     //         13.4,
                                            //     textfont: AppDimensions.font10(
                                            //             context) *
                                            //         1.6,
                                            //     textcolor: 0xFFFFFFFF),
                                          ),
                                          // empty container when dragging
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
                        goalProvider.setGoal(goal);
                        Navigator.push(
                          context,
                          FadePageRoute(
                            page: const AllGoals(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Container(
                            height: AppDimensions.height10(context) * 10.0,
                            width: AppDimensions.width10(context) * 10.0,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppDimensions.width10(context) * 0.2),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                                border: Border.all(
                                    width: 3.0, color: Color(0xFFFFFFFF)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFFC854F),
                                      Color(0xFFFAA960)
                                    ])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppDimensions.width10(context) * 10.9,
                                  child: Text(
                                    AppText().viewAllGoals,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        // circles(
                        //     circle_text: AppText().viewAllGoals,
                        //     circle_color1: 0xFFFC854F,
                        //     circle_color2: 0xFFFAA960,
                        //     circle_border: 3.0,
                        //     circle_bordercolor: 0xFFFFFFFF,
                        //     // circle_height:
                        //     //     AppDimensions.height10(context) * 10.0,
                        //     // circle_width: AppDimensions.width10(context) * 10.0,
                        //     textfont: AppDimensions.font10(context) * 1.6,
                        //     textcolor: 0xFFFFFFFF),
                      ),
                    )
                  ],
                )
              : const categories_shimmer(),
        ],
      ),
    );
  }
}
