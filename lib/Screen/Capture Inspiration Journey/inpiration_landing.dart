import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/Widgets/updateBox.dart';

import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/constants/videothumbnail.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_motivation.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Widgets/BottomSearch.dart';
import 'package:potenic_app/Widgets/CustomBottomSheet.dart';
import 'package:potenic_app/Widgets/CustomCircle.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/deleteanimatedDialog.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/tutorialBottomSheet.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../utils/app_dimensions.dart';
import 'capture_inpirations_goals.dart';
import 'inpiration_type.dart';
import 'inpiration_veiw_detail.dart';
import 'record_inpiration_type.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class inspiration_landing extends StatefulWidget {
  final bool is_Updated;

  const inspiration_landing({super.key, required this.is_Updated});

  @override
  State<inspiration_landing> createState() => _inspiration_landingState();
}

class _inspiration_landingState extends State<inspiration_landing> {
  final formkey = GlobalKey<FormState>();
  var inspirationList;
  var inspirationAll;
  List<String> tagNames = [];
  bool searchIcon = false;

  bool loading = true;
  var goals = [];
  bool deleteAll = false;
  bool noData = false;
  bool longPress = false;
  List goalName = [];
  int goalId = 0;
  String selectionTag = '';
  int inspirationId = 0;
  var route;
  bool checkResponse = true;

