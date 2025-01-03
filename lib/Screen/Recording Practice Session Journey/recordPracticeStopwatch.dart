import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeWelldone.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/appBarWidgets.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class clocks extends StatefulWidget {
  const clocks({super.key});

  @override
  State<clocks> createState() => _clocksState();
}

class _clocksState extends State<clocks> {
  String pracName = "";
  var behaviour_route;

  @override
  void initState() {
    super.initState();
    _fetchPracticeNames();
  }

  void _fetchPracticeNames() async {
    final SharedPreferences prefs = await _prefs;
    var Name = prefs.getString('pracName');

    setState(() {
      pracName = '$Name';
      behaviour_route = prefs.getBool('behaviour_route');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: appBarTitle(context, pracName,false),
        leading: Buttons().backButton(context, () {
          Navigator.pop(context);
        }),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  showAnimatedDialog(
                    animationType: DialogTransitionType.fadeScale,
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 1),
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      width: AppDimensionsUpdated.width10(context) * 27.0,
                      height: AppDimensionsUpdated.height10(context) * 18.2,
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        actionsPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensionsUpdated.height10(context) * 1.4)),
                        title: Container(
                          margin: const EdgeInsets.only(
                              top: 19, right: 16, left: 16, bottom: 2),
                          height: AppDimensionsUpdated.height10(context) * 2.2,
                          width: AppDimensionsUpdated.width10(context) * 23.8,
                          child: Text(
                            "Are you sure?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        content: Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  AppDimensionsUpdated.height10(context) * 1.9,
                              left: AppDimensionsUpdated.width10(context) * 1.6,
                              right:
                                  AppDimensionsUpdated.width10(context) * 1.6),
                          height: AppDimensionsUpdated.height10(context) * 3.2,
                          width: AppDimensionsUpdated.width10(context) * 23.8,
                          child: Text(
                            "If you close it now, you will lose all your progress.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: 42,
                                width: double.infinity,
                                color: const Color(0xFF007AFF),
                                child: TextButton(
                                  onPressed: () {
                                    if (behaviour_route == false) {
                                      Navigator.pushReplacement(
                                          context,
                                          FadePageRouteReverse(
                                              page: const ViewDashboard(
                                            missed: false,
                                            name: '',
                                            update: false,
                                            helpfulTips: false,
                                            record: 0,
                                          )));
                                    } else {
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
                                    }
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 44,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF007AFF)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/images/Close.webp',
                  width: AppDimensionsUpdated.width10(context) * 2.8,
                  height: AppDimensionsUpdated.height10(context) * 2.8,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: AppDimensionsUpdated.height10(context) * 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScaleButton(
              onTap: () {
                Navigator.push(
                  context,
                  FadePageRoute(
                    page: const feelingsAfter(
                      summary: false,
                      selected: 0,
                    ),
                  ),
                );
              },
              child: Container(
                  height: AppDimensionsUpdated.height10(context) * 5.0,
                  width: AppDimensionsUpdated.width10(context) * 25.4,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCC10D),
                          Color(0xffFDA210),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(
                          AppDimensionsUpdated.height10(context) * 5.0),
                      border: Border.all(
                          width: AppDimensionsUpdated.width10(context) * 0.2,
                          color: Colors.transparent)),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: UpdatedDimensions.font10(context) * 2,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: AppDimensionsUpdated.height10(context) * 7.5,
                    top: AppDimensionsUpdated.height10(context) * 7.0),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 35.9,
                height: AppDimensionsUpdated.height10(context) * 14.8,
                alignment: Alignment.center,
                // margin: EdgeInsets.only(bottom: 86),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppText().clockText,
                    style: TextStyle(
                        fontSize: AppDimensionsUpdated.font10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Laila',
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              const watch_time(),
            ],
          ),
        ),
      ),
    );
  }
}

class watch_time extends StatefulWidget {
  const watch_time({super.key});

  @override
  State<watch_time> createState() => _watch_timeState();
}

class _watch_timeState extends State<watch_time> {
  String button_text = 'Start';
  bool clock_state = true;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _elapsedTime = "00:00";
  int _seconds = 00;
  int _minutes = 00;
  int _hours = 0;
  bool enabled = false;

  bool _isRunning = false;

