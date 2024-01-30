import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_statement.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/tutorialBottomSheet.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../Dashboard Behaviour/dashboard_view_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class landing_hurdles extends StatefulWidget {
  const landing_hurdles({super.key});

  @override
  State<landing_hurdles> createState() => _landing_hurdlesState();
}

class _landing_hurdlesState extends State<landing_hurdles> {
  var hurdlesList;
  var hurdlesListName;
  List hurdleName = [];
  bool deleteAll = false;
  bool noData = false;
  bool longPress = false;
  bool searchIcon = false;
  var goals = [];
  int search = 0;
  int goalId = 0;
  int hurdleId = 0;
  List goalName = [];
  var allHurdle;
  bool loading = true;
  var Route;

  final TextEditingController _searchController = TextEditingController();

  void getHurdleRoute() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Route = prefs.getString('HurdleRoute');
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

  void searchHurdles(String searchText) {
    var searchTerm = allHurdle.where((hurdle) => hurdle["hurdleName"]
        .toString()
        .toLowerCase()
        .contains(searchText.toLowerCase()));

    setState(() {
      hurdlesList = searchTerm.toList();
    });
    if (searchTerm.toList().length == 0) {
      setState(() {
        noData = true;
      });
    } else {
      setState(() {
        noData = false;
      });
    }
  }

  void _fetchHurdle() async {
    Hurdles().getUserHurdles().then((response) {
      if (response.length != 0 && response != 404) {
        setState(() {
          hurdlesList = response;
          allHurdle = response;
        });
        _fetchUserGoal();
        _fetchAllHurdle();
        loadData();
      } else if (response == 404) {
        setState(() {
          noData = true;
        });
        loadData();
      }
    }).catchError((error) {
      setState(() {
        noData = true;
      });
      _fetchUserGoal();
      _fetchAllHurdle();
      loadData();
    });
  }

  void filterTerm(searchTerm, goalId) {
    Hurdles().filterUserHurdles(searchTerm, goalId).then((response) {
      if (response != 404) {
        setState(() {
          hurdlesList = response;
          noData = false;
        });
      } else if (response == 404) {
        setState(() {
          noData = true;
        });
      } else {}
    });
  }

  List selectItems = [];
  void doMultiSelection(String path) {
    print('Double tapped $selectItems');
    //if (isMultiSelectionEnabled) {
    setState(() {
      if (selectItems.contains(path)) {
        selectItems.remove(path);
      } else {
        selectItems.add(path);
      }
    });
    if (selectItems.isEmpty) {
      setState(() {
        longPress = false;
      });
    }
    print('Double tapped $selectItems');
  }

  void selectAll() {
    if (!deleteAll) {
      setState(() {
        selectItems.clear();
        longPress = false;
      });
    } else {
      selectItems.clear();
      for (int i = 0; i < hurdlesList.length; i++) {
        selectItems.add(hurdlesList[i]['id'].toString());
      }
      setState(() {
        longPress = true;
      });
    }
  }

