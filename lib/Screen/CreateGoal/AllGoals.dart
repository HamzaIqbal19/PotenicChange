import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../API/Goal.dart';
import '../../Widgets/fading.dart';
import 'Loaders/AllGolas_shimmer.dart';

class AllGoals extends StatefulWidget {
  const AllGoals({
    Key? key,
  }) : super(key: key);

  @override
  State<AllGoals> createState() => _AllGoalsState();
}

class _AllGoalsState extends State<AllGoals> {
  bool SearchIcon = false;

  bool Loading = true;

  // Future<List<String>>? _goalNamesAndCategoriesFuture;

  List<Map<String, dynamic>>? goalNamesAndCategories;

  @override
  void initState() {
    super.initState();
    _fetchGoalNamessAndCategories();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 5), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchGoalNamessAndCategories() {
    AdminGoal.getAllGoalAndCategories().then((response) {
      if (response.length != 0) {
        setState(() {
          goalNamesAndCategories = response;
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
      print("error");
    });
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future getUserId(int categoryid, goalname, goalid) async {
    final SharedPreferences prefs = await _prefs;
    var userId = prefs.getInt("userid");

    saveGoalToPrefs(userId!, categoryid, goalname, goalid);
  }

  Future<void> saveGoalToPrefs(
      var userId, var categoryId, var goalName, var goalId) async {
    final SharedPreferences prefs = await _prefs;
    var GoalName = prefs.setString('goalName', goalName);
    var usergoalId = prefs.setInt("goalId", goalId);
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
    prefs.setString('goal', jsonString);
    print('====================');
    var userGoalId = prefs.setInt('goalId', goalId);
    print('====================');
    print('====================$userGoalId');

    getGoal();
  }

  Future<Goal> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    print("GoalId:${prefs.getInt("goalId")}");
    String? jsonString = prefs.getString('goal');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      print("Goal===============>$jsonString");
      Navigator.push(
        context,
        FadePageRoute(
          page: GoalName(),
        ),
      );
      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  String searchText = ''; // Add this line

  void _searchGoals(String searchTerm) {
    setState(() {
      //if (searchTerm) {
      AdminGoal().searchAllGoal(searchTerm).then((value) => {
            print("value:$value"),
            setState(() {
              goalNamesAndCategories = value;
              Loading = false;
              print("responses:${value[1]["goals"]}");
            }),
          });
      // } else {
      //_searchResults = [];
      //  }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
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
                  'assets/images/Back.webp',
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
                    'assets/images/Close.webp',
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

          // SingleChildScrollView(
          //   child: ,
          // )
          Loading == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
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
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
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
                        margin: EdgeInsets.symmetric(
                            horizontal: AppDimensions.height10(context) * 2.0),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: goalNamesAndCategories!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.1),
                                        child: circles(
                                            circle_text: '',
                                            circle_color1: 0xFFFC854F,
                                            circle_color2: 0xFFFAA960,
                                            circle_border: 1,
                                            circle_bordercolor: 0xFFFFFFFF,
                                            circle_height:
                                                AppDimensions.height10(
                                                        context) *
                                                    2.5,
                                            circle_width:
                                                AppDimensions.height10(
                                                        context) *
                                                    2.5,
                                            textfont: 0,
                                            textcolor: 0),
                                      ),
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            1.0,
                                      ),
                                      Container(
                                        // color: Colors.yellow,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        child: Text(
                                          goalNamesAndCategories![index]
                                              ["name"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                2.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                  ),
                                  Container(
                                    height: (goalNamesAndCategories![index]["goals"].length <=
                                            2)
                                        ? AppDimensions.height10(context) *
                                            20.0 *
                                            (goalNamesAndCategories![index]["goals"]
                                                .length)
                                        : (goalNamesAndCategories![index]["goals"].length <=
                                                5)
                                            ? AppDimensions.height10(context) *
                                                11.0 *
                                                (goalNamesAndCategories![index]
                                                        ["goals"]
                                                    .length)
                                            : (goalNamesAndCategories![index]["goals"].length <=
                                                    7)
                                                ? AppDimensions.height10(context) *
                                                    10.2 *
                                                    (goalNamesAndCategories![index]
                                                            ["goals"]
                                                        .length)
                                                : (goalNamesAndCategories![index]
                                                                ["goals"]
                                                            .length <=
                                                        8)
                                                    ? AppDimensions.height10(context) *
                                                        9.2 *
                                                        (goalNamesAndCategories![index]
                                                                ["goals"]
                                                            .length)
                                                    : (goalNamesAndCategories![index]["goals"].length <= 18)
                                                        ? AppDimensions.height10(context) * 8.6 * (goalNamesAndCategories![index]["goals"].length)
                                                        : AppDimensions.height10(context) * 12.4 * (goalNamesAndCategories![index]["goals"].length) - 250,
                                    width: AppDimensions.height10(context) * 38,
                                    child: GridView.builder(
                                        shrinkWrap: false,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              3.5 / 3, // Two items in each row

                                          mainAxisSpacing: 1.0,
                                          crossAxisSpacing: 0.1,
                                        ),
                                        itemCount:
                                            goalNamesAndCategories![index]
                                                    ["goals"]
                                                .length,
                                        itemBuilder: (context, index1) {
                                          return SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  41.9,
                                              child: Column(children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    AnimatedScaleButton(
                                                      onTap: () {
                                                        getUserId(
                                                            goalNamesAndCategories![
                                                                index]['id'],
                                                            goalNamesAndCategories![
                                                                            index]
                                                                        [
                                                                        "goals"]
                                                                    [index1]
                                                                ["goalName"],
                                                            goalNamesAndCategories![
                                                                        index]
                                                                    ["goals"]
                                                                [index1]["id"]);
                                                      },
                                                      child: circles(
                                                          circle_text: goalNamesAndCategories![
                                                                      index]
                                                                  ["goals"][index1]
                                                              ["goalName"],
                                                          circle_color1:
                                                              0xFFFFFFFF,
                                                          circle_color2:
                                                              0xFFFFFFFF,
                                                          circle_border: 3.0,
                                                          circle_bordercolor:
                                                              0xFFEE8E6F,
                                                          circle_height:
                                                              AppDimensions.height10(
                                                                      context) *
                                                                  13.4,
                                                          circle_width:
                                                              AppDimensions.height10(
                                                                      context) *
                                                                  13.4,
                                                          textfont: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          textcolor:
                                                              0xFFFA9934),
                                                    ),
                                                  ],
                                                ),
                                              ]));
                                        }),
                                  )
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                )
              : const AllGoals_shimmer(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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
                                controller: _searchController,
                                onChanged: (value) {
                                  print("value:$value");

                                  setState(() {
                                    searchText = value;
                                    _searchGoals(value);
                                  });
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0.0),
                                    prefixIcon: Image.asset(
                                      'assets/images/Light.webp',
                                      width:
                                          AppDimensions.height10(context) * 1.5,
                                      height:
                                          AppDimensions.height10(context) * 1.5,

                                      // fit: BoxFit.contain,
                                      // fit: BoxFit.contain,
                                    ),
                                    suffixIcon: Image.asset(
                                      'assets/images/cancel.webp',
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
                            'assets/images/Add.webp',
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
                          'assets/images/Search.webp',
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