  void _startTimer() {
    setState(() {
      _isRunning = true;
      enabled = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            if (_hours > 0) {
              _hours--;
              _minutes = 59;
              _seconds = 59;
            } else {
              _isRunning = false;
              enabled = false;
              _audioPlayer.play(AssetSource('sounds/timerRingtone.mp3'));
              _timer?.cancel();
            }
          }
        }
      });
    });
  }

  // This function will be called when the user presses the pause button
  // Pause the timer
  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  // This function will be called when the user presses the cancel button
  // Cancel the timer
  void _cancelTimer() {
    setState(() {
      _hours = 0;
      _minutes = 00;
      _seconds = 00;
      _isRunning = false;
      enabled = false;
    });
    _timer?.cancel();
  }

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _elapsedTime = _stopwatch.elapsed.toString().substring(2, 7);
      });
    });
  }

  void _stopStopwatch() {
    if (_timer != null) {
      _stopwatch.stop();
      _timer!.cancel();
    }
  }

  void _resetStopwatch() {
    if (_timer != null) {
      _stopwatch.reset();
      _timer!.cancel();
    }
    setState(() {
      _elapsedTime = "00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: AppDimensionsUpdated.height10(context) * 4.501,
        width: AppDimensionsUpdated.width10(context) * 26.6,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: AppDimensionsUpdated.width10(context) * 13.3,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: AppDimensionsUpdated.width10(context) * 0.2,
                          color: clock_state
                              ? const Color(0xff437296)
                              : Colors.white))),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    _resetStopwatch();
                    setState(() {
                      button_text = "Start";
                      clock_state = true;
                    });
                  },
                  child: clock_state
                      ? SizedBox(
                          //width: AppDimensionsUpdated.width10(context) * 9.2,
                          height: AppDimensionsUpdated.height10(context) * 2.4,
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.8,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff437296)),
                          ),
                        )
                      : SizedBox(
                          //width: AppDimensionsUpdated.width10(context) * 5.4,
                          height: AppDimensionsUpdated.height10(context) * 2.4,
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                ),
              ),
            ),
            Container(
              width: AppDimensionsUpdated.width10(context) * 13.3,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: AppDimensionsUpdated.width10(context) * 0.2,
                          color: clock_state
                              ? Colors.white
                              : const Color(0xff437296)))),
              // padding: EdgeInsets.only(left: 10),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      _cancelTimer();
                      setState(() {
                        button_text = "Start";
                        clock_state = false;
                      });
                    },
                    child: clock_state
                        ? SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 2.4,
                            // width: AppDimensionsUpdated.width10(context) * 5.4,
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.8,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          )
                        : SizedBox(
                            height:
                                AppDimensionsUpdated.height10(context) * 2.4,
                            // width: AppDimensionsUpdated.width10(context) * 5.4,
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            1.8,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff437296))),
                          )),
              ),
            )
          ],
        ),
      ),
      Container(
        height: AppDimensionsUpdated.height10(context) * 34.5,
        width: AppDimensionsUpdated.width10(context) * 34.5,
        margin: EdgeInsets.only(
            bottom: AppDimensionsUpdated.height10(context) * 6.4,
            top: AppDimensionsUpdated.height10(context) * 2.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: AppDimensionsUpdated.width10(context) * 0.2,
              color: Colors.white),
        ),
        child: Container(
          height: AppDimensionsUpdated.height10(context) * 28.565,
          width: AppDimensionsUpdated.width10(context) * 28.565,
          margin: EdgeInsets.all(AppDimensionsUpdated.height10(context) * 3.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: AppDimensionsUpdated.width10(context) * 0.2,
                  color: Colors.white)),
          child: Stack(
            children: [
              //timer
              Align(
                alignment: const Alignment(0, -0.4),
                child: SizedBox(
                  height: AppDimensionsUpdated.height10(context) * 7.2,
                  width: AppDimensionsUpdated.width10(context) * 12.8,
                  // color: Colors.red,
                  child: Center(
                    child: Container(
                        decoration: clock_state
                            ? const BoxDecoration(
                                shape: BoxShape.rectangle,
                              )
                            : DottedDecoration(
                                shape: Shape.line,
                                linePosition: LinePosition.bottom,
                                color: Colors.white,
                                dash: const [2, 2]),
                        child: clock_state
                            ? Text(
                                _elapsedTime,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensionsUpdated.font10(context) *
                                            4.6,
                                    fontWeight: FontWeight.w300),
                              )
                            : GestureDetector(
                                onTap: () {
                                  showCupertinoModalPopup<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _buildContainer(timerPicker());
                                      });
                                },
                                child: Text(
                                  '${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) *
                                              4.6,
                                      fontWeight: FontWeight.w300),
                                ),
                              )),
                  ),
                ),
              ),
              //play button
              Positioned(
                right: AppDimensionsUpdated.width10(context) * 9.7,
                left: AppDimensionsUpdated.width10(context) * 9.7,
                bottom: AppDimensionsUpdated.height10(context) * 2.0,
                child: AnimatedScaleButton(
                  onTap: () {
                    if (clock_state == true) {
                      if (button_text == 'Pause') {
                        _stopStopwatch();
                        setState(() {
                          button_text = 'Start';
                        });
                      } else {
                        _startStopwatch();
                        setState(() {
                          button_text = 'Pause';
                        });
                      }
                    } else {
                      if (enabled == true) {
                        if (_isRunning) {
                          _pauseTimer();
                          setState(() {
                            button_text = 'Start';
                          });
                        } else {
                          _startTimer();
                          setState(() {
                            button_text = 'Pause';
                          });
                        }
                      }
                    }
                  },
                  child: Container(
                    height: AppDimensionsUpdated.height10(context) * 9.1,
                    width: AppDimensionsUpdated.width10(context) * 9.1,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _minutes == 00 &&
                                _seconds == 00 &&
                                clock_state == false
                            ? const Color(0xFFFFFFFF).withOpacity(0.5)
                            : const Color(0xFFFFFFFF),
                        border: Border.all(
                            width: AppDimensionsUpdated.width10(context) * 0.5,
                            color: _minutes == 00 &&
                                    _seconds == 00 &&
                                    clock_state == false
                                ? const Color(0xffFEBD0F).withOpacity(0.5)
                                : const Color(0xffFEBD0F))),
                    child: SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 7,
                      width: AppDimensionsUpdated.width10(context) * 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          button_text == "Pause"
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top:
                                        AppDimensionsUpdated.height10(context) *
                                            0.3,
                                    // left: AppDimensionsUpdated.width10(context) *
                                    //     1.0
                                  ),
                                  child: Image.asset(
                                    'assets/images/stop_icon.png',
                                    width:
                                        AppDimensionsUpdated.width10(context) *
                                            2.7,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.7,
                                    fit: BoxFit.cover,
                                  ))
                              : Container(
                                  margin: EdgeInsets.only(
                                      top: AppDimensionsUpdated.height10(
                                              context) *
                                          0.3,
                                      left: AppDimensionsUpdated.width10(
                                              context) *
                                          1.0),
                                  child: Image.asset(
                                    'assets/images/start_icon.webp',
                                    width:
                                        AppDimensionsUpdated.width10(context) *
                                            1.8,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.7,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 3.5,
                            height:
                                AppDimensionsUpdated.height10(context) * 2.2,
                            margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 0.5,
                            ),
                            child: Center(
                              child: Text(button_text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensionsUpdated.font10(context) *
                                              1.4,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffFFA511))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //reset button
              Positioned(
                right: AppDimensionsUpdated.width10(context) * 3.78,
                bottom: AppDimensionsUpdated.height10(context) * 5.6,
                child: AnimatedScaleButton(
                  onTap: () {
                    if (clock_state == true) {
                      _resetStopwatch();
                      setState(() {
                        button_text = 'Start';
                      });
                    } else {
                      _cancelTimer();
                      setState(() {
                        button_text = 'Start';
                      });
                    }
                  },
                  child: Container(
                    height: AppDimensionsUpdated.width10(context) * 5.6,
                    width: AppDimensionsUpdated.width10(context) * 5.6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: const Color(0xffFEBD0F).withOpacity(0.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh,
                          size: AppDimensionsUpdated.height10(context) * 1.8,
                          color: const Color(0xffFEAD10).withOpacity(0.5),
                        ),
                        Text(
                          'Reset',
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.2,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffFFA511).withOpacity(0.5)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  // Function to create the timerPicker widget
  Widget timerPicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.ms,
      initialTimerDuration:
          Duration(hours: _hours, minutes: _minutes, seconds: _seconds),
      onTimerDurationChanged: (Duration changeTimer) {
        setState(() {
          _hours = changeTimer.inHours;
          _minutes = changeTimer.inMinutes.remainder(60);
          _seconds = changeTimer.inSeconds.remainder(60);
        });
      },
    );
  }

  // Function to build the container for the timerPicker
  Widget _buildContainer(Widget picker) {
    return Container(
      height: AppDimensionsUpdated.height10(context) * 34,
      padding: const EdgeInsets.only(top: 6),
      color: CupertinoColors.white,
      child: Column(
        children: [
          SizedBox(
            height: AppDimensionsUpdated.height10(context) * 3.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _minutes = 00;
                      _seconds = 00;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff2F80ED),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // When the "Done" button is pressed, update the timer values
                    setState(() {
                      enabled = true;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff2F80ED),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: SafeArea(
                top: false,
                child: picker,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