  final TextEditingController _searchController = TextEditingController();

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void searchHurdles(String searchText) {
    var searchTerm = inspirationAll.where((inspiration) => inspiration["title"]
        .toString()
        .toLowerCase()
        .contains(searchText.toLowerCase()));

    setState(() {
      inspirationList = searchTerm.toList();
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

  void filterInspiratonByTag(search, id, tag) {
    InspirationApi().filterUserInspiration(search, id, tag).then((response) {
      if (response != 404) {
        setState(() {
          inspirationList = response;
          noData = false;
        });
      } else if (response == 404) {
        setState(() {
          noData = true;
        });
      } else {}
    });
  }

  _fetchInspiraion() async {
    InspirationApi().getUserInspiration().then((response) {
      if (response.length != 0) {
        setState(() {
          inspirationList = response;
          inspirationAll = response;
          noData = false;
        });

        loadData();
        _fetchUserGoal();
      } else {}
    }).catchError((error) {
      loadData();
      setState(() {
        noData = true;
      });
    }).whenComplete(() {
      loadData();
      setState(() {
        _getTagNames();
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
    for (int i = 0; i <= goals.length; i++) {
      goalName.add(goals[i]['name']);
    }
  }

  _getTagNames() {
    for (int i = 0; i <= inspirationList.length; i++) {
      if (inspirationList[i]['hashTags']?.length != 0) {
        if (inspirationList[i]['hashTags'] != null) {
          List<String> tags = inspirationList[i]['hashTags']
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .replaceAll('"', '')
              .split(', '); // Split the hashtags into individual tags

          tagNames.addAll(tags);
        }
      } else {}

      //tagNames.add(InspirationList[i]['hashTags'].toString());
    }
  }

  void getInspirationRoute() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      route = prefs.getString('inspiration_saved_route').toString().isEmpty
          ? ''
          : prefs.getString('inspiration_saved_route');
    });
  }

  List selectItems = [];
  void doMultiSelection(String path) {
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
  }

  void selectAll() {
    if (!deleteAll) {
      setState(() {
        selectItems.clear();
        longPress = false;
      });
    } else {
      selectItems.clear();
      for (int i = 0; i < inspirationList.length; i++) {
        selectItems.add(inspirationList[i]['id'].toString());
      }
      setState(() {
        longPress = true;
      });
    }
  }

  deleteMult() {
    setState(() {
      loading = true;
    });
    InspirationApi().deleteMulipleInspiration(selectItems).then((value) async {
      print("vale $value");
      if (value == true) {
        selectItems.clear();
        await _fetchInspiraion();
        InspirationApi().getUserInspiration().then((response) {
          print("resposne $response");
          if (response == false) {
            Navigator.push(
                context,
                FadePageRoute(
                    page: const inspiration_motivation(
                        goal_delete: false, inspirationName: '')));
          } else {
            print("dkksd");
            // print("isnpiration list $inspirationList");
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchInspiraion();
    getInspirationRoute();
  }

  // String image = '';
  // fucntion(index) async {
  //   image = await Videothumbnail()
  //       .extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink']);
  // }

  // String image2 = '';
  // fucntion2(index) async {
  //   image2 = await Videothumbnail()
  //       .extractThumbnailUrl(inspirationList[index * 2]['destinationLink']);
  // }

  final List<String> type = [
    'All ',
    'Image',
    'Note',
    'Video',
    'Content',
  ];

  int tagIndex = 0;
  String selectedTag = 'All';
  int goalIndex = 0;
  int typeindex = 0;
  String selectedtype = 'All';
  String selectedgoal = 'All';

  @override
  Widget build(BuildContext context) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                  child: Buttons().closeButton(context, () async {
                Navigator.push(
                    context,
                    FadePageRouteReverse(
                        page: const ViewDashboard(
                      missed: false,
                      name: '',
                      update: false,
                      helpfulTips: false,
                      record: 0,
                    )));
                final SharedPreferences prefs = await _prefs;
                prefs.remove('inspiration_saved_route');
              })),
              //   IconButton(
              //       onPressed: () async {
              //         Navigator.push(
              //             context,
              //             FadePageRouteReverse(
              //                 page: const ViewDashboard(
              //               missed: false,
              //               name: '',
              //               update: false,
              //               helpfulTips: false,
              //               record: 0,
              //             )));
              //         final SharedPreferences prefs = await _prefs;
              //         prefs.remove('inspiration_saved_route');
              //       },
              //       icon: Image.asset(
              //         'assets/images/Close.webp',
              //         // width: AppDimensions.width10(context) * 2.6,
              //         height: AppDimensions.height10(context) * 2.8,
              //         fit: BoxFit.contain,
              //       )),
              // )
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/bg_inpiration_purple.webp'),
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                    fit: BoxFit.cover)),
            child: loading == false
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.width10(context) * 34.3,
                            height: AppDimensions.height10(context) * 27.0,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 12.0,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                    width:
                                        AppDimensions.width10(context) * 34.3,
                                    //height: AppDimensions.height10(context) * 9.1,
                                    // margin: EdgeInsets.only(
                                    //     top:
                                    //         AppDimensions.height10(context) * 7.5,
                                    //     left: AppDimensions.width10(context) * 2),
                                    child: GradientText(
                                      'My inspirations',
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
                                    )),

                                // GestureDetector(
                                //   onTap: () {},
                                //   child: SizedBox(
                                //     width: AppDimensions.width10(context) * 34.3,
                                //     height: AppDimensions.height10(context) * 8.1,
                                //     child: Center(
                                //       child: GradientText(
                                //         'My current\ninspirations',
                                //         textAlign: TextAlign.center,
                                //         style: TextStyle(
                                //           height: 1.5,
                                //           fontSize:
                                //               AppDimensions.font10(context) * 3.0,
                                //           fontWeight: FontWeight.w700,
                                //         ),
                                //         colors: const [
                                //           Color(0xffFA9934),
                                //           Color(0xffEDD15E)
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                Align(
                                  alignment: const Alignment(0, 0.525),
                                  child: AnimatedScaleButton(
                                    onTap: () async {
                                      if (route == null) {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const inspiraton_goals(
                                                    update: false,
                                                    data_saved: false,
                                                    context: false,
                                                    note: true,
                                                    route: 'landing')));
                                      } else if (route == 'goals_inspiration') {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const inspiraton_goals(
                                                    update: false,
                                                    data_saved: false,
                                                    context: false,
                                                    note: true,
                                                    route: 'landing')));
                                      } else if (route == "type_inspiration") {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page:
                                                    const inspiration_type()));
                                      } else {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: const inspiraton_goals(
                                                    update: false,
                                                    data_saved: false,
                                                    context: false,
                                                    note: true,
                                                    route: 'landing')));
                                        final SharedPreferences prefs =
                                            await _prefs;
                                        await prefs
                                            .remove('inspiration_saved_route');
                                      }
                                    },
                                    child: SizedBox(
                                      width: AppDimensions.width10(context) *
                                          16.43,
                                      height: AppDimensions.height10(context) *
                                          16.43,
                                      // decoration: const BoxDecoration(
                                      //     image: DecorationImage(
                                      //   opacity: 0.2,
                                      //   image: AssetImage(
                                      //       'assets/images/Inspriation Glare.webp'),
                                      // )),
                                      child: Container(
                                        width: AppDimensions.width10(context) *
                                            16.43,
                                        height:
                                            AppDimensions.height10(context) *
                                                16.43,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          //opacity: 0.2,
                                          image: AssetImage(
                                              'assets/images/addInspiration.webp'),
                                        )),
                                        // child: Center(
                                        //   child: Container(
                                        //     width:
                                        //         AppDimensions.width10(context) *
                                        //             15.6,
                                        //     height:
                                        //         AppDimensions.height10(context) *
                                        //             15.6,
                                        //     decoration: const BoxDecoration(
                                        //         image: DecorationImage(
                                        //             image: AssetImage(
                                        //                 'assets/images/Inspiration_center 1.webp'))),
                                        //     child: Center(
                                        //         child: Container(
                                        //       width:
                                        //           AppDimensions.width10(context) *
                                        //               6.8,
                                        //       height: AppDimensions.height10(
                                        //               context) *
                                        //           6.8,
                                        //       decoration: const BoxDecoration(
                                        //           shape: BoxShape.circle,
                                        //           color: Color(0xFFFFFFFF)),
                                        //       child: Center(
                                        //           child: SizedBox(
                                        //               width: AppDimensions
                                        //                       .height10(context) *
                                        //                   3.2,
                                        //               height:
                                        //                   AppDimensions.height10(
                                        //                           context) *
                                        //                       3.2,
                                        //               child: Image.asset(
                                        //                 'assets/images/plus.webp',
                                        //               ))),
                                        //     )),
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          selectItems.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppDimensions.height10(context) *
                                              1.5),
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
                                          DeleteAnimatedDialog(
                                            text1: 'Are you sure you want\nto',
                                            boldText: ' delete ',
                                            text2: 'this inspiration?',
                                            content:
                                                "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                                            TextButton1: 'No',
                                            ontap1: () {
                                              Navigator.pop(context);
                                            },
                                            TextButton2: 'Yes',
                                            ontap2: () async {
                                              await deleteMult();
                                              Navigator.pop(context);
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
                                          )
                                          // AnimatedScaleButton(
                                          //   onTap: () {
                                          //     // deleteMult();
                                          //   },
                                          //   child: GradientText(
                                          //     'Delete',
                                          //     textAlign: TextAlign.center,
                                          //     style: TextStyle(
                                          //       fontSize: AppDimensions.font10(
                                          //               context) *
                                          //           1.8,
                                          //       fontWeight: FontWeight.w700,
                                          //     ),
                                          //     colors: const [
                                          //       Color(0xffFA9934),
                                          //       Color(0xffEDD15E)
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          noData == true
                              ? Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          4.0),
                                  width: AppDimensions.width10(context) * 26,
                                  child: Center(
                                      child: Text(
                                    'There are no recorded inspiration',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xFFFBFBFB),
                                        fontSize:
                                            AppDimensions.font10(context) * 3),
                                  )),
                                )
                              : Container(
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 6.8,
                                      bottom: AppDimensions.height10(context) *
                                          9.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: (inspirationList.length +
                                                  1) ~/
                                              2, // Half of the items, rounded up
                                          itemBuilder: (context, index) {
                                            bool selected =
                                                selectItems.contains(
                                                    inspirationList[index * 2]
                                                            ['id']
                                                        .toString());
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.5),
                                              width: AppDimensions.width10(
                                                      context) *
                                                  17.6,
                                              // height: AppDimensions.height10(
                                              //     context) *
                                              //     30,
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topEnd,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            doMultiSelection(
                                                                inspirationList[
                                                                        index *
                                                                            2]['id']
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
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .transparent),
                                                              shape: BoxShape
                                                                  .circle,
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
                                                        MulitiSelectionButton(
                                                          onTap: () async {
                                                            if (longPress) {
                                                              doMultiSelection(
                                                                  inspirationList[index *
                                                                              2]
                                                                          ['id']
                                                                      .toString());
                                                            } else {
                                                              final SharedPreferences
                                                                  prefs =
                                                                  await _prefs;

                                                              await prefs.setInt(
                                                                  'userInspirationId',
                                                                  inspirationList[
                                                                          index *
                                                                              2]
                                                                      ['id']);
                                                              Navigator.push(
                                                                  context,
                                                                  FadePageRoute(
                                                                      page:
                                                                          const record_inspiration()));
                                                            }
                                                          },
                                                          longPress: () {
                                                            setState(() {
                                                              longPress = true;
                                                            });
                                                            doMultiSelection(
                                                                inspirationList[
                                                                        index *
                                                                            2]['id']
                                                                    .toString());
                                                          },
                                                          child: Container(
                                                            width: !smallScreen
                                                                ? AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    19.313
                                                                : AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    17.6,
                                                            height: !smallScreen
                                                                ? AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    19.313
                                                                : AppDimensions
                                                                        .width10(
                                                                            context) *
                                                                    17.6,

                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                inspirationList[index *
                                                                                2]
                                                                            [
                                                                            'inspirationId'] ==
                                                                        2
                                                                    ? CustomCircle()
                                                                        .customContainer(
                                                                        context,
                                                                        id: inspirationList[index *
                                                                                2]
                                                                            [
                                                                            'inspirationId'],
                                                                        desc: inspirationList[index *
                                                                                2]
                                                                            [
                                                                            'description'],
                                                                      )
                                                                    : inspirationList[index * 2]['inspirationId'] ==
                                                                            4
                                                                        ? CustomCircle()
                                                                            .customContainer(
                                                                            context,
                                                                            id: inspirationList[index *
                                                                                2]['inspirationId'],
                                                                            desc:
                                                                                inspirationList[index * 2]['description'],
                                                                          )
                                                                        : inspirationList[index * 2]['inspirationId'] ==
                                                                                3
                                                                            ? CustomCircle().customContainer(
                                                                                context,
                                                                                id: inspirationList[index * 2]['inspirationId'],
                                                                                link: inspirationList[index * 2]['destinationLink'],
                                                                              )
                                                                            // inspirationList[index *
                                                                            //                 2]
                                                                            //             [
                                                                            //             'inspirationId'] ==
                                                                            //         2
                                                                            //     ? CustomCircle()
                                                                            //         .customContainer(
                                                                            //         context,
                                                                            //         gradient:
                                                                            //             const RadialGradient(
                                                                            //                 colors: [
                                                                            //               Color(0xFFE9A594),
                                                                            //               Color(0xFFEEBEB2)
                                                                            //             ]),
                                                                            //         image:
                                                                            //             null,
                                                                            //         child:
                                                                            //             Container(
                                                                            //           padding:
                                                                            //               EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                            //           height:
                                                                            //               AppDimensions.height10(context) * 6.3,
                                                                            //           child: Center(
                                                                            //               child: Text(
                                                                            //             inspirationList[index *
                                                                            //                 2]['description'],
                                                                            //             overflow:
                                                                            //                 TextOverflow.ellipsis,
                                                                            //             maxLines:
                                                                            //                 2,
                                                                            //             textAlign:
                                                                            //                 TextAlign.center,
                                                                            //             style: TextStyle(
                                                                            //                 fontSize: AppDimensions.font10(context) * 1.6,
                                                                            //                 fontWeight: FontWeight.w400,
                                                                            //                 color: const Color(0xFFFFFFFF)),
                                                                            //           )),
                                                                            //         ),
                                                                            //       )

                                                                            // Container(
                                                                            //     width: !smallScreen
                                                                            //         ? AppDimensions.width10(context) *
                                                                            //             19.313
                                                                            //         : AppDimensions.width10(context) *
                                                                            //             17.6,
                                                                            //     height: !smallScreen
                                                                            //         ? AppDimensions.width10(context) *
                                                                            //             19.313
                                                                            //         : AppDimensions.width10(context) *
                                                                            //             17.6,
                                                                            //     decoration:
                                                                            //         const BoxDecoration(
                                                                            //       shape:
                                                                            //           BoxShape.circle,
                                                                            //       gradient:
                                                                            //           RadialGradient(colors: [
                                                                            //         Color(0xFFE9A594),
                                                                            //         Color(0xFFEEBEB2)
                                                                            //       ]),

                                                                            //       // : const LinearGradient(
                                                                            //       //     end: Alignment(0.73,
                                                                            //       //         0),
                                                                            //       //     begin: Alignment(-1,
                                                                            //       //         1),
                                                                            //       //     colors: [
                                                                            //       //         Color(0xFF673636),
                                                                            //       //         Color(0xFFF8C3B5),
                                                                            //       //       ]),
                                                                            //     ),
                                                                            //     child:
                                                                            //         Container(
                                                                            //       padding:
                                                                            //           EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                            //       height:
                                                                            //           AppDimensions.height10(context) * 6.3,
                                                                            //       child: Center(
                                                                            //           child: Text(
                                                                            //         inspirationList[index *
                                                                            //             2]['description'],
                                                                            //         overflow:
                                                                            //             TextOverflow.ellipsis,
                                                                            //         maxLines:
                                                                            //             2,
                                                                            //         textAlign:
                                                                            //             TextAlign.center,
                                                                            //         style: TextStyle(
                                                                            //             fontSize: AppDimensions.font10(context) * 1.6,
                                                                            //             fontWeight: FontWeight.w400,
                                                                            //             color: const Color(0xFFFFFFFF)),
                                                                            //       )),
                                                                            //     ),
                                                                            //   )

                                                                            // : inspirationList[index * 2]['inspirationId'] ==
                                                                            //         4
                                                                            //     ? CustomCircle()
                                                                            //         .customContainer(
                                                                            //         context,
                                                                            //         gradient:
                                                                            //             null,
                                                                            //         image:
                                                                            //             DecorationImage(image: AssetImage("assets/images/contentrecordbg.png"), fit: BoxFit.cover),
                                                                            //         child:
                                                                            //             Container(
                                                                            //           padding: EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                            //           height: AppDimensions.height10(context) * 6.3,
                                                                            //           child: Center(
                                                                            //               child: Text(
                                                                            //             inspirationList[index * 2]['description'],
                                                                            //             overflow: TextOverflow.ellipsis,
                                                                            //             maxLines: 2,
                                                                            //             textAlign: TextAlign.center,
                                                                            //             style: TextStyle(fontSize: AppDimensions.font10(context) * 1.6, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF)),
                                                                            //           )),
                                                                            //         ),
                                                                            //       )
                                                                            // ? Container(
                                                                            //     width: !smallScreen
                                                                            //         ? AppDimensions.width10(context) * 19.313
                                                                            //         : AppDimensions.width10(context) * 17.6,
                                                                            //     height: !smallScreen
                                                                            //         ? AppDimensions.width10(context) * 19.313
                                                                            //         : AppDimensions.width10(context) * 17.6,
                                                                            //     decoration:
                                                                            //         const BoxDecoration(
                                                                            //       gradient: LinearGradient(end: Alignment(0.73, 0), begin: Alignment(-1, 1), colors: [
                                                                            //         Color(0xFF673636),
                                                                            //         Color(0xFFF8C3B5),
                                                                            //       ]),
                                                                            //       shape: BoxShape.circle,
                                                                            //     ),
                                                                            //     child:
                                                                            //         Container(
                                                                            //       padding: EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                            //       height: AppDimensions.height10(context) * 6.3,
                                                                            //       child: Center(
                                                                            //           child: Text(
                                                                            //         inspirationList[index * 2]['description'],
                                                                            //         overflow: TextOverflow.ellipsis,
                                                                            //         maxLines: 2,
                                                                            //         textAlign: TextAlign.center,
                                                                            //         style: TextStyle(fontSize: AppDimensions.font10(context) * 1.6, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF)),
                                                                            //       )),
                                                                            //     ),
                                                                            //   )
                                                                            // : inspirationList[index * 2]['inspirationId'] ==
                                                                            //         3
                                                                            //     ? CustomCircle().customContainer(context,
                                                                            //         gradient: null,
                                                                            //         image: DecorationImage(image: inspirationList[index * 2]['inspirationId'] == 3 ? (Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink']) == '' ? AssetImage('assets/images/video.webp') : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink'])) as ImageProvider<Object>) : AssetImage(''), fit: BoxFit.cover),
                                                                            //         child: inspirationList[index * 2]['inspirationId'] == 3
                                                                            //             ? Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink']) == ''
                                                                            //                 ? Container()
                                                                            //                 : SizedBox(
                                                                            //                     width: 10, // Set the desired width
                                                                            //                     height: 10, // Set the desired height
                                                                            //                     child: Image.asset(
                                                                            //                       'assets/images/videoicon.png',
                                                                            //                       // fit: BoxFit
                                                                            //                       //     ., // Ensures the image fits within the box
                                                                            //                     ),
                                                                            //                   )
                                                                            //             : Container())
                                                                            //  Container(
                                                                            //     width: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                            //     height: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                            //     decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: inspirationList[index * 2]['inspirationId'] == 3 ? (Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink']) == '' ? AssetImage('assets/images/video.webp') : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink'])) as ImageProvider<Object>) : AssetImage(''), fit: BoxFit.cover)),
                                                                            //     child: inspirationList[index * 2]['inspirationId'] == 3
                                                                            //         ? Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink']) == ''
                                                                            //             ? Container()
                                                                            //             : SizedBox(
                                                                            //                 width: 10, // Set the desired width
                                                                            //                 height: 10, // Set the desired height
                                                                            //                 child: Image.asset(
                                                                            //                   'assets/images/videoicon.png',
                                                                            //                   // fit: BoxFit
                                                                            //                   //     ., // Ensures the image fits within the box
                                                                            //                 ),
                                                                            //               )
                                                                            //         : Container())
                                                                            : inspirationList[index * 2]['inspirationId'] == 1
                                                                                ?
                                                                                // ? CustomCircle().customContainer(
                                                                                //     context,
                                                                                //     child: ClipRRect(
                                                                                //       borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 18),
                                                                                //       child: FadeInImage(
                                                                                //         placeholder: const AssetImage('assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                                                //         image: NetworkImage(inspirationList[index * 2]['file'].toString()),
                                                                                //         fit: BoxFit.cover,
                                                                                //         placeholderFit: BoxFit.contain,
                                                                                //       ),
                                                                                //     ),
                                                                                //   )
                                                                                CustomCircle().customContainer(context, img: inspirationList[index * 2]['file'], id: inspirationList[index * 2]['inspirationId'])
                                                                                : Container(),
                                                              ],
                                                            ),
                                                            // decoration:
                                                            //     BoxDecoration(
                                                            //         gradient: inspirationList[index * 2]['inspirationId'] ==
                                                            //                 2
                                                            //             ? const RadialGradient(
                                                            //                 colors: [
                                                            //                     Color(0xFFE9A594),
                                                            //                     Color(0xFFEEBEB2)
                                                            //                   ])
                                                            //             : const LinearGradient(
                                                            //                 end: Alignment(0.73,
                                                            //                     0),
                                                            //                 begin: Alignment(-1,
                                                            //                     1),
                                                            //                 colors: [
                                                            //                     Color(0xFF673636),
                                                            //                     Color(0xFFF8C3B5),
                                                            //                   ]),
                                                            //         shape: BoxShape
                                                            //             .circle,
                                                            //         image: DecorationImage(
                                                            //             image: inspirationList[index * 2]['inspirationId'] ==
                                                            //                     3
                                                            //                 ? (Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink']) == ''
                                                            //                     ? AssetImage('assets/images/video.webp')
                                                            //                     : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirationList[index * 2]['destinationLink'])) as ImageProvider<Object>)
                                                            //                 : AssetImage(''),
                                                            //             fit: BoxFit.cover)),

                                                            // child: inspirationList[index *
                                                            //                     2]
                                                            //                 [
                                                            //                 'inspirationId'] ==
                                                            //             2 ||
                                                            //         inspirationList[index *
                                                            //                     2]
                                                            //                 [
                                                            //                 'inspirationId'] ==
                                                            //             4
                                                            //     ? Container(
                                                            //         padding: EdgeInsets.symmetric(
                                                            //             horizontal:
                                                            //                 AppDimensions.height10(context) *
                                                            //                     1.7),
                                                            //         height:
                                                            //             AppDimensions.height10(context) *
                                                            //                 6.3,
                                                            //         child: Center(
                                                            //             child: Text(
                                                            //           inspirationList[index *
                                                            //                   2]
                                                            //               [
                                                            //               'description'],
                                                            //           overflow:
                                                            //               TextOverflow
                                                            //                   .ellipsis,
                                                            //           maxLines:
                                                            //               2,
                                                            //           textAlign:
                                                            //               TextAlign
                                                            //                   .center,
                                                            //           style: TextStyle(
                                                            //               fontSize: AppDimensions.font10(context) *
                                                            //                   1.6,
                                                            //               fontWeight: FontWeight
                                                            //                   .w400,
                                                            //               color:
                                                            //                   const Color(0xFFFFFFFF)),
                                                            //         )),
                                                            //       )
                                                            //     : inspirationList[index *
                                                            //                     2]
                                                            //                 [
                                                            //                 'inspirationId'] ==
                                                            //             1
                                                            //         ? ClipRRect(
                                                            //             borderRadius:
                                                            //                 BorderRadius.circular(AppDimensions.height10(context) *
                                                            //                     18),
                                                            //             child:
                                                            //                 FadeInImage(
                                                            //               placeholder:
                                                            //                   const AssetImage('assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                            //               image:
                                                            //                   NetworkImage(inspirationList[index * 2]['file'].toString()),
                                                            //               fit: BoxFit
                                                            //                   .cover,
                                                            //               placeholderFit:
                                                            //                   BoxFit.contain,
                                                            //             ),
                                                            //           )

                                                            //         : Container(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              16.7,
                                                      //height: AppDimensions.height10(context) * 1.9,
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.5),
                                                      child: Center(
                                                          child: Text(
                                                        inspirationList[index *
                                                                        2][
                                                                    'inspirationId'] ==
                                                                1
                                                            ? 'Image'
                                                            : inspirationList[index *
                                                                            2][
                                                                        'inspirationId'] ==
                                                                    2
                                                                ? 'Note'
                                                                : inspirationList[index *
                                                                                2]
                                                                            [
                                                                            'inspirationId'] ==
                                                                        3
                                                                    ? 'Video'
                                                                    : 'Content',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .font10(
                                                                        context) *
                                                                1.6,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xFFFFFFFF)),
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          AppDimensions.width10(
                                                                  context) *
                                                              15.7,
                                                      child: Center(
                                                          child: Text(
                                                        inspirationList[
                                                            index * 2]['title'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .font10(
                                                                        context) *
                                                                1.8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFFFFFFFF)),
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
                                              top: AppDimensions.height10(
                                                      context) *
                                                  7.4), // Extra padding for the second column
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: inspirationList.length ~/
                                                2, // Half of the items, rounded down
                                            itemBuilder: (context, index) {
                                              bool selected = selectItems
                                                  .contains(inspirationList[
                                                          index * 2 + 1]['id']
                                                      .toString());
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.5),
                                                width: AppDimensions.width10(
                                                        context) *
                                                    17.6,
                                                // height: AppDimensions.height10(
                                                //         context) *
                                                //     30,
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            AlignmentDirectional
                                                                .topEnd,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              doMultiSelection(
                                                                  inspirationList[index *
                                                                              2 +
                                                                          1]['id']
                                                                      .toString());
                                                            },
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0), // Set the borderRadius to make it circular
                                                            child: Container(
                                                              width:
                                                                  20.0, // Set the size of the circular checkbox
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: selectItems.isNotEmpty
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .transparent),
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: selected
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .transparent, // Set the background color when selected
                                                              ),
                                                              child: selected
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      size:
                                                                          16.0,
                                                                      color: Color(
                                                                          0xffFA9934), // Set the check mark color
                                                                    )
                                                                  : null, // Show the check mark icon only when selected
                                                            ),
                                                          ),
                                                          MulitiSelectionButton(
                                                            onTap: () async {
                                                              if (longPress) {
                                                                doMultiSelection(
                                                                    inspirationList[index *
                                                                                2 +
                                                                            1]['id']
                                                                        .toString());
                                                              } else {
                                                                final SharedPreferences
                                                                    prefs =
                                                                    await _prefs;

                                                                await prefs.setInt(
                                                                    'userInspirationId',
                                                                    inspirationList[
                                                                        index * 2 +
                                                                            1]['id']);
                                                                Navigator.push(
                                                                    context,
                                                                    FadePageRoute(
                                                                        page:
                                                                            const record_inspiration()));
                                                              }
                                                            },
                                                            longPress: () {
                                                              setState(() {
                                                                longPress =
                                                                    true;
                                                              });
                                                              doMultiSelection(
                                                                  inspirationList[index *
                                                                              2 +
                                                                          1]['id']
                                                                      .toString());
                                                            },
                                                            child: Container(
                                                              width: !smallScreen
                                                                  ? AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      19.313
                                                                  : AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      17.6,
                                                              height: !smallScreen
                                                                  ? AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      19.313
                                                                  : AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      17.6,

                                                              child: Column(
                                                                children: [
                                                                  inspirationList[index * 2 + 1]
                                                                              [
                                                                              'inspirationId'] ==
                                                                          2
                                                                      ? CustomCircle()
                                                                          .customContainer(
                                                                          context,
                                                                          id: inspirationList[index * 2 + 1]
                                                                              [
                                                                              'inspirationId'],
                                                                          desc: inspirationList[index * 2 + 1]
                                                                              [
                                                                              'description'],
                                                                        )
                                                                      : inspirationList[index * 2 + 1]['inspirationId'] ==
                                                                              4
                                                                          ? CustomCircle()
                                                                              .customContainer(
                                                                              context,
                                                                              id: inspirationList[index * 2 + 1]['inspirationId'],
                                                                              desc: inspirationList[index * 2 + 1]['description'],
                                                                            )
                                                                          : inspirationList[index * 2 + 1]['inspirationId'] == 3
                                                                              ? CustomCircle().customContainer(
                                                                                  context,
                                                                                  id: inspirationList[index * 2 + 1]['inspirationId'],
                                                                                  link: inspirationList[index * 2 + 1]['destinationLink'],
                                                                                )
                                                                              // ? CustomCircle()
                                                                              //     .customContainer(
                                                                              //     context,
                                                                              //     gradient:
                                                                              //         RadialGradient(colors: [
                                                                              //       Color(0xFFE9A594),
                                                                              //       Color(0xFFEEBEB2)
                                                                              //     ]),
                                                                              //     child:
                                                                              //         Container(
                                                                              //       padding:
                                                                              //           EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                              //       height:
                                                                              //           AppDimensions.height10(context) * 6.3,
                                                                              //       child: Center(
                                                                              //           child: Text(
                                                                              //         inspirationList[index * 2 + 1]['description'],
                                                                              //         overflow: TextOverflow.ellipsis,
                                                                              //         maxLines: 2,
                                                                              //         textAlign: TextAlign.center,
                                                                              //         style: TextStyle(fontSize: AppDimensions.font10(context) * 1.6, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF)),
                                                                              //       )),
                                                                              //     ),
                                                                              //   )
                                                                              // ? Container(
                                                                              //     width: !smallScreen
                                                                              //         ? AppDimensions.width10(context) * 19.313
                                                                              //         : AppDimensions.width10(context) * 17.6,
                                                                              //     height: !smallScreen
                                                                              //         ? AppDimensions.width10(context) * 19.313
                                                                              //         : AppDimensions.width10(context) * 17.6,
                                                                              //     decoration:
                                                                              //         const BoxDecoration(
                                                                              //       shape:
                                                                              //           BoxShape.circle,
                                                                              //       gradient:
                                                                              //           RadialGradient(colors: [
                                                                              //         Color(0xFFE9A594),
                                                                              //         Color(0xFFEEBEB2)
                                                                              //       ]),

                                                                              //     ),
                                                                              //     child:
                                                                              //         Container(
                                                                              //       padding:
                                                                              //           EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                              //       height:
                                                                              //           AppDimensions.height10(context) * 6.3,
                                                                              //       child: Center(
                                                                              //           child: Text(
                                                                              //         inspirationList[index * 2 + 1]['description'],
                                                                              //         overflow: TextOverflow.ellipsis,
                                                                              //         maxLines: 2,
                                                                              //         textAlign: TextAlign.center,
                                                                              //         style: TextStyle(fontSize: AppDimensions.font10(context) * 1.6, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF)),
                                                                              //       )),
                                                                              //     ),
                                                                              //   )
                                                                              // : inspirationList[index * 2 + 1]['inspirationId'] ==
                                                                              //         4
                                                                              //     ? CustomCircle().customContainer(
                                                                              //         context,
                                                                              //         gradient: LinearGradient(end: Alignment(0.73, 0), begin: Alignment(-1, 1), colors: [
                                                                              //           Color(0xFF673636),
                                                                              //           Color(0xFFF8C3B5),
                                                                              //         ]),
                                                                              //         child: Container(
                                                                              //           padding: EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                              //           height: AppDimensions.height10(context) * 6.3,
                                                                              //           child: Center(
                                                                              //               child: Text(
                                                                              //             inspirationList[index * 2 + 1]['description'],
                                                                              //             overflow: TextOverflow.ellipsis,
                                                                              //             maxLines: 2,
                                                                              //             textAlign: TextAlign.center,
                                                                              //             style: TextStyle(fontSize: AppDimensions.font10(context) * 1.6, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF)),
                                                                              //           )),
                                                                              //         ))
                                                                              // ? Container(
                                                                              //     width: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                              //     height: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                              //     decoration: const BoxDecoration(
                                                                              //       gradient: LinearGradient(end: Alignment(0.73, 0), begin: Alignment(-1, 1), colors: [
                                                                              //         Color(0xFF673636),
                                                                              //         Color(0xFFF8C3B5),
                                                                              //       ]),
                                                                              //       shape: BoxShape.circle,
                                                                              //     ),
                                                                              //     child: Container(
                                                                              //       padding: EdgeInsets.symmetric(horizontal: AppDimensions.height10(context) * 1.7),
                                                                              //       height: AppDimensions.height10(context) * 6.3,
                                                                              //       child: Center(
                                                                              //           child: Text(
                                                                              //         inspirationList[index * 2 + 1]['description'],
                                                                              //         overflow: TextOverflow.ellipsis,
                                                                              //         maxLines: 2,
                                                                              //         textAlign: TextAlign.center,
                                                                              //         style: TextStyle(fontSize: AppDimensions.font10(context) * 1.6, fontWeight: FontWeight.w400, color: const Color(0xFFFFFFFF)),
                                                                              //       )),
                                                                              //     ),
                                                                              //   )
                                                                              // : inspirationList[index * 2 + 1]['inspirationId'] == 3
                                                                              //     ? CustomCircle().customContainer(
                                                                              //         context,
                                                                              //         image: DecorationImage(image: inspirationList[index * 2 + 1]['inspirationId'] == 3 ? (Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink']) == '' ? AssetImage('assets/images/video.webp') : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink'])) as ImageProvider<Object>) : AssetImage(''), fit: BoxFit.cover),
                                                                              //         child: inspirationList[index * 2 + 1]['inspirationId'] == 3
                                                                              //             ? Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink']) == ''
                                                                              //                 ? Container()
                                                                              //                 : SizedBox(
                                                                              //                     width: 10, // Set the desired width
                                                                              //                     height: 10, // Set the desired height
                                                                              //                     child: Image.asset(
                                                                              //                       'assets/images/videoicon.png',
                                                                              //                       // fit: BoxFit
                                                                              //                       //     ., // Ensures the image fits within the box
                                                                              //                     ),
                                                                              //                   )
                                                                              //             : Container(),
                                                                              //       )
                                                                              // ? Container(
                                                                              //     width: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                              //     height: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                              //     decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: inspirationList[index * 2 + 1]['inspirationId'] == 3 ? (Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink']) == '' ? AssetImage('assets/images/video.webp') : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink'])) as ImageProvider<Object>) : AssetImage(''), fit: BoxFit.cover)),
                                                                              //     child: inspirationList[index * 2 + 1]['inspirationId'] == 3
                                                                              //         ? Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink']) == ''
                                                                              //             ? Container()
                                                                              //             : SizedBox(
                                                                              //                 width: 10, // Set the desired width
                                                                              //                 height: 10, // Set the desired height
                                                                              //                 child: Image.asset(
                                                                              //                   'assets/images/videoicon.png',
                                                                              //                   // fit: BoxFit
                                                                              //                   //     ., // Ensures the image fits within the box
                                                                              //                 ),
                                                                              //               )
                                                                              //         : Container(),
                                                                              //   )
                                                                              : inspirationList[index * 2 + 1]['inspirationId'] == 1
                                                                                  // ? CustomCircle().customContainer(
                                                                                  //     context,
                                                                                  //     child: ClipRRect(
                                                                                  //       borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 18),
                                                                                  //       child: FadeInImage(
                                                                                  //         placeholder: const AssetImage('assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                                                  //         image: NetworkImage(inspirationList[index * 2 + 1]['file'].toString()),
                                                                                  //         fit: BoxFit.cover,
                                                                                  //         placeholderFit: BoxFit.contain,
                                                                                  //       ),
                                                                                  //     ),
                                                                                  //   )
                                                                                  ? CustomCircle().customContainer(context, img: inspirationList[index * 2 + 1]['file'], id: inspirationList[index * 2 + 1]['inspirationId'])
                                                                                  // ? Container(
                                                                                  //     width: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                                  //     height: !smallScreen ? AppDimensions.width10(context) * 19.313 : AppDimensions.width10(context) * 17.6,
                                                                                  //     child: ClipRRect(
                                                                                  //       borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 18),
                                                                                  //       child: FadeInImage(
                                                                                  //         placeholder: const AssetImage('assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                                                  //         image: NetworkImage(inspirationList[index * 2 + 1]['file'].toString()),
                                                                                  //         fit: BoxFit.cover,
                                                                                  //         placeholderFit: BoxFit.contain,
                                                                                  //       ),
                                                                                  //     ),
                                                                                  //   )
                                                                                  : Container(),
                                                                ],
                                                              ),

                                                              // decoration:
                                                              //     BoxDecoration(
                                                              //         gradient: inspirationList[index * 2 + 1]['inspirationId'] ==
                                                              //                 2
                                                              //             ? const RadialGradient(colors: [
                                                              //                 Color(0xFFE9A594),
                                                              //                 Color(0xFFEEBEB2)
                                                              //               ])
                                                              //             : const LinearGradient(
                                                              //                 end: Alignment(0.73,
                                                              //                     0),
                                                              //                 begin: Alignment(-1,
                                                              //                     1),
                                                              //                 colors: [
                                                              //                     Color(0xFF673636),
                                                              //                     Color(0xFFF8C3B5),
                                                              //                   ]),
                                                              //         shape: BoxShape
                                                              //             .circle,
                                                              //         image: DecorationImage(
                                                              //             image: inspirationList[index * 2 + 1]['inspirationId'] == 3 ? (Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink']) == '' ? AssetImage('assets/images/video.webp') : NetworkImage(Videothumbnail().extractThumbnailUrl(inspirationList[index * 2 + 1]['destinationLink'])) as ImageProvider<Object>) : AssetImage(''),

                                                              //             // image: AssetImage(inspirationList[index * 2 + 1]['inspirationId'] == 3
                                                              //             //     ? 'assets/images/video_play.webp'
                                                              //             //     : ''),
                                                              //             fit: BoxFit.cover)),
                                                              // child: inspirationList[index * 2 + 1]
                                                              //                 [
                                                              //                 'inspirationId'] ==
                                                              //             2 ||
                                                              //         inspirationList[index * 2 + 1]
                                                              //                 [
                                                              //                 'inspirationId'] ==
                                                              //             4
                                                              //     ? Container(
                                                              //         padding: EdgeInsets.symmetric(
                                                              //             horizontal:
                                                              //                 AppDimensions.height10(context) * 1.7),
                                                              //         height:
                                                              //             AppDimensions.height10(context) *
                                                              //                 6.3,
                                                              //         child: Center(
                                                              //             child: Text(
                                                              //           inspirationList[index *
                                                              //                   2 +
                                                              //               1]['description'],
                                                              //           overflow:
                                                              //               TextOverflow.ellipsis,
                                                              //           maxLines:
                                                              //               2,
                                                              //           textAlign:
                                                              //               TextAlign.center,
                                                              //           style: TextStyle(
                                                              //               fontSize: AppDimensions.font10(context) *
                                                              //                   1.6,
                                                              //               fontWeight:
                                                              //                   FontWeight.w400,
                                                              //               color: const Color(0xFFFFFFFF)),
                                                              //         )),
                                                              //       )
                                                              //     : inspirationList[index * 2 + 1]
                                                              //                 [
                                                              //                 'inspirationId'] ==
                                                              //             1
                                                              //         ? ClipRRect(
                                                              //             borderRadius:
                                                              //                 BorderRadius.circular(AppDimensions.height10(context) * 18),
                                                              //             child:
                                                              //                 FadeInImage(
                                                              //               placeholder:
                                                              //                   const AssetImage('assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                                                              //               image:
                                                              //                   NetworkImage(inspirationList[index * 2 + 1]['file'].toString()),
                                                              //               fit:
                                                              //                   BoxFit.cover,
                                                              //               placeholderFit:
                                                              //                   BoxFit.contain,
                                                              //             ),
                                                              //           )
                                                              //         : Container(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            16.7,
                                                        //height: AppDimensions.height10(context) * 1.9,
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.5),
                                                        child: Center(
                                                            child: Text(
                                                          inspirationList[index *
                                                                              2 +
                                                                          1][
                                                                      'inspirationId'] ==
                                                                  1
                                                              ? 'Image'
                                                              : inspirationList[
                                                                              index * 2 + 1]
                                                                          [
                                                                          'inspirationId'] ==
                                                                      2
                                                                  ? 'Note'
                                                                  : inspirationList[index * 2 + 1]
                                                                              [
                                                                              'inspirationId'] ==
                                                                          3
                                                                      ? 'Video'
                                                                      : 'Content',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .font10(
                                                                          context) *
                                                                  1.6,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color(
                                                                  0xFFFFFFFF)),
                                                        )),
                                                      ),
                                                      SizedBox(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            15.7,
                                                        child: Center(
                                                            child: Text(
                                                          inspirationList[
                                                                  index * 2 + 1]
                                                              ['title'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .font10(
                                                                          context) *
                                                                  1.8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xFFFFFFFF)),
                                                        )),
                                                      )
                                                    ]),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
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
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              padding: EdgeInsets.only(
                  left: AppDimensions.width10(context) * 2.2,
                  right: AppDimensions.width10(context) * 2.2),
              height: AppDimensions.height10(context) * 7.0,
              // width: AppDimensions.width10(context) * 41.4,
              child: searchIcon == true
                  ? BottomSearch(
                      onTap: () {
                        _searchController.clear();
                        setState(() {
                          inspirationList = inspirationAll;
                        });
                      },
                      CancelTap: () {
                        setState(() {
                          _searchController.clear();
                          inspirationList = inspirationAll;
                          searchIcon = false;
                          noData = false;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          searchHurdles(value);
                        });
                      },
                      controller: _searchController,
                    )
                  // Container(
                  //     color: Colors.transparent,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Container(
                  //               height: AppDimensions.height10(context) * 3.6,
                  //               width: AppDimensions.width10(context) * 31.3,
                  //               padding: const EdgeInsets.all(6.0),
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
                  //                     onChanged: (value) {
                  //                       setState(() {
                  //                         searchHurdles(value);
                  //                       });
                  //                     },
                  //                     decoration: InputDecoration(
                  //                         contentPadding: EdgeInsets.only(
                  //                           bottom: AppDimensions.height10(
                  //                                   context) *
                  //                               1.9,
                  //                         ),
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
                  //                             setState(() {
                  //                               inspirationList =
                  //                                   inspirationAll;
                  //                             });
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
                  //               _searchController.clear();
                  //               inspirationList = inspirationAll;
                  //               searchIcon = false;
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
                                CustomBottomSheet().customBottomIcon(context),
                                // SizedBox(
                                //   width: AppDimensions.width10(context) * 2.4,
                                //   height: AppDimensions.height10(context) * 2.4,
                                //   // padding: EdgeInsets.only(
                                //   //     top: AppDimensions.height10(context) * 0.5,
                                //   //     bottom: AppDimensions.height10(context) * 0.5),
                                //   child: GestureDetector(
                                //     onTap: () {},
                                //     child: Image.asset(
                                //       'assets/images/ic_filter_list.webp',
                                //       width:
                                //           AppDimensions.width10(context) * 2.4,
                                //       height:
                                //           AppDimensions.height10(context) * 2.4,
                                //       fit: BoxFit.contain,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: AppDimensions.width10(context) * 0.5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      CustomBottomSheet().BottomSheet(
                                        context,
                                        list: goalName,
                                        onTap: () {
                                          setState(() {
                                            selectedgoal = goalName[goalIndex];
                                            goalId = goals[goalIndex]['id'];
                                          });
                                          filterInspiratonByTag(
                                              typeindex,
                                              goals[goalIndex]['id'],
                                              selectionTag);

                                          Navigator.pop(context);
                                        },
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            goalIndex = index;
                                            //activity_duration = _statements[_selectedIndex];
                                            // _selected_activity =
                                            //     _statements[index];
                                          });
                                        },
                                      );

                                      // showModalBottomSheet(
                                      //   context: context,
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   shape: const RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.vertical(
                                      //       top: Radius.circular(16),
                                      //     ),
                                      //   ),
                                      //   builder: (context) {
                                      //     return GestureDetector(
                                      //       onTap: () =>
                                      //           Navigator.of(context).pop(),
                                      //       child: Container(
                                      //         height: AppDimensions.height10(
                                      //                 context) *
                                      //             30.3,
                                      //         color: const Color.fromRGBO(
                                      //             0, 0, 0, 0.001),
                                      //         child: GestureDetector(
                                      //           onTap: () {},
                                      //           child: Container(
                                      //             decoration: const BoxDecoration(
                                      //               color: Colors.white,
                                      //             ),
                                      //             child: Stack(
                                      //               children: [
                                      //                 Column(
                                      //                   children: [
                                      //                     Container(
                                      //                       height: AppDimensions
                                      //                               .height10(
                                      //                                   context) *
                                      //                           4.0,
                                      //                       width: AppDimensions
                                      //                               .width10(
                                      //                                   context) *
                                      //                           41.4,
                                      //                       decoration: BoxDecoration(
                                      //                           border: Border(
                                      //                               bottom: BorderSide(
                                      //                                   width: AppDimensions.width10(
                                      //                                           context) *
                                      //                                       0.1,
                                      //                                   color: const Color(
                                      //                                       0xFF828282)))),
                                      //                       child: Row(
                                      //                         mainAxisAlignment:
                                      //                             MainAxisAlignment
                                      //                                 .end,
                                      //                         children: [
                                      //                           GestureDetector(
                                      //                             onTap: () {
                                      //                               Navigator.pop(
                                      //                                   context);
                                      //                             },
                                      //                             child:
                                      //                                 Container(
                                      //                               margin: EdgeInsets.only(
                                      //                                   right: AppDimensions.height10(
                                      //                                           context) *
                                      //                                       2.0),
                                      //                               child: Text(
                                      //                                 'Cancel',
                                      //                                 style: TextStyle(
                                      //                                     fontSize:
                                      //                                         AppDimensions.font10(context) *
                                      //                                             1.9,
                                      //                                     height: AppDimensions.height10(context) *
                                      //                                         0.1,
                                      //                                     color: const Color(
                                      //                                         0xFF2F80ED)),
                                      //                               ),
                                      //                             ),
                                      //                           ),
                                      //                           GestureDetector(
                                      //                             onTap: () {
                                      //                               setState(() {
                                      //                                 selectedgoal =
                                      //                                     goalName[
                                      //                                         goalIndex];
                                      //                                 goalId = goals[
                                      //                                         goalIndex]
                                      //                                     ['id'];
                                      //                               });
                                      //                               filterInspiratonByTag(
                                      //                                   typeindex,
                                      //                                   goals[goalIndex]
                                      //                                       [
                                      //                                       'id'],
                                      //                                   selectionTag);

                                      //                               Navigator.pop(
                                      //                                   context);
                                      //                             },
                                      //                             child: SizedBox(
                                      //                               child: Text(
                                      //                                 'Done',
                                      //                                 style: TextStyle(
                                      //                                     fontSize:
                                      //                                         AppDimensions.font10(context) *
                                      //                                             1.9,
                                      //                                     height: AppDimensions.height10(context) *
                                      //                                         0.1,
                                      //                                     color: const Color(
                                      //                                         0xFF2F80ED)),
                                      //                               ),
                                      //                             ),
                                      //                           ),
                                      //                           SizedBox(
                                      //                             width: AppDimensions
                                      //                                 .width10(
                                      //                                     context),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                     ),
                                      //                     Expanded(
                                      //                       child:
                                      //                           ListWheelScrollView(
                                      //                         itemExtent: 40,
                                      //                         magnification: 1.3,
                                      //                         useMagnifier: true,
                                      //                         physics:
                                      //                             const FixedExtentScrollPhysics(),
                                      //                         onSelectedItemChanged:
                                      //                             (int index) {
                                      //                           setState(() {
                                      //                             goalIndex =
                                      //                                 index;
                                      //                             //activity_duration = _statements[_selectedIndex];
                                      //                             // _selected_activity =
                                      //                             //     _statements[index];
                                      //                           });
                                      //                         },
                                      //                         // Set the height of each statement
                                      //                         children: goalName
                                      //                             .map(
                                      //                                 (statement) =>
                                      //                                     SizedBox(
                                      //                                       width:
                                      //                                           AppDimensions.height10(context) * 26,
                                      //                                       child:
                                      //                                           Center(
                                      //                                         child: Text(statement,
                                      //                                             overflow: TextOverflow.ellipsis,
                                      //                                             textAlign: TextAlign.center,
                                      //                                             style: TextStyle(
                                      //                                               fontSize: AppDimensions.height10(context) * 2.0,
                                      //                                               fontWeight: FontWeight.w400,
                                      //                                             )),
                                      //                                       ),
                                      //                                     ))
                                      //                             .toList(),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //                 Positioned(
                                      //                   top: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       14.5,
                                      //                   right: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   left: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   child: Align(
                                      //                     alignment:
                                      //                         const Alignment(
                                      //                             0, 0),
                                      //                     child: Container(
                                      //                         width: 400,
                                      //                         height: 1,
                                      //                         color: const Color(
                                      //                                 0xFF828282)
                                      //                             .withOpacity(
                                      //                                 0.5)),
                                      //                   ),
                                      //                 ),
                                      //                 Positioned(
                                      //                   top: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       19.5,
                                      //                   right: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   left: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   child: Align(
                                      //                     alignment:
                                      //                         const Alignment(
                                      //                             0, 0),
                                      //                     child: Container(
                                      //                         width: 400,
                                      //                         height: 1,
                                      //                         color: const Color(
                                      //                                 0xFF828282)
                                      //                             .withOpacity(
                                      //                                 0.5)),
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: CustomBottomSheet()
                                        .customBottomContainer(
                                      context,
                                      "Goal:",
                                      selectedgoal.length <= 30
                                          ? selectedgoal
                                          : '${selectedgoal.substring(0, 29)}...',
                                    )

                                    //  Container(
                                    //   // width: AppDimensions.width10(context) * 11.5,
                                    //   height:
                                    //       AppDimensions.height10(context) * 3.4,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //           AppDimensions.height10(context) *
                                    //               1.0),
                                    //       border: Border.all(
                                    //           width: AppDimensions.height10(
                                    //                   context) *
                                    //               0.1,
                                    //           color: const Color(0xFFE0E0E0))),
                                    //   margin: EdgeInsets.only(
                                    //       left: AppDimensions.height10(context) *
                                    //           1.3,
                                    //       right: AppDimensions.width10(context) *
                                    //           1.0),
                                    //   child: Row(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.center,
                                    //     children: [
                                    //       Container(
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 1.0),
                                    //         child: Text(
                                    //           'Goal:',
                                    //           style: TextStyle(
                                    //               fontSize: AppDimensions.font10(
                                    //                       context) *
                                    //                   1.4,
                                    //               fontWeight: FontWeight.w400,
                                    //               color: const Color(0xffFA9934)),
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         //width: AppDimensions.width10(context) * 1.9,
                                    //         height:
                                    //             AppDimensions.height10(context) *
                                    //                 2.4,
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 0.8),
                                    //         child: Center(
                                    //           child: Text(
                                    //             selectedgoal.length <= 30
                                    //                 ? selectedgoal
                                    //                 : '${selectedgoal.substring(0, 29)}...',
                                    //             style: TextStyle(
                                    //                 fontSize:
                                    //                     AppDimensions.font10(
                                    //                             context) *
                                    //                         1.4,
                                    //                 fontWeight: FontWeight.w700,
                                    //                 color:
                                    //                     const Color(0xffFA9934)),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         width:
                                    //             AppDimensions.width10(context) *
                                    //                 2.4,
                                    //         height:
                                    //             AppDimensions.height10(context) *
                                    //                 2.4,
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 0.8,
                                    //             right: AppDimensions.width10(
                                    //                     context) *
                                    //                 1.0,
                                    //             bottom: AppDimensions.height10(
                                    //                     context) *
                                    //                 0.3),
                                    //         child: const Icon(
                                    //           Icons.arrow_drop_down,
                                    //           color: Color(0xffFA9934),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),

                                    ),
                                GestureDetector(
                                    onTap: () {
                                      CustomBottomSheet().BottomSheet(
                                        context,
                                        list: tagNames,
                                        onTap: () {
                                          setState(() {
                                            selectedTag = tagNames[tagIndex]
                                                .toString()
                                                .trim();
                                            selectionTag = tagNames[tagIndex]
                                                .toString()
                                                .trim();
                                          });

                                          filterInspiratonByTag(
                                              typeindex,
                                              goalId,
                                              tagNames[tagIndex]
                                                  .toString()
                                                  .trim());
                                          Navigator.pop(context);
                                        },
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            tagIndex = index;
                                            //activity_duration = _statements[_selectedIndex];
                                            // _selected_activity =
                                            //     _statements[index];
                                          });
                                        },
                                      );

                                      // showModalBottomSheet(
                                      //   context: context,
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   shape: const RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.vertical(
                                      //       top: Radius.circular(16),
                                      //     ),
                                      //   ),
                                      //   builder: (context) {
                                      //     return GestureDetector(
                                      //       onTap: () =>
                                      //           Navigator.of(context).pop(),
                                      //       child: Container(
                                      //         height: AppDimensions.height10(
                                      //                 context) *
                                      //             30.3,
                                      //         color: const Color.fromRGBO(
                                      //             0, 0, 0, 0.001),
                                      //         child: GestureDetector(
                                      //           onTap: () {},
                                      //           child: Container(
                                      //             decoration: const BoxDecoration(
                                      //               color: Colors.white,
                                      //             ),
                                      //             child: Stack(
                                      //               children: [
                                      //                 Column(
                                      //                   children: [
                                      //                     Container(
                                      //                       height: AppDimensions
                                      //                               .height10(
                                      //                                   context) *
                                      //                           4.0,
                                      //                       width: AppDimensions
                                      //                               .width10(
                                      //                                   context) *
                                      //                           41.4,
                                      //                       decoration: BoxDecoration(
                                      //                           border: Border(
                                      //                               bottom: BorderSide(
                                      //                                   width: AppDimensions.width10(
                                      //                                           context) *
                                      //                                       0.1,
                                      //                                   color: const Color(
                                      //                                       0xFF828282)))),
                                      //                       child: Row(
                                      //                         mainAxisAlignment:
                                      //                             MainAxisAlignment
                                      //                                 .end,
                                      //                         children: [
                                      //                           GestureDetector(
                                      //                             onTap: () {
                                      //                               Navigator.pop(
                                      //                                   context);
                                      //                             },
                                      //                             child:
                                      //                                 Container(
                                      //                               margin: EdgeInsets.only(
                                      //                                   right: AppDimensions.height10(
                                      //                                           context) *
                                      //                                       2.0),
                                      //                               child: Text(
                                      //                                 'Cancel',
                                      //                                 style: TextStyle(
                                      //                                     fontSize:
                                      //                                         AppDimensions.font10(context) *
                                      //                                             1.9,
                                      //                                     height: AppDimensions.height10(context) *
                                      //                                         0.1,
                                      //                                     color: const Color(
                                      //                                         0xFF2F80ED)),
                                      //                               ),
                                      //                             ),
                                      //                           ),
                                      //                           GestureDetector(
                                      //                             onTap: () {
                                      //                               setState(() {
                                      //                                 selectedTag = tagNames[
                                      //                                         tagIndex]
                                      //                                     .toString()
                                      //                                     .trim();
                                      //                                 selectionTag = tagNames[
                                      //                                         tagIndex]
                                      //                                     .toString()
                                      //                                     .trim();
                                      //                               });

                                      //                               filterInspiratonByTag(
                                      //                                   typeindex,
                                      //                                   goalId,
                                      //                                   tagNames[
                                      //                                           tagIndex]
                                      //                                       .toString()
                                      //                                       .trim());

                                      //                               Navigator.pop(
                                      //                                   context);
                                      //                             },
                                      //                             child: SizedBox(
                                      //                               child: Text(
                                      //                                 'Done',
                                      //                                 style: TextStyle(
                                      //                                     fontSize:
                                      //                                         AppDimensions.font10(context) *
                                      //                                             1.9,
                                      //                                     height: AppDimensions.height10(context) *
                                      //                                         0.1,
                                      //                                     color: const Color(
                                      //                                         0xFF2F80ED)),
                                      //                               ),
                                      //                             ),
                                      //                           ),
                                      //                           SizedBox(
                                      //                             width: AppDimensions
                                      //                                 .width10(
                                      //                                     context),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                     ),
                                      //                     Expanded(
                                      //                       child:
                                      //                           ListWheelScrollView(
                                      //                         itemExtent: 40,
                                      //                         magnification: 1.3,
                                      //                         physics:
                                      //                             const FixedExtentScrollPhysics(),
                                      //                         useMagnifier:
                                      //                             true, // Set the height of each statement
                                      //                         children: tagNames
                                      //                             .map(
                                      //                                 (statement) =>
                                      //                                     SizedBox(
                                      //                                       width:
                                      //                                           AppDimensions.height10(context) * 26,
                                      //                                       child:
                                      //                                           Center(
                                      //                                         child: Text(statement,
                                      //                                             overflow: TextOverflow.ellipsis,
                                      //                                             textAlign: TextAlign.center,
                                      //                                             style: TextStyle(
                                      //                                               fontSize: AppDimensions.height10(context) * 2.0,
                                      //                                               fontWeight: FontWeight.w400,
                                      //                                             )),
                                      //                                       ),
                                      //                                     ))
                                      //                             .toList(),
                                      //                         onSelectedItemChanged:
                                      //                             (int index) {
                                      //                           setState(() {
                                      //                             tagIndex =
                                      //                                 index;
                                      //                             //activity_duration = _statements[_selectedIndex];
                                      //                             // _selected_activity =
                                      //                             //     _statements[index];
                                      //                           });
                                      //                         },
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //                 Positioned(
                                      //                   top: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       14.5,
                                      //                   right: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   left: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   child: Align(
                                      //                     alignment:
                                      //                         const Alignment(
                                      //                             0, 0),
                                      //                     child: Container(
                                      //                         width: 400,
                                      //                         height: 1,
                                      //                         color: const Color(
                                      //                                 0xFF828282)
                                      //                             .withOpacity(
                                      //                                 0.5)),
                                      //                   ),
                                      //                 ),
                                      //                 Positioned(
                                      //                   top: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       19.5,
                                      //                   right: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   left: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   child: Align(
                                      //                     alignment:
                                      //                         const Alignment(
                                      //                             0, 0),
                                      //                     child: Container(
                                      //                         width: 400,
                                      //                         height: 1,
                                      //                         color: const Color(
                                      //                                 0xFF828282)
                                      //                             .withOpacity(
                                      //                                 0.5)),
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: CustomBottomSheet()
                                        .customBottomContainer(
                                      context,
                                      "Tags:",
                                      selectedTag.length <= 30
                                          ? selectedTag
                                          : '${selectedTag.substring(0, 29)}...',
                                    )
                                    //  Container(
                                    //   //width: AppDimensions.width10(context) * 11.6,
                                    //   height:
                                    //       AppDimensions.height10(context) * 3.4,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //           AppDimensions.height10(context) *
                                    //               1.0),
                                    //       border: Border.all(
                                    //           width: AppDimensions.height10(
                                    //                   context) *
                                    //               0.1,
                                    //           color: const Color(0xFFE0E0E0))),
                                    //   child: Row(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.center,
                                    //     children: [
                                    //       Container(
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 1.0),
                                    //         child: Text(
                                    //           'Tags:',
                                    //           style: TextStyle(
                                    //               fontSize: AppDimensions.font10(
                                    //                       context) *
                                    //                   1.4,
                                    //               fontWeight: FontWeight.w400,
                                    //               color: const Color(0xffFA9934)),
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         // width: AppDimensions.width10(context) * 1.9,
                                    //         height:
                                    //             AppDimensions.height10(context) *
                                    //                 2.4,
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 0.8),
                                    //         child: Center(
                                    //           child: Text(
                                    //             selectedTag.length <= 30
                                    //                 ? selectedTag
                                    //                 : '${selectedTag.substring(0, 29)}...',
                                    //             style: TextStyle(
                                    //                 fontSize:
                                    //                     AppDimensions.font10(
                                    //                             context) *
                                    //                         1.4,
                                    //                 fontWeight: FontWeight.w700,
                                    //                 color:
                                    //                     const Color(0xffFA9934)),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         width:
                                    //             AppDimensions.width10(context) *
                                    //                 2.4,
                                    //         height:
                                    //             AppDimensions.height10(context) *
                                    //                 2.4,
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 0.8,
                                    //             bottom: AppDimensions.height10(
                                    //                     context) *
                                    //                 0.3,
                                    //             right: AppDimensions.width10(
                                    //                     context) *
                                    //                 1.0),
                                    //         child: const Icon(
                                    //           Icons.arrow_drop_down,
                                    //           color: Color(0xffFA9934),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),

                                    ),
                                SizedBox(
                                  width: AppDimensions.width10(context) * 0.5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      CustomBottomSheet().BottomSheet(
                                        context,
                                        list: type,
                                        onTap: () {
                                          setState(() {
                                            selectedtype = type[typeindex];
                                          });

                                          filterInspiratonByTag(
                                              typeindex, goalId, selectionTag);
                                          Navigator.pop(context);
                                        },
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            typeindex = index;
                                            //activity_duration = _statements[_selectedIndex];
                                            // _selected_activity =
                                            //     _statements[index];
                                          });
                                        },
                                      );
                                      // showModalBottomSheet(
                                      //   context: context,
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   shape: const RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.vertical(
                                      //       top: Radius.circular(16),
                                      //     ),
                                      //   ),
                                      //   builder: (context) {
                                      //     return GestureDetector(
                                      //       onTap: () =>
                                      //           Navigator.of(context).pop(),
                                      //       child: Container(
                                      //         height: AppDimensions.height10(
                                      //                 context) *
                                      //             30.3,
                                      //         color: const Color.fromRGBO(
                                      //             0, 0, 0, 0.001),
                                      //         child: GestureDetector(
                                      //           onTap: () {},
                                      //           child: Container(
                                      //             decoration: const BoxDecoration(
                                      //               color: Colors.white,
                                      //             ),
                                      //             child: Stack(
                                      //               children: [
                                      //                 Column(
                                      //                   children: [
                                      //                     Container(
                                      //                       height: AppDimensions
                                      //                               .height10(
                                      //                                   context) *
                                      //                           4.0,
                                      //                       width: AppDimensions
                                      //                               .width10(
                                      //                                   context) *
                                      //                           41.4,
                                      //                       decoration: BoxDecoration(
                                      //                           border: Border(
                                      //                               bottom: BorderSide(
                                      //                                   width: AppDimensions.width10(
                                      //                                           context) *
                                      //                                       0.1,
                                      //                                   color: const Color(
                                      //                                       0xFF828282)))),
                                      //                       child: Row(
                                      //                         mainAxisAlignment:
                                      //                             MainAxisAlignment
                                      //                                 .end,
                                      //                         children: [
                                      //                           GestureDetector(
                                      //                             onTap: () {
                                      //                               Navigator.pop(
                                      //                                   context);
                                      //                             },
                                      //                             child:
                                      //                                 Container(
                                      //                               margin: EdgeInsets.only(
                                      //                                   right: AppDimensions.height10(
                                      //                                           context) *
                                      //                                       2.0),
                                      //                               child: Text(
                                      //                                 'Cancel',
                                      //                                 style: TextStyle(
                                      //                                     fontSize:
                                      //                                         AppDimensions.font10(context) *
                                      //                                             1.9,
                                      //                                     height: AppDimensions.height10(context) *
                                      //                                         0.1,
                                      //                                     color: const Color(
                                      //                                         0xFF2F80ED)),
                                      //                               ),
                                      //                             ),
                                      //                           ),
                                      //                           GestureDetector(
                                      //                             onTap: () {
                                      //                               setState(() {
                                      //                                 selectedtype =
                                      //                                     type[
                                      //                                         typeindex];
                                      //                               });

                                      //                               filterInspiratonByTag(
                                      //                                   typeindex,
                                      //                                   goalId,
                                      //                                   selectionTag);
                                      //                               Navigator.pop(
                                      //                                   context);
                                      //                             },
                                      //                             child: SizedBox(
                                      //                               child: Text(
                                      //                                 'Done',
                                      //                                 style: TextStyle(
                                      //                                     fontSize:
                                      //                                         AppDimensions.font10(context) *
                                      //                                             1.9,
                                      //                                     height: AppDimensions.height10(context) *
                                      //                                         0.1,
                                      //                                     color: const Color(
                                      //                                         0xFF2F80ED)),
                                      //                               ),
                                      //                             ),
                                      //                           ),
                                      //                           SizedBox(
                                      //                             width: AppDimensions
                                      //                                 .width10(
                                      //                                     context),
                                      //                           ),
                                      //                         ],
                                      //                       ),
                                      //                     ),
                                      //                     Expanded(
                                      //                       child:
                                      //                           ListWheelScrollView(
                                      //                         itemExtent: 40,
                                      //                         magnification: 1.3,
                                      //                         physics:
                                      //                             const FixedExtentScrollPhysics(),
                                      //                         useMagnifier:
                                      //                             true, // Set the height of each statement
                                      //                         children: type
                                      //                             .map((statement) =>
                                      //                                 Text(
                                      //                                     statement,
                                      //                                     style:
                                      //                                         TextStyle(
                                      //                                       fontSize:
                                      //                                           AppDimensions.height10(context) * 2.0,
                                      //                                       fontWeight:
                                      //                                           FontWeight.w400,
                                      //                                     )))
                                      //                             .toList(),
                                      //                         onSelectedItemChanged:
                                      //                             (int index) {
                                      //                           setState(() {
                                      //                             typeindex =
                                      //                                 index;
                                      //                             //activity_duration = _statements[_selectedIndex];
                                      //                             // _selected_activity =
                                      //                             //     _statements[index];
                                      //                           });
                                      //                         },
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //                 Positioned(
                                      //                   top: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       13.5,
                                      //                   right: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   left: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   child: Align(
                                      //                     alignment:
                                      //                         const Alignment(
                                      //                             0, 0),
                                      //                     child: Container(
                                      //                         width: 400,
                                      //                         height: 1,
                                      //                         color: const Color(
                                      //                                 0xFF828282)
                                      //                             .withOpacity(
                                      //                                 0.5)),
                                      //                   ),
                                      //                 ),
                                      //                 Positioned(
                                      //                   top: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       18.0,
                                      //                   right: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   left: AppDimensions
                                      //                           .height10(
                                      //                               context) *
                                      //                       2.0,
                                      //                   child: Align(
                                      //                     alignment:
                                      //                         const Alignment(
                                      //                             0, 0),
                                      //                     child: Container(
                                      //                         width: 400,
                                      //                         height: 1,
                                      //                         color: const Color(
                                      //                                 0xFF828282)
                                      //                             .withOpacity(
                                      //                                 0.5)),
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: CustomBottomSheet()
                                        .customBottomContainer(
                                      context,
                                      "Media:",
                                      selectedtype,
                                    )
                                    //  Container(
                                    //   //width: AppDimensions.width10(context) * 11.6,
                                    //   height:
                                    //       AppDimensions.height10(context) * 3.4,
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(
                                    //           AppDimensions.height10(context) *
                                    //               1.0),
                                    //       border: Border.all(
                                    //           width: AppDimensions.height10(
                                    //                   context) *
                                    //               0.1,
                                    //           color: const Color(0xFFE0E0E0))),
                                    //   child: Row(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.center,
                                    //     children: [
                                    //       Container(
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 1.0),
                                    //         child: Text(
                                    //           'Media:',
                                    //           style: TextStyle(
                                    //               fontSize: AppDimensions.font10(
                                    //                       context) *
                                    //                   1.4,
                                    //               fontWeight: FontWeight.w400,
                                    //               color: const Color(0xffFA9934)),
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         // width: AppDimensions.width10(context) * 1.9,
                                    //         height:
                                    //             AppDimensions.height10(context) *
                                    //                 2.4,
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 0.8),
                                    //         child: Center(
                                    //           child: Text(
                                    //             selectedtype,
                                    //             style: TextStyle(
                                    //                 fontSize:
                                    //                     AppDimensions.font10(
                                    //                             context) *
                                    //                         1.4,
                                    //                 fontWeight: FontWeight.w700,
                                    //                 color:
                                    //                     const Color(0xffFA9934)),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Container(
                                    //         width:
                                    //             AppDimensions.width10(context) *
                                    //                 2.4,
                                    //         height:
                                    //             AppDimensions.height10(context) *
                                    //                 2.4,
                                    //         margin: EdgeInsets.only(
                                    //             left: AppDimensions.width10(
                                    //                     context) *
                                    //                 0.8,
                                    //             bottom: AppDimensions.height10(
                                    //                     context) *
                                    //                 0.3,
                                    //             right: AppDimensions.width10(
                                    //                     context) *
                                    //                 1.0),
                                    //         child: const Icon(
                                    //           Icons.arrow_drop_down,
                                    //           color: Color(0xffFA9934),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),

                                    ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      inspirationList = inspirationAll;
                                      selectionTag = '';
                                      noData = false;
                                      goalId = 0;
                                      typeindex = 0;
                                      selectedtype = 'All';
                                      selectedgoal = "All";
                                      selectedTag = 'All';
                                    });
                                  },
                                  child: CustomBottomSheet()
                                      .customClearWidget(context),
                                  // Container(
                                  //   //width: AppDimensions.width10(context) * 3.9,
                                  //   height:
                                  //       AppDimensions.height10(context) * 3.4,
                                  //   margin: EdgeInsets.only(
                                  //       left: AppDimensions.width10(context) *
                                  //           1.0,
                                  //       right: AppDimensions.width10(context) *
                                  //           7.0),
                                  //   alignment: Alignment.centerLeft,
                                  //   child: Text(
                                  //     'Clear all',
                                  //     style: TextStyle(
                                  //         fontSize:
                                  //             AppDimensions.font10(context) *
                                  //                 1.4,
                                  //         fontWeight: FontWeight.w400,
                                  //         decoration: TextDecoration.underline,
                                  //         color: const Color(0xFFFA9934)),
                                  //   ),
                                  // ),
                                )
                              ],
                            ),
                          ),
                        ),
                        CustomBottomSheet().customSearchWidget(
                          context,
                          () {
                            setState(() {
                              searchIcon = true;
                            });
                          },
                        )

                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Container(
                        //     width: AppDimensions.width10(context) * 4.9,
                        //     height: AppDimensions.height10(context) * 5.0,
                        //     decoration: const BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: Color(0xFFFBFBFB)),
                        //     child: GestureDetector(
                        //       onTap: () {
                        //         setState(() {
                        //           searchIcon = true;
                        //         });
                        //       },
                        //       child: Image.asset(
                        //         'assets/images/Search.webp',
                        //         width: AppDimensions.width10(context) * 5,
                        //         height: AppDimensions.height10(context) * 5,
                        //         fit: BoxFit.contain,
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //const Padding(padding: EdgeInsets.all(10))
                      ],
                    ),
            ),
          )
          //:
          // Container(),
          ),
    );
  }
}

