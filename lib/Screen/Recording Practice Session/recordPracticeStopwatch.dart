import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeWelldone.dart';

import '../../utils/app_dimensions.dart';

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
                  'assets/images/Back.png',
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body:  Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
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
                width: AppDimensions.height10 * 18.6,
                height: AppDimensions.height10 * 2.4,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 10.5,
                    top: AppDimensions.height10 * 4.6),
                alignment: Alignment.center,
                child: Text(
                  'Meditation Session',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 35.9,
                height: AppDimensions.height10 * 14.8,
                alignment: Alignment.center,
                // margin: EdgeInsets.only(bottom: 86),
                child: Text(
                  'Do you need a timer for\nyour practice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.8,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(child: watch_time()),
              Container(
                width: AppDimensions.height10 * 32.5,
                height: AppDimensions.height10 * 6.0,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 10.6,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 5.0),
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
                                fontSize: AppDimensions.height10*1.6,
                                fontWeight: FontWeight.w600),
                          ))),
                  Container(
                      height: AppDimensions.height10 * 5.0,
                      width: AppDimensions.height10 * 20.7,
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
                              AppDimensions.height10 * 5.0),
                          border:
                              Border.all(width: AppDimensions.height10*0.2, color: Colors.transparent)),
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
                                fontSize: AppDimensions.height10*1.6,
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
        height: AppDimensions.height10 * 3.501,
        width: AppDimensions.height10 * 26.6,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              width: AppDimensions.height10 * 13.3,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: AppDimensions.height10 * 0.2,
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
                          // width: AppDimensions.height10 * 5.4,
                          height: AppDimensions.height10 * 2.2,
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff437296)),
                          ),
                        )
                      : Container(
                          //width: AppDimensions.height10 * 5.4,
                          height: AppDimensions.height10 * 2.2,
                          child: Text(
                            'Stopwatch',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 13.3,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: AppDimensions.height10 * 0.2,
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
                            height: AppDimensions.height10 * 2.4,
                            // width: AppDimensions.height10 * 5.4,
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )
                        : Container(
                            height: AppDimensions.height10 * 2.4,
                            // width: AppDimensions.height10 * 5.4,
                            child: Text('Timer',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.6,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff437296))),
                          )),
              ),
            )
          ],
        ),
      ),
      Container(
        height: AppDimensions.height10 * 34.5,
        width: AppDimensions.height10 * 34.5,
        margin: EdgeInsets.only(
            bottom: AppDimensions.height10 * 6.4,
            top: AppDimensions.height10 * 2.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: AppDimensions.height10 * 0.2, color: Colors.white),
        ),
        child: Container(
          height: AppDimensions.height10 * 28.565,
          width: AppDimensions.height10 * 28.565,
          margin: EdgeInsets.all(AppDimensions.height10 * 3.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: AppDimensions.height10 * 0.2, color: Colors.white)),
          child: Stack(
            children: [
              //timer
              Align(
                alignment: Alignment(0, -0.4),
                child: Container(
                    height: AppDimensions.height10 * 7.2,
                    width: AppDimensions.height10 * 12.8,
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
                        child:
                        // clock_state
                        //     ?
                        //
                        Text(
                                duration,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 4.6,
                                    fontWeight: FontWeight.w300),
                              )

                            // : TextFieldTapRegion(
                            //     onTapInside: (event) {
                            //       showCupertinoModalPopup<void>(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return _buildContainer(timerPicker());
                            //           });
                            //     },
                            //     child: Text(duration,
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: AppDimensions.height10 * 4.6,
                            //             fontWeight: FontWeight.w300))),
                      ),
                    )),
              ),
              //play button
              Positioned(
                right: AppDimensions.height10 * 9.7,
                left: AppDimensions.height10 * 9.7,
                bottom: AppDimensions.height10 * 2.0,
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
                    height: AppDimensions.height10 * 9.1,
                    width: AppDimensions.height10 * 9.1,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            width: AppDimensions.height10 * 0.5,
                            color: Color(0xffFEBD0F))),
                    child: Container(
                      height: AppDimensions.height10 * 7,
                      width: AppDimensions.height10 * 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              'assets/images/start_icon.png',
                              width: AppDimensions.height10 * 1.8,
                              height: AppDimensions.height10 * 2.7,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 3.5,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(button_text,
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.4,
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
                right: AppDimensions.height10 * 2.7,
                bottom: AppDimensions.height10 * 5.6,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      duration = '00:00';
                    });
                  },
                  child: Container(
                    height: AppDimensions.height10 * 5.6,
                    width: AppDimensions.height10 * 5.6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xffFEBD0F))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh,
                          size: AppDimensions.height10 * 1.8,
                          color: Color(0xffFEAD10),
                        ),
                        Text(
                          'Reset',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.2,
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
      height: AppDimensions.height10 * 30.3,
      padding: EdgeInsets.only(top: AppDimensions.height10 * 0.60),
      color: CupertinoColors.white,
      child: Column(
        children: [
          Container(
            height: AppDimensions.height10 * 3.8,
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
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2F80ED)),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2F80ED)),
                    ))
              ],
            ),
          ),
          Divider(
            height: AppDimensions.height10 * 0.1,
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
