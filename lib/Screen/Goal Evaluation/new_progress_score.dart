// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/goal_criteria.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/goal_criteria_impact.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class new_progress_score extends StatefulWidget {
  final int evaluationIndex;
  final bool premium;
  const new_progress_score(
      {super.key, required this.premium, required this.evaluationIndex});

  @override
  State<new_progress_score> createState() => _new_progress_scoreState();
}

class _new_progress_scoreState extends State<new_progress_score> {
  int _selectedIndex = 0;
  int datesIndex = 0;
  final List<String> _statements = [
    '01 Jan 23 to 01 Feb 23 (2/5) ',
    '01 Dec 22 to 01 Jan 23 (-/5)  ',
    '01 Nov 22 to 01 Dec 22 (2/5)  ',
    '01 Oct 22 to 01 Nov 22 (3/5)  ',
    '01 Sep 22 to 01 Oct 22 (2/5)  ',
  ];
  List<String> _dates = [];
  String activity_duration = '01 Jan 23 to 01 Feb 23 ';
  String _selected_activity = '';
  int goal_level = 2;
  int selectedEval = 0;
  int mirror = 0;
  bool color_fill_1 = false;
  bool color_fill_2 = false;
  bool Loader = true;
  var goalDetails;

  List messages = [
    "No progress towards my ",
    "I'm making small steps towards my ",
    "I'm making gradual steps towards my ",
    "I'm making significant and consistent steps towards my ",
    "I'm living my "
  ];

  List messagesImpact = [
    "It hasn't started to ",
    "It has little ",
    "It has positive ",
    "It has a significant ",
    "It's "
  ];

