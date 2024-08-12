import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/API/timelineApi.dart';
import 'package:potenic_app/Screen/Subscription/methods.dart';
import 'package:potenic_app/Screen/timeline/component/filterComponent.dart';
import 'package:potenic_app/Screen/timeline/component/new_practice.dart';
import 'package:potenic_app/Screen/timeline/component/newvision_component.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'component/Day_time_component.dart';
import 'component/goal_practice_component.dart';
import 'component/hurdle_component.dart';
import 'component/inspiration_component.dart';
import 'component/practice_session_component.dart';
import 'component/recorded_component.dart';
import 'component/repoprt_component.dart';

class timeline extends StatefulWidget {
  final goalId;
  final pracId;
  const timeline({super.key, required this.goalId, required this.pracId});
  @override
  State<timeline> createState() => _timelineState();
}

class _timelineState extends State<timeline> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _listView1Key = GlobalKey();
  final GlobalKey _middleWidgetKey = GlobalKey();
  late DateTime? setValue = DateTime.now();
  final searchController = TextEditingController();
  bool showUpcoming = true;
  int pastLoaded = 0;
  bool pastLoader = false;
  bool isEmpty = true;
  bool loader = true;
  List<String> usernameList = [];
  Map<String, dynamic> TimeLineRes = {};
  Map<String, dynamic> FuturetimeLine = {};
  Set<String> uniqueNames = Set<String>();
  bool pastActivities = true;
  String? _name = 'All';
  bool dataFound = false;
  final List<String> _statements = [
    'All ',
    'Practice session',
    'Hurdle',
    'Inspiration',
    'Report',
    'New Vision Score'
  ];

  setType(tag) {
    if (tag == 0) {
      setState(() {
        type = null;
        showUpcoming = true;
      });
    } else if (tag == 1) {
      setState(() {
        type = 'practiceSession';
        showUpcoming = true;
      });
    } else if (tag == 2) {
      setState(() {
        type = 'hurdle';
        showUpcoming = false;
      });
    } else if (tag == 3) {
      setState(() {
        type = 'inspiration';
        showUpcoming = false;
      });
    } else if (tag == 4) {
      setState(() {
        type = 'report';
        showUpcoming = false;
      });
    } else if (tag == 5) {
      setState(() {
        type = 'goalLevel';
        showUpcoming = false;
      });
    }
  }

  var goalId;
  var type;
  var pracId;

  String currentDateKey = '2024-07-11';
  int _selectedTag = 0;
  int goalIndex = 0;
  String selectedActivity = 'All';
  String selectedGoal = 'All';
  clearData() {
    setState(() {
      setValue = DateTime.now();
      selectedGoal = 'All';
      selectedActivity = _statements[0];
      loader = true;
      showUpcoming = true;
      pastLoaded = 0;
      pastLoader = false;
      type = null;
      goalId = null;
      pracId = null;
    });
    getFutureTimeLine(setValue, null, null);
    callTimeLine(setValue, null, null, null, true);
  }

  @override
  void initState() {
    setState(() {
      selectedActivity = _statements[0];
      goalId = widget.goalId;
      pracId = widget.pracId;
    });
    getFutureTimeLine(date, goalId, pracId);
    callTimeLine(date, goalId, pracId, type, true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToMiddleWidget();
    });

    super.initState();
  }

  DateTime date = DateTime.now();

  callTimeLine(givenDate, goal, pracId, type, bool getGoalNames) {
    String formattedDate = DateFormat('MM-dd-yyyy').format(givenDate);

    setState(() {
      currentDateKey = DateFormat("yyyy-MM-dd").format(givenDate);
    });

    TimelineService.getTimeLine(formattedDate, goal, pracId, type)
        .then((value) {
      setState(() {
        TimeLineRes = value;
      });
      //bool result = areAllObjectsEmpty(TimeLineRes, currentDateKey);

      if (getGoalNames) {
        usernameList.clear();
        uniqueNames.clear();
        addGoalNames();
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToMiddleWidget();
      });
      setState(() {
        //  isEmpty = result;
        loader = false;
      });
    });
  }

  getFutureTimeLine(
    givenDate,
    goal,
    prac,
  ) {
    String formattedDateFuture =
        DateFormat('MM-dd-yyyy').format(givenDate.add(const Duration(days: 1)));
    TimelineService.getFutureTimeLine(formattedDateFuture, goal, prac)
        .then((value) {
      setState(() {
        FuturetimeLine = value;
      });
    });
  }

  callTimeLineLoad(
    goal,
    pracId,
    type,
  ) {
    String formattedDate = DateFormat('MM-dd-yyyy')
        .format(DateTime.now().add(Duration(days: -7 * pastLoaded)));
    bool getGoalNames = true;
    if (goalId != null || pracId != null || type != null) {
      setState(() {
        getGoalNames = false;
      });
    }

    print("getGoalNames $getGoalNames type $type");

    TimelineService.getTimeLine(formattedDate, goal, pracId, type)
        .then((value) {
      setState(() {
        TimeLineRes.addAll(value);
      });

      if (getGoalNames) {
        usernameList.clear();
        uniqueNames.clear();
        addGoalNames();
      }

      setState(() {
        pastLoader = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  bool areAllObjectsEmpty(data, String currentDateKey) {
    if (!data.containsKey(currentDateKey)) {
      // If the currentDateKey is not in the data, return true as there's nothing to check
      return true;
    }

    var dateData = TimeLineRes[currentDateKey];

    for (var entry in dateData.entries) {
      if (entry.value.isNotEmpty) {
        return false; // If any list is not empty, return false
      }
    }

    return true; // All lists are empty, return true
  }

  // This function is triggered when the user presses the back-to-top button

  void _scrollToMiddleWidget() {
    final RenderBox listView1Box =
        _listView1Key.currentContext!.findRenderObject() as RenderBox;
    final double listView1Height = listView1Box.size.height;

    final RenderBox middleWidgetBox =
        _middleWidgetKey.currentContext!.findRenderObject() as RenderBox;
    final double middleWidgetHeight = middleWidgetBox.size.height;

    final double offset = widget.pracId != null
        ? (listView1Height +
            300 +
            (middleWidgetHeight) -
            (MediaQuery.of(context).size.height / 2))
        : (listView1Height +
            460 +
            (middleWidgetHeight) -
            (MediaQuery.of(context).size.height / 2));

    _scrollController.jumpTo(offset);
  }

  isDateInFuture(date) {
    if (date.isAfter(DateTime.now())) {
      setState(() {
        pastActivities = false;
      });
    } else {
      setState(() {
        pastActivities = true;
      });
    }
  }

  addGoalNames() {
    if (TimeLineRes[currentDateKey] != null) {
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
      List<dynamic> practiceRecordings =
          TimeLineRes[currentDateKey]["recordings"] ?? ['No data'];

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
      if (practiceRecordings.isNotEmpty) {
        addUniqueNamesFromPractice(practiceRecordings);
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

  void addUniqueNamesFromPractice(
    userList,
  ) {
    // Create a set to store unique names

    // Iterate over the usercreated list
    userList.forEach((user) {
      String name = user['userGoal']["name"].toString();
      String id = user['userGoal']['id'].toString();

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
              _scrollToMiddleWidget();
            },
            child: Container(
              padding: EdgeInsets.only(
                  right: AppDimensionsUpdated.width10(context) * 1.1),
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
                                AppDimensionsUpdated.height10(context) * 2.0,
                          ),
                          !showUpcoming
                              ? Container()
                              : ListView.builder(
                                  itemCount: FuturetimeLine.length,
                                  key: _listView1Key,
                                  shrinkWrap: true,
                                  reverse: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    String DateKey = DateFormat("yyyy-MM-dd")
                                        .format(DateTime.now()
                                            .add(Duration(days: index + 1)));
                                    var scheduleList =
                                        FuturetimeLine[DateKey]['recordings'];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        scheduleList.length == 0
                                            ? Container(
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    4)
                                            : Container(),
                                        scheduleList.length == 0
                                            ? Center(
                                                child: Text(
                                                  'No scheduled practices',
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
                                                                ['schedule'][
                                                            'time${index + 1}'],
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
                                              .format(date.add(
                                                  Duration(days: index + 1)))
                                              .toString(),
                                          TimeText: DateFormat('dd.MM')
                                              .format(date.add(
                                                  Duration(days: index + 1)))
                                              .toString(),
                                        ),
                                      ],
                                    );
                                  }),
                          !showUpcoming
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          3.5),
                                  child: Image.asset(
                                    'assets/images/Arrow_up.webp',
                                    color: const Color(0xFF437296),
                                    width:
                                        AppDimensionsUpdated.width10(context) *
                                            2.5,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.5,
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
                            height:
                                AppDimensionsUpdated.height10(context) * 2.3,
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
                                            2,
                                    fontWeight: FontWeight.w600,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.12,
                                    color: const Color(0xFF437296)),
                              ),
                            ),
                          ),
                          Container(
                            key: _middleWidgetKey,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    0.6),
                            child: Image.asset(
                              'assets/images/Arrow.webp',
                              color: const Color(0xFF437296),
                              width:
                                  AppDimensionsUpdated.width10(context) * 2.5,
                              height:
                                  AppDimensionsUpdated.height10(context) * 2.5,
                            ),
                          ),
                          ListView.builder(
                              itemCount: TimeLineRes.length,
                              shrinkWrap: true,
                              //reverse: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                String DateKey = DateFormat("yyyy-MM-dd")
                                    .format(DateTime.now()
                                        .add(Duration(days: -index)));
                                bool isEmpty =
                                    areAllObjectsEmpty(TimeLineRes, DateKey);
                                return Column(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DayTimeComponent(
                                          DayText: DateFormat('EEE')
                                              .format(DateTime.parse(DateKey)),
                                          TimeText: DateFormat('dd.MM')
                                              .format(DateTime.parse(DateKey)),
                                        ),
                                        isEmpty
                                            ? SizedBox(
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    4,
                                              )
                                            : Container(),
                                        isEmpty
                                            ? Center(
                                                child: Text(
                                                  'No activity ',
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
                                              )
                                            : Column(
                                                children: [
                                                  TimeLineRes[DateKey][
                                                              'userGoalsCreated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userGoalsCreated']
                                                                [index];
                                                            return GoalPracticeComponent(
                                                                image1: data[
                                                                    'color'],
                                                                image2: '2',
                                                                mainText: data[
                                                                    'name'],
                                                                smallText: '',
                                                                subText: data[
                                                                        'identityStatement']
                                                                    [0]['text'],
                                                                status:
                                                                    'Created');
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userPracticeCreated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userPracticeCreated']
                                                                [index];
                                                            return GoalPracticeComponent(
                                                                image1: data[
                                                                        'userGoal']
                                                                    ['color'],
                                                                image2: data[
                                                                    'color'],
                                                                mainText: data[
                                                                        'userGoal']
                                                                    ['name'],
                                                                smallText: data[
                                                                    'name'],
                                                                subText: data[
                                                                            'userGoal']
                                                                        [
                                                                        'identityStatement']
                                                                    [0]['text'],
                                                                status: ' ');
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userHurdlesCreated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userHurdlesCreated']
                                                                [index];
                                                            return HurdleComponent(
                                                              mainText: data[
                                                                  'hurdleName'],
                                                              subText: data[
                                                                  'triggerStatment'],
                                                              status: 'Created',
                                                            );
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userInspirationsCreated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userInspirationsCreated']
                                                                [index];
                                                            return InspirationComponent(
                                                              Text1:
                                                                  data['title'],
                                                              mainImage: data[
                                                                      'file']
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
                                                  TimeLineRes[DateKey]
                                                              ['recordings'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: TimeLineRes[
                                                                      DateKey]
                                                                  ['recordings']
                                                              .length,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 0),
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            var data = TimeLineRes[
                                                                        DateKey]
                                                                    [
                                                                    'recordings']
                                                                [index];
                                                            return ListView
                                                                .builder(
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemCount:
                                                                        data['schedule'].length -
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
                                                                            data['recordingAfterFeelingTime${index + 1}'].toString(),
                                                                        past:
                                                                            pastActivities,
                                                                        scheduleTime:
                                                                            schedule,
                                                                        recordedText:
                                                                            data['name'],
                                                                        goalName:
                                                                            data['userGoal']['name'],
                                                                        pracName:
                                                                            data['name'],
                                                                        beforeText:
                                                                            data['recordingBeforeFeelingTime${index + 1}'].toString(),
                                                                        orangeImage:
                                                                            data['userGoal']['color'],
                                                                        greenImage:
                                                                            data['color'],
                                                                        status:
                                                                            data['recordingStatusTime${index + 1}'],
                                                                        missedGreenImage:
                                                                            null,
                                                                      );
                                                                    });
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'practiceReport'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'practiceReport']
                                                                [index];
                                                            return ReportComponent(
                                                              pracName: data[
                                                                      'userPractice']
                                                                  ['name'],
                                                              color2: data[
                                                                          'userPractice']
                                                                      ['color']
                                                                  .toString(),
                                                              goalName: data[
                                                                          'userPractice']
                                                                      [
                                                                      'userGoal']
                                                                  ['name'],
                                                              color1: data['userPractice']
                                                                          [
                                                                          'userGoal']
                                                                      ['color']
                                                                  .toString(),
                                                            );
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userGoalsUpdated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userGoalsUpdated']
                                                                [index];
                                                            return GoalPracticeComponent(
                                                                image1: data[
                                                                    'color'],
                                                                image2: '2',
                                                                mainText: data[
                                                                    'name'],
                                                                smallText: '',
                                                                subText: data[
                                                                        'identityStatement']
                                                                    [0]['text'],
                                                                status:
                                                                    'update');
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userPracticeUpdated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userPracticeUpdated']
                                                                [index];
                                                            return GoalPracticeComponent(
                                                                image1: data[
                                                                        'userGoal']
                                                                    ['color'],
                                                                image2: data[
                                                                    'color'],
                                                                mainText: data[
                                                                        'userGoal']
                                                                    ['name'],
                                                                smallText: data[
                                                                    'name'],
                                                                subText: data[
                                                                            'userGoal']
                                                                        [
                                                                        'identityStatement']
                                                                    [0]['text'],
                                                                status:
                                                                    'practiceUpdate');
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userGoalsCreated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userGoalsCreated']
                                                                [index];
                                                            return GoalPracticeComponent(
                                                                image1: data[
                                                                    'color'],
                                                                image2: '2',
                                                                mainText: data[
                                                                    'name'],
                                                                smallText: '',
                                                                subText: data[
                                                                        'identityStatement']
                                                                    [0]['text'],
                                                                status:
                                                                    'Created');
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'userInspirationsUpdated'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'userInspirationsUpdated']
                                                                [index];
                                                            return InspirationComponent(
                                                              Text1:
                                                                  data['title'],
                                                              mainImage: data[
                                                                      'file']
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
                                                  TimeLineRes[DateKey][
                                                              'newGoalLevel'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
                                                                      [
                                                                      'newGoalLevel']
                                                                  .length,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            var data = TimeLineRes[
                                                                        DateKey]
                                                                    [
                                                                    'newGoalLevel']
                                                                [index];

                                                            return NewVisionComponent(
                                                              image1: data[
                                                                      'userGoal']
                                                                  ['color'],
                                                              image2:
                                                                  'assets/images/medBlue_gradient.webp',
                                                              mainText: data[
                                                                      'userGoal']
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
                                                  TimeLineRes[DateKey][
                                                              'deleteGoals'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: TimeLineRes[
                                                                      DateKey][
                                                                  'deleteGoals']
                                                              .length,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemBuilder:
                                                              (context, index) {
                                                            var data = TimeLineRes[
                                                                        DateKey]
                                                                    [
                                                                    'deleteGoals']
                                                                [index];
                                                            return GoalPracticeComponent(
                                                                image1: data[
                                                                    'color'],
                                                                image2: '2',
                                                                mainText: data[
                                                                    'name'],
                                                                smallText: '',
                                                                subText: data[
                                                                        'identityStatement']
                                                                    [0]['text'],
                                                                status:
                                                                    'deleted');
                                                          })
                                                      : Container(),
                                                  TimeLineRes[DateKey][
                                                              'deletePractices'] !=
                                                          null
                                                      ? ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              TimeLineRes[DateKey]
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
                                                                        DateKey]
                                                                    [
                                                                    'deletePractices']
                                                                [index];
                                                            return NewPractice(
                                                                image1: data[
                                                                        'userGoal']
                                                                    ['color'],
                                                                image2: '2',
                                                                greenText: data[
                                                                    'name'],
                                                                orangeText: data[
                                                                        'userGoal']
                                                                    ['name'],
                                                                Status:
                                                                    'deleted');
                                                          })
                                                      : Container(),
                                                ],
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          2,
                                    )
                                  ],
                                );
                              }),
                          SizedBox(
                            height: AppDimensionsUpdated.height10(context) * 2,
                          ),
                          SizedBox(
                            height: AppDimensionsUpdated.height10(context) * 4,
                            child: AnimatedScaleButton(
                              onTap: () {
                                setState(() {
                                  pastLoaded = pastLoaded + 1;
                                  pastLoader = true;
                                });

                                print("type: $type");
                                callTimeLineLoad(goalId, pracId, type);
                              },
                              child: pastLoader
                                  ? const Center(
                                      child: SpinKitFadingCircle(
                                        color: Color(0xFFB1B8FF),
                                        size: 30,
                                      ),
                                    )
                                  : Container(
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          4,
                                      width: AppDimensionsUpdated.height10(
                                              context) *
                                          15,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(40.0)),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          'Load More',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF5A4D73),
                                            fontSize:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    2,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: AppDimensionsUpdated.height10(context) * 20,
                          )
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
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 2.2),
                          margin: EdgeInsets.only(
                              right: AppDimensions.width10(context) * 5.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 2.4,
                                    height:
                                        AppDimensions.height10(context) * 2.4,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        'assets/images/ic_filter_list.webp',
                                        width: AppDimensions.width10(context) *
                                            2.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDimensions.width10(context) * 0.5,
                                  ),
                                  // GestureDetector(
                                  //   onTap: () async {
                                  //     DateTime? valueOne =
                                  //         await _TimeBottomSheet(context);
                                  //     String formattedDate =
                                  //         DateFormat('yyyy-MM-dd')
                                  //             .format(valueOne!);
                                  //     isDateInFuture(valueOne);
                                  //     setState(() {
                                  //       setValue = valueOne;
                                  //       currentDateKey = formattedDate;
                                  //       loader = true;
                                  //     });
                                  //     callTimeLine(
                                  //         valueOne, null, null, null, true);
                                  //   },
                                  //   child: Container(
                                  //     //width: AppDimensions.width10(context) * 11.5,
                                  //     height:
                                  //         AppDimensions.height10(context) * 3.4,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(
                                  //             AppDimensions.height10(context) *
                                  //                 1.0),
                                  //         border: Border.all(
                                  //             width: AppDimensions.width10(
                                  //                     context) *
                                  //                 0.1,
                                  //             color: const Color(0xFFE0E0E0))),
                                  //     margin: EdgeInsets.only(
                                  //         left:
                                  //             AppDimensions.height10(context) *
                                  //                 1.3,
                                  //         right:
                                  //             AppDimensions.width10(context) *
                                  //                 1.0),
                                  //     child: Row(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       children: [
                                  //         Container(
                                  //           margin: EdgeInsets.only(
                                  //               left: AppDimensions.height10(
                                  //                       context) *
                                  //                   1.0),
                                  //           child: Text(
                                  //             'Date:',
                                  //             style: TextStyle(
                                  //                 fontSize:
                                  //                     AppDimensions.font10(
                                  //                             context) *
                                  //                         1.4,
                                  //                 fontWeight: FontWeight.w400,
                                  //                 color:
                                  //                     const Color(0xffFA9934)),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           //width: AppDimensions.width10(context) * 1.9,
                                  //           height: AppDimensions.height10(
                                  //                   context) *
                                  //               2.4,
                                  //           margin: EdgeInsets.only(
                                  //               left: AppDimensions.height10(
                                  //                       context) *
                                  //                   0.8),
                                  //           child: Center(
                                  //             child: Text(
                                  //               setValue == null
                                  //                   ? ''
                                  //                   : '${setValue!.year}-${setValue!.month}-${setValue!.day}',
                                  //               style: TextStyle(
                                  //                   fontSize:
                                  //                       AppDimensions.font10(
                                  //                               context) *
                                  //                           1.4,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   color: const Color(
                                  //                       0xffFA9934)),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width:
                                  //               AppDimensions.width10(context) *
                                  //                   2.4,
                                  //           height: AppDimensions.height10(
                                  //                   context) *
                                  //               2.4,
                                  //           margin: EdgeInsets.only(
                                  //               left: AppDimensions.height10(
                                  //                       context) *
                                  //                   0.8,
                                  //               right: AppDimensions.height10(
                                  //                       context) *
                                  //                   1.0,
                                  //               bottom: AppDimensions.height10(
                                  //                       context) *
                                  //                   0.3),
                                  //           child: const Icon(
                                  //             Icons.arrow_drop_down,
                                  //             color: Color(0xffFA9934),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: Container(
                                              height: AppDimensions.height10(
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
                                                            bottom: BorderSide(
                                                              width: AppDimensions
                                                                      .width10(
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
                                                                  right: 20.0),
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
                                                                child:
                                                                    Container(
                                                                  width: AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      5.0,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    right: AppDimensions.height10(
                                                                            context) *
                                                                        2.0,
                                                                  ),
                                                                  child: Text(
                                                                    'Cancel',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.4,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: const Color(
                                                                          0xFF2F80ED),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    goalId = uniqueNames
                                                                        .elementAt(
                                                                            goalIndex);
                                                                    selectedGoal =
                                                                        usernameList[
                                                                            goalIndex];
                                                                    loader =
                                                                        true;
                                                                  });

                                                                  callTimeLine(
                                                                      DateTime.parse(
                                                                          currentDateKey),
                                                                      goalId,
                                                                      pracId,
                                                                      type,
                                                                      false);

                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: SizedBox(
                                                                  width: AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      3.7,
                                                                  child: Text(
                                                                    'Done',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          AppDimensions.font10(context) *
                                                                              1.4,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: const Color(
                                                                          0xFF2F80ED),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child:
                                                              ListWheelScrollView(
                                                                  onSelectedItemChanged:
                                                                      (index) {
                                                                    goalIndex =
                                                                        index;
                                                                  },
                                                                  itemExtent:
                                                                      40,
                                                                  magnification:
                                                                      1.5,
                                                                  useMagnifier:
                                                                      true,
                                                                  children:
                                                                      usernameList
                                                                          .map((statement) =>
                                                                              SizedBox(
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
                                      height:
                                          AppDimensions.height10(context) * 3.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                1.0),
                                        border: Border.all(
                                          width:
                                              AppDimensions.width10(context) *
                                                  0.1,
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.3,
                                        right: AppDimensions.width10(context) *
                                            1.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            child: Text(
                                              'Goal:',
                                              style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.4,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xffFA9934),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.4,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    0.8),
                                            child: Center(
                                              child: Text(
                                                selectedGoal ?? '',
                                                style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      const Color(0xffFA9934),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    2.4,
                                            height: AppDimensions.height10(
                                                    context) *
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
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
                                            child: Container(
                                              height: AppDimensions.height10(
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
                                                                    width: AppDimensions.width10(
                                                                            context) *
                                                                        0.1,
                                                                    color: const Color(
                                                                        0xFF828282)))),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 20.0),
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
                                                                child:
                                                                    Container(
                                                                  width: AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      5.0,
                                                                  margin: EdgeInsets.only(
                                                                      right: AppDimensions.height10(
                                                                              context) *
                                                                          2.0),
                                                                  child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            AppDimensions.font10(context) *
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
                                                                  if (_selectedTag ==
                                                                      0) {
                                                                    setState(
                                                                        () {
                                                                      selectedActivity =
                                                                          'All';
                                                                    });
                                                                  }
                                                                  setType(
                                                                      _selectedTag);
                                                                  setState(() {
                                                                    selectedActivity =
                                                                        _statements[
                                                                            _selectedTag];
                                                                    loader =
                                                                        true;
                                                                  });
                                                                  callTimeLine(
                                                                      DateTime.parse(
                                                                          currentDateKey),
                                                                      goalId,
                                                                      pracId,
                                                                      type,
                                                                      false);

                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: SizedBox(
                                                                  width: AppDimensions
                                                                          .width10(
                                                                              context) *
                                                                      3.7,
                                                                  child: Text(
                                                                    'Done',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            AppDimensions.font10(context) *
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
                                                      ),
                                                      Expanded(
                                                        child:
                                                            ListWheelScrollView(
                                                          itemExtent: 40,
                                                          magnification: 1.2,
                                                          useMagnifier:
                                                              true, // Set the height of each statement
                                                          children: _statements
                                                              .map((statement) =>
                                                                  Text(
                                                                      statement,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            AppDimensions.height10(context) *
                                                                                2.0,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      )))
                                                              .toList(),
                                                          onSelectedItemChanged:
                                                              (int index) {
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
                                      height:
                                          AppDimensions.height10(context) * 3.4,
                                      margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.3,
                                        right: AppDimensions.width10(context) *
                                            1.0,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  1.0),
                                          border: Border.all(
                                              width: AppDimensions.width10(
                                                      context) *
                                                  0.1,
                                              color: const Color(0xFFE0E0E0))),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    1.0),
                                            child: Text(
                                              'Action:',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xffFA9934)),
                                            ),
                                          ),
                                          Container(
                                            //width: AppDimensions.width10(context) * 1.9,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.4,
                                            margin: EdgeInsets.only(
                                                left: AppDimensions.height10(
                                                        context) *
                                                    0.8),
                                            child: Center(
                                              child: Text(
                                                selectedActivity,
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xffFA9934)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                AppDimensions.width10(context) *
                                                    2.4,
                                            height: AppDimensions.height10(
                                                    context) *
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
                                      clearData();
                                    },
                                    child: Container(
                                      // width: AppDimensions.width10(context) * 6.0,
                                      height:
                                          AppDimensions.height10(context) * 2.1,
                                      margin: EdgeInsets.only(
                                          left: AppDimensions.width10(context) *
                                              1.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Clear all',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.4,
                                            fontWeight: FontWeight.w700,
                                            decoration:
                                                TextDecoration.underline,
                                            color: const Color(0xFFFA9934)),
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
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Container(
                    //     width: AppDimensions.width10(context) * 4.9,
                    //     height: AppDimensions.height10(context) * 5.0,
                    //     decoration: BoxDecoration(
                    //         color: const Color(0xFFFBFBFB),
                    //         borderRadius: BorderRadius.circular(100)),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         setState(() {
                    //           isSearch = !isSearch;
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