  void _fetchAllHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0 && response != false) {
        setState(() {
          hurdlesListName = response['hurdle'];
        });
        _newFunctionForHurdle();

        return response;
      } else if (response == false) {
        setState(() {
          noData = true;
        });
        loadData();
      }
    }).catchError((error) {});
  }

  void _fetchUserGoal() {
    AdminGoal.getUserGoalByUserId().then((response) {
      setState(() {
        goals = response;
      });
      _newFunction();
    });
  }

  _newFunction() {
    for (int i = 0; i <= goals.length; i++) {
      goalName.add(goals[i]['name']);
    }
  }

  deleteMult() {
    setState(() {
      loading = true;
    });
    Hurdles().deleteMulipleHurdle(selectItems).then((value) {
      if (value == true) {
        selectItems.clear();
        _fetchHurdle();
      }
    });
  }

  _newFunctionForHurdle() {
    for (int i = 0; i <= hurdlesListName.length; i++) {
      hurdleName.add(hurdlesListName[i]['hurdleName']);
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchHurdle();
    getHurdleRoute();
  }

  bool deleted = false;
  int selectedTag = 0;
  int goalIndex = 0;
  String selectedActivity = 'All';
  String selectedGoal = 'All';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            FadePageRouteReverse(
                page: const view_goals(
              missed: false,
              name: '',
              update: false,
              helpfulTips: false,
              record: 0,
            )));
        final SharedPreferences prefs = await _prefs;
        await prefs.remove('HurdleRoute');
        await prefs.remove('hurdleName');
        await prefs.remove('NameHurdle');
        await prefs.remove('hurdleStatement');
        await prefs.remove('hurdleId');
        await prefs.remove('selected_goals');
        await prefs.remove('feelingsList');
        await prefs.remove("hurdle_selected");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page: const view_goals(
                          missed: false,
                          name: '',
                          update: false,
                          helpfulTips: false,
                          record: 0,
                        )));
                    final SharedPreferences prefs = await _prefs;
                    await prefs.remove('HurdleRoute');
                    await prefs.remove('hurdleName');
                    await prefs.remove('NameHurdle');
                    await prefs.remove('hurdleStatement');
                    await prefs.remove('hurdleId');
                    await prefs.remove('selected_goals');
                    await prefs.remove('feelingsList');
                    await prefs.remove("hurdle_selected");
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    // width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
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
            // width: AppDimensions.width10(context) * 41.4,
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
                                    onChanged: (value) {
                                      setState(() {
                                        searchHurdles(value);
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
                                            _searchController.clear();
                                            setState(() {
                                              hurdlesList = allHurdle;
                                            });
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
                              _searchController.clear();
                              hurdlesList = allHurdle;
                              searchIcon = false;
                            });
                            print("allHurdle $hurdlesList");
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
                : Stack(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: AppDimensions.width10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                // padding: EdgeInsets.only(
                                //     top: AppDimensions.height10(context) * 0.5,
                                //     bottom: AppDimensions.height10(context) * 0.5),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/ic_filter_list.webp',
                                    width: AppDimensions.width10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context) * 0.5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                    ),
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  30.3,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.001),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            41.4,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    width: AppDimensions.width10(
                                                                            context) *
                                                                        0.1,
                                                                    color: const Color(
                                                                        0xFF828282)))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                margin: EdgeInsets.only(
                                                                    right: AppDimensions.height10(
                                                                            context) *
                                                                        2.0),
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.9,
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      color: const Color(
                                                                          0xFF2F80ED)),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedGoal =
                                                                      goalName[
                                                                          goalIndex];
                                                                  goalId = goals[
                                                                          index]
                                                                      ['id'];
                                                                });
                                                                filterTerm(
                                                                    hurdleId,
                                                                    goals[index]
                                                                        ['id']);

                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: SizedBox(
                                                                child: Text(
                                                                  'Done',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.9,
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      color: const Color(
                                                                          0xFF2F80ED)),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: AppDimensions
                                                                  .width10(
                                                                      context),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListWheelScrollView(
                                                          itemExtent: 40,
                                                          magnification: 1.3,
                                                          useMagnifier:
                                                              true, // Set the height of each statement
                                                          children: goalName
                                                              .map((statement) =>
                                                                  Text(
                                                                      statement,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            AppDimensions.font10(context) *
                                                                                2.0,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      )))
                                                              .toList(),
                                                          onSelectedItemChanged:
                                                              (int index) {
                                                            setState(() {
                                                              goalIndex = index;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Positioned(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        13.5,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    child: Align(
                                                      alignment:
                                                          const Alignment(0, 0),
                                                      child: Container(
                                                          width: 400,
                                                          height: 1,
                                                          color: const Color(
                                                                  0xFF828282)
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        18.0,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    child: Align(
                                                      alignment:
                                                          const Alignment(0, 0),
                                                      child: Container(
                                                          width: 400,
                                                          height: 1,
                                                          color: const Color(
                                                                  0xFF828282)
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  // width: AppDimensions.width10(context) * 11.5,
                                  height: AppDimensions.height10(context) * 3.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              1.0),
                                      border: Border.all(
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.1,
                                          color: const Color(0xFFE0E0E0))),
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.width10(context) * 1.3,
                                      right:
                                          AppDimensions.width10(context) * 1.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                AppDimensions.width10(context) *
                                                    1.0),
                                        child: Text(
                                          'Goal:',
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFA9934)),
                                        ),
                                      ),
                                      Container(
                                        //width: AppDimensions.width10(context) * 1.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        margin: EdgeInsets.only(
                                            left:
                                                AppDimensions.width10(context) *
                                                    0.8),
                                        child: Center(
                                          child: Text(
                                            selectedGoal,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.4,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA9934)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                0.8,
                                            right: AppDimensions.height10(
                                                    context) *
                                                1.0,
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.3),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffFA9934),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                    ),
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  30.3,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.001),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.0,
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            41.4,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                bottom: BorderSide(
                                                                    width: AppDimensions.width10(
                                                                            context) *
                                                                        0.1,
                                                                    color: const Color(
                                                                        0xFF828282)))),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                margin: EdgeInsets.only(
                                                                    right: AppDimensions.height10(
                                                                            context) *
                                                                        2.0),
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.9,
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      color: const Color(
                                                                          0xFF2F80ED)),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedActivity =
                                                                      hurdleName[
                                                                          selectedTag];
                                                                  hurdleId =
                                                                      hurdlesListName[
                                                                              selectedTag]
                                                                          [
                                                                          'id'];
                                                                  // search = hurdlesList[
                                                                  //         _selectedTag]
                                                                  //     ['hurdleId'];
                                                                });
                                                                filterTerm(
                                                                    hurdleId,
                                                                    goalId);

                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: SizedBox(
                                                                child: Text(
                                                                  'Done',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.9,
                                                                      height:
                                                                          AppDimensions.height10(context) *
                                                                              0.1,
                                                                      color: const Color(
                                                                          0xFF2F80ED)),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: AppDimensions
                                                                  .width10(
                                                                      context),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListWheelScrollView(
                                                          itemExtent: 40,
                                                          magnification: 1.3,
                                                          useMagnifier: true,
                                                          children: hurdleName
                                                              .map(
                                                                  (statement) =>
                                                                      Column(
                                                                        children: [
                                                                          Text(
                                                                              statement,
                                                                              style: TextStyle(
                                                                                fontSize: AppDimensions.height10(context) * 2.0,
                                                                                fontWeight: FontWeight.w400,
                                                                              )),
                                                                        ],
                                                                      ))
                                                              .toList(),
                                                          onSelectedItemChanged:
                                                              (int index) {
                                                            setState(() {
                                                              selectedTag =
                                                                  index;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Positioned(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        13.5,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    child: Align(
                                                      alignment:
                                                          const Alignment(0, 0),
                                                      child: Container(
                                                          width: 400,
                                                          height: 1,
                                                          color: const Color(
                                                                  0xFF828282)
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        18.0,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.0,
                                                    child: Align(
                                                      alignment:
                                                          const Alignment(0, 0),
                                                      child: Container(
                                                          width: 400,
                                                          height: 1,
                                                          color: const Color(
                                                                  0xFF828282)
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  //width: AppDimensions.width10(context) * 11.6,
                                  height: AppDimensions.height10(context) * 3.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              1.0),
                                      border: Border.all(
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.1,
                                          color: const Color(0xFFE0E0E0))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                AppDimensions.width10(context) *
                                                    1.0),
                                        child: Text(
                                          'Type:',
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFA9934)),
                                        ),
                                      ),
                                      Container(
                                        // width: AppDimensions.width10(context) * 1.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        margin: EdgeInsets.only(
                                            left:
                                                AppDimensions.width10(context) *
                                                    0.8),
                                        child: Center(
                                          child: Text(
                                            selectedActivity,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.4,
                                                fontWeight: FontWeight.w700,
                                                color: const Color(0xffFA9934)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.width10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                0.8,
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                0.3,
                                            right:
                                                AppDimensions.width10(context) *
                                                    1.0),
                                        child: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffFA9934),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedScaleButton(
                                onTap: () {
                                  setState(() {
                                    hurdlesList = allHurdle;
                                    noData = false;
                                    hurdleId = 0;
                                    goalId = 0;
                                    selectedActivity = "All";
                                    selectedGoal = 'All';
                                  });
                                },
                                child: Container(
                                  //width: AppDimensions.width10(context) * 3.9,
                                  height: AppDimensions.height10(context) * 3.4,
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.width10(context) * 1.0,
                                      right:
                                          AppDimensions.width10(context) * 7.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Clear All',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xFFFA9934)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: AppDimensions.width10(context) * 5.0,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFFBFBFB)),
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
                      ),

                      //const Padding(padding: EdgeInsets.all(10))
                    ],
                  ),
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/practicebackground.webp'),
              fit: BoxFit.cover,
            )),
            child: loading == false
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 7.5,
                                left: AppDimensions.width10(context) * 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right:
                                          AppDimensions.width10(context) * 2.0),
                                  child: GradientText(
                                    'My faced hurdles ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 3.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colors: const [
                                      Color(0xffFA9934),
                                      Color(0xffEDD15E)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right:
                                          AppDimensions.width10(context) * 2.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GradientText(
                                        '& obstacles ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  3.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        colors: const [
                                          Color(0xffFA9934),
                                          Color(0xffEDD15E)
                                        ],
                                      ),
                                      AnimatedScaleButton(
                                        onTap: () {
                                          //hurdleSheet(context);
                                          journeyBottomSheet(
                                              context,
                                              AppText().hurdleBottomSheedTitle,
                                              AppText().hurdleBottomSheedBody,
                                              AppText().hurdleTutorialLink);
                                        },
                                        child: Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    3.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.0,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/ic_info_outline_orange.webp')))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        AnimatedScaleButton(
                          onTap: () async {
                            if (Route == 'Impact') {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const hurdles_goal_impact(
                                  summary: false,
                                )),
                              );
                            } else if (Route == 'Select') {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const select_hurdle(update: false)),
                              );
                            } else if (Route == 'Name') {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const hurdle_name(update: false)),
                              );
                            } else if (Route == 'Statements') {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page:
                                        const hurdle_statement(update: false)),
                              );
                            } else if (Route == 'Feelings') {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const felling_hurdles(
                                  update: false,
                                )),
                              );
                            } else {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const hurdles_goal_impact(
                                  summary: false,
                                )),
                              );
                              final SharedPreferences prefs = await _prefs;
                              await prefs.remove('HurdleRoute');
                            }
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 21.6,
                            height: AppDimensions.height10(context) * 23.5,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/addHurdle.webp'),
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ),
                        selectItems.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 1.5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GradientText(
                                          'Select All',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.8,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          colors: const [
                                            Color(0xffFA9934),
                                            Color(0xffEDD15E)
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors
                                                  .white, // Set the border color to white
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                deleteAll = !deleteAll;
                                              });
                                              selectAll();
                                            },
                                            borderRadius: BorderRadius.circular(
                                                50.0), // Set the borderRadius to make it circular
                                            child: Container(
                                              width:
                                                  20.0, // Set the size of the circular checkbox
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: deleteAll
                                                    ? Colors.white
                                                    : Colors
                                                        .transparent, // Set the background color when selected
                                              ),
                                              child: deleteAll
                                                  ? const Icon(
                                                      Icons.check,
                                                      size: 16.0,
                                                      color: Color(
                                                          0xffFA9934), // Set the check mark color
                                                    )
                                                  : null, // Show the check mark icon only when selected
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            selectItems.clear();
                                            setState(() {
                                              deleteAll = false;
                                            });
                                          },
                                          child: GradientText(
                                            'Clear',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            colors: const [
                                              Color(0xffFA9934),
                                              Color(0xffEDD15E)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        AnimatedScaleButton(
                                          onTap: () {
                                            deleteMult();
                                          },
                                          child: GradientText(
                                            'Delete',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            colors: const [
                                              Color(0xffFA9934),
                                              Color(0xffEDD15E)
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                        noData == true
                            ? Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 4.0),
                                width: AppDimensions.width10(context) * 26,
                                child: Center(
                                    child: Text(
                                  'There are no recorded hurdle',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xFFFBFBFB),
                                      fontSize:
                                          AppDimensions.font10(context) * 3),
                                )),
                              )
                            : Container(
                                //height: AppDimensions.height10(context) * 45,
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) * 4,
                                    bottom:
                                        AppDimensions.height10(context) * 10),
                                //color: Colors.red,
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                      top: 0,
                                      bottom:
                                          AppDimensions.height10(context) * 5,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          1.0, // Two items in each row

                                      mainAxisSpacing: 0.0,
                                      crossAxisSpacing: 0.0,
                                    ),
                                    itemCount: hurdlesList.length,
                                    itemBuilder: (context, index) {
                                      bool selected = selectItems.contains(
                                          hurdlesList[index]['id'].toString());
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MulitiSelectionButton(
                                                longPress: () {
                                                  print(
                                                      "Hurdle List $hurdlesList");
                                                  setState(() {
                                                    longPress = true;
                                                  });
                                                  doMultiSelection(
                                                      hurdlesList[index]['id']
                                                          .toString());
                                                },
                                                onTap: () async {
                                                  if (longPress) {
                                                    doMultiSelection(
                                                        hurdlesList[index]['id']
                                                            .toString());
                                                  } else {
                                                    final SharedPreferences
                                                        prefs = await _prefs;

                                                    await prefs.setInt(
                                                        'userHurdleId',
                                                        hurdlesList[index]
                                                            ['id']);
                                                    Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page:
                                                              const hurdle_menu()),
                                                    );
                                                  }
                                                },
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .topEnd,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        doMultiSelection(
                                                            hurdlesList[index]
                                                                    ['id']
                                                                .toString());
                                                      },
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0), // Set the borderRadius to make it circular
                                                      child: Container(
                                                        width:
                                                            20.0, // Set the size of the circular checkbox
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: selectItems
                                                                      .isNotEmpty
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .transparent),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: selected
                                                              ? Colors.white
                                                              : Colors
                                                                  .transparent, // Set the background color when selected
                                                        ),
                                                        child: selected
                                                            ? const Icon(
                                                                Icons.check,
                                                                size: 16.0,
                                                                color: Color(
                                                                    0xffFA9934), // Set the check mark color
                                                              )
                                                            : null, // Show the check mark icon only when selected
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              19.313,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          19.942,
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: AppDimensions
                                                                  .width10(
                                                                      context) *
                                                              1.5),
                                                      decoration:
                                                          const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/black_hole.webp'),
                                                                // colorFilter: ColorFilter.mode(
                                                                //     selectItems.contains(
                                                                //             hurdlesList[index]
                                                                //                     [
                                                                //                     'id']
                                                                //                 .toString())
                                                                //         ? Colors.black
                                                                //             .withOpacity(
                                                                //                 0.8)
                                                                //         : Colors
                                                                //             .transparent,
                                                                //     BlendMode
                                                                //         .color)
                                                              )),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: AppDimensions
                                                                    .width10(
                                                                        context) *
                                                                14.0,
                                                            child: Text(
                                                              capitalizeFirstLetter(
                                                                  hurdlesList[
                                                                          index]
                                                                      [
                                                                      'hurdleName']),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFFFFFFFF),
                                                                  fontSize:
                                                                      AppDimensions.font10(
                                                                              context) *
                                                                          1.8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                top: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.6),
                                                            width: AppDimensions
                                                                    .width10(
                                                                        context) *
                                                                15.7,
                                                            child: Text(
                                                              capitalizeFirstLetter(
                                                                  hurdlesList[
                                                                          index]
                                                                      [
                                                                      'triggerStatment']),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 4,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color: const Color(
                                                                      0xFFFFFFFF),
                                                                  fontSize:
                                                                      AppDimensions.font10(
                                                                              context) *
                                                                          1.6,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                      ],
                    ),
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  )),
      ),
    );
  }
}

