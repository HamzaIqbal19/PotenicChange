import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/API/timelineApi.dart';
import 'package:potenic_app/Screen/timeline/component/newvision_component.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import 'component/Day_time_component.dart';
import 'component/goal_practice_component.dart';
import 'component/hurdle_component.dart';
import 'component/inspiration_component.dart';
import 'component/practice_session_component.dart';
import 'component/recorded_component.dart';
import 'component/repoprt_component.dart';

class timeline extends StatefulWidget {
  const timeline({super.key});

  @override
  State<timeline> createState() => _timelineState();
}

class _timelineState extends State<timeline> {
  late ScrollController _scrollController;
  late DateTime setValue = DateTime.now();
  final searchController = TextEditingController();
  int goalLevel = 3;
  bool isSearch = false;
  Map<String, dynamic> TimeLineRes = {};

  final List<String> _statements = [
    'All ',
    'Sessions completed',
    'Sessions upcoming',
    'Sessions missed',
    'Evaluation & reports',
    'Hurdles',
  ];
  final List<String> _goals = [
    'All ',
    'Goal name 1',
    'Goal name 2 ',
    'Goal name 3 ',
    'Practice name 1 (goal name)',
  ];
  int _selectedTag = 0;
  int goalIndex = 0;
  String selectedActivity = 'All';
  String selectedGoal = 'All';
  DateTime date = DateTime.now();

  clearData() {
    print("clear method");
    setState(() {
      setValue = DateTime.now();
      selectedGoal = 'All';
      selectedActivity = 'All';
    });
  }

  @override
  void initState() {
    callTimeLine();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
// show the back-to-top button
          } else {
// hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  bool loader = true;

  callTimeLine() {
    String formattedDate = DateFormat('MM-dd-yyyy').format(date);

    loader = true;
    TimelineService.getTimeLine(formattedDate).then((value) {
      print('Timeline called $value');

      setState(() {
        TimeLineRes = value;
      });

      print(
          'Timeline value ${TimeLineRes[DateFormat('yyyy-MM-dd').format(date.add(Duration(days: 1)))]}');
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(820,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarOpacity: 0.0,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                height: AppDimensionsUpdated.height10(context) * 3.0,
                fit: BoxFit.contain,
              )),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _scrollToTop();
            },
            child: Container(
              child: Image.asset(
                'assets/images/Asset 10 2.webp',
                width: AppDimensionsUpdated.width10(context) * 4.1,
                height: AppDimensionsUpdated.height10(context) * 4.1,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage('assets/images/Background.webp'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 8.0,
                    ),

                    ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DayTimeComponent(
                                DayText: DateFormat('EEE')
                                    .format(date.add(Duration(days: index + 1)))
                                    .toString(),
                                TimeText: DateFormat('dd.MM')
                                    .format(date.add(Duration(days: index + 1)))
                                    .toString(),
                              ),
                            ],
                          );
                        }),

