import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Screen/capture_inspiration/record_inpiration_type.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/dashboardViewgoals.dart';
import 'inpiration_veiw_detail.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class inspiration_landing extends StatefulWidget {
  final bool is_Updated;

  const inspiration_landing({super.key, required this.is_Updated});

  @override
  State<inspiration_landing> createState() => _inspiration_landingState();
}

class _inspiration_landingState extends State<inspiration_landing> {
  var InspirationList;
  var InspirationAll;
  List<String> tagNames = [];
  bool Loading = true;
  var goals = [];
  bool noData = false;
  List goalName = [];
  int goalId = 0;
  String selectionTag = '';
  int inspirationId = 0;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void filterInspiratonByTag(search, id, tag) {
    InspirationApi().filterUserInspiration(search, id, tag).then((response) {
      if (response.length != 0) {
        setState(() {
          InspirationList = response;
        });
      }
    });
  }

  void _fetchInspiraion() async {
    InspirationApi().getUserInspiration().then((response) {
      if (response.length != 0) {
        setState(() {
          InspirationList = response;
          InspirationAll = response;
        });

        loadData();
        //  _getTagNames();
        _fetchUserGoal();
      } else {
        print(response.statusCode);
      }
    }).catchError((error) {
      loadData();
      print("Error");
      setState(() {
        noData = true;
      });
    }).whenComplete(() {
      loadData();
      setState(() {
        _getTagNames();
        //  noData = true;
      });
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

  _getTagNames() {
    print('Tag function called');
    for (int i = 0; i <= InspirationList.length; i++) {
      if (InspirationList[i]['hashTags']?.length != 0) {
        if (InspirationList[i]['hashTags'] != null) {
          tagNames.add(InspirationList[i]['hashTags']
              .toString()
              .replaceAll('[', ' ')
              .replaceAll(']', ' '));
        }
      } else {
        print("No tags");
      }

      //tagNames.add(InspirationList[i]['hashTags'].toString());
    }
    print('TAGNAMES=====================');
    // print(tagNames);
  }

  @override
  void initState() {
    super.initState();
    _fetchInspiraion();
  }

  @override
  final List<String> type = [
    'All ',
    'Image',
    'Note',
    'Video',
    'Content',
  ];
  final List<String> _goals = [
    'All ',
    'Goal name 1',
    'Goal name 2 ',
    'Goal name 3 ',
    'Practice name 1 (goal name)',
  ];
  int _selectedTag = 0;
  int TagIndex = 0;
  String selectedTag = 'All';
  int _Goal_Index = 0;
  int type_index = 0;
  String _selected_activity = 'All';
  String selected_type = 'All';
  String _selected_goal = 'All';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        FadePageRoute(
                            page: const dashBoard(
                          saved: false,
                          helpful_tips: false,
                          membership: true,
                          dashboard_ctrl: false,
                          cancel: false,
                          trial: false,
                        )));
                  },
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
          // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                  fit: BoxFit.cover)),
          child: Loading == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 34.3,
                        height: AppDimensions.height10(context) * 27.0,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 12.0,
                        ),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: AppDimensions.height10(context) * 34.3,
                                height: AppDimensions.height10(context) * 7.3,
                                child: Center(
                                  child: GradientText(
                                    'My current\ninspirations',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize:
                                          AppDimensions.height10(context) * 3.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colors: const [
                                      Color(0xffFA9934),
                                      Color(0xffEDD15E)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.525),
                              child: AnimatedScaleButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const inspiraton_goals(
                                              update: false,
                                              data_saved: false,
                                              context: false,
                                              note: false,
                                              route: 'landing')));
                                },
                                child: Container(
                                  width:
                                      AppDimensions.height10(context) * 16.43,
                                  height:
                                      AppDimensions.height10(context) * 16.43,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    opacity: 0.2,
                                    image:
                                        AssetImage('assets/images/Star.webp'),
                                  )),
                                  child: Center(
                                    child: Container(
                                      width: AppDimensions.height10(context) *
                                          15.6,
                                      height: AppDimensions.height10(context) *
                                          15.6,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/Inspiration_center 1.webp'))),
                                      child: Center(
                                          child: Container(
                                        width: AppDimensions.height10(context) *
                                            6.8,
                                        height:
                                            AppDimensions.height10(context) *
                                                6.8,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFFFFFFF)),
                                        child: Center(
                                            child: SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    3.2,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.2,
                                                child: Image.asset(
                                                    'assets/images/plus.webp'))),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 6.8,
                            bottom: AppDimensions.height10(context) * 9.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: (InspirationList.length + 1) ~/
                                    2, // Half of the items, rounded up
                                itemBuilder: (context, index) {
                                  return Container(
                                    width:
                                        AppDimensions.height10(context) * 16.7,
                                    height:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Column(children: [
                                      AnimatedScaleButton(
                                        onTap: () async {
                                          final SharedPreferences prefs =
                                              await _prefs;

                                          var hurdleId = prefs.setInt(
                                              'userInspirationId',
                                              InspirationList[index * 2]['id']);
                                          Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page:
                                                      const record_inspiration()));
                                        },
                                        child: Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  16.7,
                                          height:
                                              AppDimensions.height10(context) *
                                                  16.7,
                                          decoration: BoxDecoration(
                                              gradient: InspirationList[index * 2]
                                                          ['inspirationId'] ==
                                                      2
                                                  ? const RadialGradient(
                                                      colors: [
                                                          Color(0xFFE9A594),
                                                          Color(0xFFEEBEB2)
                                                        ])
                                                  : const RadialGradient(
                                                      colors: [
                                                          Color(0xFFD9D9D9),
                                                          Color(0xFFD9D9D9)
                                                        ]),
                                              shape: BoxShape.circle,
                                              image: InspirationList[index * 2]
                                                          ['inspirationId'] ==
                                                      1
                                                  ? DecorationImage(
                                                      image: FileImage(File(
                                                          InspirationList[index * 2]['file'])),
                                                      fit: BoxFit.cover)
                                                  : DecorationImage(
                                                      image: AssetImage(InspirationList[index * 2]['inspirationId'] == 4
                                                          ? 'assets/images/distraction content.webp'
                                                          : InspirationList[index]['inspirationId'] == 3
                                                              ? 'assets/images/video_play.webp'
                                                              : ''),
                                                      fit: BoxFit.cover)),
                                          child: InspirationList[index * 2]
                                                      ['inspirationId'] ==
                                                  2
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.7),
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          6.3,
                                                  child: Center(
                                                      child: Text(
                                                    InspirationList[index * 2]
                                                        ['description'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFFFFFFFF)),
                                                  )),
                                                )
                                              : Container(),
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            16.7,
                                        //height: AppDimensions.height10(context) * 1.9,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                0.2),
                                        child: Center(
                                            child: Text(
                                          InspirationList[index * 2]['title'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFFFFFFF)),
                                        )),
                                      ),
                                      SizedBox(
                                        width: AppDimensions.height10(context) *
                                            15.7,
                                        child: Center(
                                            child: Text(
                                          InspirationList[index * 2]
                                              ['description'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    ]),
                                  );
                                  // Replace YourItemWidget with the widget for each item
                                },
                              ),
                            ),
                            // Second column
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10(context) *
                                        7.4), // Extra padding for the second column
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: InspirationList.length ~/
                                      2, // Half of the items, rounded down
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: AppDimensions.height10(context) *
                                          16.7,
                                      height: AppDimensions.height10(context) *
                                          23.8,
                                      child: Column(children: [
                                        AnimatedScaleButton(
                                          onTap: () async {
                                            final SharedPreferences prefs =
                                                await _prefs;

                                            var hurdleId = prefs.setInt(
                                                'userInspirationId',
                                                InspirationList[index * 2 + 1]
                                                    ['id']);
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page:
                                                        const record_inspiration()));
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                16.7,
                                            height: AppDimensions.height10(
                                                    context) *
                                                16.7,
                                            decoration: BoxDecoration(
                                                gradient: InspirationList[index * 2 + 1]
                                                            ['inspirationId'] ==
                                                        2
                                                    ? const RadialGradient(
                                                        colors: [
                                                            Color(0xFFE9A594),
                                                            Color(0xFFEEBEB2)
                                                          ])
                                                    : const RadialGradient(
                                                        colors: [
                                                            Color(0xFFD9D9D9),
                                                            Color(0xFFD9D9D9)
                                                          ]),
                                                shape: BoxShape.circle,
                                                image: InspirationList[index * 2 + 1]
                                                            ['inspirationId'] ==
                                                        1
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            File(InspirationList[index * 2 + 1]['file'])),
                                                        fit: BoxFit.cover)
                                                    : DecorationImage(
                                                        image: AssetImage(InspirationList[index * 2 + 1]['inspirationId'] == 4
                                                            ? 'assets/images/distraction content.webp'
                                                            : InspirationList[index]['inspirationId'] == 3
                                                                ? 'assets/images/video_play.webp'
                                                                : ''),
                                                        fit: BoxFit.cover)),
                                            child: InspirationList[index * 2 +
                                                        1]['inspirationId'] ==
                                                    2
                                                ? Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7),
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            6.3,
                                                    child: Center(
                                                        child: Text(
                                                      InspirationList[
                                                              index * 2 + 1]
                                                          ['description'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFFFFFFFF)),
                                                    )),
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  16.7,
                                          //height: AppDimensions.height10(context) * 1.9,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.2),
                                          child: Center(
                                              child: Text(
                                            InspirationList[index * 2 + 1]
                                                ['title'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFFFFFFFF)),
                                          )),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  15.7,
                                          child: Center(
                                              child: Text(
                                            InspirationList[index * 2 + 1]
                                                ['description'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.0,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFFFFF)),
                                          )),
                                        )
                                      ]),
                                    );
                                    ; // Replace YourItemWidget with the widget for each item
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // noData == false
                      //     ? GridView.builder(
                      //         shrinkWrap: true,
                      //         padding: EdgeInsets.only(
                      //           bottom: AppDimensions.height10(context) * 8.0,
                      //         ),
                      //         physics: const NeverScrollableScrollPhysics(),
                      //         gridDelegate:
                      //             const SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 2,
                      //           // childAspectRatio: 3.5 / 3, // Two items in each row

                      //           mainAxisSpacing: 30,
                      //           crossAxisSpacing: 0,
                      //         ),
                      //         itemCount: InspirationList.length,
                      //         itemBuilder: ((context, index) {
                      //           return Container(
                      //             width: AppDimensions.height10(context) * 16.7,
                      //             height: AppDimensions.height10(context) * 30,
                      //             child: Column(children: [
                      //               AnimatedScaleButton(
                      //                 onTap: () async {
                      //                   final SharedPreferences prefs =
                      //                       await _prefs;

                      //                   var hurdleId = prefs.setInt(
                      //                       'userInspirationId',
                      //                       InspirationList[index]['id']);
                      //                   Navigator.push(
                      //                       context,
                      //                       FadePageRoute(
                      //                           page:
                      //                               const record_inspiration()));
                      //                 },
                      //                 child: Container(
                      //                   width: AppDimensions.height10(context) *
                      //                       16.7,
                      //                   height:
                      //                       AppDimensions.height10(context) *
                      //                           16.7,
                      //                   decoration: BoxDecoration(
                      //                       gradient: InspirationList[index]
                      //                                   ['inspirationId'] ==
                      //                               2
                      //                           ? const RadialGradient(colors: [
                      //                               Color(0xFFE9A594),
                      //                               Color(0xFFEEBEB2)
                      //                             ])
                      //                           : const RadialGradient(colors: [
                      //                               Color(0xFFD9D9D9),
                      //                               Color(0xFFD9D9D9)
                      //                             ]),
                      //                       shape: BoxShape.circle,
                      //                       image: InspirationList[index]
                      //                                   ['inspirationId'] ==
                      //                               1
                      //                           ? DecorationImage(
                      //                               image: FileImage(File(
                      //                                   InspirationList[index]
                      //                                       ['file'])),
                      //                               fit: BoxFit.cover)
                      //                           : DecorationImage(
                      //                               image: AssetImage(InspirationList[index]['inspirationId'] == 4
                      //                                   ? 'assets/images/distraction content.webp'
                      //                                   : InspirationList[index]['inspirationId'] == 3
                      //                                       ? 'assets/images/video_play.webp'
                      //                                       : ''),
                      //                               fit: BoxFit.cover)),
                      //                   child: InspirationList[index]
                      //                               ['inspirationId'] ==
                      //                           2
                      //                       ? Container(
                      //                           padding: EdgeInsets.symmetric(
                      //                               horizontal:
                      //                                   AppDimensions.height10(
                      //                                           context) *
                      //                                       1.7),
                      //                           height: AppDimensions.height10(
                      //                                   context) *
                      //                               6.3,
                      //                           child: Center(
                      //                               child: Text(
                      //                             InspirationList[index]
                      //                                 ['description'],
                      //                             overflow:
                      //                                 TextOverflow.ellipsis,
                      //                             maxLines: 3,
                      //                             textAlign: TextAlign.center,
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions
                      //                                         .height10(
                      //                                             context) *
                      //                                     1.4,
                      //                                 fontWeight:
                      //                                     FontWeight.w400,
                      //                                 color: const Color(
                      //                                     0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       : Container(),
                      //                 ),
                      //               ),
                      //               Container(
                      //                 width: AppDimensions.height10(context) *
                      //                     16.7,
                      //                 //height: AppDimensions.height10(context) * 1.9,
                      //                 margin: EdgeInsets.only(
                      //                     top: AppDimensions.height10(context) *
                      //                         0.2),
                      //                 child: Center(
                      //                     child: Text(
                      //                   InspirationList[index]['title'],
                      //                   overflow: TextOverflow.ellipsis,
                      //                   style: TextStyle(
                      //                       fontSize: AppDimensions.height10(
                      //                               context) *
                      //                           1.4,
                      //                       fontWeight: FontWeight.w600,
                      //                       color: const Color(0xFFFFFFFF)),
                      //                 )),
                      //               ),
                      //               SizedBox(
                      //                 width: AppDimensions.height10(context) *
                      //                     15.7,
                      //                 child: Center(
                      //                     child: Text(
                      //                   InspirationList[index]['description'],
                      //                   overflow: TextOverflow.ellipsis,
                      //                   maxLines: 2,
                      //                   style: TextStyle(
                      //                       fontSize: AppDimensions.height10(
                      //                               context) *
                      //                           1.0,
                      //                       fontWeight: FontWeight.w400,
                      //                       color: const Color(0xFFFFFFFF)),
                      //                 )),
                      //               )
                      //             ]),
                      //           );
                      //         }))
                      //     : Container(
                      //         margin: EdgeInsets.only(
                      //             top: AppDimensions.height10(context) * 4.0),
                      //         width: AppDimensions.height10(context) * 26,
                      //         child: Center(
                      //             child: Text(
                      //           'There are no recorded inspiration',
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //               color: const Color(0xFFFBFBFB),
                      //               fontSize:
                      //                   AppDimensions.height10(context) * 3),
                      //         )),
                      //       ),

                      // widget.is_Updated
                      //     ? Container(
                      //         width: AppDimensions.height10(context) * 38.259,
                      //         height: AppDimensions.height10(context) * 9.707,
                      //         margin: EdgeInsets.only(
                      //             top: AppDimensions.height10(context) * 12.0),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(
                      //                 AppDimensions.height10(context) * 2.0),
                      //             gradient: const LinearGradient(
                      //                 begin: Alignment.topCenter,
                      //                 end: Alignment.bottomCenter,
                      //                 colors: [
                      //                   Color(0xFFD4B7B9),
                      //                   Color(0xFF91698C)
                      //                 ])),
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Container(
                      //               margin: EdgeInsets.only(
                      //                   left: AppDimensions.height10(context) *
                      //                       1.261),
                      //               width:
                      //                   AppDimensions.height10(context) * 4.437,
                      //               height:
                      //                   AppDimensions.height10(context) * 4.437,
                      //               decoration: const BoxDecoration(
                      //                   image: DecorationImage(
                      //                       image: AssetImage(
                      //                           'assets/images/circle_tick.webp'))),
                      //             ),
                      //             Container(
                      //               width:
                      //                   AppDimensions.height10(context) * 6.9,
                      //               height:
                      //                   AppDimensions.height10(context) * 3.6,
                      //               margin: EdgeInsets.only(
                      //                   left: AppDimensions.height10(context) *
                      //                       1.232),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   SizedBox(
                      //                     width:
                      //                         AppDimensions.height10(context) *
                      //                             4.6,
                      //                     height:
                      //                         AppDimensions.height10(context) *
                      //                             1.4,
                      //                     //   color: Colors.amber,
                      //                     child: Text(
                      //                       widget.is_Updated
                      //                           ? 'Updated'
                      //                           : 'SAVED',
                      //                       style: TextStyle(
                      //                           fontSize:
                      //                               AppDimensions.height10(
                      //                                       context) *
                      //                                   1.3,
                      //                           fontWeight: FontWeight.w500,
                      //                           color: const Color(0xFFFFFFFF)),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     width:
                      //                         AppDimensions.height10(context) *
                      //                             6.9,
                      //                     height:
                      //                         AppDimensions.height10(context) *
                      //                             2.2,
                      //                     child: Text(
                      //                       'Nir Eyal',
                      //                       style: TextStyle(
                      //                           fontSize:
                      //                               AppDimensions.height10(
                      //                                       context) *
                      //                                   1.8,
                      //                           fontWeight: FontWeight.w500,
                      //                           color: const Color(0xFFFFFFFF)),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             Container(
                      //               width:
                      //                   AppDimensions.height10(context) * 8.1,
                      //               height:
                      //                   AppDimensions.height10(context) * 6.0,
                      //               margin: EdgeInsets.only(
                      //                   left: AppDimensions.height10(context) *
                      //                       15.1),
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(
                      //                     color: const Color(0xFFFFFFFF),
                      //                     width: 1),
                      //                 borderRadius: BorderRadius.circular(
                      //                     AppDimensions.height10(context) *
                      //                         2.0),
                      //               ),
                      //               child: Center(
                      //                 child: Text(
                      //                   'Veiw',
                      //                   style: TextStyle(
                      //                       fontSize: AppDimensions.height10(
                      //                               context) *
                      //                           1.8,
                      //                       fontWeight: FontWeight.w500,
                      //                       color: const Color(0xFFFFFFFF)),
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     : Container(),
                      // noData == false
                      //     ? Container(
                      //         width: AppDimensions.height10(context) * 17.0,
                      //         height: AppDimensions.height10(context) * 0.5,
                      //         margin: EdgeInsets.only(
                      //             top: AppDimensions.height10(context) * 0.29),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(
                      //                 AppDimensions.height10(context) * 2.0),
                      //             color:
                      //                 const Color(0xFFFFFFFF).withOpacity(0.3)),
                      //       )
                      //     : Container()
                    ],
                  ))
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
        extendBody: true,
        bottomNavigationBar:
            // widget.muliple_insp
            //     ?
            BottomAppBar(
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
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: AppDimensions
                                                                  .height10(
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
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF2F80ED)),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            _selected_goal =
                                                                goalName[
                                                                    _Goal_Index];
                                                            goalId = goals[
                                                                    _Goal_Index]
                                                                ['id'];
                                                          });
                                                          filterInspiratonByTag(
                                                              type_index,
                                                              goals[_Goal_Index]
                                                                  ['id'],
                                                              selectionTag);

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: SizedBox(
                                                          width: AppDimensions
                                                                  .height10(
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
                                                                    FontWeight
                                                                        .w400,
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
                                                    magnification: 1.3,
                                                    useMagnifier: true,
                                                    onSelectedItemChanged:
                                                        (int index) {
                                                      setState(() {
                                                        _Goal_Index = index;
                                                        //activity_duration = _statements[_selectedIndex];
                                                        // _selected_activity =
                                                        //     _statements[index];
                                                      });
                                                    },
                                                    // Set the height of each statement
                                                    children: goalName
                                                        .map((statement) =>
                                                            Text(statement,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          2.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )))
                                                        .toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 112,
                                              right: 20,
                                              left: 20,
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 0),
                                                child: Container(
                                                    width: 400,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF828282)
                                                            .withOpacity(0.5)),
                                              ),
                                            ),
                                            Positioned(
                                              top: 152,
                                              right: 20,
                                              left: 20,
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 0),
                                                child: Container(
                                                    width: 400,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF828282)
                                                            .withOpacity(0.5)),
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
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFFE0E0E0))),
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.3,
                                right: AppDimensions.height10(context) * 1.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.0),
                                  child: Text(
                                    'Goal:',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  //width: AppDimensions.height10(context) * 1.9,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          0.8),
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
                                      left:
                                          AppDimensions.height10(context) * 0.8,
                                      right:
                                          AppDimensions.height10(context) * 1.0,
                                      bottom: AppDimensions.height10(context) *
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
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: AppDimensions
                                                                  .height10(
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
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF2F80ED)),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedTag =
                                                                tagNames[
                                                                        TagIndex]
                                                                    .toString()
                                                                    .trim();
                                                            selectionTag =
                                                                tagNames[
                                                                        TagIndex]
                                                                    .toString()
                                                                    .trim();
                                                          });
                                                          print(tagNames[
                                                              TagIndex]);
                                                          filterInspiratonByTag(
                                                              type_index,
                                                              goalId,
                                                              tagNames[TagIndex]
                                                                  .toString()
                                                                  .trim());
                                                          print('asf');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: SizedBox(
                                                          width: AppDimensions
                                                                  .height10(
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
                                                                    FontWeight
                                                                        .w400,
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
                                                    magnification: 1.3,
                                                    useMagnifier:
                                                        true, // Set the height of each statement
                                                    children: tagNames
                                                        .map((statement) =>
                                                            Text(statement,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          2.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )))
                                                        .toList(),
                                                    onSelectedItemChanged:
                                                        (int index) {
                                                      setState(() {
                                                        TagIndex = index;
                                                        //activity_duration = _statements[_selectedIndex];
                                                        // _selected_activity =
                                                        //     _statements[index];
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 112,
                                              right: 20,
                                              left: 20,
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 0),
                                                child: Container(
                                                    width: 400,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF828282)
                                                            .withOpacity(0.5)),
                                              ),
                                            ),
                                            Positioned(
                                              top: 152,
                                              right: 20,
                                              left: 20,
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 0),
                                                child: Container(
                                                    width: 400,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF828282)
                                                            .withOpacity(0.5)),
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
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFFE0E0E0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.0),
                                  child: Text(
                                    'Tags:',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10(context) * 1.9,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          0.8),
                                  child: Center(
                                    child: Text(
                                      selectedTag,
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
                                      left:
                                          AppDimensions.height10(context) * 0.8,
                                      bottom:
                                          AppDimensions.height10(context) * 0.3,
                                      right: AppDimensions.height10(context) *
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
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          width: AppDimensions
                                                                  .height10(
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
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF2F80ED)),
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selected_type =
                                                                type[
                                                                    type_index];
                                                          });
                                                          print(
                                                              type[type_index]);
                                                          filterInspiratonByTag(
                                                              type_index,
                                                              goalId,
                                                              selectionTag);
                                                          print('asf');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: SizedBox(
                                                          width: AppDimensions
                                                                  .height10(
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
                                                                    FontWeight
                                                                        .w400,
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
                                                    magnification: 1.3,
                                                    useMagnifier:
                                                        true, // Set the height of each statement
                                                    children: type
                                                        .map((statement) =>
                                                            Text(statement,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          2.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )))
                                                        .toList(),
                                                    onSelectedItemChanged:
                                                        (int index) {
                                                      setState(() {
                                                        type_index = index;
                                                        //activity_duration = _statements[_selectedIndex];
                                                        // _selected_activity =
                                                        //     _statements[index];
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 112,
                                              right: 20,
                                              left: 20,
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 0),
                                                child: Container(
                                                    width: 400,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF828282)
                                                            .withOpacity(0.5)),
                                              ),
                                            ),
                                            Positioned(
                                              top: 152,
                                              right: 20,
                                              left: 20,
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 0),
                                                child: Container(
                                                    width: 400,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF828282)
                                                            .withOpacity(0.5)),
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
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFFE0E0E0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.0),
                                  child: Text(
                                    'Media:',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10(context) * 1.9,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          0.8),
                                  child: Center(
                                    child: Text(
                                      selected_type,
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
                                      left:
                                          AppDimensions.height10(context) * 0.8,
                                      bottom:
                                          AppDimensions.height10(context) * 0.3,
                                      right: AppDimensions.height10(context) *
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              InspirationList = InspirationAll;
                              selectionTag = '';
                              goalId = 0;
                              type_index = 0;
                              selected_type = 'All';
                              _selected_goal = "All";
                              selectedTag = 'All';
                            });
                          },
                          child: Container(
                            //width: AppDimensions.height10(context) * 3.9,
                            height: AppDimensions.height10(context) * 3.4,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.0,
                                right: AppDimensions.height10(context) * 7.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Clear all',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
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
        )
        //:
        // Container(),
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
  String goal = 'Tag';

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
                                    //when it will be reconstructed bottom decororation will be set, at the moment it is there to show presence.
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