class hurdle_menu extends StatefulWidget {
  const hurdle_menu({super.key});

  @override
  State<hurdle_menu> createState() => _hurdle_menuState();
}

class _hurdle_menuState extends State<hurdle_menu> {
  var hurdlesSummary;
  bool loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void checkHurdle() async {
    Hurdles().checkUserHurdles().then((response) {
      if (response == true) {
        Navigator.push(
          context,
          FadePageRouteReverse(page: const landing_hurdles()),
        );

        return response;
      } else if (response == false) {
        Navigator.push(
            context, FadePageRouteReverse(page: const hurdles_splash()));
      }
    }).catchError((error) {});
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesSummary = response['hurdle'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  @override
  void initState() {
    super.initState();
    _fetchHurdleSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.5),
          child: Text(
            'Menu',
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 2.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xfffbfbfb)),
          ),
        ),
        centerTitle: true,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                //width: AppDimensions.width10(context) * 3.0,
                height: AppDimensions.height10(context) * 3.0,
                fit: BoxFit.contain,
              )),
        ),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Close.webp',
                  //  width: AppDimensions.width10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/practicebackground.webp'),
          fit: BoxFit.cover,
        )),
        child: loading == false
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppDimensions.height10(context) * 11.255,
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 17.62,
                    height: AppDimensions.height10(context) * 17.33,
                    padding:
                        EdgeInsets.all(AppDimensions.width10(context) * 2.3),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/black_hole.webp'))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: AppDimensions.width10(context) * 7.1,
                          // height: AppDimensions.height10(context) * 1.9,
                          child: Text(
                            capitalizeFirstLetter(hurdlesSummary['hurdleName']),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFFFBFBFB),
                                fontSize: AppDimensions.font10(context) * 1.8,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          // width: AppDimensions.width10(context) * 7.471,
                          // height: AppDimensions.height10(context) * 4.38,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.773),
                          child: Text(
                            capitalizeFirstLetter(
                                hurdlesSummary['triggerStatment']),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFFFBFBFB),
                                fontSize: AppDimensions.font10(context) * 1.6,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 7.313,
                  ),
                  SizedBox(
                    width: AppDimensions.width10(context) * 32.0,
                    height: AppDimensions.height10(context) * 3.0,
                    // margin:
                    //     EdgeInsets.only(top: AppDimensions.height10(context) * 7.313),
                    child: Center(
                        child: Text(
                      'What do you want to do?',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 36.0,
                    height: AppDimensions.height10(context) * 21.5,
                    margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 3.4,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScaleButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const summary_hurdles(
                                delete_hurdle: true,
                              )),
                            );
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 36.0,
                            height: AppDimensions.height10(context) * 6.0,
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AppDimensions.width10(context) * 23.9,
                                  height: AppDimensions.height10(context) * 2.2,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.width10(context) *
                                          1.99),
                                  child: Text(
                                    'View/Edit details',
                                    style: TextStyle(
                                      color: const Color(0xFF646464),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: AppDimensions.width10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.width10(context) *
                                            2.391),
                                    child: Image.asset(
                                      'assets/images/BTN Back.webp',
                                      //width: AppDimensions.width10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 17.0,
                          height: AppDimensions.height10(context) * 0.5,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 36.0,
                          height: AppDimensions.height10(context) * 6.0,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: AppDimensions.width10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                  right: AppDimensions.width10(context) * 0.5,
                                ),
                                child: const Icon(
                                  Icons.share,
                                  color: Color(0xff646464),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context) * 5.0,
                                height: AppDimensions.height10(context) * 2.2,
                                child: Center(
                                    child: Text(
                                  'Share',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF646464)),
                                )),
                              ),
                            ],
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            return showAnimatedDialog(
                                animationType: DialogTransitionType.fadeScale,
                                curve: Curves.easeInOut,
                                duration: const Duration(seconds: 1),
                                context: context,
                                builder: (BuildContext context) => SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 27.0,
                                      height: AppDimensions.height10(context) *
                                          21.4,
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
                                                    1.4)),
                                        contentPadding: EdgeInsets.zero,
                                        actionsPadding: EdgeInsets.zero,
                                        titlePadding: EdgeInsets.zero,
                                        title: Container(
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(context) *
                                                    1.9,
                                                right: AppDimensions.width10(context) *
                                                    1.6,
                                                left: AppDimensions.width10(context) *
                                                    1.6,
                                                bottom:
                                                    AppDimensions.height10(context) *
                                                        0.2),
                                            height:
                                                AppDimensions.height10(context) *
                                                    4.4,
                                            width: AppDimensions.width10(context) *
                                                23.8,
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontFamily: 'laila',
                                                        height:
                                                            AppDimensions.height10(context) *
                                                                0.15,
                                                        fontSize: AppDimensions.font10(context) * 1.6,
                                                        fontWeight: FontWeight.w400,
                                                        color: const Color(0xFF000000)),
                                                    children: const [
                                                      TextSpan(
                                                          text:
                                                              'Are you sure you want\nto'),
                                                      TextSpan(
                                                        text: ' delete ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      TextSpan(
                                                          text: 'this hurdle?')
                                                    ]))),
                                        content: Container(
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  AppDimensions.height10(
                                                          context) *
                                                      1.5,
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              right: AppDimensions.height10(
                                                      context) *
                                                  1.6),
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          width:
                                              AppDimensions.width10(context) *
                                                  23.8,
                                          child: Text(
                                            "By clicking 'Yes' you confirm that this\nhurdle will be deleted permanently. ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFF000000),
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              Container(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.2,
                                                width: double.infinity,
                                                color: const Color(0xFF007AFF),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.4,
                                                width: double.infinity,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Hurdles()
                                                        .deleteUserHurdle(
                                                            hurdlesSummary[
                                                                'id'])
                                                        .then((response) {
                                                      if (response == true) {
                                                        checkHurdle();

                                                        // Navigator.push(
                                                        //     context,
                                                        //     FadePageRoute(
                                                        //         page:
                                                        //             const landing_hurdles()));
                                                      }
                                                    });
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.7,
                                                        fontFamily: "Laila",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF007AFF)),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                child: Divider(
                                                  color: const Color(0XFF3C3C43)
                                                      .withOpacity(0.29),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 36.0,
                            height: AppDimensions.height10(context) * 6.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: AppDimensions.width10(context) * 0.1,
                                    color: const Color(0xFFFFFFFF)),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xff464646)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.width10(context) * 2.4,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.height10(context) * 0.5,
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Color(0XFFFFFFFF),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.width10(context) * 5.3,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: Center(
                                      child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffffffff)),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              ),
      ),
    );
  }
}

