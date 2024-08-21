import 'dart:async';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal%20Finished.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/Widgets/bottom_sheet_Practice.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/Practice.dart';
import '../../Widgets/animatedButton.dart';
import '../../Widgets/fading2.dart';
import '../HomeScreen/HomeScreen.dart';
import 'Loaders/create_practice_shimmer.dart';

class CreatePractice extends StatefulWidget {
  const CreatePractice({Key? key}) : super(key: key);

  @override
  State<CreatePractice> createState() => _CreatePracticeState();
}

class _CreatePracticeState extends State<CreatePractice> {
  bool searchIcon = false;
  bool loading = true;
  String searchText = '';
  var mygoal;
  var color = '0';
  String route = '';
  bool noDate = false;

  List<Map<String, dynamic>>? practiceName;
  @override
  void initState() {
    getGoalName();
    super.initState();
    getRoute();
    _fetchPracticeNames();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _searchController = TextEditingController();

  getGoalName() async {
    final SharedPreferences prefs = await _prefs;
    var goalName = prefs.getString("goalName");

    setState(() {
      mygoal = goalName!;
    });
  }

  Future<void> getRoute() async {
    final SharedPreferences prefs = await _prefs;
    var goalRoute = prefs.getString('goal_route');
    setState(() {
      route = goalRoute!;
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void _fetchGoalColor() async {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          color = response["color"];
        });
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
    });
  }

  void _fetchPracticeNames() {
    PracticeGoalApi.getPractice().then((response) {
      if (response.length != 0) {
        _fetchGoalColor();
        setState(() {
          practiceName = response;
        });
        loadData();
      } else {
        loadData();
      }
    }).catchError((error) {
      loadData();
    });
  }

