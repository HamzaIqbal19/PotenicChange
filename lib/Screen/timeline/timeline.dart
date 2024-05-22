import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/API/timelineApi.dart';
import 'package:potenic_app/Screen/timeline/component/new_practice.dart';
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
  late DateTime? setValue = DateTime.now();
  final searchController = TextEditingController();
  bool isSearch = false;
  bool loader = true;
  final GlobalKey _selectedWidgetKey = GlobalKey();
  List<String> usernameList = [];
  Map<String, dynamic> TimeLineRes = {};
  Set<String> uniqueNames = Set<String>();
  String? _name = 'All';
  bool dataFound = false;
  final List<String> _statements = [
    'All ',
    'Practice session',
    'Goal & Practice scheduled',
    'Sessions missed',
    'Hurdle',
    'Inspiration',
    'Report',
    'New Vision Score'
  ];

  int _selectedTag = 0;
  int goalIndex = 0;
  String selectedActivity = 'All';
  String selectedGoal = 'All';
  clearData() {
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

  DateTime date = DateTime.now();

  callTimeLine() {
    String formattedDate = DateFormat('MM-dd-yyyy').format(date);

    TimelineService.getTimeLine(formattedDate).then((value) {
      setState(() {
        TimeLineRes = value;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedWidget();
      });
      setState(() {
        loader = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button

  void _scrollToSelectedWidget() {
    if (_selectedWidgetKey.currentContext != null) {
      final RenderBox? renderBox =
          _selectedWidgetKey.currentContext!.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        _scrollController.animateTo(
          position.dy,
          duration: const Duration(microseconds: 1),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  addGoalNames() {
    for (int index = 0; index < 7; index++) {
      DateTime currentDate = DateTime.now().subtract(Duration(days: index));
      String currentDateKey = DateFormat('yyyy-MM-dd').format(currentDate);
      if (TimeLineRes.containsKey(currentDateKey) &&
          TimeLineRes[currentDateKey].length != 0) {
        List<dynamic> usercreated =
            TimeLineRes[currentDateKey]["userPracticeCreated"] ?? ['No data'];
        List<dynamic> goalcreated =
            TimeLineRes[currentDateKey]["userGoalsCreated"] ?? ['No data'];
        List<dynamic> goaldeleted =
            TimeLineRes[currentDateKey]["deleteGoals"] ?? ['No data'];
        List<dynamic> practicedeleted =
            TimeLineRes[currentDateKey]["deletePractices"] ?? ['No data'];
        List<dynamic> goalupdate =
            TimeLineRes[currentDateKey]["userGoalsUpdated"] ?? ['No data'];
        List<dynamic> practiceupdate =
            TimeLineRes[currentDateKey]["userPracticeUpdated"] ?? ['No data'];
        if (usercreated.isNotEmpty) {
          addUniqueNames(usercreated);
        }
        if (goalcreated.isNotEmpty) {
          addUniqueNames(goalcreated);
        }
        if (goaldeleted.isNotEmpty) {
          addUniqueNames(goaldeleted);
        }
        if (practicedeleted.isNotEmpty) {
          addUniqueNames(practicedeleted);
        }
        if (goalupdate.isNotEmpty) {
          addUniqueNames(goalupdate);
        }
        if (practiceupdate.isNotEmpty) {
          addUniqueNames(practiceupdate);
        }
      }
    }
  }

  void addUniqueNames(
    userList,
  ) {
    // Create a set to store unique names

    // Iterate over the usercreated list
    userList.forEach((user) {
      String name = user["name"].toString();
      String id = user['id'].toString();

      // Check if the name is not already in the set

      if (uniqueNames.contains(id)) {
        // Add the name to the list and the set
      } else {
        usernameList.add(name);
        uniqueNames.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              _scrollToSelectedWidget();
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
              child: loader
                  ? const Center(
                      child: SpinKitFadingCircle(
                        color: Color(0xFFB1B8FF),
                        size: 80,
                      ),
                    )
                  : SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 8.0,
                          ),
                          Column(
                            children: [
                              ListView.builder(
                                itemCount: 7,
                                shrinkWrap: true,
                                reverse: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index1) {
                                  // Calculate the date for the current index
                                  DateTime currentDate =
                                      date.add(Duration(days: index1 + 1));
                                  String currentDateKey =
                                      DateFormat('yyyy-MM-dd')
                                          .format(currentDate);
                                  var scheduleList =
                                      TimeLineRes[currentDateKey]['recordings'];
                                  return Column(
                                    children: [
                                      // Check if the data exists for the current date in TimeLineRes

                                      scheduleList.length == 0
                                          ? Container(
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      4)
                                          : Container(),

                                      scheduleList.length == 0
                                          ? Center(
                                              child: Text(
                                                'No scheduled practices',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        AppDimensionsUpdated
                                                                .height10(
                                                                    context) *
                                                            2.2),
                                              ),
                                            )
                                          : ListView.builder(
                                              itemCount: scheduleList.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index3) {
                                                return ListView.builder(
                                                  itemCount:
                                                      scheduleList[index3]
                                                                  ['schedule']
                                                              .length -
                                                          1,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      ((context, index) {
                                                    return PracticeSessionComponent(
                                                      greenText:
                                                          scheduleList[index3]
                                                              ['name'],
                                                      orangeText:
                                                          scheduleList[index3]
                                                                  ['userGoal']
                                                              ['name'],
                                                      scheduleTime: scheduleList[
                                                                  index3]
                                                              ['schedule']
                                                          ['time${index + 1}'],
                                                      image1:
                                                          scheduleList[index3]
                                                                  ['userGoal']
                                                              ['color'],
                                                      image2:
                                                          scheduleList[index3]
                                                              ['color'],
                                                      status: 'Active',
                                                    );
                                                  }),
                                                );
                                              },
                                            ),

                                      DayTimeComponent(
                                        DayText: DateFormat('EEE')
                                            .format(currentDate),
                                        TimeText: DateFormat('dd.MM')
                                            .format(currentDate),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            key: _selectedWidgetKey,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    3.5),
                            child: Image.asset(
                              'assets/images/Arrow_up.webp',
                              color: const Color(0xFF437296),
                              width:
                                  AppDimensionsUpdated.width10(context) * 2.5,
                              height:
                                  AppDimensionsUpdated.height10(context) * 2.5,
                            ),
                          ),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 7.2,
                            height:
                                AppDimensionsUpdated.height10(context) * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    0.4),
                            child: Center(
                              child: Text(
                                'Schedule',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.7,
                                    fontWeight: FontWeight.w700,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      3.5),
                              child: Image.asset(
                                'assets/images/Asset_timeline.webp',
                                height: AppDimensionsUpdated.height10(context) *
                                    7.8,
                                width:
                                    AppDimensionsUpdated.width10(context) * 7.8,
                              )),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 34.8,
                            height:
                                AppDimensionsUpdated.height10(context) * 3.6,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    2.0),
                            child: Center(
                              child: Text(
                                'Your Timeline Journey',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            3.0,
                                    letterSpacing:
                                        AppDimensionsUpdated.height10(context) *
                                            0.2,
                                    fontWeight: FontWeight.w700,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 30.8,
                            height:
                                AppDimensionsUpdated.height10(context) * 5.4,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) * 2,
                                left:
                                    AppDimensionsUpdated.width10(context) * 4.8,
                                right: AppDimensionsUpdated.width10(context) *
                                    4.7),
                            child: Text(
                              'All your recorded events & schedule\nin one place',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          1.8,
                                  fontWeight: FontWeight.w500,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.12,
                                  color: const Color(0xFF437296)),
                            ),
                          ),
                          Container(
                            width:
                                AppDimensionsUpdated.width10(context) * 11.20,
                            height:
                                AppDimensionsUpdated.height10(context) * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.4),
                            child: Center(
                              child: Text(
                                'Past activities',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.6,
                                    fontWeight: FontWeight.w700,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top:
                                    AppDimensionsUpdated.height10(context) * 1),
                            child: Image.asset(
                              'assets/images/Arrow.webp',
                              color: const Color(0xFF437296),
                              width:
                                  AppDimensionsUpdated.width10(context) * 2.5,
                              height:
                                  AppDimensionsUpdated.height10(context) * 2.5,
                            ),
                          ),
                          Column(
                            children: [
                              ListView.builder(
                                itemCount: 7,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 0),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index1) {
                                  DateTime currentDate = DateTime.now()
                                      .subtract(Duration(days: index1));
                                  String currentDateKey =
                                      DateFormat('yyyy-MM-dd')
                                          .format(currentDate);

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DayTimeComponent(
                                        DayText: DateFormat('EEE')
                                            .format(currentDate),
                                        TimeText: DateFormat('dd.MM')
                                            .format(currentDate),
                                      ),
                                      TimeLineRes[currentDateKey].length == 0
                                          ? Container(
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      4)
                                          : Container(),
                                      TimeLineRes[currentDateKey].length == 0
                                          ? Container(
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      3,
                                              child: Center(
                                                child: Text(
                                                  'No activity',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      fontSize:
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              2.2),
                                                ),
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                TimeLineRes[currentDateKey][
                                                                'userGoalsCreated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userGoalsCreated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userGoalsCreated'][index];
                                                          return GoalPracticeComponent(
                                                              image1:
                                                                  data['color'],
                                                              image2: '2',
                                                              mainText:
                                                                  data['name'],
                                                              smallText: '',
                                                              subText: data[
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status:
                                                                  'Created');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userPracticeCreated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userPracticeCreated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userPracticeCreated'][index];
                                                          return GoalPracticeComponent(
                                                              image1: data[
                                                                      'userGoal']
                                                                  ['color'],
                                                              image2:
                                                                  data['color'],
                                                              mainText: data[
                                                                      'userGoal']
                                                                  ['name'],
                                                              smallText:
                                                                  data['name'],
                                                              subText: data[
                                                                          'userGoal']
                                                                      [
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status: ' ');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userHurdlesCreated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userHurdlesCreated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userHurdlesCreated'][index];
                                                          return HurdleComponent(
                                                            mainText: data[
                                                                'hurdleName'],
                                                            subText: data[
                                                                'triggerStatment'],
                                                            status: 'Created',
                                                          );
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userInspirationsCreated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userInspirationsCreated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userInspirationsCreated'][index];
                                                          return InspirationComponent(
                                                            Text1:
                                                                data['title'],
                                                            mainImage:
                                                                data['file']
                                                                    .toString(),
                                                            inspirationId: data[
                                                                    'inspirationId']
                                                                .toString(),
                                                            Text2: data[
                                                                'description'],
                                                            status: null,
                                                          );
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey]
                                                                ['recordings']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                ['recordings']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 0),
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'recordings'][index];
                                                          return ListView
                                                              .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount:
                                                                      data['schedule']
                                                                              .length -
                                                                          1,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  physics:
                                                                      const NeverScrollableScrollPhysics(),
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    var schedule =
                                                                        data['schedule']
                                                                            [
                                                                            'time${index + 1}'];
                                                                    return RecordedComponent(
                                                                      afterText:
                                                                          data['recordingAfterFeelingTime${index + 1}']
                                                                              .toString(),
                                                                      recordedText:
                                                                          data[
                                                                              'name'],
                                                                      goalName:
                                                                          data['userGoal']
                                                                              [
                                                                              'name'],
                                                                      pracName:
                                                                          data[
                                                                              'name'],
                                                                      beforeText:
                                                                          data['recordingBeforeFeelingTime${index + 1}']
                                                                              .toString(),
                                                                      orangeImage:
                                                                          data['userGoal']
                                                                              [
                                                                              'color'],
                                                                      greenImage:
                                                                          data[
                                                                              'color'],
                                                                      status: data[
                                                                          'recordingStatusTime${index + 1}'],
                                                                      missedGreenImage:
                                                                          null,
                                                                    );
                                                                  });
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'practiceReport']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'practiceReport']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'practiceReport'][index];
                                                          return ReportComponent(
                                                            pracName: data[
                                                                    'userPractice']
                                                                ['name'],
                                                            color2:
                                                                data['userPractice']
                                                                        [
                                                                        'color']
                                                                    .toString(),
                                                            goalName: data[
                                                                        'userPractice']
                                                                    ['userGoal']
                                                                ['name'],
                                                            color1: data['userPractice']
                                                                        [
                                                                        'userGoal']
                                                                    ['color']
                                                                .toString(),
                                                          );
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey]
                                                                ['newGoalLevel']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userGoalsCreated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userGoalsCreated'][index];
                                                          return GoalPracticeComponent(
                                                              image1:
                                                                  data['color'],
                                                              image2: '2',
                                                              mainText:
                                                                  data['name'],
                                                              smallText: '',
                                                              subText: data[
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status:
                                                                  'Created');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userGoalsUpdated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userGoalsUpdated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userGoalsUpdated'][index];
                                                          return GoalPracticeComponent(
                                                              image1:
                                                                  data['color'],
                                                              image2: '2',
                                                              mainText:
                                                                  data['name'],
                                                              smallText: '',
                                                              subText: data[
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status: 'update');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userPracticeUpdated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userPracticeUpdated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userPracticeUpdated'][index];
                                                          return GoalPracticeComponent(
                                                              image1: data[
                                                                      'userGoal']
                                                                  ['color'],
                                                              image2:
                                                                  data['color'],
                                                              mainText: data[
                                                                      'userGoal']
                                                                  ['name'],
                                                              smallText:
                                                                  data['name'],
                                                              subText: data[
                                                                          'userGoal']
                                                                      [
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status:
                                                                  'practiceUpdate');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userHurdlesUpdated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userGoalsCreated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userGoalsCreated'][index];
                                                          return GoalPracticeComponent(
                                                              image1:
                                                                  data['color'],
                                                              image2: '2',
                                                              mainText:
                                                                  data['name'],
                                                              smallText: '',
                                                              subText: data[
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status:
                                                                  'Created');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'userInspirationsUpdated']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'userInspirationsUpdated']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'userInspirationsUpdated'][index];
                                                          return InspirationComponent(
                                                            Text1:
                                                                data['title'],
                                                            mainImage:
                                                                data['file']
                                                                    .toString(),
                                                            inspirationId: data[
                                                                    'inspirationId']
                                                                .toString(),
                                                            Text2: data[
                                                                'description'],
                                                            status: false,
                                                          );
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey]
                                                                ['newGoalLevel']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                ['newGoalLevel']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'newGoalLevel'][index];

                                                          return NewVisionComponent(
                                                            image1:
                                                                data['userGoal']
                                                                    ['color'],
                                                            image2:
                                                                'assets/images/medBlue_gradient.webp',
                                                            mainText:
                                                                data['userGoal']
                                                                    ['name'],
                                                            subText: data[
                                                                        'userGoal']
                                                                    [
                                                                    'identityStatement']
                                                                [0]['text'],
                                                            levelText: data['goalLevel']
                                                                        .toString() ==
                                                                    'null'
                                                                ? '0'
                                                                : data['goalLevel']
                                                                    .toString(),
                                                          );
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey]
                                                                ['deleteGoals']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                ['deleteGoals']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'deleteGoals'][index];
                                                          return GoalPracticeComponent(
                                                              image1:
                                                                  data['color'],
                                                              image2: '2',
                                                              mainText:
                                                                  data['name'],
                                                              smallText: '',
                                                              subText: data[
                                                                      'identityStatement']
                                                                  [0]['text'],
                                                              status:
                                                                  'deleted');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'deletePractices']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'deletePractices']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'deletePractices'][index];
                                                          return NewPractice(
                                                              image1: data[
                                                                      'userGoal']
                                                                  ['color'],
                                                              image2: '2',
                                                              greenText:
                                                                  data['name'],
                                                              orangeText: data[
                                                                      'userGoal']
                                                                  ['name'],
                                                              Status:
                                                                  'deleted');
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'deleteHurdles']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'deleteHurdles']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'deleteHurdles'][index];
                                                          return HurdleComponent(
                                                            mainText: data[
                                                                'hurdleName'],
                                                            subText: data[
                                                                'triggerStatment'],
                                                            status: true,
                                                          );
                                                        })
                                                    : Container(),
                                                TimeLineRes[currentDateKey][
                                                                'deleteInspirations']
                                                            .length !=
                                                        0
                                                    ? ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: TimeLineRes[
                                                                    currentDateKey]
                                                                [
                                                                'deleteInspirations']
                                                            .length,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          var data = TimeLineRes[
                                                                  currentDateKey]
                                                              [
                                                              'deleteInspirations'][index];
                                                          return InspirationComponent(
                                                            Text1:
                                                                data['title'],
                                                            mainImage:
                                                                data['file']
                                                                    .toString(),
                                                            inspirationId: data[
                                                                    'inspirationId']
                                                                .toString(),
                                                            Text2: data[
                                                                'description'],
                                                            status: true,
                                                          );
                                                        })
                                                    : Container(),
                                              ],
                                            ),
                                    ],
                                  );
                                },
                              ),
                              Container(
                                height:
                                    AppDimensionsUpdated.height10(context) * 18,
                              )
                            ],
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
                    right: AppDimensions.width10(context) * 2.2),
                height: AppDimensions.height10(context) * 7.0,