// _showBottomSheet(BuildContext context) {
//   String goal = 'Goal Name';

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(16),
//       ),
//     ),
//     builder: (context) {
//       return GestureDetector(
//         onTap: () => Navigator.of(context).pop(),
//         child: Container(
//           height: AppDimensions.height10(context) * 30.3,
//           color: const Color.fromRGBO(0, 0, 0, 0.001),
//           child: GestureDetector(
//             onTap: () {},
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     height: AppDimensions.height10(context) * 4.0,
//                     width: AppDimensions.width10(context) * 41.4,
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 width: AppDimensions.width10(context) * 0.1,
//                                 color: const Color(0xFF828282)))),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(
//                                 right: AppDimensions.width10(context) * 2.0),
//                             child: Text(
//                               'Cancel',
//                               style: TextStyle(
//                                   fontSize: AppDimensions.font10(context) * 1.4,
//                                   fontWeight: FontWeight.w400,
//                                   color: const Color(0xFF2F80ED)),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Text(
//                             'Done',
//                             style: TextStyle(
//                                 fontSize: AppDimensions.font10(context) * 1.9,
//                                 height: AppDimensions.height10(context) * 0.1,
//                                 color: const Color(0xFF2F80ED)),
//                           ),
//                         ),
//                         SizedBox(
//                           width: AppDimensions.width10(context),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: AppDimensions.width10(context) * 37.5,
//                     height: AppDimensions.height10(context) * 24.8,
//                     // color: Colors.amber,
//                     child: ListWheelScrollView(
//                         onSelectedItemChanged: (value) {},
//                         diameterRatio: 1.5,
//                         // magnification: 1.5,
//                         overAndUnderCenterOpacity: 0.5,
//                         itemExtent: AppDimensions.height10(context) * 3.1,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 'All',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 '$goal 1',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 '$goal 2',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 '$goal 3',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           )
//                         ]),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