  late FixedExtentScrollController _scrollController;

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  Future<void> _fetchGoalDetails() async {
    final SharedPreferences prefs = await _prefs;

    AdminGoal.getUserGoalById(prefs.get('goal_num')).then((response) async {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
          selectedEval = response["goalEvaluations"].length - 1;
          _selectedIndex = response["goalEvaluations"].length - 1;
        });
        if (widget.evaluationIndex != response["goalEvaluations"].length - 1) {
          setState(() {
            _selectedIndex = widget.evaluationIndex;
            selectedEval = widget.evaluationIndex;
          });
        }

        _scrollController =
            FixedExtentScrollController(initialItem: _selectedIndex);
        print("error start");

        print("error initiate");
        loadData();
        GetDates();
        print("error off");
      } else {
        loadData();
      }
    }).catchError((error) {
      // loadData();
      print("error occured");
    }).whenComplete(() {
      //loadData();
    });
  }

  GetDates() {
    print("error initiate ${goalDetails["goalEvaluations"][0]}");

    if(goalDetails["goalEvaluations"][0]['goalLevel'] == null ||
        goalDetails["goalEvaluations"][0]['goalLevel'] == 0){
      for (int i = 0; i < goalDetails["goalEvaluations"].length; i++) {
        print("error initiate 1");
        late DateTime futureDate ;
        final DateTime originalDate = DateFormat("yyyy-MM-dd")
            .parse(goalDetails["goalEvaluations"][i]['activedate']);
        print("error initiate 2");
        if(goalDetails["goalEvaluations"][i]['endDate'] != null){
          futureDate = DateFormat("yyyy-MM-dd")
              .parse(goalDetails["goalEvaluations"][i]['endDate']);
        }else{
          futureDate = originalDate.add(Duration(days: 30));
        }

        print("error initiate 3");
        final String formattedDate = DateFormat("dd MMM yy").format(originalDate);
        print("error initiate 4");
        final String formattedFutureDate =
        DateFormat("dd MMM yy").format(futureDate);
        print("error initiate 5");
        if (goalDetails["goalEvaluations"][i]['goalLevel'] == null ||
            goalDetails["goalEvaluations"][i]['goalLevel'] == 0) {
          _dates.add('$formattedDate to $formattedFutureDate (-/5)');
          print("error initiate 6");
        } else {
          _dates.add(
              '$formattedDate to $formattedFutureDate (${goalDetails["goalEvaluations"][i]['totalPoint']}/5)');
        }
        setState(() {
          activity_duration = _dates[selectedEval].substring(0, 22);
        });
      }
    }





  }

  @override
  void initState() {
    super.initState();
    _fetchGoalDetails();
    _scrollController =
        FixedExtentScrollController(initialItem: _selectedIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRouteReverse(
                page: const goal_menu_inactive(
              goal_evaluation: false,
              isActive: false,
            )));
        return Future.value(true);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        FadePageRouteReverse(
                            page: const goal_menu_inactive(
                          isActive: true,
                          goal_evaluation: true,
                        )));
                  },
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    //  width: AppDimensions.width10(context) * 3.0,
                    height: AppDimensions.height10(context) * 3.0,
                    fit: BoxFit.contain,
                  )),
            ),
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      evaluation_sheet(context);
                    },
                    icon: Image.asset(
                      'assets/images/ic_info_outline.webp',
                      width: AppDimensions.width10(context) * 3.0,
                      height: AppDimensions.height10(context) * 3.0,
                      fit: BoxFit.contain,
                    )),
              ),
            ]),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: Loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.width10(context) * 33.5,
                        height: AppDimensions.height10(context) * 3.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 11.1),
                        //color: Colors.amber,
                        child: Center(
                          child: Text(
                            'Goal Level Evaluation',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 3.0,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 30,
                        height: AppDimensions.height10(context) * 2.4,
                        //  color: Colors.grey,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.4),
                        child: Center(
                          child: Text(
                            'For ‘${goalDetails['name']}’',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 36.5,
                       // height: AppDimensions.height10(context) * 58.1,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 4.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: AppDimensions.height10(context) *
                                          31.3, // Set the height of the bottom sheet
                                      child: Column(
                                        children: [
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.8,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: const Color(
                                                            0xFF828282),
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            0.1))),
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
                                                        AppDimensions.width10(
                                                                context) *
                                                            5.0,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.1,
                                                    margin: EdgeInsets.only(
                                                        right: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            2.0),
                                                    child: Text(
                                                      'Cancel',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
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
                                                    int select = 0;
                                                    setState(() {
                                                      activity_duration =
                                                          _dates[_selectedIndex]
                                                              .substring(0, 22);
                                                      select = _selectedIndex;
                                                    });
                                                    if (select < 0 ||
                                                        select >=
                                                            _dates.length) {
                                                      setState(() {
                                                        selectedEval =
                                                            _selectedIndex;
                                                        mirror = _selectedIndex;
                                                      });
                                                    } else {
                                                      int mirrorIndex =
                                                          _dates.length -
                                                              1 -
                                                              _selectedIndex;
                                                      setState(() {
                                                        selectedEval =
                                                            _selectedIndex;
                                                        mirror = mirrorIndex;
                                                      });
                                                    }
                                                    Navigator.of(context).pop(
                                                        _dates[_selectedIndex]);
                                                  },
                                                  child: Container(
                                                    width:
                                                        AppDimensions.width10(
                                                                context) *
                                                            3.7,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.1,
                                                    margin: EdgeInsets.only(
                                                        right: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.9),
                                                    child: Text(
                                                      'Done',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color(
                                                              0xFF2F80ED)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: ListWheelScrollView(
                                              controller: _scrollController,
                                              itemExtent: 40,
                                              magnification: 1.2,
                                              useMagnifier:
                                                  true, // Set the height of each statement
                                              children: _dates
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
                                                  _selectedIndex = index;
                                                  _selected_activity =
                                                      _statements[
                                                          _selectedIndex];
                                                });
                                                _scrollController =
                                                    FixedExtentScrollController(
                                                        initialItem:
                                                            _selectedIndex);
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.6),
                                        ],
                                      ),
                                    );

                                  },
                                ),
                                child: Container(
                                  width: AppDimensions.width10(context) * 31.3,
                                  height:
                                      AppDimensions.height10(context) * 12.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.1,
                                          color: const Color(0xFFFFFFFF)),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              1.8)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: AppDimensions.width10(context) * 30.3,
                                        height: widget.premium != true
                                            ? AppDimensions.height10(context) *
                                                2.2
                                            : goalDetails['goalEvaluations']
                                                                [selectedEval]
                                                            ['totalPoint'] ==
                                                        null ||
                                                    goalDetails['goalEvaluations']
                                                                [selectedEval]
                                                            ['totalPoint'] ==
                                                        0
                                                ? AppDimensions.height10(
                                                        context) *
                                                    4.4
                                                : AppDimensions.height10(
                                                        context) *
                                                    2.2,
                                        // color: Colors.grey,
                                        margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              //  width: AppDimensions.width10(context) * 25.2,
                                              child: Text(
                                                widget.premium == false
                                                    ? 'From 01 Jan 23 to 01 Feb 23'
                                                    : goalDetails['goalEvaluations']
                                                                        [
                                                                        selectedEval]
                                                                    [
                                                                    'totalPoint'] ==
                                                                null ||
                                                            goalDetails['goalEvaluations']
                                                                        [
                                                                        selectedEval]
                                                                    [
                                                                    'totalPoint'] ==
                                                                0
                                                        ? 'From $activity_duration\nMissing'
                                                        : 'From $activity_duration',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.75,
                                                    fontWeight: FontWeight.w600,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.15,
                                                    color: widget.premium ==
                                                            false
                                                        ? Colors.white
                                                        : goalDetails['goalEvaluations']
                                                                            [selectedEval]
                                                                        [
                                                                        'totalPoint'] ==
                                                                    null ||
                                                                goalDetails['goalEvaluations']
                                                                            [selectedEval]
                                                                        ['totalPoint'] ==
                                                                    0
                                                            ? Colors.red
                                                            : const Color(0xFFFFFFFF)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  0.8,
                                            ),
                                            SizedBox(
                                                child: Image.asset(
                                              'assets/images/Polygon 9.webp',
                                              width: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                            ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                          width: AppDimensions.width10(context) *
                                              23.7,
                                          height: widget.premium == false
                                              ? AppDimensions.height10(context) *
                                                  5.4
                                              : goalDetails['goalEvaluations']
                                                                  [selectedEval]
                                                              ['totalPoint'] ==
                                                          null ||
                                                      goalDetails['goalEvaluations']
                                                                  [selectedEval]
                                                              ['totalPoint'] ==
                                                          0
                                                  ? AppDimensions.height10(context) *
                                                      5.4
                                                  : AppDimensions.height10(
                                                          context) *
                                                      7.1,
                                          margin: EdgeInsets.only(
                                              top:
                                                  AppDimensions.height10(context) *
                                                      0.7),
                                          child: Text(
                                            widget.premium == false
                                                ? 'Evaluate how close you\nwere to living your goal'
                                                : goalDetails['goalEvaluations']
                                                                    [
                                                                    selectedEval]
                                                                [
                                                                'totalPoint'] ==
                                                            null ||
                                                        goalDetails['goalEvaluations']
                                                                    [
                                                                    selectedEval]
                                                                [
                                                                'totalPoint'] ==
                                                            0
                                                    ? 'Evaluate how close you\nwere to living your goal'
                                                    : 'This is how close you were\nto living your goal and\ndesired identity.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFFFFFF)),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: AppDimensions.width10(context) * 36.5,
                                //height: AppDimensions.height10(context) * 52.0,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          const Color(0xFFF9DCC0)
                                              .withOpacity(0),
                                          const Color(0XffFF7975).withOpacity(1)
                                        ]),
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 2.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 21.0,
                                      height:
                                          AppDimensions.width10(context) * 21.0,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              12.9),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,

                                        image: DecorationImage(
                                          image: AssetImage(widget.premium ==
                                                  false
                                              ? "assets/images/Nebula Pie.webp"
                                              : goalDetails['goalEvaluations']
                                                              [selectedEval]
                                                          ['totalPoint'] ==
                                                      1
                                                  ? 'assets/images/Nebula pie 1.webp'
                                                  : goalDetails['goalEvaluations']
                                                                  [selectedEval]
                                                              ['totalPoint'] ==
                                                          2
                                                      ? 'assets/images/Nebula pie 2.webp'
                                                      : goalDetails['goalEvaluations']
                                                                      [selectedEval]
                                                                  [
                                                                  'totalPoint'] ==
                                                              3
                                                          ? 'assets/images/Nebula pie 3.webp'
                                                          : goalDetails['goalEvaluations']
                                                                          [selectedEval]
                                                                      ['totalPoint'] ==
                                                                  4
                                                              ? 'assets/images/Nebula pie 4.webp'
                                                              : goalDetails['goalEvaluations'][selectedEval]['totalPoint'] == 5
                                                                  ? 'assets/images/Nebula pie 5.webp'
                                                                  : "assets/images/Nebula Pie.webp"),
                                        ),
                                        // color: Colors.amber,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width:
                                                AppDimensions.width10(context) *
                                                    2.6,
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.0,
                                            child: Center(
                                              child: Text(
                                                'LEVEL',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            0.8,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF464646)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    6.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.3,
                                            // color: Colors.amber,
                                            margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    1.5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    widget.premium == false
                                                        ? '-'
                                                        : goalDetails['goalEvaluations']
                                                                            [
                                                                            selectedEval]
                                                                        [
                                                                        'totalPoint'] ==
                                                                    0 ||
                                                                goalDetails['goalEvaluations']
                                                                            [
                                                                            selectedEval]
                                                                        [
                                                                        'totalPoint'] ==
                                                                    null ||
                                                                widget.premium ==
                                                                    false
                                                            ? '-'
                                                            : goalDetails['goalEvaluations']
                                                                        [
                                                                        selectedEval]
                                                                    [
                                                                    'totalPoint']
                                                                .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            2.8,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: const Color(
                                                            0xFF646464)),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.7),
                                                  child: Text(
                                                    '/5',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        letterSpacing:
                                                            AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                -0.1,
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: const Color(
                                                            0xFF828282)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 24.9,
                                      // height:
                                      //     AppDimensions.height10(context) * 8.1,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.1),
                                      child: Stack(
                                        children: [
                                          widget.premium == false
                                              ? Container()
                                              : goalDetails['goalEvaluations']
                                                                  [selectedEval]
                                                              ['totalPoint'] ==
                                                          null ||
                                                      goalDetails['goalEvaluations']
                                                                  [selectedEval]
                                                              ['totalPoint'] ==
                                                          0
                                                  ? Container()
                                                  : Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                        width: AppDimensions
                                                                .width10(
                                                                    context) *
                                                            2.5,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.6,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/images/colon.webp'),
                                                              fit: BoxFit
                                                                  .contain),
                                                        ),
                                                      ),
                                                    ),
                                          Align(
                                            alignment: const Alignment(0.5, 0),
                                            child: SizedBox(
                                              //  width: AppDimensions.width10(context) * 21.4,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  7.3,

                                              //color: Colors.amber,
                                              child: Center(
                                                child: Text(
                                                  widget.premium == false
                                                      ? 'Score needed!'
                                                      : goalDetails['goalEvaluations']
                                                                          [selectedEval][
                                                                      'totalPoint'] ==
                                                                  null ||
                                                              goalDetails['goalEvaluations']
                                                                          [selectedEval][
                                                                      'totalPoint'] ==
                                                                  0 ||
                                                              widget.premium ==
                                                                  false
                                                          ? 'Score needed!'
                                                          : goalDetails['goalEvaluations']
                                                                          [selectedEval][
                                                                      'totalPoint'] ==
                                                                  2
                                                              ? "I'm making small steps\nforward"
                                                              : goalDetails['goalEvaluations'][selectedEval]
                                                                          ['totalPoint'] ==
                                                                      1
                                                                  ? 'I’m not making any progress'
                                                                  : goalDetails['goalEvaluations'][selectedEval]['totalPoint'] == 3
                                                                      ? 'I’m making considerable steps forward'
                                                                      : goalDetails['goalEvaluations'][selectedEval]['totalPoint'] == 4
                                                                          ? "I’m almost there"
                                                                          : goalDetails['goalEvaluations'][selectedEval]['totalPoint'] == 5
                                                                              ? "I’m continuously living my why"
                                                                              : "Score needed",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              2.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFFFFFFFF)),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          AppDimensions.width10(context) * 33.0,
                                      height:
                                          AppDimensions.height10(context) * 4.9,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              1.7),
                                      child: Center(
                                        child: Text(
                                          'Please evaluate each criteria below to see\nyour goal level progress.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width: AppDimensions.width10(context) * 2.1,
                                      // height: AppDimensions.height10(context) * 4.3,
                                      child: Image.asset(
                                        'assets/images/Arrow.webp',
                                        width: AppDimensions.width10(context) *
                                            4.1,
                                        height:
                                            AppDimensions.height10(context) *
                                                4.1,
                                      ),
                                    ),
                                    SizedBox(height: AppDimensions.height10(context),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        //width: AppDimensions.width10(context) * 44.1,
                        height: AppDimensions.height10(context) * 67.2,
                        // color: Colors.amberAccent,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedScaleButton(
                              onTap: () {
                                // if (widget.premium == true) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: your_why(
                                      destination: 'reason',
                                      index: selectedEval,
                                      premium: widget.premium,
                                    )));
                                // }
                              },
                              child: goal_criteria(
                                criteria: 'Goal Criteria 1',
                                identity: 'Your Why’s',
                                text_span_1: widget.premium == false
                                    ? 'Score needed'
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['YourWay'] ==
                                            null
                                        ? 'Score needed'
                                        : messages[
                                            goalDetails['goalEvaluations']
                                                        [selectedEval]
                                                    ['YourWay']['level'] -
                                                1],
                                text_span_2: widget.premium == false
                                    ? ''
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['YourWay'] ==
                                            null
                                        ? ''
                                        : 'why',
                                text_span_3: widget.premium == false
                                    ? ''
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['YourWay'] ==
                                            null
                                        ? ''
                                        : goalDetails['goalEvaluations']
                                                        [selectedEval]
                                                    ['YourWay']['level'] ==
                                                1
                                            ? ' yet'
                                            : '',
                                margin_top: 0,
                                border:
                                    goalDetails['goalEvaluations'] == null ||
                                            widget.premium == false
                                        ? true
                                        : goalDetails['goalEvaluations']
                                                    [selectedEval]['YourWay']
                                                //['level']
                                                ==
                                                null
                                            ? true
                                            : false,
                                colors: goalDetails['goalEvaluations'] ==
                                            null ||
                                        widget.premium == false
                                    ? 0xFF
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['YourWay'] ==
                                            null
                                        ? 0xFF
                                        : goalDetails['goalEvaluations']
                                                    [selectedEval]['YourWay']
                                                //['level']
                                                ==
                                                null
                                            ? 0xFF
                                            : 0xFFFBFBFB,
                                text_color:
                                    goalDetails['goalEvaluations'] == null ||
                                            widget.premium == false
                                        ? 0xFFFBFBFB
                                        : goalDetails['goalEvaluations']
                                                    [selectedEval]['YourWay']
                                                //['level']
                                                ==
                                                null
                                            ? 0xFFFBFBFB
                                            : 0xFF646464,
                                goal_: goalDetails['goalEvaluations'] == null ||
                                        widget.premium == false
                                    ? "0"
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['YourWay'] ==
                                            null

                                        //
                                        // ['level']
                                        // ==
                                        // null
                                        ? "0"
                                        : goalDetails['goalEvaluations']
                                                    [selectedEval]['YourWay']
                                                ['level']
                                            .toString(),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                // if (widget.premium == true) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: your_why(
                                      destination: 'identityStatement',
                                      index: selectedEval,
                                      premium: widget.premium,
                                    )));
                                // }
                              },
                              child: goal_criteria(
                                criteria: 'Goal Criteria 2',
                                identity: 'Your new identity',
                                text_span_1: widget.premium == false
                                    ? 'Score needed'
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['YourWay'] ==
                                            null
                                        ? 'Score needed'
                                        : goalDetails['goalEvaluations'][selectedEval]['newIdentity'] == null ||
                                                goalDetails['goalEvaluations']
                                                            [selectedEval]['newIdentity']
                                                        ['level'] ==
                                                    0 ||
                                                goalDetails['goalEvaluations']
                                                                [selectedEval]
                                                            ['newIdentity']
                                                        ['level'] ==
                                                    null
                                            ? 'Score needed'
                                            : messages[goalDetails['goalEvaluations']
                                                        [selectedEval]
                                                    ['newIdentity']['level'] -
                                                1],
                                text_span_2: widget.premium == false
                                    ? ''
                                    : goalDetails['goalEvaluations']
                                                        [selectedEval]
                                                    ['newIdentity'] ==
                                                null ||
                                            goalDetails['goalEvaluations']
                                                        [selectedEval]
                                                    ['newIdentity']['level'] ==
                                                0
                                        ? ''
                                        : 'new identity',
                                text_span_3: widget.premium == false
                                    ? ''
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['newIdentity'] ==
                                            null
                                        ? ''
                                        : goalDetails['goalEvaluations']
                                                        [selectedEval]
                                                    ['newIdentity']['level'] ==
                                                1
                                            ? ' yet'
                                            : '',
                                margin_top: 1.0,
                                border: goalDetails['goalEvaluations'] ==
                                            null ||
                                        widget.premium == false
                                    ? true
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['newIdentity']
                                            //['level']
                                            ==
                                            null
                                        ? true
                                        : false,
                                colors: goalDetails['goalEvaluations'] ==
                                            null ||
                                        widget.premium == false
                                    ? 0xFF
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['newIdentity'] ==
                                            null
                                        ? 0xFF
                                        : 0xFFFBFBFB,
                                text_color: goalDetails['goalEvaluations'] ==
                                            null ||
                                        widget.premium == false
                                    ? 0xFFFBFBFB
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['newIdentity']
                                            // ['level']
                                            ==
                                            null
                                        ? 0xFFFBFBFB
                                        : 0xFF646464,
                                goal_: goalDetails['goalEvaluations'] == null ||
                                        widget.premium == false
                                    ? "0"
                                    : goalDetails['goalEvaluations']
                                                [selectedEval]['newIdentity']
                                            //['level']
                                            ==
                                            null
                                        ? "0"
                                        : goalDetails['goalEvaluations']
                                                    [selectedEval]
                                                ['newIdentity']['level']
                                            .toString(),
                              ),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: your_why(
                                      destination: 'visualizingYourSelf',
                                      index: selectedEval,
                                      premium: widget.premium,
                                    )));
                                //  }
                              },
                              child: goal_criteria(
                                  criteria: 'Goal Criteria 3',
                                  identity: 'Your vision for\nnew self',
                                  text_span_1: widget.premium == false
                                      ? 'Score needed'
                                      : goalDetails['goalEvaluations'][selectedEval]
                                                  ['visualisingYourSelf'] ==
                                              null
                                          ? 'Score needed'
                                          : goalDetails['goalEvaluations'][selectedEval]
                                                          ['visualisingYourSelf']
                                                      ['level'] ==
                                                  0
                                              ? 'Score needed'
                                              : messages[goalDetails['goalEvaluations'][selectedEval]
                                                          ['visualisingYourSelf']
                                                      ['level'] -
                                                  1],
                                  text_span_2: widget.premium == false
                                      ? ''
                                      : goalDetails['goalEvaluations'][selectedEval]
                                                      ['visualisingYourSelf'] ==
                                                  null ||
                                              goalDetails['goalEvaluations'][selectedEval]
                                                      ['visualisingYourSelf']['level'] ==
                                                  0
                                          ? ''
                                          : 'vision',
                                  text_span_3: widget.premium == false
                                      ? ''
                                      : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf'] == null
                                          ? ''
                                          : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf']['level'] == 1
                                              ? ' yet'
                                              : '',
                                  goal_: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? "0"
                                      : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? "0"
                                          : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf']['level'].toString(),
                                  border: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? true
                                      : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? true
                                          : false,
                                  colors: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? 0xFF
                                      : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? 0xFF
                                          : 0xFFFBFBFB,
                                  text_color: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? 0xFFFBFBFB
                                      : goalDetails['goalEvaluations'][selectedEval]['visualisingYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? 0xFFFBFBFB
                                          : 0xFF646464,
                                  margin_top: 1.0),
                            ),
                            AnimatedScaleButton(
                              onTap: () {
                                // if (widget.premium == true) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: your_impact(
                                      premium: widget.premium,
                                      index: selectedEval,
                                    )));
                                // }
                              },
                              child: goal_criteria(
                                  criteria: 'Goal Criteria 4',
                                  identity: 'Impact on your\nlife',
                                  text_span_1: widget.premium == false
                                      ? 'Score needed'
                                      : goalDetails['goalEvaluations'][selectedEval]
                                                  ['impactOnYourSelf'] ==
                                              null
                                          ? 'Score needed'
                                          : goalDetails['goalEvaluations'][selectedEval]
                                                          ['impactOnYourSelf']
                                                      ['level'] ==
                                                  0
                                              ? 'Score needed'
                                              : messagesImpact[goalDetails['goalEvaluations']
                                                              [selectedEval]
                                                          ['impactOnYourSelf']
                                                      ['level'] -
                                                  1],
                                  text_span_2: widget.premium == false
                                      ? ''
                                      : goalDetails['goalEvaluations'][selectedEval]
                                                  ['impactOnYourSelf'] ==
                                              null
                                          ? ''
                                          : goalDetails['goalEvaluations'][selectedEval]
                                                      ['impactOnYourSelf']['level'] ==
                                                  5
                                              ? 'impacting'
                                              : 'impact',
                                  text_span_3: widget.premium == false
                                      ? ''
                                      : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf'] == null
                                          ? ''
                                          : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']['level'] == 0
                                              ? ' my life yet'
                                              : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']['level'] == 5
                                                  ? ' my life positively and consistently'
                                                  : ' on my life',
                                  border: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? true
                                      : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? true
                                          : false,
                                  colors: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? 0xFF
                                      : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? 0xFF
                                          : 0xFFFBFBFB,
                                  text_color: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? 0xFFFBFBFB
                                      : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']
                                              //['level']
                                              ==
                                              null
                                          ? 0xFFFBFBFB
                                          : 0xFF646464,
                                  goal_: goalDetails['goalEvaluations'] == null || widget.premium == false
                                      ? "0"
                                      : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']
                                              // ['level']
                                              ==
                                              null
                                          ? "0"
                                          : goalDetails['goalEvaluations'][selectedEval]['impactOnYourSelf']['level'].toString(),
                                  margin_top: 1.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.width10(context) * 17.0,
                        height: AppDimensions.height10(context) * 0.5,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 20.3,
                            bottom: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
        extendBody: true,
        bottomNavigationBar: widget.premium == true
            ? Container()
            : GestureDetector(
                onTap: () {
                  Upgrade_sheet(context);
                },
                child: BottomAppBar(
                  elevation: 0,
                  color: const Color(0xFFF5F5F5),padding: EdgeInsets.zero,
                  height: AppDimensions.height10(context) * 7.7,
                  child: Container(
                    height: AppDimensions.height10(context) * 7.7,
                    width: AppDimensions.width10(context) * 41.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                AppDimensions.height10(context) * 2.0),
                            topRight: Radius.circular(
                                AppDimensions.height10(context) * 2.0)),
                        color: const Color(0xFFF5F5F5)),
                    child: SizedBox(
                      // width: AppDimensions.width10(context) * 27.8,
                      height: AppDimensions.height10(context) * 3.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 1.0),
                            // width: AppDimensions.width10(context) * 23.6,
                            child: Text(
                              'Upgrade to score ',
                              style: TextStyle(
                                  color: const Color(0xFF437296),
                                  fontSize: AppDimensions.font10(context) * 2.8,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 3.2,
                            height: AppDimensions.height10(context) * 3.2,
                            padding: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.1,
                                left: AppDimensions.width10(context) * 0.6,
                                right: AppDimensions.width10(context) * 0.6,
                                bottom: AppDimensions.height10(context) * 0.9),
                            decoration: const BoxDecoration(
                                color: Color(0xFF437296),
                                shape: BoxShape.circle),
                            child: Image.asset(
                              'assets/images/Arrow.webp',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class goal_criteria extends StatelessWidget {
  final String criteria;
  final String identity;
  final double margin_top;
  final String text_span_1;
  final String text_span_2;
  final String text_span_3;
  final int colors;
  final bool border;
  final int text_color;
  final String goal_;

  const goal_criteria(
      {super.key,
      required this.criteria,
      required this.identity,
      required this.text_span_1,
      required this.text_span_2,
      required this.text_span_3,
      required this.margin_top,
      required this.colors,
      required this.border,
      required this.text_color,
      required this.goal_});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 44.1,
      //height: AppDimensions.height10(context) * 14.8,
      margin:
          EdgeInsets.only(top: AppDimensions.height10(context) * margin_top),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color(0xFFE97B74).withOpacity(0.9),
        const Color(0xFFD8C1C4).withOpacity(0.9)
      ])),
      child: Row(
        children: [
          Container(
            width: AppDimensions.width10(context) * 23.6,
            //  height: AppDimensions.height10(context) * 9.9,

            margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 3.0,
              top: AppDimensions.height10(context) * 2.4,
              bottom: AppDimensions.height10(context) * 2.4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppDimensions.width10(context) * 19.6,
                  height: AppDimensions.height10(context) * 2.2,
                  child: Text(
                    criteria,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimensions.font10(context) * 1.6,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 21.6,
                  // height: AppDimensions.height10(context) * 3.7,
                  child: Text(
                    identity,
                    style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.font10(context) * 2.4,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
                SizedBox(
                    width: AppDimensions.width10(context) * 21.2,
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: 'laila',
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                                height: AppDimensions.height10(context) * 0.16,
                                fontSize: AppDimensions.font10(context) * 1.6,
                                color: const Color(0xFFFFFFFF)),
                            children: [
                          TextSpan(text: text_span_1),
                          TextSpan(
                              text: text_span_2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(text: text_span_3)
                        ])))
              ],
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 8.7,
            height: AppDimensions.width10(context) * 8.7,
            margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.0),
            decoration: BoxDecoration(
                color: Color(colors),
                shape: BoxShape.circle,
                border: Border.all(
                    width: border ? AppDimensions.height10(context) * 0.1 : 0,
                    color:
                        border ? const Color(0xFFFEFEEC) : Colors.transparent)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppDimensions.width10(context) * 3.4,
                  height: AppDimensions.height10(context) * 1.5,
                  child: Text(
                    'Level',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.4,
                        fontWeight: FontWeight.w500,
                        color: Color(text_color)),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.2,
                ),
                Container(
                  width: AppDimensions.width10(context) * 3.2,
                  height: AppDimensions.height10(context) * 3.7,
                  margin: EdgeInsets.only(
                      left: AppDimensions.width10(context) * 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        goal_ == "0" || goal_ == "null" ? '-' : goal_,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.4,
                            fontWeight: FontWeight.w500,
                            color: Color(text_color)),
                      ),
                      Text(
                        '/5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w300,
                            color: Color(text_color)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              width: AppDimensions.width10(context) * 2.4,
              height: AppDimensions.height10(context) * 1.31,
              margin:
                  EdgeInsets.only(left: AppDimensions.width10(context) * 1.7),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/BTN Back.webp',
                  color: const Color(0xFFFFFFFF),
                  //width: AppDimensions.width10(context) * 2.6,
                  //height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.contain,
                ),
              )),
        ],
      ),
    );
  }
}