class updatedLandingPage extends StatefulWidget {
  final bool delete;
  final bool is_Updated;
  const updatedLandingPage(
      {super.key, required this.delete, required this.is_Updated});

  @override
  State<updatedLandingPage> createState() => _updatedLandingPageState();
}

class _updatedLandingPageState extends State<updatedLandingPage> {
  bool Loading = true;
  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  var inspirationDetails;

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchInspiration() {
    InspirationApi().getInspirationById().then((response) {
      print('Res=====================');
      if (response.length != 0) {
        setState(() {
          inspirationDetails = response;
        });
        loadData();
        print(inspirationDetails['inspiration']['title']);
      } else {
        print(response);
      }

      // return null;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchInspiration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page: const inspiration_landing(is_Updated: false)));
                },
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
        // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: Loading == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 34.3,
                      height: AppDimensions.height10(context) * 27.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 12.0),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: AppDimensions.height10(context) * 34.3,
                              height: AppDimensions.height10(context) * 7.3,
                              child: Center(
                                child: GradientText(
                                  'My current\ninspirations',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize:
                                        AppDimensions.height10(context) * 3.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  colors: const [
                                    Color(0xffFA9934),
                                    Color(0xffEDD15E)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.525),
                            child: AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const inspiraton_goals(
                                      update: false,
                                      data_saved: false,
                                      route: 'landing',
                                      context: false,
                                      note: false,
                                    )));
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 16.43,
                                height: AppDimensions.height10(context) * 16.43,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  opacity: 0.2,
                                  image: AssetImage('assets/images/Star.webp'),
                                )),
                                child: Center(
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 15.6,
                                    height:
                                        AppDimensions.height10(context) * 15.6,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Inspiration_center 1.webp'))),
                                    child: Center(
                                        child: Container(
                                      width:
                                          AppDimensions.height10(context) * 6.8,
                                      height:
                                          AppDimensions.height10(context) * 6.8,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFFFFFF)),
                                      child: Center(
                                          child: SizedBox(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  3.2,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.2,
                                              child: Image.asset(
                                                  'assets/images/plus.webp'))),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.1, 0.85),
                            child: SizedBox(
                              width: AppDimensions.height10(context) * 13.5,
                              height: AppDimensions.height10(context) * 2.2,
                              child: Text(
                                'New inspiration',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // width: AppDimensions.height10(context) * 16.7,
                      //height: AppDimensions.height10(context) * 21.2,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 18.5,
                        top: AppDimensions.height10(context) * 4.3,
                      ),
                      child: Column(
                        children: [
                          Column(children: [
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const record_inspiration()));
                              },
                              child: Container(
                                width: AppDimensions.height10(context) * 16.7,
                                height: AppDimensions.height10(context) * 16.7,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: inspirationDetails['inspiration']
                                                ['inspirationId'] ==
                                            2
                                        ? const RadialGradient(colors: [
                                            Color(0xFFE9A594),
                                            Color(0xFFEEBEB2)
                                          ])
                                        : const RadialGradient(colors: [
                                            Color(0xFFD9D9D9),
                                            Color(0xFFD9D9D9)
                                          ]),
                                    image: inspirationDetails['inspiration']
                                                ['inspirationId'] ==
                                            1
                                        ? DecorationImage(
                                            image: FileImage(File(
                                                inspirationDetails['inspiration']
                                                    ['file'])),
                                            fit: BoxFit.cover)
                                        : DecorationImage(
                                            image: AssetImage(inspirationDetails['inspiration']['inspirationId'] == 4
                                                ? 'assets/images/distraction content.webp'
                                                : inspirationDetails['inspiration']['inspirationId'] == 3
                                                    ? 'assets/images/video_play.webp'
                                                    : ''),
                                            fit: BoxFit.cover)),
                                child: inspirationDetails['inspiration']
                                            ['inspirationId'] ==
                                        2
                                    ? Container(
                                        margin: EdgeInsets.all(
                                            AppDimensions.height10(context) *
                                                2.5),
                                        height:
                                            AppDimensions.height10(context) *
                                                6.3,
                                        child: Center(
                                            child: Text(
                                          inspirationDetails['inspiration']
                                              ['description'],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFFFFF)),
                                        )),
                                      )
                                    : Container(),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 16.7,
                              height: AppDimensions.height10(context) * 1.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.5,
                                  bottom:
                                      AppDimensions.height10(context) * 0.2),
                              child: Center(
                                  child: Text(
                                inspirationDetails['inspiration']['title'],
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF)),
                              )),
                            ),
                            Container(
                              // margin: EdgeInsets.symmetric(
                              //     horizontal:
                              //         AppDimensions.height10(context) * 0.5),
                              //height: AppDimensions.height10(context) * 3.0,
                              width: AppDimensions.height10(context) * 15.7,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    inspirationDetails['inspiration']
                                        ['description'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.2,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFFFFFFF)),
                                  )),
                            )
                          ])
                        ],
                      ),
                    ),

                    Container(
                      width: AppDimensions.height10(context) * 38.259,
                      height: AppDimensions.height10(context) * 9.707,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 2.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.261),
                            width: AppDimensions.height10(context) * 4.437,
                            height: AppDimensions.height10(context) * 4.437,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/circle_tick.webp'))),
                          ),
                          Container(
                            //width: AppDimensions.height10(context) * 6.9,
                            height: AppDimensions.height10(context) * 3.6,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.232),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 4.6,
                                  height: AppDimensions.height10(context) * 1.4,
                                  //   color: Colors.amber,
                                  child: Text(
                                    widget.is_Updated ? 'Updated' : 'SAVED',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 16.9,
                                  height: AppDimensions.height10(context) * 2.2,
                                  child: Text(
                                    inspirationDetails['inspiration']['title']
                                            .toString()
                                            .isEmpty
                                        ? 'Inspiraion'
                                        : inspirationDetails['inspiration']
                                            ['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedScaleButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                FadePageRoute(page: const veiw_details()),
                              );
                            },
                            child: Container(
                              width: AppDimensions.height10(context) * 8.1,
                              height: AppDimensions.height10(context) * 6.0,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 5,
                                  right:
                                      AppDimensions.height10(context) * 1.23),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFFFFFFF), width: 1),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                              ),
                              child: Center(
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )

                    // noData == false
                    //     ? Container(
                    //         width: AppDimensions.height10(context) * 17.0,
                    //         height: AppDimensions.height10(context) * 0.5,
                    //         margin: EdgeInsets.only(
                    //             top: AppDimensions.height10(context) * 0.29),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(
                    //                 AppDimensions.height10(context) * 2.0),
                    //             color:
                    //                 const Color(0xFFFFFFFF).withOpacity(0.3)),
                    //       )
                    //     : Container()
                  ],
                ))
            : const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              ),
      ),
      extendBody: true,
    );
  }
}
