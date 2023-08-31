import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';

import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_veiw_detail.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/video_access.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiratoinEdit/photoEdit.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiratoinEdit/videoEdit.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class inspiraton_goals extends StatefulWidget {
  final bool data_saved;
  final String route;
  final bool note;
  final bool update;
  final bool context;
  const inspiraton_goals(
      {super.key,
      required this.data_saved,
      required this.route,
      required this.note,
      required this.context,
      required this.update});

  @override
  State<inspiraton_goals> createState() => _inspiraton_goalsState();
}

List<int> selectedIndices = [];
List<int> selectedInActiveIndices = [];
List selectedGoals = [];
List multiGoals = [];
List allgoalsSelected = [];
bool selectAll = false;

class _inspiraton_goalsState extends State<inspiraton_goals> {
  var goals = [];
  int selectBox = -1;
  int selectinActive = -1;
  var inspirationDetails;
  List<Map<String, dynamic>> Active = [];
  List<Map<String, dynamic>> inActive = [];

  bool Loading = true;

  Future<void> saveGoalsToSharedPreferences(List goals) async {
    final SharedPreferences prefs = await _prefs;
    final encodedGoals = json.encode(goals);
    prefs.setString('selected_goals_inspiration', encodedGoals);
    print(allgoalsSelected);
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchUserGoal() {
    AdminGoal.getUserGoalByUserId().then((response) {
      setState(() {
        goals = response;
      });
      if (widget.update == true) {
        print('INSPIRATION CALLED');

        _fetchInspiration();
      }

      loadData();
      _newFunction();
    });
  }

  clear() {
    selectedInActiveIndices.clear();
    selectedIndices.clear();
    selectedGoals.clear();
    multiGoals.clear();
    allgoalsSelected.clear();
    setState(() {
      selectAll = false;
    });
  }

  _newFunction() {
    print('FunctionCalled');
    for (int i = 0; i <= goals.length; i++) {
      if (goals[i]['isActive'] == true) {
        Active.add(goals[i]);
        allgoalsSelected.add(goals[i]['id']);
      } else {
        inActive.add(goals[i]);
        allgoalsSelected.add(goals[i]['id']);
      }
    }
    print('FunctionEnd');
    print("Selected Goals =======================>$allgoalsSelected");
  }

  _sort() {
    print('2nd Function Called');
    for (int i = 0; i <= goals.length; i++) {
      if (goals[i]['isActive'] == true) {
        print('====Active===');
        if (inspirationDetails.contains(goals[i]['id'])) {
          multiGoals.add(goals[i]['id']);
          selectedIndices.add(Active.indexOf(goals[i]));
        }
      } else {
        print('====Inactive===');
        if (inspirationDetails.contains(goals[i]['id'])) {
          multiGoals.add(goals[i]['id']);
          selectedInActiveIndices.add(inActive.indexOf(goals[i]));
        }
      }
    }
  }

  void _fetchInspiration() {
    InspirationApi().getInspirationById().then((response) {
      print('Res=====================');
      if (response.length != 0) {
        setState(() {
          inspirationDetails = response['inspiration']['userGoalId'];
        });

        print('Goal================================>$inspirationDetails');
        _sort();
        loadData();
        print(selectedInActiveIndices);
        print(selectedIndices);

        return response;
      }

      // return null;
    });
  }

  var Route;

  void getInspirationRoute() async {
    final SharedPreferences prefs = await _prefs;
    print(prefs.getString('inspiration_saved_route'));
    setState(() {
      Route = prefs.getString('inspiration_saved_route').toString().isEmpty
          ? ''
          : prefs.getString('inspiration_saved_route');
    });
    if (prefs.getString('inspiration_saved_route') == null) {
      selectedInActiveIndices.clear();
      selectedIndices.clear();
      selectedGoals.clear();
      multiGoals.clear();
      allgoalsSelected.clear();
      setState(() {
        selectAll = false;
      });
    }

    print(
        "ROUTE:==================>${prefs.getString('inspiration_saved_route')}");
  }

  @override
  void initState() {
    super.initState();
    allgoalsSelected.clear();
    if (widget.update == true) {
      clear();
    } else {
      getInspirationRoute();
    }

    _fetchUserGoal();

    // if (widget.data_saved == false) {
    //   selectedInActiveIndices.clear();
    //   selectedIndices.clear();
    //   selectedGoals.clear();
    //   multiGoals.clear();
    //   allgoalsSelected.clear();
    //   setState(() {
    //     selectAll = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: widget.data_saved || widget.update
              ? Center(
                  child: IconButton(
                      onPressed: () {
                        widget.route == 'landing'
                            ? Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const inspiration_landing(
                                        is_Updated: false)),
                              )
                            : Navigator.pop(context);
                      },
                      icon: Image.asset(
                        'assets/images/Back.webp',
                        width: AppDimensions.height10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        fit: BoxFit.cover,
                      )),
                )
              : Container(),
          title: widget.data_saved || widget.update
              ? Container()
              : Container(
                  width: AppDimensions.height10(context) * 18.9,
                  height: AppDimensions.height10(context) * 2.4,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 7.5),
                  child: Row(
                    children: [
                      GradientText(
                        'Inspiration 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                      GradientText(
                        '/2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w400,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                    ],
                  ),
                ),
          actions: [
            widget.data_saved || widget.update
                ? Container()
                : Center(
                    child: IconButton(
                        onPressed: () {
                          showAnimatedDialog(
                              animationType: DialogTransitionType.fadeScale,
                              curve: Curves.easeInOut,
                              duration: const Duration(seconds: 1),
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 27.0,
                                    height:
                                        AppDimensions.height10(context) * 24.0,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  1.4)),
                                      contentPadding: EdgeInsets.zero,
                                      actionsPadding: EdgeInsets.zero,
                                      titlePadding: EdgeInsets.zero,
                                      title: Container(
                                        margin: const EdgeInsets.only(
                                            top: 19,
                                            right: 16,
                                            left: 16,
                                            bottom: 2),
                                        // height:
                                        //     AppDimensions.height10(context) * 2.2,
                                        width: AppDimensions.height10(context) *
                                            23.8,
                                        child: const Text(
                                          "Exit Inspiration?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      content: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 19, left: 16, right: 16),
                                        // height:
                                        //     AppDimensions.height10(context) * 1.6,
                                        width: 238,
                                        child: const Text(
                                          "Please select from the options below",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
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
                                              height: 42,
                                              width: double.infinity,
                                              color: Colors.white,
                                              child: TextButton(
                                                onPressed: () async {
                                                  if (selectAll == true) {
                                                    saveGoalsToSharedPreferences(
                                                        selectedGoals);
                                                  } else {
                                                    saveGoalsToSharedPreferences(
                                                        multiGoals);
                                                  }
                                                  InspirationApi()
                                                      .checkUserInspiration()
                                                      .then((response) {
                                                        if (response == true) {
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page: const inspiration_landing(
                                                                      is_Updated:
                                                                          false)));
                                                        } else if (response ==
                                                            false) {
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                      const inspiration_motivation(
                                                                goal_delete:
                                                                    false,
                                                              )));
                                                          // print(response.statusCode);
                                                        }
                                                      })
                                                      .catchError((error) {})
                                                      .whenComplete(() {});

                                                  final SharedPreferences
                                                      prefs = await _prefs;
                                                  var savedRoute = prefs.setString(
                                                      'inspiration_saved_route',
                                                      'goals_inspiration');
                                                },
                                                child: const Text(
                                                  'Exit & save progress',
                                                  style: TextStyle(
                                                      color: Color(0xFF007AFF),
                                                      fontSize: 17,
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
                                              height: 44,
                                              width: double.infinity,
                                              child: TextButton(
                                                onPressed: () async {
                                                  InspirationApi()
                                                      .checkUserInspiration()
                                                      .then((response) async {
                                                        if (response == true) {
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page: const inspiration_landing(
                                                                      is_Updated:
                                                                          false)));
                                                          selectedInActiveIndices
                                                              .clear();
                                                          selectedIndices
                                                              .clear();
                                                          selectedGoals.clear();
                                                          multiGoals.clear();
                                                          allgoalsSelected
                                                              .clear();
                                                          setState(() {
                                                            selectAll = false;
                                                          });
                                                          final SharedPreferences
                                                              prefs =
                                                              await _prefs;
                                                          var deleted =
                                                              prefs.remove(
                                                                  'inspiration_saved_route');
                                                        } else if (response ==
                                                            false) {
                                                          Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                      const inspiration_motivation(
                                                                goal_delete:
                                                                    false,
                                                              )));
                                                          final SharedPreferences
                                                              prefs =
                                                              await _prefs;
                                                          var deleted =
                                                              prefs.remove(
                                                                  'inspiration_saved_route');
                                                          selectedInActiveIndices
                                                              .clear();
                                                          selectedIndices
                                                              .clear();
                                                          selectedGoals.clear();
                                                          multiGoals.clear();
                                                          allgoalsSelected
                                                              .clear();
                                                          setState(() {
                                                            selectAll = false;
                                                          });
                                                          // print(response.statusCode);
                                                        }
                                                      })
                                                      .catchError((error) {})
                                                      .whenComplete(() {});
                                                },
                                                child: const Text(
                                                  'Exit & delete progress',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF007AFF)),
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
                                            Container(
                                              height: 42,
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                  bottom:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.0),
                                              color: Colors.white,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Cancel exit',
                                                  style: TextStyle(
                                                      color: Color(0xFF007AFF),
                                                      fontSize: 17,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                        },
                        icon: Image.asset(
                          'assets/images/Close.webp',
                          width: AppDimensions.height10(context) * 2.6,
                          height: AppDimensions.height10(context) * 2.6,
                          fit: BoxFit.cover,
                        )),
                  )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: Loading == false
            ? Column(children: [
                Container(
                  // width: AppDimensions.height10(context) * 36.0,
                  height: widget.route == 'details'
                      ? AppDimensions.height10(context) * 77.9
                      : AppDimensions.height10(context) * 67.9,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 9.3,
                    // left: AppDimensions.height10(context) * 3.0,
                    // right: AppDimensions.height10(context) * 2.4
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 34.3,
                            height: AppDimensions.height10(context) * 7.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 8.7),
                            child: Center(
                              //Text alingment changes
                              child: GradientText(
                                'Which goals is the\ninspiration for?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
                                  fontWeight: FontWeight.w700,
                                ),
                                colors: const [
                                  Color(0xffFA9934),
                                  Color(0xffEDD15E)
                                ],
                              ),
                            ),
                          ),
                          AnimatedScaleButton(
                            onTap: () {
                              if (widget.route != 'details') {
                                if (selectAll == false) {
                                  setState(() {
                                    selectAll = true;
                                    selectBox = -1;
                                    selectinActive = -1;

                                    selectedIndices.clear();
                                    selectedInActiveIndices.clear();
                                  });

                                  print(allgoalsSelected);
                                } else if (selectAll == true) {
                                  setState(() {
                                    selectAll = false;
                                    selectinActive = -1;
                                    selectBox = -1;
                                    selectedIndices.clear();
                                    selectedInActiveIndices.clear();
                                    selectedGoals.clear();
                                    multiGoals.clear();
                                  });
                                }
                              }
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 14.1,
                              height: AppDimensions.height10(context) * 14.1,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 2.1,
                                  right: AppDimensions.height10(context) * 19.8,
                                  top: AppDimensions.height10(context) * 2.9),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2,
                                      color: selectAll == true
                                          ? Colors.white
                                          : Colors.transparent)),
                              padding: EdgeInsets.all(
                                  AppDimensions.height10(context) * 0.5),
                              child: Container(
                                height: AppDimensions.height10(context) * 13.1,
                                width: AppDimensions.height10(context) * 13.1,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: Colors.white),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffBE3FC6),
                                          Color(0xff642445)
                                        ])),
                                child: Center(
                                  child: Text(
                                    'All goals',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 12.4,
                            height: AppDimensions.height10(context) * 2.4,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 21.2,
                                left: AppDimensions.height10(context) * 2.8,
                                top: AppDimensions.height10(context) * 2.0),
                            child: Center(
                              child: Text(
                                'Active Goals',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 6,
                                top: AppDimensions.height10(context) * 1.0,
                                right: AppDimensions.height10(context) * 3,
                                bottom: AppDimensions.height10(context) * 2.0),
                            child: GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      3.5 / 3, // Two items in each row

                                  mainAxisSpacing: 9.0,
                                  crossAxisSpacing: 3,
                                ),
                                itemCount: Active.length,
                                itemBuilder: ((context, index) {
                                  return AnimatedScaleButton(
                                    onTap: () {
                                      if (widget.route != 'details') {
                                        setState(() {
                                          if (selectedIndices.contains(index)) {
                                            multiGoals
                                                .remove(Active[index]['id']);
                                            selectedIndices.remove(index);
                                          } else {
                                            selectedIndices.add(index);
                                            multiGoals.add(Active[index]['id']);
                                          }
                                        });
                                        setState(() {
                                          selectAll = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  3),
                                      height: selectedIndices.contains(index) ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      width: selectedIndices.contains(index) ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context) *
                                              0.8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: selectedIndices
                                                        .contains(index) ||
                                                    selectAll == true
                                                ? AppDimensions.height10(
                                                        context) *
                                                    0.2
                                                : 0,
                                            color: selectedIndices
                                                        .contains(index) ||
                                                    selectAll == true
                                                ? Colors.white
                                                : Colors.transparent),
                                      ),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                13.1,
                                        width: AppDimensions.height10(context) *
                                            13.1,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
                                                    context) *
                                                0.8),
                                        // margin: EdgeInsets.only(
                                        //   right:
                                        //       AppDimensions.height10(context) * 4.5,
                                        // ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                color: Colors.white),
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xffBE3FC6),
                                                  Color(0xff642445)
                                                ])),
                                        child: Center(
                                          child: Text(
                                            Active[index]['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 13.7,
                            height: AppDimensions.height10(context) * 2.4,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 19.5,
                                left: AppDimensions.height10(context) * 2.8),
                            child: Center(
                              child: Text(
                                'Inactive Goals',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.0,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 6,
                                top: AppDimensions.height10(context) * 1.0,
                                right: AppDimensions.height10(context) * 3,
                                bottom: AppDimensions.height10(context) * 2.0),
                            child: GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      3.5 / 3, // Two items in each row

                                  mainAxisSpacing: 9.0,
                                  crossAxisSpacing: 3,
                                ),
                                itemCount: inActive.length,
                                itemBuilder: ((context, index) {
                                  return AnimatedScaleButton(
                                    onTap: () {
                                      if (widget.route != 'details') {
                                        setState(() {
                                          if (selectedInActiveIndices
                                              .contains(index)) {
                                            multiGoals
                                                .remove(inActive[index]['id']);
                                            selectedInActiveIndices
                                                .remove(index);
                                          } else {
                                            multiGoals
                                                .add(inActive[index]['id']);
                                            selectedInActiveIndices.add(index);
                                          }
                                        });
                                        setState(() {
                                          selectAll = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right:
                                              AppDimensions.height10(context) *
                                                  3),
                                      height: selectedInActiveIndices
                                                  .contains(index) ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      width: selectedInActiveIndices
                                                  .contains(index) ||
                                              selectAll == true
                                          ? AppDimensions.height10(context) *
                                              14.1
                                          : AppDimensions.height10(context) *
                                              13.1,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10(context) *
                                              0.8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: selectedInActiveIndices
                                                        .contains(index) ||
                                                    selectAll == true
                                                ? AppDimensions.height10(
                                                        context) *
                                                    0.2
                                                : 0,
                                            color: selectedInActiveIndices
                                                        .contains(index) ||
                                                    selectAll == true
                                                ? Colors.white
                                                : Colors.transparent),
                                      ),
                                      child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                13.1,
                                        width: AppDimensions.height10(context) *
                                            13.1,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppDimensions.height10(
                                                    context) *
                                                1.2),
                                        // margin: EdgeInsets.only(
                                        //   right: AppDimensions.height10(context) *
                                        //       4.5,
                                        // ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    0.1,
                                                color: Colors.white),
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xffBE3FC6),
                                                  Color(0xff642445)
                                                ])),
                                        child: Center(
                                          child: Text(
                                            inActive[index]['name'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.6,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ]),
                  ),
                ),
                widget.data_saved
                    ? widget.route == 'details'
                        ? Container()
                        : Container(
                            width: AppDimensions.height10(context) * 34.2,
                            height: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.3,
                                bottom: AppDimensions.height10(context) * 3.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedScaleButton(
                                  onTap: () {
                                    multiGoals.clear();
                                    selectedGoals.clear();
                                    selectedInActiveIndices.clear();
                                    selectedIndices.clear();
                                    setState(() {
                                      selectAll = false;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 12.8,
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFFFFFFFF)
                                              .withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Reset',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w600,
                                          color: selectAll == true ||
                                                  multiGoals.isNotEmpty
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5)),
                                    )),
                                  ),
                                ),
                                AnimatedScaleButton(
                                  onTap: () {
                                    if (selectAll == true ||
                                        multiGoals.isNotEmpty) {
                                      if (selectAll == true) {
                                        saveGoalsToSharedPreferences(
                                            allgoalsSelected);
                                        widget.route == 'photo_create'
                                            ? Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const photo_info(
                                                  edit_details: false,
                                                  image_detals: false,
                                                  image_save: false,
                                                  image_create: false,
                                                )),
                                              )
                                            : widget.route == 'video_create'
                                                ? Navigator.push(
                                                    context,
                                                    FadePageRoute(
                                                        page: const video_info(
                                                            link_state: false)),
                                                  )
                                                : widget.route == 'note_create'
                                                    ? Navigator.push(
                                                        context,
                                                        FadePageRoute(
                                                            page:
                                                                const note_info(
                                                          note_saved: true,
                                                          type_switch: 1,
                                                        )),
                                                      )
                                                    : widget.route ==
                                                            'note_saved'
                                                        ? Navigator.push(
                                                            context,
                                                            FadePageRoute(
                                                                page:
                                                                    const noteSaved()),
                                                          )
                                                        : widget.route ==
                                                                'note_link'
                                                            ? Navigator.push(
                                                                context,
                                                                FadePageRoute(
                                                                    page:
                                                                        const link_info(
                                                                  link_state:
                                                                      false,
                                                                )),
                                                              )
                                                            : Navigator.push(
                                                                context,
                                                                FadePageRoute(
                                                                    page:
                                                                        const inspiration_type()),
                                                              );
                                      } else {
                                        saveGoalsToSharedPreferences(
                                            multiGoals);

                                        widget.route == 'photo_create'
                                            ? Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const photo_info(
                                                  edit_details: false,
                                                  image_detals: true,
                                                  image_save: false,
                                                  image_create: false,
                                                )),
                                              )
                                            : widget.route == 'video_create'
                                                ? Navigator.push(
                                                    context,
                                                    FadePageRoute(
                                                        page: const video_info(
                                                      link_state: false,
                                                    )),
                                                  )
                                                : widget.route == 'note_create'
                                                    ? Navigator.push(
                                                        context,
                                                        FadePageRoute(
                                                            page:
                                                                const note_info(
                                                          note_saved: true,
                                                          type_switch: 1,
                                                        )),
                                                      )
                                                    : widget.route ==
                                                            'note_saved'
                                                        ? Navigator.push(
                                                            context,
                                                            FadePageRoute(
                                                                page:
                                                                    const noteSaved()),
                                                          )
                                                        : widget.route ==
                                                                'note_link'
                                                            ? Navigator.push(
                                                                context,
                                                                FadePageRoute(
                                                                    page:
                                                                        const link_info(
                                                                  link_state:
                                                                      false,
                                                                )),
                                                              )
                                                            : widget.route ==
                                                                    'edit'
                                                                ? Navigator
                                                                    .push(
                                                                    context,
                                                                    FadePageRoute(
                                                                        page:
                                                                            videoEdit(
                                                                      note: widget
                                                                          .note,
                                                                      context:
                                                                          widget
                                                                              .context,
                                                                      updatedList: selectAll
                                                                          ? allgoalsSelected
                                                                          : multiGoals,
                                                                    )),
                                                                  )
                                                                : widget.route ==
                                                                        'photo_edit'
                                                                    ? Navigator
                                                                        .push(
                                                                        context,
                                                                        FadePageRoute(
                                                                            page:
                                                                                photo_Edit(
                                                                          updatedList: selectAll
                                                                              ? allgoalsSelected
                                                                              : multiGoals,
                                                                        )),
                                                                      )
                                                                    : Navigator
                                                                        .push(
                                                                        context,
                                                                        FadePageRoute(
                                                                            page:
                                                                                const inspiration_type()),
                                                                      );
                                      }
                                    }
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 20.4,
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          selectAll == true ||
                                                  multiGoals.isNotEmpty
                                              ? const Color(0xffFCC10D)
                                              : const Color(0xffFCC10D)
                                                  .withOpacity(0.5),
                                          selectAll == true ||
                                                  multiGoals.isNotEmpty
                                              ? const Color(0xffFDA210)
                                              : const Color(0xffFDA210)
                                                  .withOpacity(0.5),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Save',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.6,
                                          fontWeight: FontWeight.w600,
                                          color: selectAll == true ||
                                                  multiGoals.isNotEmpty
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5)),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          )
                    : AnimatedScaleButton(
                        onTap: () async {
                          if (selectAll == true || multiGoals.isNotEmpty) {
                            if (selectAll == true) {
                              saveGoalsToSharedPreferences(allgoalsSelected);
                              widget.route == 'photo_create'
                                  ? Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const photo_info(
                                        edit_details: false,
                                        image_detals: false,
                                        image_save: false,
                                        image_create: false,
                                      )),
                                    )
                                  : widget.route == 'video_create'
                                      ? Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const video_info(
                                                  link_state: false)),
                                        )
                                      : widget.route == 'note_create'
                                          ? Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: const note_info(
                                                note_saved: true,
                                                type_switch: 1,
                                              )),
                                            )
                                          : widget.route == 'note_saved'
                                              ? Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: photo_Edit(
                                                    updatedList: selectAll
                                                        ? allgoalsSelected
                                                        : multiGoals,
                                                  )),
                                                )
                                              : widget.route ==
                                                      'note_saved_video'
                                                  ? Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page: videoEdit(
                                                        note: widget.note,
                                                        context: widget.context,
                                                        updatedList: selectAll
                                                            ? allgoalsSelected
                                                            : multiGoals,
                                                      )),
                                                    )
                                                  : widget.route == 'edit'
                                                      ? Navigator.push(
                                                          context,
                                                          FadePageRoute(
                                                              page: videoEdit(
                                                            context:
                                                                widget.context,
                                                            note: widget.note,
                                                            updatedList: selectAll
                                                                ? allgoalsSelected
                                                                : multiGoals,
                                                          )),
                                                        )
                                                      : widget.route ==
                                                              'note_link'
                                                          ? Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                      const link_info(
                                                                link_state:
                                                                    false,
                                                              )),
                                                            )
                                                          : widget.route ==
                                                                  'details'
                                                              ? Navigator.push(
                                                                  context,
                                                                  FadePageRoute(
                                                                      page:
                                                                          const veiw_details()),
                                                                )
                                                              : Navigator.push(
                                                                  context,
                                                                  FadePageRoute(
                                                                      page:
                                                                          const inspiration_type()),
                                                                );
                            } else {
                              saveGoalsToSharedPreferences(multiGoals);

                              widget.route == 'photo_create'
                                  ? Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const photo_info(
                                        edit_details: false,
                                        image_detals: false,
                                        image_save: false,
                                        image_create: false,
                                      )),
                                    )
                                  : widget.route == 'details'
                                      ? Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const veiw_details()),
                                        )
                                      : widget.route == 'video_create'
                                          ? Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: const video_info(
                                                      link_state: false)),
                                            )
                                          : widget.route == 'note_create'
                                              ? Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page: const note_info(
                                                    note_saved: true,
                                                    type_switch: 1,
                                                  )),
                                                )
                                              : widget.route == 'note_saved'
                                                  ? Navigator.push(
                                                      context,
                                                      FadePageRoute(
                                                          page: photo_Edit(
                                                        updatedList: selectAll
                                                            ? allgoalsSelected
                                                            : multiGoals,
                                                      )),
                                                    )
                                                  : widget.route ==
                                                          'note_saved_video'
                                                      ? Navigator.push(
                                                          context,
                                                          FadePageRoute(
                                                              page: videoEdit(
                                                            note: widget.note,
                                                            context:
                                                                widget.context,
                                                            updatedList: selectAll
                                                                ? allgoalsSelected
                                                                : multiGoals,
                                                          )),
                                                        )
                                                      : widget.route ==
                                                              'note_link'
                                                          ? Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                      const link_info(
                                                                link_state:
                                                                    false,
                                                              )),
                                                            )
                                                          : Navigator.push(
                                                              context,
                                                              FadePageRoute(
                                                                  page:
                                                                      const inspiration_type()),
                                                            );
                            }
                          }
                          if (widget.update == false) {
                            final SharedPreferences prefs = await _prefs;
                            var savedRoute = prefs.setString(
                                'inspiration_saved_route', 'goals_saved');
                          }
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 25.4,
                          height: AppDimensions.height10(context) * 5.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 3.3,
                              bottom: AppDimensions.height10(context) * 2.6),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                selectAll == true || multiGoals.isNotEmpty
                                    ? const Color(0xffFCC10D)
                                    : const Color(0xffFCC10D).withOpacity(0.5),
                                selectAll == true || multiGoals.isNotEmpty
                                    ? const Color(0xffFDA210)
                                    : const Color(0xffFDA210).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                          ),
                          child: Center(
                              child: Text(
                            selectAll == true
                                ? '(${allgoalsSelected.length}/${goals.length} goals selected) Next'
                                : '(${multiGoals.length}/${goals.length} goals selected) Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                        ),
                      ),
                widget.route == 'details'
                    ? Container()
                    : Container(
                        width: AppDimensions.height10(context) * 17.0,
                        height: AppDimensions.height10(context) * 0.5,
                        // margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                      )
              ])
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