void Upgrade_sheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.height10(context) * 2.0),
      )),
      builder: (context) => Container(
            height: AppDimensions.height10(context) * 23.7,
            width: AppDimensions.width10(context) * 41.4,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.height10(context) * 2.0)),
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    // width: AppDimensions.width10(context) * 27.8,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.1),
                    height: AppDimensions.height10(context) * 3.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 1.0),
                          // width: AppDimensions.width10(context) * 23.6,
                          child: Text(
                            'Upgrade to score ',
                            style: TextStyle(
                                color: const Color(0xFF437296),
                                fontSize: AppDimensions.font10(context) * 2.8,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 3.2,
                          height: AppDimensions.height10(context) * 3.2,
                          padding: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 0.9,
                              left: AppDimensions.width10(context) * 0.6,
                              right: AppDimensions.width10(context) * 0.6,
                              bottom: AppDimensions.height10(context) * 1.1),
                          decoration: const BoxDecoration(
                              color: Color(0xFF437296), shape: BoxShape.circle),
                          child: Image.asset(
                            'assets/images/Arrow_up.webp',
                            color: const Color(0xFFFBFBFB),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.width10(context) * 32.7,
                  height: AppDimensions.height10(context) * 7.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.2),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontFamily: 'LAILA',
                              color: const Color(0xFF437296),
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontWeight: FontWeight.w400),
                          children: const [
                            TextSpan(
                                text:
                                    'To access this functionality, please check\nout our '),
                            TextSpan(
                                text: 'Ownership Plan ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: 'that is available for premium users. ')
                          ])),
                ),
                Container(
                  width: AppDimensions.width10(context) * 36.0,
                  height: AppDimensions.height10(context) * 5.0,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFFCC10D), Color(0xFFFCC10D)])),
                  child: Center(
                    child: Text(
                      'View Ownership Plan',
                      style: TextStyle(
                          fontFamily: 'LAILA',
                          color: const Color(0xFFFFFFFF),
                          fontSize: AppDimensions.font10(context) * 1.8,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ));
}