                    // DayTimeComponent(
                    //   DayText: 'WED',
                    //   TimeText: '05.34',
                    // ),
                    // PracticeSessionComponent(
                    //   scheduleTime: '7-8pm',
                    // ),
                    // PracticeSessionComponent(
                    //   scheduleTime: '9-02am',
                    // ),
                    // DayTimeComponent(
                    //   DayText: 'MOn',
                    //   TimeText: '05.34',
                    // ),

                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 3.5),
                      child: Image.asset(
                        'assets/images/Arrow_up.webp',
                        color: const Color(0xFF437296),
                        width: AppDimensionsUpdated.width10(context) * 2.5,
                        height: AppDimensionsUpdated.height10(context) * 2.5,
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 7.2,
                      height: AppDimensionsUpdated.height10(context) * 1.9,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 0.4),
                      child: Center(
                        child: Text(
                          'Schedule',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.6,
                              fontWeight: FontWeight.w700,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.12,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 3.5),
                        child: Image.asset(
                          'assets/images/Asset_timeline.webp',
                          height: AppDimensionsUpdated.height10(context) * 7.8,
                          width: AppDimensionsUpdated.width10(context) * 7.8,
                        )),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 34.8,
                      height: AppDimensionsUpdated.height10(context) * 3.6,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 2.0),
                      child: Center(
                        child: Text(
                          'Your Timeline Journey',
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 3.0,
                              letterSpacing:
                                  AppDimensionsUpdated.height10(context) * 0.2,
                              fontWeight: FontWeight.w700,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.12,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 30.8,
                      height: AppDimensionsUpdated.height10(context) * 5.4,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 1.5,
                          left: AppDimensionsUpdated.width10(context) * 4.8,
                          right: AppDimensionsUpdated.width10(context) * 4.7),
                      child: Text(
                        'All your recorded events & schedule\nin one place',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize:
                                AppDimensionsUpdated.font10(context) * 1.8,
                            fontWeight: FontWeight.w500,
                            height:
                                AppDimensionsUpdated.height10(context) * 0.12,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 11.20,
                      height: AppDimensionsUpdated.height10(context) * 1.9,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 1.3),
                      child: Center(
                        child: Text(
                          'Past activities',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.6,
                              fontWeight: FontWeight.w700,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.12,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 0.8),
                      child: Image.asset(
                        'assets/images/Arrow.webp',
                        color: const Color(0xFF437296),
                        width: AppDimensionsUpdated.width10(context) * 2.5,
                        height: AppDimensionsUpdated.height10(context) * 2.5,
                      ),
                    ),

                    ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        //reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DayTimeComponent(
                                DayText: DateFormat('EEE')
                                    .format(
                                        date.add(Duration(days: -index - 1)))
                                    .toString(),
                                TimeText: DateFormat('dd.MM')
                                    .format(
                                        date.add(Duration(days: -index - 1)))
                                    .toString(),
                              ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userPracticeCreated']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userPracticeCreated']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return PracticeSessionComponent(
                                            scheduleTime: '11');
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userHurdlesCreated']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userHurdlesCreated']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return HurdleComponent(
                                          mainText: 'Husband',
                                          subText: 'Makes a\nmistake',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userGoalsCreated']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userGoalsCreated']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return RecordedComponent(
                                          orangeImage:
                                              'assets/images/orange_moon.webp',
                                          orangeText: 'Control\nmy anger',
                                          beforeText:
                                              '"I felt low and irritable"',
                                          afterText:
                                              '"I felt focused and good"',
                                          recordedText:
                                              'Practice session "Recorded"',
                                          greenImage:
                                              'assets/images/Meditation Completed.webp',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userInspirationsCreated']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['userInspirationsCreated']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return InspirationComponent(
                                          mainImage:
                                              'assets/images/Rectangle 10.webp',
                                          Text1: 'Feelings and thoughts',
                                          Text2:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit....',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['practiceReport']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['practiceReport']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ReportComponent(
                                          mainText: 'Congratulations!',
                                          subText:
                                              'Your 20 active\nday report is ready',
                                          image:
                                              'assets/images/Report card.webp',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['newGoalLevel']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[
                                              DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index -
                                                          1)))]['newGoalLevel']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return NewVisionComponent(
                                          mainText: 'Control my anger',
                                          image1:
                                              'assets/images/orange_moon.webp',
                                          subText:
                                              '"i am someone who is in\ncontrol  of my anger"',
                                          image2: goalLevel == 1
                                              ? 'assets/images/goalLevel_1.webp'
                                              : goalLevel == 2
                                                  ? 'assets/images/Nebula pie 2.webp'
                                                  : goalLevel == 3
                                                      ? 'assets/images/Nebula pie 3.webp'
                                                      : goalLevel == 4
                                                          ? 'assets/images/goalLevel_4.webp'
                                                          : 'assets/images/goalLevel_5.webp',
                                          quoteText:
                                              'I feel i am making small\nsteps forward',
                                          levelText: goalLevel.toString(),
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['deleteGoals']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[
                                              DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index -
                                                          1)))]['deleteGoals']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return RecordedComponent(
                                          orangeImage:
                                              'assets/images/orange_moon.webp',
                                          orangeText: 'Control\nmy anger',
                                          beforeText:
                                              '"I felt low and irritable"',
                                          afterText:
                                              '"I felt focused and good"',
                                          recordedText:
                                              'Practice session "Recorded"',
                                          greenImage:
                                              'assets/images/Meditation Completed.webp',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['deletePractices']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['deletePractices']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GoalPracticeComponent(
                                          subText:
                                              'I am someone who is in\ncontrol of my anger',
                                          image1:
                                              'assets/images/orange_moon.webp',
                                          image2:
                                              'assets/images/Ellipse 158.webp',
                                          mainText: 'Control my anger',
                                          smallText: 'Meditation',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['deleteHurdles']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[
                                              DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index -
                                                          1)))]['deleteHurdles']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return HurdleComponent(
                                          mainText: 'Husband',
                                          subText: 'Makes a\nmistake',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['deleteInspirations']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(date.add(Duration(
                                                      days: -index - 1)))]
                                              ['deleteInspirations']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return InspirationComponent(
                                          mainImage:
                                              'assets/images/Rectangle 10.webp',
                                          Text1: 'Feelings and thoughts',
                                          Text2:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit....',
                                        );
                                      },
                                    ),
                              TimeLineRes[DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index - 1)))]
                                              ['allRecordings']
                                          .length ==
                                      0
                                  ? Container()
                                  : ListView.builder(
                                      itemCount: TimeLineRes[
                                              DateFormat('yyyy-MM-dd').format(
                                                  date.add(Duration(
                                                      days: -index -
                                                          1)))]['allRecordings']
                                          .length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Id',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                        );
                                      },
                                    ),
                            ],
                          );
                        }),

                    DayTimeComponent(
                      DayText: 'TUE',
                      TimeText: '04.07',
                    ),
                    DayTimeComponent(
                      DayText: 'TUE',
                      TimeText: '04.09',
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(
                    right: AppDimensionsUpdated.width10(context) * 2.2),
                height: AppDimensionsUpdated.height10(context) * 7.0,
                //width: AppDimensionsUpdated.width10(context) * 41.4,
                decoration: const BoxDecoration(
                  color: Color(0xffFBFBFB),
                ),
                child: isSearch
                    ? Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppDimensionsUpdated.height10(
                                              context) *
                                          2.0),
                                  child: Container(
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            3.6,
                                    width:
                                        AppDimensionsUpdated.width10(context) *
                                            29.3,
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF767680)
                                            .withOpacity(0.12),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppDimensionsUpdated.height10(
                                                    context)))),
                                    child: TextFormField(
                                        textCapitalization: TextCapitalization
                                            .sentences,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                        controller: searchController,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(0.0),
                                            prefixIcon: Image.asset(
                                              'assets/images/Light.webp',
                                              width:
                                                  AppDimensionsUpdated.width10(
                                                          context) *
                                                      1.5,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      1.5,
                                            ),
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  searchController.clear();
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  size: AppDimensionsUpdated
                                                          .height10(context) *
                                                      1.8,
                                                  color: const Color(0xff252525)
                                                      .withOpacity(0.75),
                                                )),
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                              color: const Color(0xff3C3C43)
                                                  .withOpacity(0.6),
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.11,
                                            ),
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSearch = !isSearch;
                                });
                              },
                              child: Text(
                                "Cancel",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          1.7,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF007AFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                //width: AppDimensionsUpdated.width10(context) * 66.0,
                                // height: AppDimensionsUpdated.height10(context)*5.0,
                                padding: EdgeInsets.only(
                                    left:
                                        AppDimensionsUpdated.width10(context) *
                                            2.2),
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensionsUpdated.width10(context) *
                                            5.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: AppDimensionsUpdated.width10(
                                                  context) *
                                              2.4,
                                          height: AppDimensionsUpdated.height10(
                                                  context) *
                                              2.4,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/ic_filter_list.webp',
                                              width:
                                                  AppDimensionsUpdated.width10(
                                                          context) *
                                                      2.4,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      2.4,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimensionsUpdated.width10(
                                                  context) *
                                              0.5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: Container(
                                                    height: AppDimensionsUpdated
                                                            .height10(context) *
                                                        30.3,
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.001),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: AppDimensionsUpdated
                                                                      .height10(
                                                                          context) *
                                                                  4.0,
                                                              width: AppDimensionsUpdated
                                                                      .width10(
                                                                          context) *
                                                                  41.4,
                                                              decoration: BoxDecoration(
                                                                  border: Border(
                                                                      bottom: BorderSide(
                                                                          width: AppDimensionsUpdated.width10(context) *
                                                                              0.1,
                                                                          color:
                                                                              const Color(0xFF828282)))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: AppDimensionsUpdated.width10(context) *
                                                                            5.0,
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                AppDimensionsUpdated.height10(context) * 2.0),
                                                                        child:
                                                                            Text(
                                                                          'Cancel',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: const Color(0xFF2F80ED)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          selectedGoal =
                                                                              _goals[goalIndex];
                                                                        });

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width: AppDimensionsUpdated.width10(context) *
                                                                            3.7,
                                                                        child:
                                                                            Text(
                                                                          'Done',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: const Color(0xFF2F80ED)),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ListWheelScrollView(
                                                                itemExtent: 40,
                                                                magnification:
                                                                    1.2,
                                                                useMagnifier:
                                                                    true, // Set the height of each statement
                                                                children: _goals
                                                                    .map((statement) => Text(
                                                                        statement,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              AppDimensionsUpdated.height10(context) * 2.0,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        )))
                                                                    .toList(),
                                                                onSelectedItemChanged:
                                                                    (int
                                                                        index) {
                                                                  setState(() {
                                                                    goalIndex =
                                                                        index;
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
                                            // width: AppDimensionsUpdated.width10(context) * 11.5,
                                            height:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    3.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensionsUpdated
                                                                .height10(
                                                                    context) *
                                                            1.0),
                                                border: Border.all(
                                                    width: AppDimensionsUpdated
                                                            .width10(context) *
                                                        0.1,
                                                    color: const Color(
                                                        0xFFE0E0E0))),
                                            margin: EdgeInsets.only(
                                                left: AppDimensionsUpdated
                                                        .height10(context) *
                                                    1.3,
                                                right: AppDimensionsUpdated
                                                        .width10(context) *
                                                    1.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Text(
                                                    'Goal:',
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppDimensionsUpdated
                                                                    .font10(
                                                                        context) *
                                                                1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xffFA9934)),
                                                  ),
                                                ),
                                                Container(
                                                  //width: AppDimensionsUpdated.width10(context) * 1.9,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          0.8),
                                                  child: Center(
                                                    child: Text(
                                                      selectedGoal,
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppDimensionsUpdated
                                                                      .font10(
                                                                          context) *
                                                                  1.4,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xffFA9934)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: AppDimensionsUpdated
                                                          .width10(context) *
                                                      2.4,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          0.8,
                                                      right:
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                      bottom:
                                                          AppDimensionsUpdated
                                                                  .height10(
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: Container(
                                                    height: AppDimensionsUpdated
                                                            .height10(context) *
                                                        30.3,
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.001),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: AppDimensionsUpdated
                                                                      .height10(
                                                                          context) *
                                                                  4.0,
                                                              width: AppDimensionsUpdated
                                                                      .width10(
                                                                          context) *
                                                                  41.4,
                                                              decoration: BoxDecoration(
                                                                  border: Border(
                                                                      bottom: BorderSide(
                                                                          width: AppDimensionsUpdated.width10(context) *
                                                                              0.1,
                                                                          color:
                                                                              const Color(0xFF828282)))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: AppDimensionsUpdated.width10(context) *
                                                                            5.0,
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                AppDimensionsUpdated.height10(context) * 2.0),
                                                                        child:
                                                                            Text(
                                                                          'Cancel',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: const Color(0xFF2F80ED)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          selectedActivity =
                                                                              _statements[_selectedTag];
                                                                        });

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width: AppDimensionsUpdated.width10(context) *
                                                                            3.7,
                                                                        child:
                                                                            Text(
                                                                          'Done',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: const Color(0xFF2F80ED)),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ListWheelScrollView(
                                                                itemExtent: 40,
                                                                magnification:
                                                                    1.2,
                                                                useMagnifier:
                                                                    true, // Set the height of each statement
                                                                children: _statements
                                                                    .map((statement) => Text(statement,
                                                                        style: TextStyle(
                                                                          fontSize:
                                                                              AppDimensionsUpdated.height10(context) * 2.0,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        )))
                                                                    .toList(),
                                                                onSelectedItemChanged:
                                                                    (int
                                                                        index) {
                                                                  setState(() {
                                                                    _selectedTag =
                                                                        index;
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
                                            // width: AppDimensionsUpdated.width10(context) * 11.6,
                                            height:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    3.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensionsUpdated
                                                                .height10(
                                                                    context) *
                                                            1.0),
                                                border: Border.all(
                                                    width: AppDimensionsUpdated
                                                            .width10(context) *
                                                        0.1,
                                                    color: const Color(
                                                        0xFFE0E0E0))),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Text(
                                                    'Action:',
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppDimensionsUpdated
                                                                    .font10(
                                                                        context) *
                                                                1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xffFA9934)),
                                                  ),
                                                ),
                                                Container(
                                                  //width: AppDimensionsUpdated.width10(context) * 1.9,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          0.8),
                                                  child: Center(
                                                    child: Text(
                                                      selectedActivity,
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppDimensionsUpdated
                                                                      .font10(
                                                                          context) *
                                                                  1.4,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xffFA9934)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: AppDimensionsUpdated
                                                          .width10(context) *
                                                      2.4,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          0.8,
                                                      right:
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                      bottom:
                                                          AppDimensionsUpdated
                                                                  .height10(
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
                                          onTap: () async {
                                            DateTime? valueOne =
                                                await _TimeBottomSheet(context);
                                            setState(() {
                                              setValue = valueOne!;
                                            });
                                          },
                                          child: Container(
                                            //width: AppDimensionsUpdated.width10(context) * 11.5,
                                            height:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    3.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensionsUpdated
                                                                .height10(
                                                                    context) *
                                                            1.0),
                                                border: Border.all(
                                                    width: AppDimensionsUpdated
                                                            .width10(context) *
                                                        0.1,
                                                    color: const Color(
                                                        0xFFE0E0E0))),
                                            margin: EdgeInsets.only(
                                                left: AppDimensionsUpdated
                                                        .height10(context) *
                                                    1.3,
                                                right: AppDimensionsUpdated
                                                        .width10(context) *
                                                    1.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Text(
                                                    'Date:',
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppDimensionsUpdated
                                                                    .font10(
                                                                        context) *
                                                                1.4,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xffFA9934)),
                                                  ),
                                                ),
                                                Container(
                                                  //width: AppDimensionsUpdated.width10(context) * 1.9,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          0.8),
                                                  child: Center(
                                                    child: Text(
                                                      setValue == null
                                                          ? ''
                                                          : '${setValue.year}-${setValue.month}-${setValue.day}',
                                                      style: TextStyle(
                                                          fontSize:
                                                              AppDimensionsUpdated
                                                                      .font10(
                                                                          context) *
                                                                  1.4,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xffFA9934)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: AppDimensionsUpdated
                                                          .width10(context) *
                                                      2.4,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensionsUpdated
                                                              .height10(
                                                                  context) *
                                                          0.8,
                                                      right:
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              1.0,
                                                      bottom:
                                                          AppDimensionsUpdated
                                                                  .height10(
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
                                            print("clear");
                                            clearData();
                                          },
                                          child: Container(
                                            // width: AppDimensionsUpdated.width10(context) * 6.0,
                                            height:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    2.1,
                                            margin: EdgeInsets.only(
                                                left: AppDimensionsUpdated
                                                        .width10(context) *
                                                    1.0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Clear all',
                                              style: TextStyle(
                                                  fontSize: AppDimensionsUpdated
                                                          .font10(context) *
                                                      1.4,
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color:
                                                      const Color(0xFFFA9934)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 4.9,
                              height:
                                  AppDimensionsUpdated.height10(context) * 5.0,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFFBFBFB),
                                  borderRadius: BorderRadius.circular(100)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSearch = !isSearch;
                                  });
                                },
                                child: Image.asset(
                                  'assets/images/Search.webp',
                                  width:
                                      AppDimensionsUpdated.width10(context) * 5,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          5,
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
          ],
        ),
      ),
      extendBody: true,
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  final bool sheet_bottom;

  const MyBottomSheet({super.key, required this.sheet_bottom});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;

  final List<String> goalsname = [
    'All',
    'Goal name 1',
    'Goal name 2',
    'Goal name 3',
    'Goal name 4'
  ];
  final List<String> _sessions = [
    'All',
    'Sessions completed',
    'Sessions upcoming',
    'Sessions missed',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensionsUpdated.height10(context) *
          31.3, // Set the height of the bottom sheet
      child: Column(
        children: [
          Container(
            height: AppDimensionsUpdated.height10(context) * 3.8,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFF828282),
                        width: AppDimensionsUpdated.width10(context) * 0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 5.0,
                    height: AppDimensionsUpdated.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                        right: AppDimensionsUpdated.width10(context) * 2.0),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //activity_duration = selectedActivity;
                      //activity_duration = _statements[_selectedIndex];
                    });
                    Navigator.of(context).pop(_sessions[_selectedIndex]);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 3.7,
                    height: AppDimensionsUpdated.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                        right: AppDimensionsUpdated.width10(context) * 1.9),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 35,
              magnification: 1.2,
              useMagnifier: true, // Set the height of each statement
              children: widget.sheet_bottom
                  ? _sessions
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize:
                                AppDimensionsUpdated.font10(context) * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList()
                  : goalsname
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize:
                                AppDimensionsUpdated.font10(context) * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                  //activity_duration = _statements[_selectedIndex];
                  //  selectedActivity = _statements[_selectedIndex];
                });
              },
            ),
          ),
          SizedBox(height: AppDimensionsUpdated.height10(context) * 3.6),
        ],
      ),
    );
  }
}

