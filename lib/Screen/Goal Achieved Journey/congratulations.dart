import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Goal%20Achieved%20Journey/congratulations_journey.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/new_progress_score.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_assets.dart';
import 'package:potenic_app/utils/app_texts.dart';
import '../../utils/app_dimensions.dart';

class congratulations extends StatefulWidget {
  const congratulations({super.key});

  @override
  State<congratulations> createState() => _congratulationsState();
}

class _congratulationsState extends State<congratulations> {
  int goalLevel = 0;
  var goalName;
  String subscriptions = '';
  var goalDetails;

  var identity;
  var color;
  bool loading = true;

  void _fetchGoalNames() async {
    AdminGoal.getUpdatedGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          loading = false;
          goalName = response["name"];
          color = response["color"];
          identity = response["identityStatement"][0]['text'];
          goalLevel = response["goalLevel"];
          subscriptions = response['subscriptionsStatus'];
          goalDetails = response;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        loading = false;
      });
    });
  }

  void _incrementValue() {
    setState(() {
      goalLevel++;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                  child: Buttons().closeButton(
                context,
                () {
                  Navigator.pop(context);
                },
              )
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: Image.asset(
                  //       'assets/images/Close.webp',
                  //       // width: AppDimensionsUpdated.width10(context) * 2.6,
                  //       height: AppDimensionsUpdated.height10(context) * 2.6,
                  //       fit: BoxFit.contain,
                  //     )),
                  )
            ]),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/goal_achieved_bg.webp'),
                  fit: BoxFit.cover)),
          child: loading == false
              ? Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 25,
                        child: Container(
                          height: 706,
                          width: 708,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('$color' == '1'
                                      ? AppAssets.glare1
                                      : '$color' == '2'
                                          ? AppAssets.glare2
                                          : '$color' == '3'
                                              ? AppAssets.glare2
                                              : '$color' == '4'
                                                  ? AppAssets.glare2
                                                  : '$color' == '5'
                                                      ? AppAssets.glare2
                                                      : '$color' == '6'
                                                          ? AppAssets.glare6
                                                          : AppAssets.glare2),
                                  fit: BoxFit.contain)),
                        )),
                    Column(
                      children: [
                        Container(
                          width: AppDimensionsUpdated.width10(context) * 35.5,
                          //height: AppDimensionsUpdated.height10(context) * 13.2,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) *
                                  10.0),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'laila',
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            0.14,
                                    //have reduced size so it does,nt overflow
                                    fontSize:
                                        AppDimensions.font10(context) * 2.0,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Congratulations!\n\n',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        // fontFamily: 'laila',
                                        fontSize:
                                            AppDimensions.font10(context) * 3.0,
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    TextSpan(
                                        text: goalLevel == 5
                                            ? '\nYou are living your vision and your\ndesired identity :)'
                                            : 'You’ve gone up a level, it’s another\nstep towards living your vision and\nyour desired identity.',
                                        style: const TextStyle(
                                            //height: AppDimensionsUpdated.height10(context) * 0.14,
                                            ))
                                  ])),
                        ),
                        Container(
                          width: AppDimensionsUpdated.width10(context) * 35.8,
                          height: AppDimensionsUpdated.height10(context) * 38.8,
                          margin: EdgeInsets.only(
                              top: AppDimensionsUpdated.height10(context) * 3),
                          child: Stack(
                            children: [
                              Container(
                                width: AppDimensionsUpdated.width10(context) *
                                    35.8,
                                height: AppDimensionsUpdated.height10(context) *
                                    37.8,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/congratsGoalBg.png"))),
                              ),
                              Align(
                                alignment: const Alignment(0, -0.5),
                                child: Container(
                                  width: AppDimensionsUpdated.width10(context) *
                                      27.8,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          27.8,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('$color' == '1'
                                            ? "assets/images/red_gradient.webp"
                                            : '$color' == '2'
                                                ? 'assets/images/orange_moon.webp'
                                                : '$color' == '3'
                                                    ? "assets/images/lightGrey_gradient.webp"
                                                    : '$color' == '4'
                                                        ? "assets/images/lightBlue_gradient.webp"
                                                        : '$color' == '5'
                                                            ? "assets/images/medBlue_gradient.webp"
                                                            : '$color' == '6'
                                                                ? "assets/images/Blue_gradient.webp"
                                                                : 'assets/images/orange_moon.webp'),
                                        fit: BoxFit.contain),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // color: Colors.red,
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            9.0,
                                        width: AppDimensionsUpdated.width10(
                                                context) *
                                            24.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    2.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              goalName,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2.0,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      0.14,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xff5B74A6)),
                                            ),
                                            SizedBox(
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.7,
                                            ),
                                            SizedBox(
                                              // color: Colors.green,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      4.0,
                                              width:
                                                  AppDimensionsUpdated.width10(
                                                          context) *
                                                      22.0,
                                              child: Text('"$identity"',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              1.6,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff5B74A6))),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppDimensionsUpdated.height10(
                                                context) *
                                            4.3,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0, 1.5),
                                child: Container(
                                  width: AppDimensionsUpdated.width10(context) *
                                      23.2,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          23.2,
                                  //same dimensions as design
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(goalLevel == 1
                                              ? 'assets/images/goal_level_1.webp'
                                              : goalLevel == 2
                                                  ? 'assets/images/goal_level_2.webp'
                                                  : goalLevel == 3
                                                      ? 'assets/images/goal_level_3.webp'
                                                      : goalLevel == 4
                                                          ? 'assets/images/goal_level_4.webp'
                                                          : 'assets/images/goal_level_5.webp'),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: SizedBox(
                                      width: AppDimensionsUpdated.height10(
                                              context) *
                                          14.655,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          14.655,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // width: AppDimensionsUpdated.width10(
                                            //         context) *
                                            //     3.9,
                                            // height:
                                            //     AppDimensionsUpdated.height10(
                                            //             context) *
                                            //         4.7,
                                            margin: EdgeInsets.only(
                                                top: AppDimensionsUpdated
                                                        .height10(context) *
                                                    1.728),
                                            //color: Colors.amber,
                                            alignment: Alignment.bottomCenter,
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    style: TextStyle(
                                                      fontFamily: 'laila',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height:
                                                          AppDimensionsUpdated
                                                                  .height10(
                                                                      context) *
                                                              0.12,
                                                      // fontSize:
                                                      //     AppDimensions.font10(
                                                      //             context) *
                                                      //         1,
                                                      color: const Color(
                                                          0xFF424242),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                          text: goalLevel == 0
                                                              ? '-'
                                                              : goalLevel < 5
                                                                  ? '$goalLevel'
                                                                  : '5',
                                                          style: TextStyle(
                                                            fontFamily: 'Laila',
                                                            fontSize: AppDimensions
                                                                    .font10(
                                                                        context) *
                                                                2.8,
                                                          )),
                                                      TextSpan(
                                                          text: '/5\n',
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .font10(
                                                                          context) *
                                                                  2.0,
                                                              color: const Color(
                                                                  0xFF828282))),
                                                      WidgetSpan(
                                                          child: SizedBox(
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.5,
                                                      )),
                                                      TextSpan(
                                                          text: 'LEVEL',
                                                          style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .font10(
                                                                        context) *
                                                                1.4,
                                                          ))
                                                    ])),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            width: AppDimensionsUpdated.width10(
                                                    context) *
                                                13.1,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: Center(
                                              child: Text(
                                                goalLevel == 1
                                                    ? "I'm making\nconsiderable steps\nforward"
                                                    : goalLevel == 2
                                                        ? "I’m making\ngradual steps towards\nmy vision"
                                                        : goalLevel == 3
                                                            ? "I'm almost there"
                                                            : goalLevel == 4
                                                                ? 'I feel like I’m living\nmy goal and desired\nidentity '
                                                                : "I've achieved my\ngoal and living my\nnew identity :)",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'laila',
                                                  fontWeight: FontWeight.w400,
                                                  height: AppDimensionsUpdated
                                                          .height10(context) *
                                                      0.12,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.5,
                                                  color:
                                                      const Color(0xFF000000),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            if (goalLevel > 3) {
                              Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const Congratulations_journey()),
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 29.0,
                            height:
                                AppDimensionsUpdated.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    5.3),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFFCC10D),
                                  Color(0xFFFDA210)
                                ]),
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        5.0)),
                            child: Center(
                              child: Text(
                                goalLevel > 3 ? 'Yes I am' : 'Exit',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: new_progress_score(
                                  premium:
                                      subscriptions == 'active' ? true : false,
                                  evaluationIndex:
                                      goalDetails['goalEvaluations'].length - 1,
                                )));
                          },
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 29.0,
                            height:
                                AppDimensionsUpdated.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.8),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        5.0)),
                            child: Center(
                              child: Text(
                                'View goal level evaluation',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.15,
                                  fontSize: AppDimensions.font10(context) * 2.0,
                                  color: const Color(0xFFFA9934),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ));
  }
}

