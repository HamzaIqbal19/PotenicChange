import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/GoalName.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/BottomSearch.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/Goal.dart';
import '../../Widgets/animatedButton.dart';
import 'Loaders/GoalCategory_shimmer.dart';

class GoalCategory extends StatefulWidget {
  final String title;
  final String Circletitle;
  final int id;
  // final String message;

  const GoalCategory(this.title, this.Circletitle, this.id, {super.key});

  @override
  State<GoalCategory> createState() => _GoalCategoryState();
}

class _GoalCategoryState extends State<GoalCategory> {
  bool searchIcon = false;
  bool loading = true;
  String route = '';
  bool noData = false;
  String searchText = ''; // Add this line
  final double overlapFactor = 0.85;
  List<String> categories = [
    'Fulfil Potential',
    'Happiness & Wellbeing',
    'Self Control',
    'Relationship'
  ];
  List<Map<String, dynamic>>? Allgoal;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    getRoute();
    _fetchgetAllGoal();
  }

  Future getUserId(int categoryid, goalname, goalid) async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt("userid");

    saveGoalToPrefs(userId!, categoryid, goalname, goalid);
  }

  Future<void> saveGoalToPrefs(
      var userId, var categoryId, var goalName, var goalId) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('goalName', goalName);
    await prefs.setString("GoalCategory", widget.Circletitle);
    await prefs.setInt("goalId", goalId);
    Goal goal = Goal(
      name: goalName,
      reason: [
        {"key": "reason1", "text": "This is reason 1"},
      ],
      identityStatement: [
        {"key": "reason1", "text": "This is reason 1"},
      ],
      visualizingYourSelf: [
        {"key": "reason1", "text": "This is reason 1"},
      ],
      userId: userId,
      goalId: goalId,
      goalCategoryId: categoryId,
    );
    String jsonString =
        jsonEncode(goal.toJson()); // converting object to json string
    await prefs.setString('goal', jsonString);
    await prefs.setInt('goalId', goalId);

    getGoal();
  }

  // Future<void> getRoute() async {

  // }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return '';
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  Future<Goal> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('goal');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      Navigator.push(
        context,
        FadePageRoute(
          page: GoalName(
            saved: false,
            route: '',
            widget.id,
            comingFromEditScreen: false,
          ),
        ),
      );
      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      route = goalRoute!;
    });
  }

  void _fetchgetAllGoal() {
    AdminGoal.getAllGoal(widget.id).then((response) {
      if (response.isNotEmpty) {
        setState(() {
          goalNamesAndCategories = response;
          Allgoal = response;
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
    });
  }

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>>? goalNamesAndCategories;

  void _searchGoals(String searchTerm, int id) {
    setState(() {
      //if (searchTerm) {
      AdminGoal().searchAllGoalById(searchTerm, widget.id).then((response) => {
            if (response.isEmpty)
              {
                setState(() {
                  loading = false;
                  Allgoal = goalNamesAndCategories;
                  noData = true;
                }),
              }
            else
              {
                setState(() {
                  Allgoal = response;
                  loading = false;
                  noData = false;
                }),
              }
          });
      // } else {
      //_searchResults = [];
      //  }
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(AppDimensions.height10(context) * 5.0),
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: appBarTitle(
                    context, loading ? '' : AppText().starCreate2, false),
                leading: Buttons().backButton(context, () {
                  Navigator.pop(context);
                }),
                actions: [
                  Buttons().closeButton(context, () async {
                    if (route == 'view_all_goals') {
                      Navigator.pushReplacement(
                          context,
                          FadePageRouteReverse(
                              page: const view_all_goals_menu()));
                    } else {
                      Navigator.pop(context);
                    }

                    final SharedPreferences prefs = await _prefs;
                    await prefs.remove('goal_route');
                  }),
                ],
              )),
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
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 10.5),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 2.7,
                          ),
                          circles(
                              circle_text: widget.Circletitle,
                              circle_color1: 0xFFFC854F,
                              circle_color2: 0xFFFAA960,
                              circle_border: 3,
                              circle_bordercolor: 0xFFFFFFFF,
                              // circle_height:
                              //     AppDimensions.height10(context) * 13.4,
                              // circle_width:
                              //     AppDimensions.width10(context) * 13.4,
                              textfont: AppDimensions.font10(context) * 1.6,
                              textcolor: 0XFFFFFFFF),
                          SizedBox(
                            height: AppDimensions.height10(context) * 1.6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 1.5,
                              ),
                              SizedBox(
                                height: AppDimensions.height10(context) * 8.9,
                                child: Text(
                                  "Select your goal for \n ‘${widget.Circletitle}’ ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.font10(context) * 2.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 2.0,
                              bottom: AppDimensions.height10(context) * 8.0,
                              // left: AppDimensions.width10(context) * 2.0,
                              // right: AppDimensions.width10(context) * 2.0
                            ),
                            child: noData == true
                                ? Container(
                                    height:
                                        AppDimensions.height10(context) * 21.2,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            5),
                                    child: Center(
                                        child: Text(
                                      'Sorry no\nresults found',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.8,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            AppDimensions.height10(context) * 3,
                                        right: AppDimensions.height10(context) *
                                            3),
                                    child: GridView.builder(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 4.2 /
                                              3.5, // Two items in each row

                                          mainAxisSpacing: 18.0,
                                          crossAxisSpacing: 0,
                                        ),
                                        itemCount: Allgoal![0]["goals"].length,
                                        itemBuilder: (context, index1) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  AnimatedScaleButton(
                                                    onTap: () {
                                                      goalProvider.updateGoalId(
                                                          Allgoal![0]["goals"]
                                                              [index1]["id"]);
                                                      goalProvider.updateName(
                                                          Allgoal![0]["goals"]
                                                                  [index1]
                                                              ["goalName"]);
                                                      getUserId(
                                                          widget.id,
                                                          Allgoal![0]["goals"]
                                                                  [index1]
                                                              ["goalName"],
                                                          Allgoal![0]["goals"]
                                                              [index1]["id"]);
                                                    },
                                                    child: circles(
                                                        circle_text:
                                                            capitalizeFirstLetter(
                                                          Allgoal![0]["goals"]
                                                                  [index1]
                                                              ["goalName"],
                                                        ),
                                                        circle_color1:
                                                            0xFFFFFFFF,
                                                        circle_color2:
                                                            0xFFFFFFFF,
                                                        circle_border: 3.0,
                                                        circle_bordercolor:
                                                            0xFFEE8E6F,
                                                        // circle_height:
                                                        //     AppDimensions.width10(
                                                        //             context) *
                                                        //         13.4,
                                                        // circle_width:
                                                        //     AppDimensions.width10(
                                                        //             context) *
                                                        //         13.4,
                                                        textfont: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.6,
                                                        textcolor: 0xFFFA9934),
                                                  ),
                                                ],
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                          ),
                          SizedBox(
                            height: AppDimensions.height10(context) * 5,
                          )
                        ],
                      ),
                    )
                  : const GoalCategory_shimmer()
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // color: Colors.blue,
              padding: EdgeInsets.only(
                  // top: AppDimensions.height10(context)*0.8,
                  left: AppDimensions.width10(context) * 2.2,
                  right: AppDimensions.width10(context) * 2.2),
              //width: AppDimensions.width10(context) * 41.4,
              height: AppDimensions.width10(context) * 7.0,
              child: searchIcon == true
                  ? BottomSearch(
                      controller: _searchController,
                      onTap: () {
                        _searchController.clear();
                        setState(() {
                          searchText = '';
                          _searchGoals('', widget.id);
                          noData = false;
                        });
                      },
                      CancelTap: () {
                        setState(() {
                          searchIcon = false;
                          _searchController.clear();
                          noData = false;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                          _searchGoals(value, widget.id);
                        });
                      },
                    )
                  // Container(
                  //     color: Colors.transparent,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: AppDimensions.height10(context) * 3.6,
                  //               width: AppDimensions.width10(context) * 31.3,
                  //               padding: const EdgeInsets.all(5.0),
                  //               decoration: BoxDecoration(
                  //                   color: const Color(0xFF767680)
                  //                       .withOpacity(0.12),
                  //                   border: Border.all(
                  //                       color: Colors.white, width: 2),
                  //                   borderRadius: BorderRadius.all(
                  //                       Radius.circular(
                  //                           AppDimensions.height10(context)))),
                  //               child: Center(
                  //                 child: TextFormField(
                  //                     controller: _searchController,
                  //                     textCapitalization: TextCapitalization
                  //                         .sentences,
                  //                     keyboardType: TextInputType.text,
                  //                     onChanged: (value) {
                  //                       setState(() {
                  //                         searchText = value;
                  //                         _searchGoals(value, widget.id);
                  //                       });
                  //                     },
                  //                     decoration: InputDecoration(
                  //                         contentPadding: const EdgeInsets.all(
                  //                             0.0),
                  //                         prefixIcon: Image.asset(
                  //                           'assets/images/Light.webp',
                  //                           width:
                  //                               AppDimensions.width10(context) *
                  //                                   1.5,
                  //                           height: AppDimensions.height10(
                  //                                   context) *
                  //                               1.5,
                  //                         ),
                  //                         suffixIcon: AnimatedScaleButton(
                  //                           onTap: () {
                  //                             _searchController.clear();
                  //                             searchText = '';
                  //                             _searchGoals('', widget.id);
                  //                             noData = false;
                  //                           },
                  //                           child: Image.asset(
                  //                             'assets/images/cancel.webp',
                  //                             width: AppDimensions.width10(
                  //                                     context) *
                  //                                 2.3,
                  //                             height: AppDimensions.height10(
                  //                                     context) *
                  //                                 2.3,
                  //                             // fit: BoxFit.contain,
                  //                           ),
                  //                         ),
                  //                         hintText: "Search",
                  //                         hintStyle: TextStyle(
                  //                             height: AppDimensions.height10(
                  //                                     context) *
                  //                                 0.14),
                  //                         focusedBorder:
                  //                             const OutlineInputBorder(
                  //                                 borderSide: BorderSide(
                  //                                     color: Colors
                  //                                         .transparent)),
                  //                         enabledBorder:
                  //                             const OutlineInputBorder(
                  //                                 borderSide: BorderSide(
                  //                                     color: Colors
                  //                                         .transparent)))),
                  //               ),
                  //             ),
                  //           ],
                  //         ),

                  //         GestureDetector(
                  //           onTap: () {
                  //             setState(() {
                  //               searchIcon = false;
                  //               _searchController.clear();
                  //             });
                  //           },
                  //           child: Text(
                  //             "Cancel",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               fontSize: AppDimensions.font10(context) * 1.7,
                  //               fontWeight: FontWeight.w400,
                  //               color: const Color(0xFF007AFF),
                  //             ),
                  //           ),
                  //         ),

                  //         //const Padding(padding: EdgeInsets.all(10))
                  //       ],
                  //     ),
                  //   )

                  : Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 4.7,
                                height: AppDimensions.height10(context) * 4.7,
                                // padding: EdgeInsets.only(
                                //     top: AppDimensions.height10(context) * 0.5,
                                //     bottom:
                                //         AppDimensions.height10(context) * 0.5),
                                child: AnimatedScaleButton(
                                  onTap: () {
                                    bottom_sheet(context);
                                  },
                                  child: Image.asset(
                                    'assets/images/Add.webp',
                                    width: AppDimensions.width10(context) * 4.7,
                                    height:
                                        AppDimensions.height10(context) * 4.7,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context) * 0.5,
                              ),
                              Text(
                                AppText().createNewGoal,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFFA9934),
                                  // fontFamily: ,
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: AppDimensions.width10(context) * 5,
                            height: AppDimensions.height10(context) * 5,
                            // padding: EdgeInsets.only(
                            //     top: AppDimensions.height10(context) * 0.5,
                            //     bottom: AppDimensions.height10(context) * 0.5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  searchIcon = true;
                                });
                              },
                              child: Image.asset(
                                'assets/images/Search.webp',
                                width: AppDimensions.width10(context) * 5,
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
          )),
    );
  }
}
