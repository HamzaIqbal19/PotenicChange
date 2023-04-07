import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeWelldone.dart';
import 'package:flutter_ui/utilities/app_contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class clocks extends StatelessWidget {
  const clocks({super.key});

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
                  'assets/images/BTN Back.png',
                  width: 26,
                  height: 26,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: 26,
                    height: 26,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Appconstants.bg_image_dashboard),
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
                width: 186,
                height: 24,
                margin: EdgeInsets.only(bottom: 105),
                alignment: Alignment.center,
                child: Text(
                  'Meditation Session',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                width: 359,
                height: 148,
                alignment: Alignment.center,
                // margin: EdgeInsets.only(bottom: 86),
                child: Column(
                  children: [
                    Text(
                      'Do you need a timer for',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      ' your practice?',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(child: watch_time()),
              Container(
                width: 325,
                height: 60,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 50,
                      width: 106,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 2, color: Color(0xffFA9934))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => welldone_splash()));
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Color(0xffFA9934),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ))),
                  Container(
                      height: 50,
                      width: 207,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffFCC10D),
                              Color(0xffFDA210),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 2, color: Colors.transparent)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => welldone_splash()));
                          },
                          child: Text(
                            'Finished Practice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )))
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
  String duration = '00:00';
  String duration_min = '00';
  String duration_sec = '00';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 35.01,
        width: 272.72,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: 133,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color:
                              clock_state ? Color(0xff437296) : Colors.white))),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      clock_state = true;
                      duration = '00:00';
                    });
                    ;
                  },
                  child: clock_state
                      ? Container(
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff437296)),
                          ),
                        )
                      : Container(
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                ),
              ),
            ),
            Container(
              width: 133,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color:
                              clock_state ? Colors.white : Color(0xff437296)))),
              // padding: EdgeInsets.only(left: 10),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        clock_state = false;
                        duration = '05:00';
                      });
                    },
                    child: clock_state
                        ? Container(
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          )
                        : Container(
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff437296))),
                          )),
              ),
            )
          ],
        ),
      ),
      Container(
        height: 345,
        width: 345,
        margin: EdgeInsets.only(bottom: 64, top: 21),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Container(
          height: 285.65,
          width: 285.65,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.white)),
          child: Stack(
            children: [
              //timer
              Positioned(
                right: 79,
                left: 78,
                top: 79,
                child: Container(
                    height: 72,
                    width: 128,
                    // color: Colors.blue,
                    child: clock_state
                        ? Text(
                            duration,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 46,
                                fontWeight: FontWeight.w300),
                          )
                        : TextFieldTapRegion(
                            onTapInside: (event) {
                              showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _buildContainer(timerPicker());
                                  });
                            },
                            child: Text(duration,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 46,
                                    fontWeight: FontWeight.w300)))),
              ),
              //play button
              Positioned(
                right: 97,
                left: 97,
                bottom: 20,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      button_text = 'Stop';
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      button_text = 'Start';
                    });
                  },
                  child: Container(
                    height: 91,
                    width: 91,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 5, color: Color(0xffFEBD0F))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/start_icon.png',
                                width: 18,
                                height: 27,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          width: 32,
                          height: 22,
                          child: Text(button_text,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFA511))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //reset button
              Positioned(
                right: 27,
                bottom: 56,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      duration = '00:00';
                    });
                  },
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xffFEBD0F))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh,
                          size: 18,
                          color: Color(0xffFEAD10),
                        ),
                        Text(
                          'Reset',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFA511)),
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

  Widget timerPicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.ms,
      //  minuteInterval: 1,
      // secondInterval: 1,
      // initialTimerDuration: initialTimer,

      onTimerDurationChanged: (Duration changeTimer) {
        setState(() {
          //initialTimer = changeTimer;
          duration =
              '${changeTimer.inMinutes % 60}:${changeTimer.inSeconds % 60}';
          // duration_min = '${changeTimer.inMinutes % 60}';
          // duration_sec = '${changeTimer.inSeconds % 60}';
        });
        print(duration_min);
        print(duration_sec);
      },
    );
  }

  Widget _buildContainer(Widget picker) {
    return Container(
      height: 303,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        duration = '00:00';
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Done'))
              ],
            ),
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

// class Countdown extends AnimatedWidget {
//   Animation<int> animation;
//   Countdown({required Key key, required this.animation})
//       : super(key: key, listenable: animation);

//   @override
//   build(BuildContext context) {
//     Duration clockTimer = Duration(seconds: animation.value);

//     String timerText =
//         '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

//     print('animation.value  ${animation.value} ');
//     print('inMinutes ${clockTimer.inMinutes.toString()}');
//     print('inSeconds ${clockTimer.inSeconds.toString()}');
//     print(
//         'inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');

//     return Text(
//       "$timerText",
//       style: TextStyle(
//         fontSize: 110,
//         color: Theme.of(context).primaryColor,
//       ),
//     );
//   }
// }
