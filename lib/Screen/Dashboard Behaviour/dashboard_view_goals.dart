import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/MyServices/Notification/notificationController.dart';
import 'package:potenic_app/Screen/Alerts/widgets/notificationPermissionService.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/loaders/dashboard_behaviour_shimmer.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/dashboard_carousel.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/helpfulTips.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/widgets/practiceSessionComponent.dart';
import 'package:potenic_app/Screen/Goal_Achieved/congratulations.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Widgets/redaMessage.dart';
import 'package:potenic_app/utils/formattedTime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../capture_inspiration/inpiration_landing.dart';
import 'calender_bottom_sheet.dart';
import 'menu_dashboard_behaviour.dart';
import 'dart:ui';
import 'widgets/dashboardNoSessions.dart';
import 'widgets/dashboardUI.dart';

class ViewDashboard extends StatefulWidget {
  final bool missed;
  final bool update;
  final String name;
  final bool helpfulTips;
  final int record;

  const ViewDashboard(
      {super.key,
      required this.missed,
      required this.update,
      required this.name,
      required this.helpfulTips,
      required this.record});

  @override
  State<ViewDashboard> createState() => _ViewDashboardState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _ViewDashboardState extends State<ViewDashboard>
    with WidgetsBindingObserver {
  var allGoals;
  var userGoals;
  var responseData;
  var allPractice;
  var focusedDate = DateTime.now();
  List<dynamic> practices = [];
  bool noActive = false;
  bool noPlanned = false;
  bool noData = false;
  bool loader = true;
  bool redaVisble = false;
  var getSubscription = '';
  bool maxViewDate = false;
  List<Map<String, dynamic>> timesList = [];
  int pastPracCompleted = -1;
  int presentPracCompleted = -1;
  int nextPracCompleted = -1;
  bool contain = false;
  bool single = false;
  int removeDay = 0;
  String recordDate = '';
  int goalLevel = 0;
  var notificationBody;
  var notificationRoute;
  var notificationId;
  var notificationUrl;
  final ScrollController _scrollController = ScrollController();
  // DateTime currentDate = DateTime.now();
  int currentIndex = 7;
  bool currentItem = false;
  bool isCenterItem = false;
  final CarouselController _controller = CarouselController();
  bool isVisible = true;
  final NotificationPermissionService _notificationPermissionService =
      NotificationPermissionService();

  void _incrementValue() {
    setState(() {
      goalLevel++;
    });
  }

  getUserNotifications() {
    notificationApi.getUserNotification();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        getUserNotifications();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _fetchGoalNames() async {
    AdminGoal.getUserActiveGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          userGoals = response;
          practices.clear();
        });

        for (int i = 0; i < userGoals.length; i++) {
          for (int j = 0; j < userGoals[i]['userPractices'].length; j++) {
            if (userGoals[i]['userPractices'][j]['isActive'] == true) {
              practices.add(userGoals[i]['userPractices'][j]);
            }
          }
        }
      } else {
        setState(() {
          noActive = true;
          loadData();
        });
      }
    }).catchError((error) {
      loadData();
    });
  }

  Future<void> getGoalUpdates() async {
    final SharedPreferences prefs = await _prefs;
    var levelChange = prefs.getBool('goalLevelUpdate');
    var goalUpdate = prefs.getString('goalLevelUpOrDown');
    // var length = prefs.getInt('goalAchievedLenght');
    getSubscription = prefs.getString('subscriptionStatus').toString();
    var goalData = prefs.getString('goalAcieved');
    var newData = json.decode(goalData!);

    if (levelChange.toString() == 'true') {
      if (goalUpdate.toString() == 'up') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context, FadePageRoute(page: const congratulations()));
        });
      } else if (goalUpdate.toString() == 'down') {
        Timer(const Duration(seconds: 5), () {
          goal_achieved_sheet(context, newData, getSubscription, 0);
        });
      }
      await prefs.setBool('goalLevelUpdate', false);
    }
  }

  notificationPermissionSerice() {
    _notificationPermissionService.checkAndRequestNotificationPermission(
        context, true);
  }

  bool _showOverlay = false;
  int current = 0;
  int next = -1;
  int past = 1;

  previous() {
    setState(() {
      next++;
      past++;
      current++;
    });
  }

  future() {
    setState(() {
      next--;
      past--;
      current--;
    });
  }

  toggleDates(date) {
    if (!noActive) {
      var practiceData = allGoals[formatDates(date)]['practiceData'];

      timesList.clear();

      for (int i = 0; i < practiceData.length; i++) {
        for (int y = 0; y < practiceData[i]['schedule'].length - 1; y++) {
          timesList.add({
            'time': '${practiceData[i]['schedule']['time${y + 1}']}',
            'data': practiceData[i],
            'status': '${practiceData[i]['recordingStatusTime${y + 1}']}'
          });
        }
      }

      int convertToMinutes(String time) {
        int hours = int.parse(time.split(':')[0]);
        int minutes = int.parse(time.split(':')[1].split(' ')[0]);
        if (time.toLowerCase().contains('pm') && hours != 12) {
          hours += 12;
        }
        int totalMinutes = (hours * 60 + minutes) % (24 * 60);
        return totalMinutes < 360
            ? totalMinutes + (24 * 60 - 360)
            : totalMinutes - 360;
      }

      // Sort the list based on converted times
      timesList.sort((a, b) {
        int timeA = convertToMinutes(a['time']);
        int timeB = convertToMinutes(b['time']);
        return timeA - timeB;
      });

      print("Toggle dates timelist $timesList");

      setState(() {});
    }
  }

  DateTime currentDate =
      DateTime.parse(DateTime.now().toString().substring(0, 10));

  @override
  void initState() {
    if (widget.record != 0) {
      setState(() {
        current = widget.record;
        past = widget.record + 1;
        next = widget.record - 1;
      });
    }
    notificationPermissionSerice();

    super.initState();
    getUserNotifications();

    // _fetchUserGoal();
    _fetchGoalNames();
    fetchDashboardData();
    //
    // fetchPracticeByDay();

    if (widget.update == true) {
      setState(() {
        contain = true;
      });
      startTimer();
    }
    if (widget.helpfulTips == true) {
      //dashboard_sheet(context);
      setState(() {
        _showOverlay = true;
        goalLevel = 1;
      });
    }
    getGoalUpdates();
    WidgetsBinding.instance.addObserver(this);
  }

  void _scrollToCurrentIndex() {
    _scrollController.animateTo(
      noPlanned
          ? 20
          : noActive
              ? 35
              : 15,
      duration: const Duration(microseconds: 10),
      curve: Curves.easeInOut,
    );
  }

  final GlobalKey centerKey = GlobalKey();

  void fetchDashboardData() {
    AdminGoal.checkUserActiveGoal().then((response) {
      if (response == 200) {
        PracticeGoalApi.getUserDashboard(getFormattedDate(current))
            .then((value) {
          setState(() {
            allGoals = value['data'];
            responseData = value['data'];
          });

          toggleDates(DateTime.now().toString());
          setState(() {
            noActive = false;
          });
          loadData();
        });
      } else {
        setState(() {
          noActive = true;
        });
      }
    });
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loader = false;
    });
    Future.delayed(
        const Duration(milliseconds: 50), () => _scrollToCurrentIndex());
  }

  getSixthday() {
    var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var providedDate = getFormattedDate(current);

    // Check if the provided date is in the future
    if (DateTime.parse(providedDate).isBefore(DateTime.parse(currentDate))) {
    } else {
      var difference = DateTime.parse(providedDate)
          .difference(DateTime.parse(currentDate))
          .inDays;
      if (difference >= 6) {
        maxViewDate = true;
      } else {
        maxViewDate = false;
      }
    }

    // Calculate the difference in days

    // Check if the difference is exactly six days
  }

  Future<Timer> startTimer() async {
    return Timer(const Duration(seconds: 4), stop);
  }

  void stop() {
    setState(() {
      contain = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // getNotificationData();
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    final notificationController notificationsController =
        Get.find<notificationController>();

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        bottom: false,
        top: false,
        maintainBottomViewPadding: true,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarOpacity: 0.0,
                actions: [
                  Row(
                    children: [
                      currentIndex != 7
                          ? AnimatedScaleButton(
                              onTap: () {
                                setState(() {
                                  focusedDate = DateTime.parse(
                                      formatDates(DateTime.now().toString()));
                                  toggleDates(DateTime.now().toString());
                                  currentIndex = 7;
                                  _controller.jumpToPage(7);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: UpdatedDimensions.height10(context) *
                                        1.32),
                                child: Image.asset(
                                  'assets/images/Asset 10 2.webp',
                                  height:
                                      UpdatedDimensions.width10(context) * 4.0,
                                  width: UpdatedDimensions.width10(context) *
                                      3.977,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      AnimatedScaleButton(
                        onTap: () {
                          if (noData != true) {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const record_session(
                                  past_session: true,
                                )));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: UpdatedDimensions.width10(context) * 1.7),
                          child: Image.asset(
                            'assets/images/Add goal.webp',
                            height: UpdatedDimensions.width10(context) * 2.4,
                            width: UpdatedDimensions.width10(context) * 2.4,
                          ),
                        ),
                      ),
                      AnimatedScaleButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return CalendarBottomSheet(
                                onChangedStart: (int value) {
                                  setState(() {
                                    current = -value;
                                    next = -value - 1;
                                    past = -value + 1;
                                    loader = true;
                                  });
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              right: UpdatedDimensions.width10(context) * 1.32),
                          child: Image.asset(
                            'assets/images/calendar_month_black_24dp 1.webp',
                            height: UpdatedDimensions.width10(context) * 2.4,
                            width: UpdatedDimensions.width10(context) * 2.4,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor: const Color(0xffD9B4B4).withOpacity(0.8),
            bottomNavigationBar: contain
                ? Container(
                    margin: EdgeInsets.all(
                        UpdatedDimensions.height10(context) * 1.8),
                    child: updateBox(
                        headText: widget.missed ? 'Missed' : 'SAVED',
                        bodyText: widget.name,
                        edit: widget.missed ? false : true,
                        onTap1: () {},
                        FadeFunction: () {},
                        functionText: widget.missed ? 'Undo' : 'Edit'),
                  )
                : BottomAppBar(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    notchMargin: 0,
                    color: const Color(0xffD9B4B4).withOpacity(0.8),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Navigation_Bar(
                          bg_colored: true,
                          subscription: getSubscription.toString(),
                        ),
                      ),
                    ),
                  ),
            body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Mask Group.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                height: UpdatedDimensions.height10(context) * 79.8,
                child: loader == false
                    ? GestureDetector(
                        onTap: () {
                          if (widget.helpfulTips) {
                            if (goalLevel == 0) {
                              _incrementValue();
                            }
                          }
                        },
                        child: SizedBox(
                            width: double.infinity,
                            // height:
                            //     UpdatedDimensions.height10(context) *
                            //         19.2,
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      noActive
                                          ? dashboardCarousel(
                                              context,
                                              _controller,
                                              null,
                                              currentIndex, (value) {
                                              setState(() {
                                                currentIndex = value.value2;
                                                toggleDates(value.value1);
                                                focusedDate = DateTime.parse(
                                                    formatDates(value.value1));
                                              });
                                            })
                                          : dashboardCarousel(
                                              context,
                                              _controller,
                                              allGoals,
                                              currentIndex, (value) {
                                              setState(() {
                                                currentIndex = value.value2;
                                                toggleDates(value.value1);
                                                focusedDate = DateTime.parse(
                                                    formatDates(value.value1));
                                              });
                                            }),
                                      noActive
                                          ? dashboardPlaceHolder(context)
                                          : Stack(children: [
                                              Stack(
                                                children: [
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        timesList.isEmpty
                                                            ? dashboardNoPastSession(
                                                                context,
                                                                smallScreen,
                                                                userGoals,
                                                                currentIndex <
                                                                    7,
                                                                practices,
                                                                currentIndex ==
                                                                    7)
                                                            : ListView.builder(
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                itemCount:
                                                                    timesList
                                                                        .length,
                                                                shrinkWrap:
                                                                    true,
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                itemBuilder:
                                                                    ((context,
                                                                        index) {
                                                                  return dashBoardSessionComponent(
                                                                      context,
                                                                      timesList[
                                                                          index],
                                                                      () {
                                                                    _scrollToCurrentIndex();
                                                                  }, () async {
                                                                    if (_showOverlay ==
                                                                        false) {
                                                                      Navigator.push(
                                                                          context,
                                                                          FadePageRoute(
                                                                              page: (const practiceMenu(
                                                                            goal_eval:
                                                                                false,
                                                                            completed:
                                                                                false,
                                                                          ))));
                                                                      final SharedPreferences
                                                                          prefs =
                                                                          await _prefs;
                                                                      await prefs.setInt(
                                                                          'goal_num',
                                                                          timesList[index]['data']['userGoal']
                                                                              [
                                                                              'id']);

                                                                      await prefs.setString(
                                                                          'goal_menu_route',
                                                                          'dashboard');
                                                                    } else {
                                                                      if (goalLevel ==
                                                                          0) {
                                                                        _incrementValue();
                                                                      }
                                                                    }
                                                                  }, () async {
                                                                    if (_showOverlay ==
                                                                        false) {
                                                                      final SharedPreferences
                                                                          prefs =
                                                                          await _prefs;
                                                                      await prefs.setString(
                                                                          'prac_menu_route',
                                                                          'dashboard');
                                                                      await prefs.setInt(
                                                                          'prac_num',
                                                                          timesList[index]['data']
                                                                              [
                                                                              'id']);
                                                                      await prefs.setInt(
                                                                          'goal_num',
                                                                          timesList[index]['data']['userGoal']
                                                                              [
                                                                              'id']);

                                                                      await prefs.setString(
                                                                          'dash_pracName',
                                                                          timesList[index]['data']
                                                                              [
                                                                              'name']);
                                                                      await prefs.setString(
                                                                          'dash_goalName',
                                                                          timesList[index]['data']['userGoal']
                                                                              [
                                                                              'name']);
                                                                      await prefs.setString(
                                                                          'record_date',
                                                                          getFormattedDate(current)
                                                                              .toString());

                                                                      await timesList[index]['data']['color'] !=
                                                                              null
                                                                          ? prefs.setString(
                                                                              'dash_pracColor',
                                                                              timesList[index]['data'][
                                                                                  'color'])
                                                                          : prefs.setString(
                                                                              'dash_pracColor',
                                                                              '0');
                                                                      await prefs.setString(
                                                                          'recording_Time1',
                                                                          timesList[index]
                                                                              [
                                                                              'time']);
                                                                      await prefs.setBool(
                                                                          'behaviour_route',
                                                                          true);
                                                                      await timesList[index]['data']['userGoal']['color'] !=
                                                                              null
                                                                          ? prefs.setString(
                                                                              'dash_goalColor',
                                                                              timesList[index]['data']['userGoal']['color'])
                                                                          : '0';
                                                                      if (timesList[index]
                                                                              [
                                                                              'status'] ==
                                                                          "Not Started") {
                                                                        Navigator.push(
                                                                            context,
                                                                            FadePageRoute(
                                                                                page: const practiceMenu(
                                                                              goal_eval: false,
                                                                              completed: false,
                                                                            )));
                                                                      } else if (timesList[index]
                                                                              [
                                                                              'status'] ==
                                                                          "missed") {
                                                                        Navigator.push(
                                                                            context,
                                                                            FadePageRoute(
                                                                                page: const practiceMenu(
                                                                              goal_eval: false,
                                                                              completed: false,
                                                                            )));
                                                                      } else {
                                                                        Navigator.push(
                                                                            context,
                                                                            FadePageRoute(
                                                                                page: const practiceMenu(
                                                                              goal_eval: false,
                                                                              completed: true,
                                                                            )));
                                                                      }
                                                                    } else {
                                                                      if (goalLevel ==
                                                                          0) {
                                                                        _incrementValue();
                                                                      }
                                                                    }
                                                                  });
                                                                })),
                                                        SizedBox(
                                                          height: UpdatedDimensions
                                                                  .height10(
                                                                      context) *
                                                              20.0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (_showOverlay)
                                                FutureBuilder(
                                                    future: Future.delayed(
                                                        const Duration(
                                                            milliseconds: 200)),
                                                    builder: (c, s) =>
                                                        s.connectionState ==
                                                                ConnectionState
                                                                    .done
                                                            ? helpFulTips(
                                                                context,
                                                                goalLevel,
                                                                single, () {
                                                                setState(() {
                                                                  _showOverlay =
                                                                      false;
                                                                });
                                                              }, () {
                                                                _incrementValue();
                                                                if (goalLevel >
                                                                    7) {
                                                                  setState(() {
                                                                    _showOverlay =
                                                                        false;
                                                                  });
                                                                  Authentication()
                                                                      .userStatusUpdate(
                                                                          'isTutorial',
                                                                          false);
                                                                }
                                                              })
                                                            : Container()),
                                            ]),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: smallScreen
                                        ? UpdatedDimensions.height10(context) *
                                            50.0
                                        : UpdatedDimensions.height10(context) *
                                            54.0,
                                    left: UpdatedDimensions.height10(context) *
                                        1.3,
                                    child: Stack(
                                      children: [
                                        isVisible
                                            ? Obx(() {
                                                if (notificationsController
                                                    .getAllNotifications()
                                                    .isEmpty) {
                                                  return const SizedBox(); // Return an empty widget if the string is empty
                                                } else {
                                                  return SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: CarouselSlider
                                                        .builder(
                                                            itemCount:
                                                                notificationsController
                                                                    .getAllNotifications()
                                                                    .length,
                                                            itemBuilder: (BuildContext context,
                                                                    int
                                                                        itemIndex,
                                                                    int
                                                                        pageViewIndex) =>
                                                                reda(
                                                                    context,
                                                                    notificationsController
                                                                            .getAllNotifications()[
                                                                        itemIndex],
                                                                    () {
                                                                  Timer(
                                                                      const Duration(
                                                                          seconds:
                                                                              2),
                                                                      () {
                                                                    setState(
                                                                        () {});
                                                                  });
                                                                }),
                                                            options: CarouselOptions(
                                                                enlargeCenterPage:
                                                                    true,
                                                                height: 200,
                                                                viewportFraction:
                                                                    1,
                                                                enableInfiniteScroll:
                                                                    false)),
                                                  );
                                                }
                                              })
                                            : Container(),
                                        AnimatedScaleButton(
                                          onTap: () {
                                            // notifications_sheet(context);
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                          child: Container(
                                            width: UpdatedDimensions.height10(
                                                    context) *
                                                4,
                                            height: UpdatedDimensions.height10(
                                                    context) *
                                                4,
                                            padding: EdgeInsets.all(
                                                UpdatedDimensions.height10(
                                                        context) *
                                                    0.4),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: Container(
                                              width: UpdatedDimensions.width10(
                                                      context) *
                                                  3.5,
                                              height:
                                                  UpdatedDimensions.height10(
                                                          context) *
                                                      3.5,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/Smart Object_1.webp'))),
                                              child: Align(
                                                alignment:
                                                    const Alignment(0, 2.8),
                                                child: notificationsController
                                                        .getAllNotifications()
                                                        .isEmpty
                                                    ? const SizedBox()
                                                    : Container(
                                                        width: UpdatedDimensions
                                                                .width10(
                                                                    context) *
                                                            1.7,
                                                        height: UpdatedDimensions
                                                                .height10(
                                                                    context) *
                                                            1.7,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            notificationsController
                                                                .getAllNotifications()
                                                                .length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: UpdatedDimensions
                                                                        .font10(
                                                                            context) *
                                                                    1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: const Color(
                                                                    0xFFFA9934)),
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            )),
                      )
                    : const DashBoardBehaviour_shimmer())),
      ),
    );
  }
}