// class updatedLandingPage extends StatefulWidget {
//   final bool delete;
//   final bool is_Updated;
//   const updatedLandingPage(
//       {super.key, required this.delete, required this.is_Updated});

//   @override
//   State<updatedLandingPage> createState() => _updatedLandingPageState();
// }

// class _updatedLandingPageState extends State<updatedLandingPage> {
//   bool loading = true;
//   Future<Timer> loadData() async {
//     return Timer(const Duration(seconds: 1), onDoneLoading);
//   }

//   var inspirationDetails;

//   void onDoneLoading() {
//     setState(() {
//       loading = false;
//       showContainer = true;
//     });
//     startTimer();
//   }

//   void _fetchInspiration() {
//     InspirationApi().getInspirationById().then((response) {
//       if (response.length != 0) {
//         setState(() {
//           inspirationDetails = response;
//         });

//         loadData();
//       } else {}

//       // return null;
//     });
//   }

//   bool showContainer = false;
//   double swipeOffset = 0.0;
//   Timer? _timer;

//   void startTimer() {
//     _timer = Timer(const Duration(seconds: 5), () {
//       setState(() {
//         showContainer = false;
//       });
//       Timer(const Duration(seconds: 1), () {
//         // Navigator.push(
//         //   context,
//         //   FadePageRoute(page: const view_details()),
//         // );
//       });
//     });
//   }