void evaluation_sheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.height10(context) * 2.0),
      )),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: AppDimensions.width10(context) * 40,
              height: AppDimensions.height10(context) * 79.9,
              padding:
                  EdgeInsets.only(bottom: AppDimensions.height10(context) * 3),
              margin: EdgeInsets.only(
                  left: AppDimensions.width10(context) * 1.0,
                  right: AppDimensions.width10(context) * 1.0,
                  bottom: AppDimensions.height10(context) * 1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: const Color(0xFFF5F5F5)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      //color: Colors.amber,
                      // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                      alignment: const Alignment(1, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 3.0,
                          height: AppDimensions.height10(context) * 3.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.5,
                              right: AppDimensions.width10(context) * 1.5),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Close_blue.webp'))),
                        ),
                      ),
                    ),
                    Container(
                      // width: AppDimensions.width10(context) * 8.202,
                      // height: AppDimensions.height10(context) * 11.2,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.9),
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         image:
                      //             AssetImage('assets/images/potenic__icon.webp'),
                      //         fit: BoxFit.contain)),
                      child: Image.asset(
                        'assets/images/potenic__icon.webp',
                        width: AppDimensions.width10(context) * 8.202,
                        height: AppDimensions.height10(context) * 11.2,
                      ),
                    ),
                    Container(
                      // width: AppDimensions.width10(context) * 35.5,
                      height: AppDimensions.height10(context) * 3.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.9),
                      child: Text(
                        'Goal Level Evaluation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.8,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 35.2,
                      // height: AppDimensions.height10(context) * 56.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.1,
                          bottom: AppDimensions.height10(context) * 2.5),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  height:
                                      AppDimensions.height10(context) * 0.15,
                                  fontFamily: 'laila',
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF437296)),
                              children: const [
                            TextSpan(
                                text:
                                    'It’s important to have clarity on the progress you’re making with your personal development goals.\n\nThis is why we’ve created a '),
                            TextSpan(
                                text: 'Goal Level Evaluation ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'feature to help you assess your goal progress in relation to your original reasons for wanting to achieve it (remember the statements you had to complete during onboarding when creating your goal)? We use these statements for you to evaluate.\n\n'),
                            TextSpan(
                                text: 'Goal Level Evaluation ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'has four core criteria that you’ll need to assess:\n\n 1.Your why’s\n 2.Your new identity\n 3.Your vision for new self\n 4.Impact on your life\n\nBy navigating to each of different criteria, you would be able to '),
                            TextSpan(
                                text: 'evaluate your progress.\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'Have fun with it, but also make sure you’re honest with yourself. It’s totally ok to give yourself a low score if you feel you’re not making a considerable progress. This way, we can better support you.\n\nDepending on a goal, some take longer that others to achieve. What matters is the '),
                            TextSpan(
                                text: 'daily practices ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    ' you perform that will eventually help you observe meaningful changes into your life.'),
                          ])),
                    )
                  ],
                ),
              ),
            ),
          ));
}