_BottomSheet(BuildContext context) {
  const bool bottom_sheet = false;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return const MyBottomSheet(
          sheet_bottom: bottom_sheet,
        );
      });
    },
  ).then((value) {
    if (value != null) {
      // Do something with the selected statement
    }
  });
}

class BottomSheet extends StatefulWidget {
  final bool sheet_bottom;

  const BottomSheet({super.key, required this.sheet_bottom});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _BottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;

  final List<String> goalsname = [
    'All',
    'Goal name 1',
    'Goal name 2',
    'Goal name 3',
    'Goal name 4'
  ];
  final List<String> _sessions = [
    'All',
    'Sessions completed',
    'Sessions upcoming',
    'Sessions missed',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensionsUpdated.height10(context) *
          31.3, // Set the height of the bottom sheet
      child: Column(
        children: [
          Container(
            height: AppDimensionsUpdated.height10(context) * 3.8,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFF828282),
                        width: AppDimensionsUpdated.width10(context) * 0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 5.0,
                    height: AppDimensionsUpdated.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                        right: AppDimensionsUpdated.width10(context) * 2.0),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                    Navigator.of(context).pop(_sessions[_selectedIndex]);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 3.7,
                    height: AppDimensionsUpdated.height10(context) * 2.1,
                    margin: EdgeInsets.only(
                        right: AppDimensionsUpdated.width10(context) * 1.9),
                    child: Text(
                      'Done',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensionsUpdated.font10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2F80ED)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 35,
              magnification: 1.2,
              useMagnifier: true, // Set the height of each statement
              children: widget.sheet_bottom
                  ? _sessions
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize:
                                AppDimensionsUpdated.font10(context) * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList()
                  : goalsname
                      .map((statement) => Text(statement,
                          style: TextStyle(
                            fontSize:
                                AppDimensionsUpdated.font10(context) * 2.0,
                            fontWeight: FontWeight.w400,
                          )))
                      .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: AppDimensionsUpdated.height10(context) * 3.6),
        ],
      ),
    );
  }
}

