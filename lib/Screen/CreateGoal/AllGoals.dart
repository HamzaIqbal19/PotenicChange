import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Goal.dart';
import '../../Widgets/fading.dart';
import '../HomeScreen/HomeScreen.dart';
import 'Loaders/AllGolas_shimmer.dart';

class AllGoals extends StatefulWidget {
  const AllGoals({
    Key? key,
  }) : super(key: key);

  @override
  State<AllGoals> createState() => _AllGoalsState();
}

class _AllGoalsState extends State<AllGoals> {
  bool searchIcon = false;
  bool noData = false;
  bool loading = true;
  var allGoals;

  List<Map<String, dynamic>>? goalNamesAndCategories;

  @override
  void initState() {
    super.initState();
    _fetchGoalNamessAndCategories();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void _fetchGoalNamessAndCategories() {
    AdminGoal.getAllGoalAndCategories().then((response) {
      if (response.length != 0) {
        setState(() {
          goalNamesAndCategories = response;
          allGoals = response;
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
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
    await prefs.setString('goalName', goalName);
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
    prefs.setString('goal', jsonString);
    await prefs.setInt('goalId', goalId);

    getGoal();
  }

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
          page: const GoalName(
            saved: false,
            route: '',
            4,
            comingFromEditScreen: false,
          ),
        ),
      );
      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

  final TextEditingController _searchController = TextEditingController();

  String searchText = ''; // Add this line

  void _searchGoals(String searchTerm) {
    setState(() {
      //if (searchTerm) {
      AdminGoal().searchAllGoal(searchTerm).then((value) => {
            if (value.isEmpty)
              {
                setState(() {
                  goalNamesAndCategories = allGoals;
                  loading = false;
                  noData = true;
                }),
              }
            else
              {
                setState(() {
                  goalNamesAndCategories = value;
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
              leading: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Back.webp',
                      // width: AppDimensions.width10(context) * 3,
                      height: AppDimensions.height10(context) * 3,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Add code for performing close action
                    },
                  ),
                ),
              ),
              actions: [
                Center(
                  child :Buttons().closeButton(context,(){Navigator.pop(context);})
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
            loading == false
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 5.5),
                          child: Center(
                            child: Text(
                              AppText().starCreate1,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.8,
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
                            Center(
                              child: Text(
                                AppText().allGoals,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: AppDimensions.font10(context) * 2.8,
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
                            Text(
                              AppText().selectCategoryBody,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.8,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppDimensions.width10(context) * 2.0),
                          child: noData == true
                              ? Container(
                                  height:
                                      AppDimensions.height10(context) * 21.2,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) * 5),
                                  child: Center(
                                      child: Text(
                                    'Sorry no\nresults found',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xFFFFFFFF),
                                        fontSize:
                                            AppDimensions.font10(context) * 2.8,
                                        fontWeight: FontWeight.w700),
                                  )),
                                )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: goalNamesAndCategories!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  circle_bordercolor:
                                                      0xFFFFFFFF,
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
                                              width: AppDimensions.width10(
                                                      context) *
                                                  1.0,
                                            ),
                                            SizedBox(
                                              // color: Colors.yellow,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                              child: Text(
                                                capitalizeFirstLetter(
                                                  goalNamesAndCategories![index]
                                                      ["name"],
                                                ),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.0,
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.width10(context) *
                                                  38,
                                          padding: EdgeInsets.only(
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  3.1),
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 3.5 /
                                                    3, // Two items in each row

                                                mainAxisSpacing: 1.0,
                                                crossAxisSpacing: 0.1,
                                              ),
                                              itemCount:
                                                  goalNamesAndCategories![index]
                                                          ["goals"]
                                                      .length,
                                              itemBuilder: (context, index1) {
                                                return SizedBox(
                                                    height:
                                                        AppDimensions.height10(
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
                                                                goalProvider.updateGoalCategoryId(
                                                                    goalNamesAndCategories![
                                                                            index]
                                                                        ['id']);
                                                                goalProvider.updateName(goalNamesAndCategories![index]
                                                                            [
                                                                            "goals"]
                                                                        [index1]
                                                                    [
                                                                    "goalName"]);
                                                                goalProvider.updateGoalId(
                                                                    goalNamesAndCategories![index]
                                                                            [
                                                                            "goals"]
                                                                        [
                                                                        index1]["id"]);
                                                                getUserId(
                                                                    goalNamesAndCategories![
                                                                            index]
                                                                        ['id'],
                                                                    goalNamesAndCategories![
                                                                                index]["goals"]
                                                                            [
                                                                            index1]
                                                                        [
                                                                        "goalName"],
                                                                    goalNamesAndCategories![
                                                                                index]
                                                                            [
                                                                            "goals"]
                                                                        [
                                                                        index1]["id"]);
                                                              },
                                                              child: circles(
                                                                circle_text:
                                                                    capitalizeFirstLetter(
                                                                  goalNamesAndCategories![index]["goals"]
                                                                              [
                                                                              index1]
                                                                          [
                                                                          "goalName"]
                                                                      .toString(),
                                                                ),
                                                                circle_color1:
                                                                    0xFFFFFFFF,
                                                                circle_color2:
                                                                    0xFFFFFFFF,
                                                                circle_border:
                                                                    3.0,
                                                                circle_bordercolor:
                                                                    0xFFEE8E6F,
                                                                circle_height:
                                                                    AppDimensions.width10(
                                                                            context) *
                                                                        13.4,
                                                                circle_width:
                                                                    AppDimensions.width10(
                                                                            context) *
                                                                        13.4,
                                                                textfont: AppDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1.6,
                                                                textcolor:
                                                                    0xFFFA9934,
                                                              )),
                                                        ],
                                                      ),
                                                    ]));
                                              }),
                                        ),

                                      ],
                                    );
                                  }),
                        ),
                    //    SizedBox(height: AppDimensions.height10(context)*3,)
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
                //top: AppDimensions.height10(context)*0.8,
                left: AppDimensions.width10(context) * 2.2,
                right: AppDimensions.width10(context) * 2.2),
            //width: AppDimensions.width10(context) * 41.4,
            height: AppDimensions.width10(context) * 7.0,

            child: searchIcon == true
                ? Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: AppDimensions.height10(context) * 3.6,
                              width: AppDimensions.width10(context) * 31.3,
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF767680).withOpacity(0.12),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context)))),
                              child: Center(
                                child: TextFormField(
                                    controller: _searchController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onChanged: (value) {
                                      setState(() {
                                        searchText = value;
                                        _searchGoals(value);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(0.0),
                                        prefixIcon: Image.asset(
                                          'assets/images/Light.webp',
                                          width:
                                              AppDimensions.width10(context) *
                                                  1.5,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                        ),
                                        suffixIcon: AnimatedScaleButton(
                                          onTap: () {
                                            searchText = '';
                                            _searchGoals('');
                                            _searchController.clear();
                                          },
                                          child: Image.asset(
                                            'assets/images/cancel.webp',
                                            width:
                                                AppDimensions.width10(context) *
                                                    2.3,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.3,
                                            // fit: BoxFit.contain,
                                          ),
                                        ),
                                        hintText: "Search",
                                        hintStyle: TextStyle(
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.14),
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
                              searchIcon = false;
                              _searchGoals('');
                              _searchController.clear();
                            });
                          },
                          child: Text(
                            "Cancel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.7,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF007AFF),
                            ),
                          ),
                        ),

                        //const Padding(padding: EdgeInsets.all(10))
                      ],
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            AnimatedScaleButton(
                              onTap: () {
                                bottom_sheet(
                                  context,
                                );
                              },
                              child: SizedBox(
                                width: AppDimensions.width10(context) * 4.7,
                                height: AppDimensions.height10(context) * 4.7,
                                // padding: EdgeInsets.only(
                                //     top: AppDimensions.height10(context) * 0.5,
                                //     bottom:
                                //         AppDimensions.height10(context) * 0.5),
                                child: Image.asset(
                                  'assets/images/Add.webp',
                                  width: AppDimensions.width10(context) * 4.7,
                                  height: AppDimensions.height10(context) * 4.7,
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
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
