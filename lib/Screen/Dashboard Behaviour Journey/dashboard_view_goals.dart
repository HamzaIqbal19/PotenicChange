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
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_landing.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/loaders/TutorialController.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/widgets/tooltips.dart';
import 'package:potenic_app/Screen/Goal%20Achieved%20Journey/congratulations.dart';
import 'package:potenic_app/Screen/Notification%20Journey/widgets/notificationPermissionService.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/redaMessage.dart';
import 'package:potenic_app/utils/formattedTime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_tooltip/super_tooltip.dart';
import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../Capture Inspiration Journey/Widgets/updateBox.dart';
import 'future_practice_menu.dart';
import 'loaders/dashboard_behaviour_shimmer.dart';
import 'dart:ui';
import 'widgets/dashboardNoSessions.dart';
import 'widgets/dashboardUI.dart';
import 'widgets/dashboard_carousel.dart';
import 'widgets/helpfulTips.dart';
import 'widgets/practiceSessionComponent.dart';

class ViewDashboard extends StatefulWidget {
  final bool missed;
  final bool update;
  final String name;
  final bool helpfulTips;
  final int record;
  final navigateRecord;

  const ViewDashboard(
      {super.key,
      required this.missed,
      required this.update,
      required this.name,
      required this.helpfulTips,
      required this.record,
      this.navigateRecord});

  @override
  State<ViewDashboard> createState() => _ViewDashboardState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _ViewDashboardState extends State<ViewDashboard>
    with WidgetsBindingObserver {
  final superTooltipController1 = SuperTooltipController();
  final superTooltipController2 = SuperTooltipController();
  final superTooltipController3 = SuperTooltipController();
  final superTooltipController4 = SuperTooltipController();
  final superTooltipController5 = SuperTooltipController();
  final superTooltipController6 = SuperTooltipController();

  var allGoals;
  var userGoals;
  var focusedDate = DateTime.now();
  List<dynamic> practices = [];
  bool noActive = false;
  bool noPlanned = false;
  bool noData = false;
  bool loader = true;
  var getSubscription = '';
  bool maxViewDate = false;
  List<Map<String, dynamic>> timesList = [];
  bool contain = false;
  bool single = false;
  int goalLevel = 1;
  final ScrollController _scrollController = ScrollController();
  // DateTime currentDate = DateTime.now();
  int currentIndex = 7;
  bool currentItem = false;
  bool isCenterItem = false;
  final CarouselSliderController _controller = CarouselSliderController();
  bool isVisible = true;
  final NotificationPermissionService _notificationPermissionService =
      NotificationPermissionService();
  var saveindex;
  var saveDate;

  void _incrementValue() {
    if (goalLevel == 1) {
      superTooltipController1.showTooltip();
    } else if (goalLevel == 2) {
      superTooltipController1.hideTooltip();
      superTooltipController2.showTooltip();
    } else if (goalLevel == 3) {
      superTooltipController2.hideTooltip();
      superTooltipController3.showTooltip();
    } else if (goalLevel == 4) {
      superTooltipController3.hideTooltip();
      superTooltipController4.showTooltip();
    } else if (goalLevel == 5) {
      superTooltipController4.hideTooltip();
      superTooltipController5.showTooltip();
    } else if (goalLevel == 6) {
      superTooltipController5.hideTooltip();
      superTooltipController6.showTooltip();
      setState(() {
        _showOverlay = false;
      });
    } else {
      setState(() {
        _showOverlay = false;
      });
      superTooltipController6.hideTooltip();
    }

    setState(() {
      goalLevel++;
    });
  }

  initializeTutorial() {
    if (widget.helpfulTips == true) {
      Future.delayed(const Duration(seconds: 2), _incrementValue);
    }
  }

  disposeTooltips() {
    superTooltipController1.hideTooltip();
    superTooltipController2.hideTooltip();
    superTooltipController3.hideTooltip();
    superTooltipController4.hideTooltip();
    superTooltipController5.hideTooltip();
    superTooltipController6.hideTooltip();
    setState(() {
      _showOverlay = false;
    });
  }

  getUser() {
    Authentication().getUserData().then((value) async {
      final SharedPreferences prefs = await _prefs;

      setState(() {
        getSubscription = value['subscriptionStatus'];
      });

      prefs.setString('subscriptionStatus', value['subscriptionStatus']);
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
    superTooltipController1.dispose();
    superTooltipController2.dispose();
    superTooltipController3.dispose();
    superTooltipController4.dispose();
    superTooltipController5.dispose();
    superTooltipController6.dispose();
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
      });
    }
    notificationPermissionSerice();
    super.initState();
    getUser();
    getUserNotifications();
    _fetchGoalNames();
    fetchDashboardData();

    if (widget.update == true) {
      setState(() {
        contain = true;
      });
      startTimer();
    }
    if (widget.helpfulTips == true) {
      setState(() {
        _showOverlay = true;
      });
    }
    getGoalUpdates();

    WidgetsBinding.instance.addObserver(this);
    getIndex();
  }

