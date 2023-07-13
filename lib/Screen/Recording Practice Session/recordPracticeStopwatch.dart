import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeWelldone.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
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

  final _scrollController = ScrollController();

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
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
                // width: AppDimensions.height10(context) * 18.6,
                height: AppDimensions.height10(context) * 2.4,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 10.5,
                    top: AppDimensions.height10(context) * 4.6),
                alignment: Alignment.center,
                child: Text(
                  pracName,
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 35.9,
                height: AppDimensions.height10(context) * 14.8,
                alignment: Alignment.center,
                // margin: EdgeInsets.only(bottom: 86),
                child: Text(
                  'Do you need a timer for\nyour practice?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.12,
                      fontSize: AppDimensions.height10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(child: watch_time()),
              Container(
                width: AppDimensions.height10(context) * 32.5,
                height: AppDimensions.height10(context) * 6.0,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.push(
                          context, FadePageRoute(page: (welldone_splash())));
                    },
                    child: Container(
                        height: AppDimensions.height10(context) * 5.0,
                        width: AppDimensions.height10(context) * 10.6,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                            border:
                                Border.all(width: 2, color: Color(0xffFA9934))),
                        child: Center(
                            child: Text(
                          'Skip',
                          style: TextStyle(
                              color: Color(0xffFA9934),
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.push(
                          context, FadePageRoute(page: (welldone_splash())));
                    },
                    child: Container(
                        height: AppDimensions.height10(context) * 5.0,
                        width: AppDimensions.height10(context) * 20.7,
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
                                AppDimensions.height10(context) * 5.0),
                            border: Border.all(
                                width: AppDimensions.height10(context) * 0.2,
                                color: Colors.transparent)),
                        child: Center(
                          child: Text(
                            'Finished Practice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  )
                ]),
              ),
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

  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _elapsedTime = "00:00";
  int _seconds = 00;
  int _minutes = 05;
  int _hours = 0;

  // The state of the timer (running or not)
  bool _isRunning = false;

  // This function will be called when the user presses the start button
  // Start the timer
  // The timer will run every second
  // The timer will stop when the hours, minutes and seconds are all 0
  void _startTimer() {
    setState(() {
      _isRunning = true;
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
      _minutes = 05;
      _seconds = 00;
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _elapsedTime = _stopwatch.elapsed.toString().substring(2, 7);
      });
    });
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _timer.cancel();
    setState(() {
      _elapsedTime = "00:00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: AppDimensions.height10(context) * 4.501,
        width: AppDimensions.height10(context) * 26.6,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: AppDimensions.height10(context) * 13.3,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: AppDimensions.height10(context) * 0.2,
                          color:
                              clock_state ? Color(0xff437296) : Colors.white))),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    _resetStopwatch();
                    setState(() {
                      button_text = "start";
                      clock_state = true;
                    });
                    ;
                  },
                  child: clock_state
                      ? Container(
                          //width: AppDimensions.height10(context) * 9.2,
                          height: AppDimensions.height10(context) * 2.4,
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff437296)),
                          ),
                        )
                      : Container(
                          //width: AppDimensions.height10(context) * 5.4,
                          height: AppDimensions.height10(context) * 2.4,
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 13.3,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: AppDimensions.height10(context) * 0.2,
                          color:
                              clock_state ? Colors.white : Color(0xff437296)))),
              // padding: EdgeInsets.only(left: 10),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      _cancelTimer();
                      setState(() {
                        button_text = "start";
                        clock_state = false;
                      });
                    },
                    child: clock_state
                        ? Container(
                            height: AppDimensions.height10(context) * 2.4,
                            // width: AppDimensions.height10(context) * 5.4,
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          )
                        : Container(
                            height: AppDimensions.height10(context) * 2.4,
                            // width: AppDimensions.height10(context) * 5.4,
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff437296))),
                          )),
              ),
            )
          ],
        ),
      ),
      Container(
        height: AppDimensions.height10(context) * 34.5,
        width: AppDimensions.height10(context) * 34.5,
        margin: EdgeInsets.only(
            bottom: AppDimensions.height10(context) * 6.4,
            top: AppDimensions.height10(context) * 2.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: AppDimensions.height10(context) * 0.2,
              color: Colors.white),
        ),
        child: Container(
          height: AppDimensions.height10(context) * 28.565,
          width: AppDimensions.height10(context) * 28.565,
          margin: EdgeInsets.all(AppDimensions.height10(context) * 3.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: AppDimensions.height10(context) * 0.2,
                  color: Colors.white)),
          child: Stack(
            children: [
              //timer
              Align(
                alignment: Alignment(0, -0.4),
                child: Container(
                  height: AppDimensions.height10(context) * 7.2,
                  width: AppDimensions.height10(context) * 12.8,
                  // color: Colors.red,
                  child: Center(
                    child: Container(
                        decoration: clock_state
                            ? BoxDecoration(
                                shape: BoxShape.rectangle,
                              )
                            : DottedDecoration(
                                shape: Shape.line,
                                linePosition: LinePosition.bottom,
                                color: Colors.white,
                                dash: [2, 2]),
                        child: clock_state
                            ? Text(
                                '$_elapsedTime',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 4.6,
                                    fontWeight: FontWeight.w300),
                              )
                            : Text(
                                '${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 4.6,
                                    fontWeight: FontWeight.w300),
                              )),
                  ),
                ),
              ),
              //play button
              Positioned(
                right: AppDimensions.height10(context) * 9.7,
                left: AppDimensions.height10(context) * 9.7,
                bottom: AppDimensions.height10(context) * 2.0,
                child: AnimatedScaleButton(
                  onTap: () {
                    if (clock_state == true) {
                      if (button_text == 'Stop') {
                        _stopStopwatch();
                        setState(() {
                          button_text = 'start';
                        });
                      } else {
                        _startStopwatch();
                        setState(() {
                          button_text = 'Stop';
                        });
                      }
                    } else {
                      if (_isRunning) {
                        _pauseTimer();
                        setState(() {
                          button_text = 'start';
                        });
                      } else {
                        _startTimer();
                        setState(() {
                          button_text = 'Stop';
                        });
                      }
                    }
                  },
                  child: Container(
                    height: AppDimensions.height10(context) * 9.1,
                    width: AppDimensions.height10(context) * 9.1,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            width: AppDimensions.height10(context) * 0.5,
                            color: Color(0xffFEBD0F))),
                    child: Container(
                      height: AppDimensions.height10(context) * 7,
                      width: AppDimensions.height10(context) * 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.3,
                                left: AppDimensions.height10(context) * 1.0),
                            child: Image.asset(
                              'assets/images/start_icon.webp',
                              width: AppDimensions.height10(context) * 1.8,
                              height: AppDimensions.height10(context) * 2.7,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 3.5,
                            height: AppDimensions.height10(context) * 2.2,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.5,
                                left: AppDimensions.height10(context) * 0.5),
                            child: Text(button_text,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFA511))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //reset button
              Positioned(
                right: AppDimensions.height10(context) * 2.7,
                bottom: AppDimensions.height10(context) * 5.6,
                child: AnimatedScaleButton(
                  onTap: () {
                    if (clock_state == true) {
                      _resetStopwatch();
                      setState(() {});
                    } else {
                      _cancelTimer();
                    }
                  },
                  child: Container(
                    height: AppDimensions.height10(context) * 5.6,
                    width: AppDimensions.height10(context) * 5.6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: Color(0xffFEBD0F).withOpacity(0.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh,
                          size: AppDimensions.height10(context) * 1.8,
                          color: Color(0xffFEAD10).withOpacity(0.5),
                        ),
                        Text(
                          'Reset',
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFA511).withOpacity(0.5)),
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
}