//                width: AppDimensions.width10(context) * 41.4,
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
                                      left: AppDimensions.height10(context) *
                                          2.0),
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 3.6,
                                    width:
                                        AppDimensions.width10(context) * 29.3,
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF767680)
                                            .withOpacity(0.12),
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppDimensions.height10(
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
                                              width: AppDimensions.width10(
                                                      context) *
                                                  1.5,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  1.5,
                                            ),
                                            suffixIcon: GestureDetector(
                                                onTap: () {
                                                  searchController.clear();
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  size: AppDimensions.height10(
                                                          context) *
                                                      1.8,
                                                  color: const Color(0xff252525)
                                                      .withOpacity(0.75),
                                                )),
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                              color: const Color(0xff3C3C43)
                                                  .withOpacity(0.6),
                                              height: AppDimensions.height10(
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
                                  fontSize: AppDimensions.font10(context) * 1.7,
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
                                padding: EdgeInsets.only(
                                    left: AppDimensions.width10(context) * 2.2),
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensions.width10(context) * 5.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              AppDimensions.width10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              'assets/images/ic_filter_list.webp',
                                              width: AppDimensions.width10(
                                                      context) *
                                                  2.4,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            usernameList.clear();
                                            uniqueNames.clear();
                                            addGoalNames();

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
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
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
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  4.0,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  41.4,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border(
                                                                  bottom:
                                                                      BorderSide(
                                                                    width: AppDimensions.width10(
                                                                            context) *
                                                                        0.1,
                                                                    color: const Color(
                                                                        0xFF828282),
                                                                  ),
                                                                ),
                                                              ),
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
                                                                        width: AppDimensions.width10(context) *
                                                                            5.0,
                                                                        margin:
                                                                            EdgeInsets.only(
                                                                          right:
                                                                              AppDimensions.height10(context) * 2.0,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Cancel',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                AppDimensions.font10(context) * 1.4,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                const Color(0xFF2F80ED),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          selectedGoal =
                                                                              usernameList[goalIndex];
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        width: AppDimensions.width10(context) *
                                                                            3.7,
                                                                        child:
                                                                            Text(
                                                                          'Done',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                AppDimensions.font10(context) * 1.4,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color:
                                                                                const Color(0xFF2F80ED),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: ListWheelScrollView(
                                                                    onSelectedItemChanged: (index) {
                                                                      goalIndex =
                                                                          index;
                                                                    },
                                                                    itemExtent: 40,
                                                                    magnification: 1.5,
                                                                    useMagnifier: true,
                                                                    children: usernameList
                                                                        .map((statement) => SizedBox(
                                                                              width: AppDimensions.height10(context) * 26,
                                                                              child: Center(
                                                                                child: Text(statement,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: AppDimensions.height10(context) * 2.0,
                                                                                      fontWeight: FontWeight.w400,
                                                                                    )),
                                                                              ),
                                                                            ))
                                                                        .toList()))
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
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.0),
                                              border: Border.all(
                                                width: AppDimensions.width10(
                                                        context) *
                                                    0.1,
                                                color: const Color(0xFFE0E0E0),
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              left: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              right: AppDimensions.width10(
                                                      context) *
                                                  1.0,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Text(
                                                    'Goal:',
                                                    style: TextStyle(
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.4,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xffFA9934),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.8),
                                                  child: Center(
                                                    child: Text(
                                                      selectedGoal ?? '',
                                                      style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.4,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xffFA9934),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: AppDimensions.width10(
                                                          context) *
                                                      2.4,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.8,
                                                    right:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.0,
                                                    bottom:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.3,
                                                  ),
                                                  child: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Color(0xffFA9934),
                                                  ),
                                                ),
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
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
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
                                                              height: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  4.0,
                                                              width: AppDimensions
                                                                      .width10(
                                                                          context) *
                                                                  41.4,
                                                              decoration: BoxDecoration(
                                                                  border: Border(
                                                                      bottom: BorderSide(
                                                                          width: AppDimensions.width10(context) *
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
                                                                        width: AppDimensions.width10(context) *
                                                                            5.0,
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                AppDimensions.height10(context) * 2.0),
                                                                        child:
                                                                            Text(
                                                                          'Cancel',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensions.font10(context) * 1.4,
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
                                                                        width: AppDimensions.width10(context) *
                                                                            3.7,
                                                                        child:
                                                                            Text(
                                                                          'Done',
                                                                          style: TextStyle(
                                                                              fontSize: AppDimensions.font10(context) * 1.4,
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
                                                                              AppDimensions.height10(context) * 2.0,
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
                                            // width: AppDimensions.width10(context) * 11.6,
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.0),
                                                border: Border.all(
                                                    width:
                                                        AppDimensions.width10(
                                                                context) *
                                                            0.1,
                                                    color: const Color(
                                                        0xFFE0E0E0))),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Text(
                                                    'Action:',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
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
                                                  //width: AppDimensions.width10(context) * 1.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.8),
                                                  child: Center(
                                                    child: Text(
                                                      selectedActivity,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
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
                                                  width: AppDimensions.width10(
                                                          context) *
                                                      2.4,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.8,
                                                      right: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                      bottom: AppDimensions
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
                                            //width: AppDimensions.width10(context) * 11.5,
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.0),
                                                border: Border.all(
                                                    width:
                                                        AppDimensions.width10(
                                                                context) *
                                                            0.1,
                                                    color: const Color(
                                                        0xFFE0E0E0))),
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.3,
                                                right: AppDimensions.width10(
                                                        context) *
                                                    1.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0),
                                                  child: Text(
                                                    'Date:',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
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
                                                  //width: AppDimensions.width10(context) * 1.9,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.8),
                                                  child: Center(
                                                    child: Text(
                                                      setValue == null
                                                          ? ''
                                                          : '${setValue!.year}-${setValue!.month}-${setValue!.day}',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
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
                                                  width: AppDimensions.width10(
                                                          context) *
                                                      2.4,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          2.4,
                                                  margin: EdgeInsets.only(
                                                      left: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.8,
                                                      right: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                      bottom: AppDimensions
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
                                            clearData();
                                          },
                                          child: Container(
                                            // width: AppDimensions.width10(context) * 6.0,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.width10(
                                                        context) *
                                                    1.0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Clear all',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
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
                              width: AppDimensions.width10(context) * 4.9,
                              height: AppDimensions.height10(context) * 5.0,
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
                                  width: AppDimensions.width10(context) * 5,
                                  height: AppDimensions.height10(context) * 5,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<DateTime?> _TimeBottomSheet(BuildContext context) async {
  DateTime iniValue = DateTime.now();

  final selectedDate = await showModalBottomSheet(
      shape: const LinearBorder(),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: AppDimensions.height10(context) * 30.3,
          child: Column(
            children: [
              Container(
                height: AppDimensions.height10(context) * 3.8,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0xFF828282),
                            width: AppDimensions.width10(context) * 0.1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 5.0,
                        height: AppDimensions.height10(context) * 2.1,
                        margin: EdgeInsets.only(
                            right: AppDimensions.width10(context) * 2.0),
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.4,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2F80ED)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(iniValue);
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 3.7,
                        height: AppDimensions.height10(context) * 2.1,
                        margin: EdgeInsets.only(
                            right: AppDimensions.width10(context) * 1.9),
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.4,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2F80ED)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.height10(context) * 26.0,
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
