import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

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
  bool Loading = true;
  var goals = [];
  List goalName = [];

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchHurdle() async {
    Hurdles().getUserHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesList = response;
        });
        _fetchUserGoal();
        _fetchAllHurdle();
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("Hello world error");
    });
  }

  void _fetchAllHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesListName = response['hurdle'];
        });
        _newFunctionForHurdle();

        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("Hell error");
    });
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
    print('FunctionCalled');
    for (int i = 0; i <= goals.length; i++) {
      goalName.add(goals[i]['name']);
    }
  }

  _newFunctionForHurdle() {
    print('Second FunctionCalled');
    for (int i = 0; i <= hurdlesListName.length; i++) {
      hurdleName.add(hurdlesListName[i]['hurdleName']);
    }
  }

  @override
  void initState() {
    super.initState();
    print(
        "---------------------------------------------------------------------");
    _fetchHurdle();
  }

  bool deleted = false;
  @override
  int _selectedTag = 0;
  int _Goal_Index = 0;
  String _selected_activity = 'All';
  String _selected_goal = 'All';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Close.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
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
          padding: EdgeInsets.only(
              left: AppDimensions.height10(context) * 2.2,
              right: AppDimensions.height10(context) * 2.2),
          height: AppDimensions.height10(context) * 7.0,
          // width: AppDimensions.height10(context) * 41.4,
          child: Stack(
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
                        width: AppDimensions.height10(context) * 2.4,
                        height: AppDimensions.height10(context) * 2.4,
                        // padding: EdgeInsets.only(
                        //     top: AppDimensions.height10(context) * 0.5,
                        //     bottom: AppDimensions.height10(context) * 0.5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/ic_filter_list.webp',
                            width: AppDimensions.height10(context) * 2.4,
                            height: AppDimensions.height10(context) * 2.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context) * 0.5,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  height:
                                      AppDimensions.height10(context) * 30.3,
                                  color: const Color.fromRGBO(0, 0, 0, 0.001),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.0,
                                            width: AppDimensions.height10(
                                                    context) *
                                                41.4,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.1,
                                                        color: const Color(
                                                            0xFF828282)))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.0,
                                                    margin: EdgeInsets.only(
                                                        right: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF2F80ED)),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _selected_goal =
                                                          goalName[_Goal_Index];
                                                    });

                                                    Navigator.pop(context);
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            3.7,
                                                    child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF2F80ED)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: ListWheelScrollView(
                                              itemExtent: 40,
                                              magnification: 1.2,
                                              useMagnifier:
                                                  true, // Set the height of each statement
                                              children: goalName
                                                  .map((statement) =>
                                                      Text(statement,
                                                          style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )))
                                                  .toList(),
                                              onSelectedItemChanged:
                                                  (int index) {
                                                setState(() {
                                                  _Goal_Index = index;
                                                });
                                              },
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
                          // width: AppDimensions.height10(context) * 11.5,
                          height: AppDimensions.height10(context) * 3.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 1.0),
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xFFE0E0E0))),
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.3,
                              right: AppDimensions.height10(context) * 1.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 1.0),
                                child: Text(
                                  'Goal:',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffFA9934)),
                                ),
                              ),
                              Container(
                                //width: AppDimensions.height10(context) * 1.9,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 0.8),
                                child: Center(
                                  child: Text(
                                    _selected_goal,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 0.8,
                                    right:
                                        AppDimensions.height10(context) * 1.0,
                                    bottom:
                                        AppDimensions.height10(context) * 0.3),
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
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  height:
                                      AppDimensions.height10(context) * 30.3,
                                  color: const Color.fromRGBO(0, 0, 0, 0.001),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                4.0,
                                            width: AppDimensions.height10(
                                                    context) *
                                                41.4,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.1,
                                                        color: const Color(
                                                            0xFF828282)))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.0,
                                                    margin: EdgeInsets.only(
                                                        right: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0),
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF2F80ED)),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _selected_activity =
                                                          hurdleName[
                                                              _selectedTag];
                                                    });
                                                    print('asf');
                                                    Navigator.pop(context);
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            3.7,
                                                    child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF2F80ED)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: ListWheelScrollView(
                                              itemExtent: 40,
                                              magnification: 1.2,
                                              useMagnifier: true,
                                              children: hurdleName
                                                  .map((statement) =>
                                                      Text(statement,
                                                          style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )))
                                                  .toList(),
                                              onSelectedItemChanged:
                                                  (int index) {
                                                setState(() {
                                                  _selectedTag = index;
                                                });
                                              },
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
                          //width: AppDimensions.height10(context) * 11.6,
                          height: AppDimensions.height10(context) * 3.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 1.0),
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xFFE0E0E0))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 1.0),
                                child: Text(
                                  'Type:',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffFA9934)),
                                ),
                              ),
                              Container(
                                // width: AppDimensions.height10(context) * 1.9,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                    left:
                                        AppDimensions.height10(context) * 0.8),
                                child: Center(
                                  child: Text(
                                    _selected_activity,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                              ),
                              Container(
                                width: AppDimensions.height10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 0.8,
                                    bottom:
                                        AppDimensions.height10(context) * 0.3,
                                    right:
                                        AppDimensions.height10(context) * 1.0),
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
                        onTap: () {},
                        child: Container(
                          //width: AppDimensions.height10(context) * 3.9,
                          height: AppDimensions.height10(context) * 3.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.0,
                              right: AppDimensions.height10(context) * 7.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                color:
                                    const Color(0xFFFA9934).withOpacity(0.30)),
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
                  width: AppDimensions.height10(context) * 4.9,
                  height: AppDimensions.height10(context) * 5.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFBFBFB)),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/Search.webp',
                      width: AppDimensions.height10(context) * 5,
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
          child: Loading == false
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                        'assets/images/capture_hurdles_landing_goals.webp'),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (deleted == false) {
                            setState(() {
                              deleted = true;
                            });
                          } else {
                            Navigator.push(
                              context,
                              FadePageRoute(page: const hurdles_splash()),
                            );
                          }
                        },
                        child: Container(
                            width: AppDimensions.height10(context) * 34.3,
                            height: AppDimensions.height10(context) * 8.2,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 7.5,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GradientText(
                                  'My faced hurdles ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 3.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  colors: const [
                                    Color(0xffFA9934),
                                    Color(0xffEDD15E)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientText(
                                      '& obstacles ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      colors: const [
                                        Color(0xffFA9934),
                                        Color(0xffEDD15E)
                                      ],
                                    ),
                                    Container(
                                        width: AppDimensions.height10(context) *
                                            3.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                3.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(deleted
                                                    ? 'assets/images/ic_info_outline_orange.webp'
                                                    : 'assets/images/ic_info_outline.webp')))),
                                  ],
                                )
                              ],
                            )),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 9.8,
                        height: AppDimensions.height10(context) * 2.2,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.6,
                            left: AppDimensions.height10(context) * 0.5),
                        child: Text('New hurdle',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: 'laila')),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.0,
                              left: AppDimensions.height10(context) * 0.4),
                          child: Icon(
                            Icons.add,
                            size: AppDimensions.height10(context) * 5.6,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10(context) * 45,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 14),
                        child: SingleChildScrollView(
                          child: GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                top: 0,
                                bottom: AppDimensions.height10(context) * 5,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio:
                                    3.5 / 3, // Two items in each row

                                mainAxisSpacing: 1.0,
                                crossAxisSpacing: 0.1,
                              ),
                              itemCount: hurdlesList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedScaleButton(
                                          onTap: () async {
                                            final SharedPreferences prefs =
                                                await _prefs;

                                            var hurdleId = prefs.setInt(
                                                'userHurdleId',
                                                hurdlesList[index]['id']);
                                            Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: const hurdle_menu()),
                                            );
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                17.6,
                                            height: AppDimensions.height10(
                                                    context) *
                                                18.207,
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppDimensions.height10(
                                                        context)),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/black_hole.webp'))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      7.1,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.9,
                                                  child: Text(
                                                    hurdlesList[index]
                                                        ['hurdleName'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.6,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.6),
                                                  child: Text(
                                                    hurdlesList[index]
                                                        ['triggerStatment'],
                                                    textAlign: TextAlign.center,
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        ),
                      )
                    ],
                  ))
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                )),
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
  bool Loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesSummary = response['hurdle'];
        });
        print(hurdlesSummary["id"]);
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
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
                fontSize: AppDimensions.height10(context) * 2.0,
                fontWeight: FontWeight.w600,
                color: const Color(0xfffbfbfb)),
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Close.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
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
        child: Loading == false
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppDimensions.height10(context) * 11.255,
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 17.62,
                    height: AppDimensions.height10(context) * 17.33,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.height10(context)),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/black_hole.webp'))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: AppDimensions.height10(context) * 7.1,
                          // height: AppDimensions.height10(context) * 1.9,
                          child: Text(
                            hurdlesSummary['hurdleName'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          // width: AppDimensions.height10(context) * 7.471,
                          // height: AppDimensions.height10(context) * 4.38,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.773),
                          child: Text(
                            hurdlesSummary['triggerStatment'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 7.313,
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 32.0,
                    height: AppDimensions.height10(context) * 2.6,
                    // margin:
                    //     EdgeInsets.only(top: AppDimensions.height10(context) * 7.313),
                    child: Center(
                        child: Text(
                      'What do you want to do?',
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
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
                            width: AppDimensions.height10(context) * 36.0,
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
                                  width: AppDimensions.height10(context) * 23.9,
                                  height: AppDimensions.height10(context) * 2.2,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.99),
                                  child: Text(
                                    'View/Edit details',
                                    style: TextStyle(
                                      color: const Color(0xFF646464),
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                    width:
                                        AppDimensions.height10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 1.39,
                                    margin: EdgeInsets.only(
                                        right: AppDimensions.height10(context) *
                                            2.391),
                                    child: Image.asset(
                                      'assets/images/BTN Back.webp',
                                      //width: AppDimensions.height10(context) * 2.6,
                                      //height: AppDimensions.height10(context) * 2.6,
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 17.0,
                          height: AppDimensions.height10(context) * 0.5,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 2.0),
                              color: Colors.white),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 36.0,
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
                                width: AppDimensions.height10(context) * 2.4,
                                height: AppDimensions.height10(context) * 2.4,
                                margin: EdgeInsets.only(
                                  right: AppDimensions.height10(context) * 0.5,
                                ),
                                child: const Icon(
                                  Icons.share,
                                  color: Color(0xff646464),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.height10(context) * 5.0,
                                height: AppDimensions.height10(context) * 2.2,
                                child: Center(
                                    child: Text(
                                  'Share',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF646464)),
                                )),
                              ),
                            ],
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            Hurdles()
                                .deleteUserHurdle(hurdlesSummary['id'])
                                .then((response) {
                              if (response == true) {
                                Navigator.push(context,
                                    FadePageRoute(page: landing_hurdles()));
                              }
                            });
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 36.0,
                            height: AppDimensions.height10(context) * 6.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFFFFFFFF)),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xff464646)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 2.4,
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
                                  width: AppDimensions.height10(context) * 5.3,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: Center(
                                      child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
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

_showBottomSheet(BuildContext context) {
  String goal = 'Goal Name';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: const Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.height10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

_showTagSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: const Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.height10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        //magnification: 1.1,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'People / person 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'Negative thought 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'Place 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