//   void stopTimer() {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel(); // Cancel the timer if it's active
//     }
//   }

//   @override
//   void dispose() {
//     stopTimer(); // Make sure to cancel the timer when the widget is disposed
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();

//     _fetchInspiration();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           actions: [
//             Center(
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         FadePageRoute(
//                             page:
//                                 const inspiration_landing(is_Updated: false)));
//                   },
//                   icon: Image.asset(
//                     'assets/images/Close.webp',
//                     // width: AppDimensions.width10(context) * 2.6,
//                     height: AppDimensions.height10(context) * 2.8,
//                     fit: BoxFit.contain,
//                   )),
//             )
//           ],
//         ),
//         extendBodyBehindAppBar: true,
//         bottomNavigationBar: showContainer
//             ? Container(
//                 margin: const EdgeInsets.all(10),
//                 child: updateBox(
//                     headText: widget.is_Updated ? 'Updated' : 'SAVED',
//                     bodyText: inspirationDetails['inspiration']['title'],
//                     edit: false,
//                     onTap1: () {
//                       Navigator.push(
//                         context,
//                         FadePageRoute(page: const view_details()),
//                       );
//                       stopTimer();
//                     },
//                     FadeFunction: () {},
//                     functionText: 'View'),
//               )
//             : Container(),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/bg_inpiration_purple.webp'),
//                   colorFilter: ColorFilter.mode(
//                       Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
//                   fit: BoxFit.cover)),
//           child: loading == false
//               ? SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     children: [
//                       Container(
//                         width: AppDimensions.width10(context) * 34.3,
//                         height: AppDimensions.height10(context) * 27.0,
//                         margin: EdgeInsets.only(
//                             top: AppDimensions.height10(context) * 12.0),
//                         child: Stack(
//                           children: [
//                             GestureDetector(
//                               onTap: () {},
//                               child: SizedBox(
//                                 width: AppDimensions.width10(context) * 34.3,
//                                 height: AppDimensions.height10(context) * 8.1,
//                                 child: Center(
//                                   child: GradientText(
//                                     AppText().inspirationTitle,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       height: 1.5,
//                                       fontSize:
//                                           AppDimensions.font10(context) * 3.0,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                     colors: const [
//                                       Color(0xffFA9934),
//                                       Color(0xffEDD15E)
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: const Alignment(0, 0.525),
//                               child: AnimatedScaleButton(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       FadePageRoute(
//                                           page: const inspiraton_goals(
//                                         update: false,
//                                         data_saved: false,
//                                         route: 'landing',
//                                         context: false,
//                                         note: false,
//                                       )));
//                                 },
//                                 child: Container(
//                                   width:
//                                       AppDimensions.height10(context) * 16.43,
//                                   height:
//                                       AppDimensions.height10(context) * 16.43,
//                                   decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                                     opacity: 0.2,
//                                     image:
//                                         AssetImage('assets/images/Star.webp'),
//                                   )),
//                                   child: Center(
//                                     child: Container(
//                                       width:
//                                           AppDimensions.width10(context) * 15.6,
//                                       height: AppDimensions.height10(context) *
//                                           15.6,
//                                       decoration: const BoxDecoration(
//                                           image: DecorationImage(
//                                               image: AssetImage(
//                                                   'assets/images/Inspiration_center 1.webp'))),
//                                       child: Center(
//                                           child: Container(
//                                         width: AppDimensions.width10(context) *
//                                             6.8,
//                                         height:
//                                             AppDimensions.height10(context) *
//                                                 6.8,
//                                         decoration: const BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Color(0xFFFFFFFF)),
//                                         child: Center(
//                                             child: SizedBox(
//                                                 width: AppDimensions.height10(
//                                                         context) *
//                                                     3.2,
//                                                 height: AppDimensions.height10(
//                                                         context) *
//                                                     3.2,
//                                                 child: Image.asset(
//                                                     'assets/images/plus.webp'))),
//                                       )),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Align(
//                             //   alignment: const Alignment(0.1, 0.85),
//                             //   child: SizedBox(
//                             //     width: AppDimensions.width10(context) * 13.5,
//                             //     height: AppDimensions.height10(context) * 2.2,
//                             //     child: Text(
//                             //       'New inspiration',
//                             //       style: TextStyle(
//                             //           fontSize:
//                             //               AppDimensions.font10(context) * 1.8,
//                             //           fontWeight: FontWeight.w500,
//                             //           color: const Color(0xFFFFFFFF)),
//                             //     ),
//                             //   ),
//                             // )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         // width: AppDimensions.width10(context) * 16.7,
//                         //height: AppDimensions.height10(context) * 21.2,
//                         margin: EdgeInsets.only(
//                           right: AppDimensions.width10(context) * 18.5,
//                           top: AppDimensions.height10(context) * 4.3,
//                         ),
//                         child: Column(
//                           children: [
//                             Column(children: [
//                               AnimatedScaleButton(
//                                 onTap: () {
//                                   stopTimer();
//                                   Navigator.push(
//                                       context,
//                                       FadePageRoute(
//                                           page: const record_inspiration()));
//                                 },
//                                 child: Container(
//                                   width: AppDimensions.width10(context) * 17.6,
//                                   height: AppDimensions.width10(context) * 17.6,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       gradient:
//                                           inspirationDetails['inspiration']
//                                                       ['inspirationId'] ==
//                                                   2
//                                               ? const RadialGradient(colors: [
//                                                   Color(0xFFE9A594),
//                                                   Color(0xFFEEBEB2)
//                                                 ])
//                                               : const LinearGradient(
//                                                   end: Alignment(0.73, 0),
//                                                   begin: Alignment(-1, 1),
//                                                   colors: [
//                                                       Color(0xFF673636),
//                                                       Color(0xFFF8C3B5),
//                                                     ]),
//                                       image: DecorationImage(
//                                           image: AssetImage(inspirationDetails[
//                                                           'inspiration']
//                                                       ['inspirationId'] ==
//                                                   3
//                                               ? 'assets/images/video_play.webp'
//                                               : ''),
//                                           fit: BoxFit.cover)),
//                                   child: inspirationDetails['inspiration']
//                                                   ['inspirationId'] ==
//                                               2 ||
//                                           inspirationDetails['inspiration']
//                                                   ['inspirationId'] ==
//                                               4
//                                       ? Container(
//                                           margin: EdgeInsets.all(
//                                               AppDimensions.height10(context) *
//                                                   2.5),
//                                           height:
//                                               AppDimensions.height10(context) *
//                                                   6.3,
//                                           child: Center(
//                                               child: Text(
//                                             inspirationDetails['inspiration']
//                                                 ['description'],
//                                             overflow: TextOverflow.ellipsis,
//                                             textAlign: TextAlign.center,
//                                             maxLines: 3,
//                                             style: TextStyle(
//                                                 fontSize: AppDimensions.font10(
//                                                         context) *
//                                                     1.6,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: const Color(0xFFFFFFFF)),
//                                           )),
//                                         )
//                                       : inspirationDetails['inspiration']
//                                                   ['inspirationId'] ==
//                                               1
//                                           ? ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       AppDimensions.height10(
//                                                               context) *
//                                                           18),
//                                               child: FadeInImage(
//                                                 placeholder: const AssetImage(
//                                                     'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
//                                                 image: NetworkImage(
//                                                     inspirationDetails[
//                                                                 'inspiration']
//                                                             ['file']
//                                                         .toString()),
//                                                 fit: BoxFit.cover,
//                                                 placeholderFit: BoxFit.contain,
//                                               ),
//                                             )
//                                           : Container(),
//                                 ),
//                               ),
//                               Container(
//                                 width: AppDimensions.width10(context) * 16.7,
//                                 //height: AppDimensions.height10(context) * 1.9,
//                                 margin: EdgeInsets.only(
//                                     top: AppDimensions.height10(context) * 0.5,
//                                     bottom:
//                                         AppDimensions.height10(context) * 0.2),
//                                 child: Center(
//                                     child: Text(
//                                   inspirationDetails['inspiration']
//                                               ['inspirationId'] ==
//                                           1
//                                       ? 'Image'
//                                       : inspirationDetails['inspiration']
//                                                   ['inspirationId'] ==
//                                               2
//                                           ? 'Note'
//                                           : inspirationDetails['inspiration']
//                                                       ['inspirationId'] ==
//                                                   3
//                                               ? "Video"
//                                               : 'Content',
//                                   style: TextStyle(
//                                       fontSize:
//                                           AppDimensions.font10(context) * 1.8,
//                                       fontWeight: FontWeight.w600,
//                                       color: const Color(0xFFFFFFFF)),
//                                 )),
//                               ),
//                               SizedBox(
//                                 // margin: EdgeInsets.symmetric(
//                                 //     horizontal:
//                                 //         AppDimensions.height10(context) * 0.5),
//                                 //height: AppDimensions.height10(context) * 3.0,
//                                 width: AppDimensions.width10(context) * 15.7,
//                                 child: Align(
//                                     alignment: Alignment.topCenter,
//                                     child: Text(
//                                       inspirationDetails['inspiration']
//                                           ['title'],
//                                       textAlign: TextAlign.center,
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                           fontSize:
//                                               AppDimensions.font10(context) *
//                                                   1.5,
//                                           height:
//                                               AppDimensions.height10(context) *
//                                                   0.14,
//                                           fontWeight: FontWeight.w400,
//                                           color: const Color(0xFFFFFFFF)),
//                                     )),
//                               )
//                             ])
//                           ],
//                         ),
//                       ),
//                     ],
//                   ))
//               : const Center(
//                   child: SpinKitFadingCircle(
//                     color: Color(0xFFB1B8FF),
//                     size: 80,
//                   ),
//                 ),
//         ),
//         extendBody: true,
//       ),
//     );
//   }
// }




// class updateBox extends StatefulWidget {
//   final String headText;
//   final String bodyText;
//   final String functionText;
//   final VoidCallback onTap1;
//   final VoidCallback FadeFunction;
//   final bool edit;
//   const updateBox(
//       {super.key,
//       required this.headText,
//       required this.bodyText,
//       required this.onTap1,
//       required this.functionText,
//       required this.edit,
//       required this.FadeFunction});

//   @override
//   State<updateBox> createState() => _updateBoxState();
// }

// class _updateBoxState extends State<updateBox> {
//   bool showContainer = false;
//   double swipeOffset = 0.0;
//   Timer? _timer;

//   void startTimer() {
//     _timer = Timer(const Duration(seconds: 3), () {
//       widget.FadeFunction;
//       setState(() {
//         showContainer = false;
//       });
//     });
//   }

//   void stopTimer() {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel(); // Cancel the timer if it's active
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//     setState(() {
//       showContainer = true;
//     });
//   }

//   @override
//   void dispose() {
//     stopTimer(); // Make sure to cancel the timer when the widget is disposed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         setState(() {
//           swipeOffset += details.delta.dx;
//         });

//         if (swipeOffset.abs() >= MediaQuery.of(context).size.width / 3.0) {
//           setState(() {
//             showContainer = false;
//           });
//         }
//       },
//       child: AnimatedOpacity(
//         duration: const Duration(milliseconds: 700),
//         opacity: showContainer ? 1.0 : 0.0,
//         child: Transform.translate(
//           offset: Offset(swipeOffset, 0.0),
//           child: Container(
//             width: AppDimensions.width10(context) * 38.259,
//             height: AppDimensions.height10(context) * 9.707,
//             margin:
//                 EdgeInsets.only(top: AppDimensions.height10(context) * 12.0),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                     AppDimensions.height10(context) * 2.0),
//                 gradient: const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                       left: AppDimensions.width10(context) * 1.261),
//                   width: AppDimensions.width10(context) * 4.437,
//                   height: AppDimensions.height10(context) * 4.437,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/circle_tick.webp'))),
//                 ),
//                 Container(
//                   //width: AppDimensions.width10(context) * 6.9,
//                   //height: AppDimensions.height10(context) * 4.0,
//                   margin: EdgeInsets.only(
//                       left: AppDimensions.width10(context) * 1.232),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         //width: AppDimensions.width10(context) * 4.6,
//                         //height: AppDimensions.height10(context) * 1.6,
//                         //   color: Colors.amber,
//                         child: Text(
//                           widget.headText,
//                           style: TextStyle(
//                               fontSize: AppDimensions.font10(context) * 1.3,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0xFFFFFFFF)),
//                         ),
//                       ),
//                       SizedBox(
//                         width: AppDimensions.width10(context) * 16.9,
//                         //height: AppDimensions.height10(context) * 2.2,
//                         child: Text(
//                           widget.bodyText,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: AppDimensions.font10(context) * 1.8,
//                               fontWeight: FontWeight.w500,
//                               color: const Color(0xFFFFFFFF)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 AnimatedScaleButton(
//                   onTap: widget.onTap1,
//                   child: widget.edit
//                       ? Container(
//                           height: AppDimensions.height10(context) * 2.4,
//                           width: AppDimensions.width10(context) * 2.4,
//                           margin: EdgeInsets.only(
//                               left: AppDimensions.width10(context) * 8),
//                           padding: EdgeInsets.all(
//                               AppDimensions.height10(context) * 0.4),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.transparent,
//                               border:
//                                   Border.all(width: 1, color: Colors.white)),
//                           child: const ImageIcon(
//                             AssetImage('assets/images/edit_icon.webp'),
//                             color: Colors.white,
//                           ))
//                       : Container(
//                           width: AppDimensions.width10(context) * 8.0,
//                           height: AppDimensions.height10(context) * 6.0,
//                           margin: EdgeInsets.only(
//                               left: AppDimensions.width10(context) * 5,
//                               right: AppDimensions.width10(context) * 1.03),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: const Color(0xFFFFFFFF), width: 1),
//                             borderRadius: BorderRadius.circular(
//                                 AppDimensions.height10(context) * 2.0),
//                           ),
//                           child: Center(
//                             child: Text(
//                               widget.functionText,
//                               style: TextStyle(
//                                   fontSize: AppDimensions.font10(context) * 1.8,
//                                   fontWeight: FontWeight.w500,
//                                   color: const Color(0xFFFFFFFF)),
//                             ),
//                           ),
//                         ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