  void _searchPractice(String searchTerm) {
    setState(() {
      //if (searchTerm) {
      PracticeGoalApi.searchPractice(searchTerm).then((value) {
        if (value.isEmpty) {
          setState(() {
            noDate = true;
            practiceName = value;
            loading = false;
          });
        } else {
          setState(() {
            practiceName = value;
            noDate = false;
            loading = false;
          });
        }
      });
      // } else {
      //_searchResults = [];
      //  }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (route == 'view_all_goals') {
          Navigator.pushReplacement(
              context, FadePageRouteReverse(page: const view_all_goals_menu()));
        } else if (route == 'view_all_goals_2') {
          Navigator.pushReplacement(context,
              FadePageRouteReverse(page: const multiple_goal_inactive()));
        } else {
          Navigator.push(
            context,
            FadePageRouteReverse(
              page: const GoalFinished(),
            ),
          );
        }
        final SharedPreferences prefs = await _prefs;

        await prefs.remove('route');
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(AppDimensions.height10(context) * 5.0),
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
                      //width: AppDimensions.width10(context) * 3,
                      height: AppDimensions.height10(context) * 3,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () async {
                      if (route == 'view_all_goals') {
                        Navigator.pushReplacement(context,
                            FadePageRoute(page: const view_all_goals_menu()));
                      } else if (route == 'view_all_goals_2') {
                        Navigator.pushReplacement(
                            context,
                            FadePageRoute(
                                page: const multiple_goal_inactive()));
                      } else {
                        Navigator.push(
                            context,
                            FadePageRoute3(
                                enterPage: const GoalFinished(),
                                exitPage: const CreatePractice()));
                      }
                      final SharedPreferences prefs = await _prefs;

                      await prefs.remove('route');

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
                        // width: AppDimensions.width10(context) * 3.0,
                        height: AppDimensions.height10(context) * 3.0,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () async {
                        if (route == 'view_all_goals') {
                          Navigator.pushReplacement(
                              context,
                              FadePageRouteReverse(
                                  page: const view_all_goals_menu()));
                        } else {
                          Navigator.pushReplacement(
                            context,
                            FadePageRouteReverse(
                              page: const HomeScreen(
                                login: true,
                              ),
                            ),
                          );
                        }
                        final SharedPreferences prefs = await _prefs;

                        await prefs.remove('route');

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
                image: AssetImage("assets/images/Categories.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: loading == false
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 6),
                          child: Center(
                            child: Text(
                              AppText().createPrac1,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 1.8,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.5,
                          ),
                          width: AppDimensions.width10(context) * 30,
                          child: Center(
                            child: Text(
                              mygoal,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 7.9,
                          height: AppDimensions.height10(context) * 7.9,
                          // color: Colors.amber,
                          margin: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 10.2,
                              right: AppDimensions.width10(context) * 23.3,
                              top: AppDimensions.height10(context) * 0.6),
                          // color: Colors.blue,
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(-3, 0),
                                child: Container(
                                  width: AppDimensions.width10(context) * 7.9,
                                  height: AppDimensions.height10(context) * 7.9,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // color: Colors.amber,
                                    image: DecorationImage(
                                        image: AssetImage('$color' == '1'
                                            ? "assets/images/red_gradient.webp"
                                            : '$color' == '2'
                                                ? 'assets/images/orange_moon.webp'
                                                : '$color' == '3'
                                                    ? "assets/images/lightGrey_gradient.webp"
                                                    : '$color' == '4'
                                                        ? "assets/images/lightBlue_gradient.webp"
                                                        : '$color' == '5'
                                                            ? "assets/images/medBlue_gradient.webp"
                                                            : '$color' == '6'
                                                                ? "assets/images/Blue_gradient.webp"
                                                                : 'assets/images/orange_moon.webp'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(1.5, 0),
                                child: Container(
                                  height: AppDimensions.height10(context) * 4.9,
                                  width: AppDimensions.width10(context) * 4.9,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Ellipse 158_wb.webp'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10(context) * 2.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppText().createPractice,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: AppDimensions.font10(context) * 2.8,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppDimensions.width10(context) * 2.0),
                          child: noDate == true
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
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 4.2 / 3,
                                    mainAxisSpacing:
                                        AppDimensions.width10(context) * 1.4,
                                    crossAxisSpacing: 0.1,
                                  ),
                                  itemCount: practiceName!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AnimatedScaleButton(
                                              onTap: () async {
                                                final SharedPreferences prefs =
                                                    await _prefs;

                                                await prefs.setString(
                                                    'goalColor', color);
                                                await prefs.setString(
                                                  'pracName',
                                                  practiceName?[index]["name"],
                                                );
                                                await prefs.setInt(
                                                  'pracId',
                                                  practiceName?[index]["id"],
                                                );
                                                Navigator.push(
                                                  context,
                                                  FadePageRoute2(
                                                    true,
                                                    exitPage:
                                                        const CreatePractice(),
                                                    enterPage:
                                                        const PracticeName(
                                                      comingFromEditScreen:
                                                          false,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: circles(
                                                  circle_text:
                                                      practiceName![index]
                                                          ['name'],
                                                  circle_color1: 0xFF83BB9A,
                                                  circle_color2: 0xFF1E4A22,
                                                  circle_border: 3.0,
                                                  circle_bordercolor:
                                                      0xFFFFFFFF,
                                                  circle_height:
                                                      AppDimensions.width10(
                                                              context) *
                                                          13.4,
                                                  circle_width:
                                                      AppDimensions.width10(
                                                              context) *
                                                          13.4,
                                                  textfont:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.6,
                                                  textcolor: 0xFFFFFFFF),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                        ),
                        SizedBox(height: AppDimensions.height10(context)*5,)
                      ],
                    ),
                  )
                : const Create_practice_shimmer(),
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
                  left: AppDimensions.width10(context) * 2.2,
                  right: AppDimensions.width10(context) * 2.2),
              height: AppDimensions.height10(context) * 7.0,
              //width: AppDimensions.width10(context) * 41.4,
              child: searchIcon == true
                  ? Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: AppDimensions.height10(context) * 3.6,
                                width: AppDimensions.width10(context) * 31.3,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF767680)
                                        .withOpacity(0.12),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            AppDimensions.height10(context)))),
                                child: Center(
                                  child: TextFormField(
                                      controller: _searchController,
                                      textCapitalization: TextCapitalization
                                          .sentences,
                                      onChanged: (value) {
                                        setState(() {
                                          searchText = value;
                                          _searchPractice(value);
                                        });
                                      },
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(
                                              0.0),
                                          prefixIcon: Image.asset(
                                            'assets/images/Light.webp',
                                            width:
                                                AppDimensions.width10(context) *
                                                    1.5,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.5,

                                            // fit: BoxFit.contain,
                                            // fit: BoxFit.contain,
                                          ),
                                          suffixIcon: AnimatedScaleButton(
                                            onTap: () {
                                              _searchController.clear();
                                              _searchPractice('');
                                              searchText = '';
                                              setState(() {
                                                noDate = false;
                                              });
                                            },
                                            child: Image.asset(
                                              'assets/images/cancel.webp',
                                              width: AppDimensions.width10(
                                                      context) *
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
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent)),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent)))),
                                ),
                              ),
                            ],
                          ),
                          // fit: BoxFit.contain,
                          // fit: BoxFit.contain,

                          AnimatedScaleButton(
                            onTap: () {
                              setState(() {
                                searchIcon = false;
                                _searchPractice('');
                                _searchController.clear();
                                searchText = '';
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
                  //const Padding(padding: EdgeInsets.all(10))

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
                                child: AnimatedScaleButton(
                                  onTap: () {
                                    bottom_sheet(context, mygoal);
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
                                AppText().createNewPractice,
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

              //const Padding(padding: EdgeInsets.all(10))
            ),
          ),
        ),
      ),
    );
  }
}
