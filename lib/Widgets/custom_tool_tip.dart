import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class TooltipExample extends StatefulWidget {
  @override
  _TooltipExampleState createState() => _TooltipExampleState();
}

class _TooltipExampleState extends State<TooltipExample> {
  int goal_level = 1;
  void _incrementValue() {
    setState(() {
      goal_level++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('example'),
        ),
        body: Container(
          color: Colors.amber,
          child: Center(
            child: Align(
              alignment: goal_level == 2
                  ? const Alignment(-0.2, 0.1)
                  : goal_level == 3
                      ? const Alignment(-0.2, -0.47)
                      : goal_level == 4
                          ? const Alignment(0.07, -0.68)
                          : goal_level == 5
                              ? const Alignment(0.1, -0.85)
                              : goal_level == 6
                                  ? const Alignment(0.25, -0.85)
                                  : goal_level == 1
                                      ? const Alignment(0.1, -0.27)
                                      : const Alignment(0.12, 0.37),
              child: Container(
                width: AppDimensions.width10(context) * 30.6,
                height: goal_level == 1
                    ? AppDimensions.height10(context) * 22.3
                    : goal_level == 2
                        ? AppDimensions.height10(context) * 22.1
                        : goal_level == 3
                            ? AppDimensions.height10(context) * 18.3
                            : goal_level == 4
                                ? AppDimensions.height10(context) * 20.6
                                : goal_level == 5
                                    ? AppDimensions.height10(context) * 22.6
                                    : goal_level == 6
                                        ? AppDimensions.height10(context) * 18.4
                                        : AppDimensions.height10(context) *
                                            20.6,
                child: Stack(
                  children: [
                    Align(
                      alignment: goal_level == 2
                          ? const Alignment(0.9, 1.1)
                          : goal_level == 3
                              ? const Alignment(-0.9, -1.1)
                              : goal_level == 4
                                  ? const Alignment(0, -1.1)
                                  : goal_level == 5
                                      ? const Alignment(0.9, -1.1)
                                      : goal_level == 6
                                          ? const Alignment(0.9, -1.1)
                                          : goal_level == 1
                                              ? const Alignment(0, 1.1)
                                              : const Alignment(0, 1.1),
                      child: Container(
                        child: Image.asset(
                          (goal_level == 3 ||
                                  goal_level == 4 ||
                                  goal_level == 5 ||
                                  goal_level == 6)
                              ? 'assets/images/arrow-192-up.webp'
                              : 'assets/images/arrow-192.webp',
                          height: AppDimensions.height10(context) * 2.0,
                          width: AppDimensions.width10(context) * 2.0,
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.width10(context) * 30.6,
                      height: goal_level == 1
                          ? AppDimensions.height10(context) * 22.3
                          : goal_level == 2
                              ? AppDimensions.height10(context) * 22.1
                              : goal_level == 3
                                  ? AppDimensions.height10(context) * 18.3
                                  : goal_level == 4
                                      ? AppDimensions.height10(context) * 20.6
                                      : goal_level == 5
                                          ? AppDimensions.height10(context) *
                                              22.6
                                          : goal_level == 6
                                              ? AppDimensions.height10(
                                                      context) *
                                                  18.4
                                              : AppDimensions.height10(
                                                      context) *
                                                  20.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 1.0)),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.width10(context) * 21.6,
                            //height: AppDimensions.height10(context) * 2.2,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.7,
                                left: AppDimensions.height10(context) * 1.6,
                                right: AppDimensions.width10(context) * 7.4),
                            child: Text(
                              goal_level == 2
                                  ? 'Your Practice'
                                  : goal_level == 3
                                      ? 'Time'
                                      : goal_level == 4
                                          ? 'Your Schedule'
                                          : goal_level == 5
                                              ? 'Record Practice'
                                              : goal_level == 6
                                                  ? 'Your Calendar'
                                                  : goal_level == 1
                                                      ? 'Your Goal'
                                                      : 'Reda',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Laila',
                                color: const Color(0xFF000000),
                                fontSize: AppDimensions.font10(context) * 1.6,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 27.4,
                            height: goal_level == 1
                                ? AppDimensions.height10(context) * 11.8
                                : goal_level == 2
                                    ? AppDimensions.height10(context) * 11.6
                                    : goal_level == 3
                                        ? AppDimensions.height10(context) * 7.8
                                        : goal_level == 4
                                            ? AppDimensions.height10(context) *
                                                10.1
                                            : goal_level == 5
                                                ? AppDimensions.height10(
                                                        context) *
                                                    12.1
                                                : goal_level == 6
                                                    ? AppDimensions.height10(
                                                            context) *
                                                        7.9
                                                    : AppDimensions.height10(
                                                            context) *
                                                        10.1,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.3),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF464646),
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Laila',
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.15),
                                    children: [
                                  TextSpan(
                                    text: goal_level == 1
                                        ? 'This is your own star that you’ve created.\nRemember, '
                                        : goal_level == 2
                                            ? 'Smaller circles that spin around your\nstars are the planets. The '
                                            : goal_level == 3
                                                ? 'This shows the '
                                                : goal_level == 4 ||
                                                        goal_level == 6
                                                    ? 'This is your '
                                                    : goal_level == 5
                                                        ? 'If you want to '
                                                        : 'This is your friend who sends out',
                                  ),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? '‘stars’ '
                                          : goal_level == 2
                                              ? '‘planets’ '
                                              : goal_level == 3
                                                  ? 'actual time '
                                                  : goal_level == 4
                                                      ? 'daily view '
                                                      : goal_level == 5
                                                          ? 'record a practice session\n'
                                                          : goal_level == 6
                                                              ? 'calender '
                                                              : ' helpful\nreminders ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'are your '
                                          : goal_level == 2
                                              ? 'are\nyour own '
                                              : goal_level == 3
                                                  ? 'the practice\nis '
                                                  : goal_level == 4
                                                      ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
                                                      : goal_level == 5
                                                          ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
                                                          : goal_level == 6
                                                              ? 'It’s very similar to your schedule. Navigate here if you want to see your '
                                                              : 'and '),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'personal\ngrowth goals. '
                                          : goal_level == 2
                                              ? 'practices '
                                              : goal_level == 3
                                                  ? 'scheduled '
                                                  : goal_level == 4
                                                      ? 'scheduled practices '
                                                      : goal_level == 5
                                                          ? 'active goals '
                                                          : goal_level == 6
                                                              ? 'past '
                                                              : 'messages. ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'They wil always look bigger and will have '
                                          : goal_level == 2
                                              ? 'that you’ve created to help you progress with your goal. The\n'
                                              : goal_level == 3
                                                  ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
                                                  : goal_level == 4
                                                      ? 'for that day. Scroll left or right to see your\n'
                                                      : goal_level == 5
                                                          ? 'with its'
                                                          : goal_level == 6
                                                              ? 'or'
                                                              : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'goal name '
                                          : goal_level == 2
                                              ? 'practice '
                                              : goal_level == 3
                                                  ? ''
                                                  : goal_level == 4
                                                      ? 'schedule '
                                                      : goal_level == 5
                                                          ? ' assigned practices.'
                                                          : goal_level == 6
                                                              ? ' future schedule '
                                                              : 'stay focused.',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'with\n'
                                          : goal_level == 2
                                              ? 'will have a '
                                              : goal_level == 3
                                                  ? ''
                                                  : goal_level == 4
                                                      ? 'for previous or next day.'
                                                      : goal_level == 5
                                                          ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it.'
                                                          : goal_level == 6
                                                              ? 'for a\ncertain date.'
                                                              : ''),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'identity statement  '
                                          : goal_level == 2
                                              ? 'name '
                                              : goal_level == 3
                                                  ? ''
                                                  : goal_level == 4
                                                      ? ''
                                                      : goal_level == 5
                                                          ? ''
                                                          : goal_level == 6
                                                              ? ''
                                                              : '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: goal_level == 1
                                          ? 'written on it, so you\ncan easily identify it.'
                                          : goal_level == 2
                                              ? 'written on it to help you identify it.'
                                              : goal_level == 3
                                                  ? ''
                                                  : goal_level == 4
                                                      ? ''
                                                      : goal_level == 5
                                                          ? ''
                                                          : goal_level == 6
                                                              ? ''
                                                              : '')
                                ])),
                          ),
                          Container(
                            width: AppDimensions.width10(context) * 24.3,
                            height: AppDimensions.height10(context) * 4.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    setState(() {
                                      //  _showOverlay = false;
                                    });
                                  }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                5.0),
                                        border: Border.all(
                                            width:
                                                AppDimensions.width10(context) *
                                                    0.1,
                                            color: const Color(0xFFFBFBFB))),
                                    width:
                                        AppDimensions.width10(context) * 9.60,
                                    height:
                                        AppDimensions.height10(context) * 3.2,
                                    child: Center(
                                      child: Text(
                                        'Skip tour',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Laila',
                                            decoration: TextDecoration.none,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            color: const Color(0xFF8C648A),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _incrementValue();
                                    if (goal_level > 7) {
                                      setState(() {
                                        //    _showOverlay = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.width10(context) * 11.7,
                                    height:
                                        AppDimensions.height10(context) * 4.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                5.0),
                                        color: const Color(0xFF5A4D73)),
                                    child: Center(
                                      child: Text(
                                        goal_level == 2
                                            ? '(2/7) Next'
                                            : goal_level == 3
                                                ? '(3/7) Next'
                                                : goal_level == 4
                                                    ? '(4/7) Next'
                                                    : goal_level == 5
                                                        ? '(5/7) Next'
                                                        : goal_level == 6
                                                            ? '(6/7) Next'
                                                            : goal_level == 7
                                                                ? '(7/7) Next'
                                                                : goal_level ==
                                                                        1
                                                                    ? '(1/7) Next'
                                                                    : '(7/7) Next',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Laila',
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