  getIndex() async {
    SharedPreferences prefs = await _prefs;
    saveindex = prefs.getInt('saveindex');

    if (widget.navigateRecord == true) {
      currentIndex = saveindex;
    } else {
      currentIndex;
    }
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

  void fetchDashboardData() async {
    SharedPreferences prefs = await _prefs;
    AdminGoal.checkUserActiveGoal().then((response) {
      if (response == 200) {
        PracticeGoalApi.getUserDashboard(getFormattedDate(current))
            .then((value) {
          setState(() {
            allGoals = value['data'];
            print("data ${allGoals}");
          });
          if (widget.navigateRecord == true) {
            var getDate = prefs.getString('date');
            print("getDate");

            toggleDates(getDate);
          } else {
            toggleDates(DateTime.now().toString());
          }
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

  Future<Timer> startTimer() async {
    return Timer(const Duration(seconds: 2), stop);
  }

  void stop() {
    setState(() {
      contain = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    final notificationController notificationsController =
        Get.find<notificationController>();
    final TutorialController tutorialController = Get.put(TutorialController());

    var startTutorial = tutorialController.showTutorial;
    if (startTutorial.value == true) {
      tutorialController.stopTutorial();
      initializeTutorial();
    }
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // currentIndex != 7
                      //     ?
                      //  : const SizedBox(),
                      Stack(
                        children: [
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
                                  right:
                                      UpdatedDimensions.width10(context) * 1.7),
                              child: Image.asset(
                                'assets/images/Add goal.webp',
                                height:
                                    UpdatedDimensions.width10(context) * 2.4,
                                width: UpdatedDimensions.width10(context) * 2.4,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            top: 30,
                            //alignment: const Alignment(2, 1),
                            child: dashboardTooltip(
                              superTooltipController5,
                              context,
                              5,
                              'down',
                              disposeTooltips,
                              _incrementValue,
                              Container(
                                height: 0,
                                width: 0,
                              ),
                            ),
                          )
                        ],
                      ),

                      AnimatedScaleButton(
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
                              right:
                                  UpdatedDimensions.height10(context) * 1.32),
                          child: Image.asset(
                            'assets/images/Asset 10 2.webp',
                            height: UpdatedDimensions.width10(context) * 4.0,
                            width: UpdatedDimensions.width10(context) * 3.977,
                            fit: BoxFit.contain,
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
                : ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: BottomAppBar(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        notchMargin: 0,
                        color: const Color(0xffD9B4B4).withOpacity(0.8),
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
                height: double.infinity,
                child: loader == false
                    ? GestureDetector(
                        onTap: () {
                          if (widget.helpfulTips) {
                            _incrementValue();
                          }
                        },
                        child: SizedBox(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      noActive
                                          ? dashboardCarousel(
                                              context,
                                              _controller,
                                              superTooltipController4,
                                              disposeTooltips,
                                              _incrementValue,
                                              null,
                                              currentIndex,
                                              widget.navigateRecord == true
                                                  ? saveindex
                                                  : 7, (value) {
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
                                              superTooltipController4,
                                              disposeTooltips,
                                              _incrementValue,
                                              allGoals,
                                              currentIndex,
                                              widget.navigateRecord == true
                                                  ? saveindex
                                                  : 7, (value) async {
                                              SharedPreferences prefs =
                                                  await _prefs;
                                              setState(() {
                                                if (widget.navigateRecord ==
                                                    true) {}

                                                // if (widget.navigateRecord ==
                                                //     true) {
                                                // print(
                                                //     "check ${widget.navigateRecord}");
                                                // saveindex =
                                                //     prefs.getInt('saveindex');
                                                // saveDate =
                                                //     prefs.getString('date');
                                                // currentIndex = saveindex ?? 7;
                                                // toggleDates(saveDate);
                                                // focusedDate = DateTime.parse(
                                                //     formatDates(saveDate));
                                                // } else {
                                                currentIndex = value.value2;
                                                toggleDates(value.value1);
                                                focusedDate = DateTime.parse(
                                                    formatDates(value.value1));
                                                prefs.setInt(
                                                    'saveindex', currentIndex);
                                                prefs.setString('date',
                                                    focusedDate.toString());
                                                //      }
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
                                                                    7,
                                                                focusedDate
                                                                    .toString())
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
                                                                      superTooltipController1,
                                                                      superTooltipController2,
                                                                      superTooltipController3,
                                                                      disposeTooltips,
                                                                      _incrementValue,
                                                                      index,
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
                                                                              page: const goal_menu_inactive(
                                                                            isActive:
                                                                                false,
                                                                            goal_evaluation:
                                                                                false,
                                                                          )));
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
                                                                      _incrementValue();
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
                                                                          focusedDate
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
                                                                      if (focusedDate
                                                                          .isAfter(
                                                                              DateTime.now())) {
                                                                        Navigator.pushReplacement(
                                                                            context,
                                                                            FadePageRoute(page: futurePracticeMenu(pracName: timesList[index]['data']['name'])));
                                                                      } else {
                                                                        if (timesList[index]['status'] ==
                                                                            "Not Started") {
                                                                          Navigator.push(
                                                                              context,
                                                                              FadePageRoute(
                                                                                  page: const practiceMenu(
                                                                                goal_eval: false,
                                                                                completed: false,
                                                                              )));
                                                                        } else if (timesList[index]['status'] ==
                                                                            "missed") {
                                                                          Navigator.push(
                                                                              context,
                                                                              FadePageRoute(
                                                                                  page: const practiceMenu(
                                                                                goal_eval: false,
                                                                                completed: false,
                                                                              )));
                                                                        } else {
                                                                          await prefs.setInt(
                                                                              'recording_id',
                                                                              timesList[index]['data']['recordings'][0]['id']);
                                                                          Navigator.push(
                                                                              context,
                                                                              FadePageRoute(
                                                                                  page: const practiceMenu(
                                                                                goal_eval: false,
                                                                                completed: true,
                                                                              )));
                                                                        }
                                                                      }
                                                                    } else {
                                                                      _incrementValue();
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
                                              // if (_showOverlay)
                                              //   FutureBuilder(
                                              //       future: Future.delayed(
                                              //           const Duration(
                                              //               milliseconds: 200)),
                                              //       builder: (c, s) =>
                                              //           s.connectionState ==
                                              //                   ConnectionState
                                              //                       .done
                                              //               ? helpFulTips(
                                              //                   context,
                                              //                   goalLevel,
                                              //                   single, () {
                                              //                   setState(() {
                                              //                     _showOverlay =
                                              //                         false;
                                              //                   });
                                              //                 }, () {
                                              //                   _incrementValue();
                                              //                   if (goalLevel >
                                              //                       6) {
                                              //                     setState(() {
                                              //                       _showOverlay =
                                              //                           false;
                                              //                     });
                                              //                     Authentication()
                                              //                         .userStatusUpdate(
                                              //                             'isTutorial',
                                              //                             false);
                                              //                   }
                                              //                 })
                                              //               : Container()),
                                            ]),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: smallScreen
                                        ? UpdatedDimensions.height10(context) *
                                            48.0
                                        : UpdatedDimensions.height10(context) *
                                            52.0,
                                    left: UpdatedDimensions.height10(context) *
                                        1.3,
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 180, top: 30),
                                          child: Align(
                                              alignment: const Alignment(0, 0),
                                              child: dashboardTooltip(
                                                  superTooltipController6,
                                                  context,
                                                  6,
                                                  'up',
                                                  disposeTooltips,
                                                  disposeTooltips,
                                                  Container(
                                                    height: 0,
                                                    width: 0,
                                                  ))),
                                        ),
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
                                                            1.9,
                                                        height: UpdatedDimensions
                                                                .height10(
                                                                    context) *
                                                            1.9,
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
                                                                    1.2,
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