void goal_achieved_sheet(context, data, subscription, length) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
      )),
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 4.6),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: AppDimensionsUpdated.width10(context) * 41.4,
              //  height: AppDimensionsUpdated.height10(context) * 87.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          AppDimensionsUpdated.height10(context) * 2.0)),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFFE7DEDF), Color(0xFFF9F7F9)])),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    //color: Colors.amber,
                    // margin:   EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                    alignment: const Alignment(1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensionsUpdated.width10(context) * 2.6,
                        height: AppDimensionsUpdated.height10(context) * 2.6,
                        margin: EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 1.5,
                            right: AppDimensionsUpdated.width10(context) * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Close_blue.webp'))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 3.5),
                    child: Text(
                      'Goal level has gone\ndown!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 2.8,
                          height: AppDimensionsUpdated.height10(context) * 0.15,
                          // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.6),
                    child: Text(
                      AppText().goalLevelDown,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.6,
                          height: AppDimensionsUpdated.height10(context) * 0.15,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensionsUpdated.width10(context) * 25.8,
                    height: AppDimensionsUpdated.height10(context) * 25.8,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 3.0),
                    child: Stack(
                      children: [
                        Container(
                          width: AppDimensionsUpdated.width10(context) * 25.8,
                          height: AppDimensionsUpdated.height10(context) * 25.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(data['color'] == '1'
                                    ? "assets/images/red_gradient.webp"
                                    : data['color'] == '2'
                                        ? 'assets/images/orange_moon.webp'
                                        : data['color'] == '3'
                                            ? "assets/images/lightGrey_gradient.webp"
                                            : data['color'] == '4'
                                                ? "assets/images/lightBlue_gradient.webp"
                                                : data['color'] == '5'
                                                    ? "assets/images/medBlue_gradient.webp"
                                                    : data['color'] == '6'
                                                        ? "assets/images/Blue_gradient.webp"
                                                        : 'assets/images/orange_moon.webp'),
                                fit: BoxFit.contain),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,
                                height: AppDimensionsUpdated.height10(context) *
                                    9.0,
                                width: AppDimensionsUpdated.width10(context) *
                                    24.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensionsUpdated.height10(context) *
                                            2.0),
                                child: Column(
                                  children: [
                                    Text(
                                      data['name'],
                                      // "Control my anger",

                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  2.0,
                                          height: AppDimensionsUpdated.height10(
                                                  context) *
                                              0.14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff5B74A6)),
                                    ),
                                    SizedBox(
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          0.7,
                                    ),
                                    SizedBox(
                                      // color: Colors.green,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          4.0,
                                      width: AppDimensionsUpdated.width10(
                                              context) *
                                          22.0,
                                      child: Text(
                                          data['identityStatement'][0]['text'],
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff5B74A6))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimensionsUpdated.height10(context) *
                                    4.3,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 4.0),
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 20.2,
                            height:
                                AppDimensionsUpdated.height10(context) * 20.2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(data['goalLevel'] == 1
                                        ? 'assets/images/goal_level_1.webp'
                                        : data['goalLevel'] == 2
                                            ? 'assets/images/goal_level_2.webp'
                                            : data['goalLevel'] == 3
                                                ? 'assets/images/goal_level_3.webp'
                                                : data['goalLevel'] == 4
                                                    ? 'assets/images/goal_level_4.webp'
                                                    : 'assets/images/goal_level_5.webp'),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: SizedBox(
                                width: AppDimensionsUpdated.width10(context) *
                                    14.655,
                                height: AppDimensionsUpdated.height10(context) *
                                    14.655,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: AppDimensionsUpdated.height10(
                                              context) *
                                          3.9,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          4.7,
                                      margin: EdgeInsets.only(
                                          top: AppDimensionsUpdated.height10(
                                                  context) *
                                              1.728),
                                      //color: Colors.amber,
                                      alignment: Alignment.bottomCenter,
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'laila',
                                                fontWeight: FontWeight.w500,
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    0.12,
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    0.8,
                                                color: const Color(0xFF424242),
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: int.parse(data[
                                                                    'goalLevel']
                                                                .toString()) <
                                                            5
                                                        ? data['goalLevel']
                                                            .toString()
                                                        : '5',
                                                    style: TextStyle(
                                                      fontFamily: 'Laila',
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              2.8,
                                                    )),
                                                const TextSpan(
                                                    text: '/5\n',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF828282))),
                                                const TextSpan(
                                                  text: 'LEVEL',
                                                )
                                              ])),
                                    ),
                                    SizedBox(
                                      width: AppDimensionsUpdated.width10(
                                              context) *
                                          13.1,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          5.1,
                                      child: Center(
                                        child: Text(
                                          data['goalLevel'] == 1
                                              ? "I haven’t noticed\nmuch progress yet"
                                              : data['goalLevel'] == 2
                                                  ? "I'm making\ngradual steps\nforward"
                                                  : data['goalLevel'] == 3
                                                      ? "I'm almost there"
                                                      : data['goalLevel'] == 4
                                                          ? 'I feel like I’m living\nmy goal and desired\nidentity '
                                                          : "I've achieved my\ngoal and living my\nnew identity :)",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'laila',
                                            fontWeight: FontWeight.w400,
                                            height:
                                                AppDimensionsUpdated.height10(
                                                        context) *
                                                    0.12,
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.4,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensionsUpdated.width10(context) * 29.0,
                      height: AppDimensionsUpdated.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 10.1),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius: BorderRadius.circular(
                              AppDimensionsUpdated.height10(context) * 5.0)),
                      child: SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 6.9,
                        height: AppDimensionsUpdated.height10(context) * 2.4,
                        child: Center(
                          child: Text(
                            'Exit',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.font10(context) * 2,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          FadePageRoute(
                              page: new_progress_score(
                            premium: subscription == 'active' ? true : false,
                            evaluationIndex: 0,
                          )));
                    },
                    child: Container(
                      width: AppDimensionsUpdated.width10(context) * 29.0,
                      height: AppDimensionsUpdated.height10(context) * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 1.8,
                          bottom: AppDimensionsUpdated.height10(context) * 4.3),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffFA9934)),
                          color: const Color(0xFFF9F7F9),
                          borderRadius: BorderRadius.circular(
                              AppDimensionsUpdated.height10(context) * 5.0)),
                      child: SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 23.4,
                        height: AppDimensionsUpdated.height10(context) * 2.4,
                        child: Center(
                          child: Text(
                            'View goal level evaluation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.font10(context) * 2,
                              color: const Color(0xFFFA9934),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