Future<DateTime?> _TimeBottomSheet(BuildContext context) async {
  DateTime iniValue = DateTime.now();

  final selectedDate = await showModalBottomSheet(
      shape: LinearBorder(),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: AppDimensionsUpdated.height10(context) * 30.3,
          child: Column(
            children: [
              Container(
                height: AppDimensionsUpdated.height10(context) * 3.8,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFF828282),
                            width:
                                AppDimensionsUpdated.width10(context) * 0.1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensionsUpdated.width10(context) * 5.0,
                        height: AppDimensionsUpdated.height10(context) * 2.1,
                        margin: EdgeInsets.only(
                            right: AppDimensionsUpdated.width10(context) * 2.0),
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.4,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2F80ED)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Value is ---> $iniValue');
                        Navigator.of(context).pop(iniValue);
                      },
                      child: Container(
                        width: AppDimensionsUpdated.width10(context) * 3.7,
                        height: AppDimensionsUpdated.height10(context) * 2.1,
                        margin: EdgeInsets.only(
                            right: AppDimensionsUpdated.width10(context) * 1.9),
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.4,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2F80ED)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensionsUpdated.height10(context) * 26.0,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime value) {
                    iniValue = value;
                  },
                ),
              ),
            ],
          ),
        );
      });
  return selectedDate ?? iniValue;
}
