import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:super_tooltip/super_tooltip.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Tooltip Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({
    Key? key,
  }) : super(key: key);
  @override
  State createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TargetWidget(),
      ),
    );
  }
}

class TargetWidget extends StatefulWidget {
  const TargetWidget({Key? key}) : super(key: key);

  @override
  State createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  final _controller = SuperTooltipController();
  Future<bool>? _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (_controller.isVisible) {
      await _controller.hideTooltip();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => _willPopCallback,
      child: GestureDetector(
        onTap: () async {
          await _controller.showTooltip();
        },
        child: SuperTooltip(
          showBarrier: true,
          controller: _controller,
          popupDirection: TooltipDirection.down,
          backgroundColor: Colors.white,
          left: 90,
          right: 0,
          arrowTipDistance: 15.0,
          arrowBaseWidth: 20.0,
          arrowLength: 20.0,
          borderWidth:0,
          borderRadius: 0,
          showDropBoxFilter: false,
          overlayDimensions: EdgeInsets.zero,
          bubbleDimensions: EdgeInsets.zero,
          shadowBlurRadius: 0,
          shadowColor: Colors.transparent,
          touchThroughAreaShape: ClipAreaShape.rectangle,
          touchThroughAreaCornerRadius: 0,
          barrierColor: Colors.transparent,
          content: tooltipComponent(context, 2,(){},(){}),
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),

      ),
    );
  }
}

Widget dashboardTooltip(controller,BuildContext context, goalLevel, direction,final VoidCallback action1,final VoidCallback action2,child){
  return SuperTooltip(
    showBarrier: true,
    controller: controller,
    popupDirection: direction == 'down'?TooltipDirection.down:TooltipDirection.up,
    backgroundColor: Colors.white,
    left: 30,
    right: 30,
   // bottom: 150,
    arrowTipDistance: 2.0,
    arrowBaseWidth: 10.0,
    arrowLength: 10.0,
   minimumOutsideMargin: 0,
   // borderRadius: 0,
    borderWidth:0,
    showDropBoxFilter: false,
    overlayDimensions: EdgeInsets.zero,
    bubbleDimensions: EdgeInsets.zero,
    shadowBlurRadius: 0,
    shadowColor: Colors.transparent,
    borderColor: Colors.transparent,
    touchThroughAreaShape: ClipAreaShape.oval,
    touchThroughAreaCornerRadius: 0,
    barrierColor: Colors.transparent,
    content: tooltipComponent(context, goalLevel,action1,action2),
    child: child,
  );
}