// class activity_status extends StatefulWidget {
//   const activity_status({super.key});

//   @override
//   State<activity_status> createState() => _activity_statusState();
// }

// class _activity_statusState extends State<activity_status> {
//   int _selectedIndex = 0;
//   final List<String> _statements = [
//     '01 Jan 23 to 01 Feb 23 (2/5) ',
//     '01 Dec 22 to 01 Jan 23 (-/5)  ',
//     '01 Nov 22 to 01 Dec 22 (2/5)  ',
//     '01 Oct 22 to 01 Nov 22 (3/5)  ',
//     '01 Sep 22 to 01 Oct 22 (2/5)  ',
//   ];
//   String activity_duration = 'From 01 Jan 23 to 01 Feb 23 ';
//   String _selected_activity = '';
//   int index_color = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: GestureDetector(
//         onTap: () => showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return SizedBox(
//               height: AppDimensions.height10(context) *
//                   31.3, // Set the height of the bottom sheet
//               child: Column(
//                 children: [
//                   Container(
//                     height: AppDimensions.height10(context) * 3.8,
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: const Color(0xFF828282),
//                                 width: AppDimensions.width10(context) * 0.1))),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             width: AppDimensions.width10(context) * 5.0,
//                             height: AppDimensions.height10(context) * 2.1,
//                             margin: EdgeInsets.only(
//                                 right: AppDimensions.width10(context) * 2.0),
//                             child: Text(
//                               'Cancel',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: AppDimensions.font10(context) * 1.4,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xFF2F80ED)),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               //activity_duration = _selected_activity;
//                               activity_duration = _statements[_selectedIndex];
//                               index_color = _selectedIndex;
//                             });
//                             Navigator.of(context)
//                                 .pop(_statements[_selectedIndex]);
//                           },
//                           child: Container(
//                             width: AppDimensions.width10(context) * 3.7,
//                             height: AppDimensions.height10(context) * 2.1,
//                             margin: EdgeInsets.only(
//                                 right: AppDimensions.width10(context) * 1.9),
//                             child: Text(
//                               'Done',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: AppDimensions.font10(context) * 1.4,
//                                   fontWeight: FontWeight.w400,
//                                   color: const Color(0xFF2F80ED)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListWheelScrollView(
//                       itemExtent: 40,
//                       magnification: 1.2,
//                       useMagnifier: true, // Set the height of each statement
//                       children: _statements
//                           .map((statement) => Text(statement,
//                               style: TextStyle(
//                                 fontSize: AppDimensions.font10(context) * 2.0,
//                                 fontWeight: FontWeight.w400,
//                               )))
//                           .toList(),
//                       onSelectedItemChanged: (int index) {
//                         setState(() {
//                           _selectedIndex = index;
//                           //activity_duration = _statements[_selectedIndex];
//                           _selected_activity = _statements[_selectedIndex];
//                         });
//                       },
//                     ),
//                   ),
//                   SizedBox(height: AppDimensions.height10(context) * 3.6),
//                 ],
//               ),
//             );
//             ;
//           },
//         ),
//         child: Container(
//           width: AppDimensions.width10(context) * 30.3,
//           height: AppDimensions.height10(context) * 12.3,
//           decoration: BoxDecoration(
//               border: Border.all(
//                   width: AppDimensions.width10(context) * 0.1,
//                   color: const Color(0xFFFFFFFF)),
//               borderRadius:
//                   BorderRadius.circular(AppDimensions.height10(context) * 1.8)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: AppDimensions.width10(context) * 27.4,
//                 height: index_color == 1
//                     ? AppDimensions.height10(context) * 4.4
//                     : AppDimensions.height10(context) * 2.2,
//                 // color: Colors.grey,
//                 margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.4),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: AppDimensions.width10(context) * 24.2,
//                       child: Text(
//                         index_color == 1
//                             ? activity_duration + '\nMissing'
//                             : activity_duration,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: AppDimensions.font10(context) * 1.8,
//                             fontWeight: FontWeight.w600,
//                             height: AppDimensions.height10(context) * 0.15,
//                             color: index_color == 1
//                                 ? Colors.red
//                                 : Color(0xFFFFFFFF)),
//                       ),
//                     ),
//                     SizedBox(
//                         // width: AppDimensions.width10(context) * 2.4,
//                         // height: AppDimensions.height10(context) * 2.4,
//                         // color: Colors.green,
//                         child: Image.asset(
//                       'assets/images/Polygon 9.webp',
//                       width: AppDimensions.width10(context) * 1.7,
//                       height: AppDimensions.height10(context) * 1.7,
//                     ))
//                   ],
//                 ),
//               ),
//               Container(
//                   width: AppDimensions.width10(context) * 23.7,
//                   height: index_color == 1
//                       ? AppDimensions.height10(context) * 5.4
//                       : AppDimensions.height10(context) * 7.1,
//                   margin: EdgeInsets.only(top: AppDimensions.height10(context) * 0.7),
//                   child: Text(
//                     index_color == 1
//                         ? 'Evaluate how close you\nwere to living your goal'
//                         : 'This is how close you were\nto living your goal and\ndesired identity.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         height: AppDimensions.height10(context) * 0.15,
//                         fontSize: AppDimensions.font10(context) * 1.8,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFFFFFFFF)),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