// _showTagSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(16),
//       ),
//     ),
//     builder: (context) {
//       return GestureDetector(
//         onTap: () => Navigator.of(context).pop(),
//         child: Container(
//           height: AppDimensions.height10(context) * 30.3,
//           color: const Color.fromRGBO(0, 0, 0, 0.001),
//           child: GestureDetector(
//             onTap: () {},
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     height: AppDimensions.height10(context) * 4.0,
//                     width: AppDimensions.width10(context) * 41.4,
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 width: AppDimensions.width10(context) * 0.1,
//                                 color: const Color(0xFF828282)))),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(
//                                 right: AppDimensions.width10(context) * 2.0),
//                             child: Text(
//                               'Cancel',
//                               style: TextStyle(
//                                   fontSize: AppDimensions.font10(context) * 1.4,
//                                   fontWeight: FontWeight.w400,
//                                   color: const Color(0xFF2F80ED)),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           child: Text(
//                             'Done',
//                             style: TextStyle(
//                                 fontSize: AppDimensions.font10(context) * 1.9,
//                                 height: AppDimensions.height10(context) * 0.1,
//                                 color: const Color(0xFF2F80ED)),
//                           ),
//                         ),
//                         SizedBox(
//                           width: AppDimensions.width10(context),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: AppDimensions.width10(context) * 37.5,
//                     height: AppDimensions.height10(context) * 24.8,
//                     // color: Colors.amber,
//                     child: ListWheelScrollView(
//                         onSelectedItemChanged: (value) {},
//                         diameterRatio: 1.5,
//                         //magnification: 1.1,
//                         overAndUnderCenterOpacity: 0.5,
//                         itemExtent: AppDimensions.height10(context) * 3.1,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 'All',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 'People / person 1',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 'Negative thought 2',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     bottom: BorderSide(
//                                         width: AppDimensions.width10(context) *
//                                             0.1,
//                                         color: const Color(0xFF828282)))),
//                             child: Center(
//                               child: Text(
//                                 'Place 3',
//                                 style: TextStyle(
//                                     fontSize:
//                                         AppDimensions.font10(context) * 2.2,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           )
//                         ]),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }

void hurdleSheet(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.width10(context) * 40,
          //height: AppDimensions.height10(context) * 57.7,
          padding: EdgeInsets.only(bottom: AppDimensions.height10(context) * 3),
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: AnimatedScaleButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.9,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                // width: AppDimensions.width10(context) * 28.7,
                //height: AppDimensions.height10(context) * 3.4,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'My faced hurdle\n& obstacles',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      height: AppDimensions.height10(context) * .16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 33.2,
                //height: AppDimensions.height10(context) * 26.9,
                //color: Colors.grey,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 1.2,
                ),
                child: Text(
                  'This is your private space to capture any obstacles that may divert you of course.\n\nAt Potenic, our aim is to empower you to own and enjoy your personal development journey.\n\nWe want to help you stay focused and this is why we also want you to be prepared for challenges ahead, so you can build a self-reliance and grow awareness.\n\nWith time, you will start seeing patterns (with the help of Potenic’s frameworks) and will be more aware of situations that get you triggered.',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      //height: AppDimensions.height10(context) * 0.14,
                      //letterSpacing: AppDimensions.height10(context) * 0.12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 37.5,
                height: AppDimensions.height10(context) * 5,
                decoration: BoxDecoration(
                    color: const Color(0xFFFBFBFB),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Watch Demo',
                      style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF646464),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ),
  );
}