Widget tooltipComponent(BuildContext context, goalLevel, final VoidCallback action1,final VoidCallback action2){
  return Container(
    width:
    UpdatedDimensions.width10(context) * 30.6,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UpdatedDimensions.height10(context) * 2.0)),
    child:
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: UpdatedDimensions.width10(context) * 21.6,
          //height: UpdatedDimensions.height10(context) * 2.2,

          margin: EdgeInsets.only(top: UpdatedDimensions.height10(context) * 1.7, left: UpdatedDimensions.width10(context) * 1.6, right: UpdatedDimensions.width10(context) * 7.4),
          child: Text(
            goalLevel == 2
                ? 'Your Practice'
                : goalLevel == 3
                ? 'Time'
                : goalLevel == 4
                ? 'Your Schedule'
                : goalLevel == 5
                ? 'Record Practice'
            // : goalLevel == 6
            // ? 'Your Calendar'
                : goalLevel == 1
                ? 'Your Goal'
                : 'Reda',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Laila',
              color: const Color(0xFF000000),
              fontSize: UpdatedDimensions.font10(context) * 1.6,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: UpdatedDimensions.width10(context) * 27.4,

          margin: EdgeInsets.only(top: UpdatedDimensions.height10(context) * 0.3),
          child: RichText(
              text: TextSpan(style: TextStyle(fontWeight: FontWeight.w400, color: const Color(0xFF464646), decoration: TextDecoration.none, fontFamily: 'Laila', fontSize: UpdatedDimensions.font10(context) * 1.4, height: UpdatedDimensions.height10(context) * 0.15), children: [
                TextSpan(
                  text: goalLevel == 1
                      ? 'This is your own star that you’ve created.\nRemember, '
                      : goalLevel == 2
                      ? 'Smaller circles that spin around your\nstars are the planets. The '
                      : goalLevel == 3
                      ? 'This shows the '
                      : goalLevel == 4
                  //|| goalLevel == 6
                      ? 'This is your '
                      : goalLevel == 5
                      ? 'If you want to '
                      : 'This is your friend who sends out',
                ),
                TextSpan(
                    text: goalLevel == 1
                        ? '‘stars’ '
                        : goalLevel == 2
                        ? '‘planets’ '
                        : goalLevel == 3
                        ? 'actual time '
                        : goalLevel == 4
                        ? 'daily view '
                        : goalLevel == 5
                        ? 'record a practice session\n'
                    // : goalLevel == 6
                    // ? 'calender '
                        : ' helpful\nreminders ',
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(
                    text: goalLevel == 1
                        ? 'are your '
                        : goalLevel == 2
                        ? 'are\nyour own '
                        : goalLevel == 3
                        ? 'the practice\nis '
                        : goalLevel == 4
                        ? 'schedule.\nNavigate here if you want quick access to\nsee all your '
                        : goalLevel == 5
                        ? 'that it’s not currently scheduled, navigate\nhere. You will see all your '
                    // : goalLevel == 6
                    // ? 'It’s very similar to your schedule. Navigate here if you want to see your '
                        : 'and '),
                TextSpan(
                    text: goalLevel == 1
                        ? 'personal\ngrowth goals. '
                        : goalLevel == 2
                        ? 'practices '
                        : goalLevel == 3
                        ? 'scheduled '
                        : goalLevel == 4
                        ? 'scheduled practices '
                        : goalLevel == 5
                        ? 'active goals '
                    // : goalLevel == 6
                    // ? 'past '
                        : 'messages. ',
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(
                    text: goalLevel == 1
                        ? 'They wil always look bigger and will have '
                        : goalLevel == 2
                        ? 'that you’ve created to help you progress with your goal. The\n'
                        : goalLevel == 3
                        ? 'for on that day (centred daily calendar view at the top shows you the actual date).'
                        : goalLevel == 4
                        ? 'for that day. Scroll left or right to see your\n'
                        : goalLevel == 5
                        ? 'with its'
                    // : goalLevel == 6
                    // ? 'or'
                        : ' You will see\nReda appearing every time you have a new\nnotification with gentle prompts to help\nyou '),
                TextSpan(
                    text: goalLevel == 1
                        ? 'goal name '
                        : goalLevel == 2
                        ? 'practice '
                        : goalLevel == 3
                        ? ''
                        : goalLevel == 4
                        ? 'schedule '
                        : goalLevel == 5
                        ? ' assigned practices.'
                    // : goalLevel == 6
                    // ? ' future schedule '
                        : 'stay focused.',
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(
                    text: goalLevel == 1
                        ? 'with\n'
                        : goalLevel == 2
                        ? 'will have a '
                        : goalLevel == 3
                        ? ''
                        : goalLevel == 4
                        ? 'for previous or next day.'
                        : goalLevel == 5
                        ? ' Click on the\npractice you want to record the session\nfor and you’ll be taken to capture it.'
                    // : goalLevel == 6
                    // ? 'for a\ncertain date.'
                        : ''),
                TextSpan(
                    text: goalLevel == 1
                        ? 'identity statement  '
                        : goalLevel == 2
                        ? 'name '
                        : goalLevel == 3
                        ? ''
                        : goalLevel == 4
                        ? ''
                        : goalLevel == 5
                        ? ''
                    // : goalLevel == 6
                    // ? ''
                        : '',
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(
                    text: goalLevel == 1
                        ? 'written on it, so you\ncan easily identify it.'
                        : goalLevel == 2
                        ? 'written on it to help you identify it.'
                        : goalLevel == 3
                        ? ''
                        : goalLevel == 4
                        ? ''
                        : goalLevel == 5
                        ? ''
                    // : goalLevel == 6
                    // ? ''
                        : '')
              ])),
        ),
        Container(
          width: UpdatedDimensions.width10(context) * 24.3,
          height: UpdatedDimensions.height10(context) * 4.0,
          margin: EdgeInsets.only(top: UpdatedDimensions.height10(context) * 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: action1,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(UpdatedDimensions.height10(context) * 5.0), border: Border.all(width: UpdatedDimensions.width10(context) * 0.1, color: const Color(0xFFFBFBFB))),
                  width: UpdatedDimensions.width10(context) * 9.60,
                  height: UpdatedDimensions.height10(context) * 3.2,
                  child: Center(
                    child: Text(
                      'Skip tour',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Laila', decoration: TextDecoration.none, fontSize: UpdatedDimensions.font10(context) * 1.6, color: const Color(0xFF8C648A), fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: action2,
                child: Container(
                  width: UpdatedDimensions.width10(context) * 11.7,
                  height: UpdatedDimensions.height10(context) * 4.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(UpdatedDimensions.height10(context) * 5.0), color: const Color(0xFF5A4D73)),
                  child: Center(
                    child: Text(
                      goalLevel == 2
                          ? '(2/6) Next'
                          : goalLevel == 3
                          ? '(3/6) Next'
                          : goalLevel == 4
                          ? '(4/6) Next'
                          : goalLevel == 5
                          ? '(5/6) Next'
                      // : goalLevel == 6
                      // ? '(6/7) Next'
                          : goalLevel == 6
                          ? '(6/6) Next'
                          : goalLevel == 1
                          ? '(1/6) Next'
                          : '(6/6) Next',
                      style: TextStyle(decoration: TextDecoration.none, fontFamily: 'Laila', fontSize: UpdatedDimensions.font10(context) * 1.6, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10,)
      ],
    ),
  );
}