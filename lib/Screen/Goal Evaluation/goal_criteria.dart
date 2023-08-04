// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/goalEvaluation.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/new_progress_score.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../../utils/app_dimensions.dart';

class your_why extends StatefulWidget {
  final String destination;
  final bool saved;
  const your_why({
    super.key,
    required this.saved,
    required this.destination,
  });

  @override
  State<your_why> createState() => _your_whyState();
}

class _your_whyState extends State<your_why> {
  List options = [
    'I’m not\nmaking any\nprogress',
    'I’m making\nsmall steps\nforward',
    'I’m making\nconsiderable\nsteps forward',
    "I’m almost\nthere",
    "I’m definitely\nliving my why"
  ];
  // List<int?> selectedOptions = List.generate(3, (_) => null);

  //int? selectedItemIndexOuter; // For the outer list
  //int? selectedItemIndexInner; // For the inner list

  //int? selectedItemIndex;
  bool bt_visible = false;
  bool Loader = true;
  var goalDetails;
  List<int>? selectedItemIndexesOuter;
  final Map<String, dynamic> reasons = {};
  final Map<String, dynamic> level = {};

  Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchGoalEvauation() {
    goalEvaluationApi.getGoalEvaluation().then((response) {
      print(response);
    });
  }

  void _fetchGoalDetails() {
    AdminGoal.getUserGoal().then((response) {
      if (response.length != 0) {
        setState(() {
          goalDetails = response;
        });
        setState(() {
          selectedItemIndexesOuter =
              List.filled(goalDetails[widget.destination].length, -1);
        });
        _fetchGoalEvauation();
        loadData();
        print(response);
      } else {
        loadData();
      }
    }).catchError((error) {
      // loadData();
      print("error");
    }).whenComplete(() {
      loadData();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchGoalDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Center(
          child: IconButton(
              onPressed: () {
                showAnimatedDialog(
                    animationType: DialogTransitionType.fadeScale,
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 1),
                    context: context,
                    builder: (BuildContext context) => Container(
                        width: AppDimensions.height10(context) * 27.0,
                        height: AppDimensions.height10(context) * 18.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 1.4)),
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 1.4)),
                          contentPadding: EdgeInsets.zero,
                          actionsPadding: EdgeInsets.zero,
                          titlePadding: EdgeInsets.zero,
                          title: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 1.4)),
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.9,
                                right: AppDimensions.height10(context) * 1.6,
                                left: AppDimensions.height10(context) * 1.6,
                                bottom: AppDimensions.height10(context) * 0.2),
                            height: AppDimensions.height10(context) * 2.2,
                            width: AppDimensions.height10(context) * 23.8,
                            child: Text(
                              "Exit without saving changes?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.7,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          content: Container(
                            margin: EdgeInsets.only(
                                bottom: AppDimensions.height10(context) * 1.5,
                                left: AppDimensions.height10(context) * 1.6,
                                right: AppDimensions.height10(context) * 1.6),
                            width: AppDimensions.height10(context) * 23.8,
                            child: Text(
                              "Are you sure you want to exit, all your\nchanges will be lost?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.3,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.1,
                                  child: Divider(
                                    color: const Color(0XFF3C3C43)
                                        .withOpacity(0.29),
                                  ),
                                ),
                                Container(
                                  height: AppDimensions.height10(context) * 4.2,
                                  width: double.infinity,
                                  color: const Color(0xFF007AFF),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page:
                                                  const new_progress_score(premium: true,)));
                                    },
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.1,
                                  child: Divider(
                                    color: const Color(0XFF3C3C43)
                                        .withOpacity(0.29),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 4.4,
                                  width: double.infinity,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontFamily: "Laila",
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF007AFF)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 0.1,
                                  child: Divider(
                                    color: const Color(0XFF3C3C43)
                                        .withOpacity(0.29),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )));
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                width: AppDimensions.height10(context) * 3.0,
                height: AppDimensions.height10(context) * 3.0,
                fit: BoxFit.cover,
              )),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        child: Loader == false
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 36.5,
                      height: AppDimensions.height10(context) * 52.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFF9DCC0).withOpacity(0),
                              const Color(0XFFFF7975).withOpacity(1)
                            ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 24.0,
                            height: AppDimensions.height10(context) * 3.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 7.1),
                            child: Text(
                              widget.destination == 'reason'
                                  ? 'Goal Criteria 1'
                                  : widget.destination == 'identityStatement'
                                      ? 'Goal Criteria 2'
                                      : 'Goal Criteria 3',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 3.0,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            //  width: AppDimensions.height10(context) * 24.0,
                            height: AppDimensions.height10(context) * 3.7,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0),
                            alignment: Alignment.topCenter,
                            child: Text(
                              widget.destination == 'reason'
                                  ? 'Your Why'
                                  : widget.destination == 'identityStatement'
                                      ? 'Your New Identity'
                                      : 'Your Vision',
                              //  'Your Why',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 3.0,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 32.4,
                            height: AppDimensions.height10(context) * 2.4,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 2.5),
                            child: Text(
                              capitalizeFirstLetter(goalDetails['name']),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.0,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 8.7,
                            height: AppDimensions.height10(context) * 8.7,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xFFFFFFFF)),
                              shape: BoxShape.circle,
                              color: goalDetails['goalLevel'] == 0
                                  ? Colors.transparent
                                  : const Color(0xFFFFFFFF),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 3.4,
                                  height: AppDimensions.height10(context) * 1.3,
                                  child: Text(
                                    'Level',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF646464)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 3.2,
                                  height: AppDimensions.height10(context) * 3.7,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        goalDetails['goalEvaluations'][0]
                                                    ["YourWay"] ==
                                                0
                                            ? '-'
                                            : goalDetails['goalLevel']
                                                .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                2.4,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF646464)),
                                      ),
                                      Text(
                                        '/5',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w300,
                                            color: const Color(0xFF646464)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 23.4,
                            height: AppDimensions.height10(context) * 7.3,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(-1, -0.5),
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 2.5,
                                    height:
                                        AppDimensions.height10(context) * 1.6,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/colon.webp'),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(1, 0),
                                  child: SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 21.4,
                                    height:
                                        AppDimensions.height10(context) * 7.3,

                                    ///color: Colors.amber,
                                    child: Center(
                                      child: Text(
                                        widget.destination == 'reason'
                                            ? "I'm making small steps\ntowards my  why"
                                            : widget.destination ==
                                                    'identityStatement'
                                                ? "I'm making small steps\ntowards my identity"
                                                : "I'm making small steps\ntowards my vision",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 28.8,
                            height: AppDimensions.height10(context) * 4.2,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.3),
                            child: Text(
                              "Please give a score on how close you\nare towards achieving your goal.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFFFFFFF)),
                            ),
                          ),
                          Container(
                            // width: AppDimensions.height10(context) * 2.1,
                            //height: AppDimensions.height10(context) * 4.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.5),
                            child: Image.asset(
                              'assets/images/Arrow.webp',
                              width: AppDimensions.height10(context) * 4.1,
                              height: AppDimensions.height10(context) * 4.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: goalDetails[widget.destination].length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItemIndexesOuter![index] = index;
                            });
                          },
                          child: Container(
                            // width: AppDimensions.height10(context) * 37.0,
                            //   height: AppDimensions.height10(context) * 11.9,
                            margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 4.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // width: AppDimensions.height10(context) * 15.5,
                                  //height: AppDimensions.height10(context) * 2.9,
                                  child: Text(
                                    widget.destination == 'reason'
                                        ? "Why reason ${index + 1}"
                                        : widget.destination ==
                                                'identityStatement'
                                            ? "Identity Statement ${index + 1}"
                                            : "Vision ${index + 1}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.4,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF437296)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 37.0,
                                  //height: AppDimensions.height10(context) * 6.8,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Text(
                                    goalDetails[widget.destination][index]
                                        ['text'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        fontWeight: FontWeight.w500,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.15,
                                        color: const Color(0xFF437296)),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height:
                                      AppDimensions.height10(context) * 16.3,
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 3.0,
                                      left: AppDimensions.height10(context) *
                                          0.425),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index1) {
                                        return AnimatedScaleButton(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndexesOuter![index] =
                                                  index1;
                                            });
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                12.95,
                                            height: AppDimensions.height10(
                                                    context) *
                                                12.95,
                                            margin: EdgeInsets.only(
                                                right: AppDimensions.height10(
                                                        context) *
                                                    1.5),
                                            child: Stack(children: [
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    12.95,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    12.95,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: selectedItemIndexesOuter![index] != index1
                                                        ? const LinearGradient(
                                                            begin: Alignment.topCenter,
                                                            end: Alignment.bottomCenter,
                                                            colors: [
                                                                Color(
                                                                    0XFFFFFFFF),
                                                                Color(
                                                                    0xFFFFFFFF)
                                                              ])
                                                        : const LinearGradient(
                                                            begin: Alignment.topCenter,
                                                            end: Alignment.bottomCenter,
                                                            colors: [
                                                                Color(
                                                                    0XFFFA9934),
                                                                Color(
                                                                    0xFFFA9934)
                                                              ]),
                                                    border: Border.all(
                                                        width: AppDimensions.height10(
                                                                context) *
                                                            0.3,
                                                        color: selectedItemIndexesOuter![index] !=
                                                                index1
                                                            ? const Color(0xFFEE8F70)
                                                            : const Color(0xFFFFFFFF))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        '${index1 + 1}',
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                3.2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedItemIndexesOuter![
                                                                        index] !=
                                                                    index1
                                                                ? const Color(
                                                                    0xFFFA9934)
                                                                : const Color(
                                                                    0xFFFFFFFF)),
                                                      ),
                                                    ),
                                                    Text(
                                                      options[index1],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: selectedItemIndexesOuter![
                                                                      index] !=
                                                                  index1
                                                              ? const Color(
                                                                  0xFFFA9934)
                                                              : const Color(
                                                                  0xFFFFFFFF)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              selectedItemIndexesOuter![
                                                          index] !=
                                                      index1
                                                  ? Container()
                                                  : Align(
                                                      alignment:
                                                          const Alignment(
                                                              0, 0.8),
                                                      child: Container(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.0,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            4.0,
                                                        padding: EdgeInsets.all(
                                                            AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.2),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.1,
                                                                color: const Color(
                                                                    0xFFFFFFFF))),
                                                        child: Container(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.4,
                                                          height: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.4,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      0.1,
                                                                  color: const Color(
                                                                      0xFFFFFFFF)),
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: const DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/images/circle_tick.webp'))),
                                                        ),
                                                      ),
                                                    )
                                            ]),
                                          ),
                                        );
                                      }),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 7.2,
                                  height: AppDimensions.height10(context) * 0.1,
                                  color: const Color(0xFF437296),
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 3.0,
                                      bottom: AppDimensions.height10(context) *
                                          3.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    widget.saved
                        ? Container(
                            width: AppDimensions.height10(context) * 38.259,
                            height: AppDimensions.height10(context) * 9.707,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 9.9,
                                bottom:
                                    AppDimensions.height10(context) * 2.193),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFD4B7B9),
                                      Color(0xFF91698C)
                                    ])),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.261),
                                  width:
                                      AppDimensions.height10(context) * 4.437,
                                  height:
                                      AppDimensions.height10(context) * 4.437,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/circle_tick.webp'))),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 10.8,
                                  height:
                                      AppDimensions.height10(context) * 3.673,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.232),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //  width: AppDimensions.height10(context) * 4.6,
                                        height:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        //   color: Colors.amber,
                                        child: Text(
                                          'Changes saved',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.3,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                      SizedBox(
                                        // width: AppDimensions.height10(context) * 6.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        child: Text(
                                          'Goal Criteria',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.8,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   saved = false;
                                    // });
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 8.1,
                                    height:
                                        AppDimensions.height10(context) * 6.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            11.2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFFFFFFF),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Undo',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: AppDimensions.height10(context) * 35.4,
                            height: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 10.9,
                                bottom: AppDimensions.height10(context) * 3.6),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => showAnimatedDialog(
                                      animationType:
                                          DialogTransitionType.fadeScale,
                                      curve: Curves.easeInOut,
                                      duration: const Duration(seconds: 1),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          showAlertBox(context)),
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 8.0,
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Clear',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w600,
                                            color: selectedItemIndexesOuter! !=
                                                    null
                                                ? const Color(0xFFFA9934)
                                                : const Color(0xFFFA9934)
                                                    .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedScaleButton(
                                  onTap: () => showAnimatedDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return showSaveWithout(context);
                                    },
                                    animationType:
                                        DialogTransitionType.fadeScale,
                                    curve: Curves.easeInOut,
                                    duration: const Duration(seconds: 1),
                                  ),
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 8.0,
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Reset',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w600,
                                            color: selectedItemIndexesOuter! !=
                                                    null
                                                ? const Color(0xFFFA9934)
                                                : const Color(0xFFFA9934)
                                                    .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedScaleButton(
                                  onTap: () {
                                    if (selectedItemIndexesOuter!
                                            .contains(-1) ==
                                        false) {
                                      showAnimatedDialog(
                                          context: context,
                                          animationType: DialogTransitionType
                                              .fadeScale,
                                          curve: Curves.easeInOut,
                                          duration: const Duration(seconds: 1),
                                          builder: (BuildContext context) =>
                                              Container(
                                                  width:
                                                      AppDimensions.height10(
                                                              context) *
                                                          27.0,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          18.2,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.4)),
                                                  child: AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4)),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    actionsPadding:
                                                        EdgeInsets.zero,
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    title: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  1.4)),
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.9,
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          left: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          bottom: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.2),
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          2.2,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          23.8,
                                                      child: Text(
                                                        "Save changes?",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.7,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    content: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.5,
                                                          left: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6,
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.6),
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.2,
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          23.8,
                                                      child: Text(
                                                        "Are you sure you want to save your new\nupdates?",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.3,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                4.2,
                                                            width:
                                                                double.infinity,
                                                            color: const Color(
                                                                0xFF007AFF),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                var sum = selectedItemIndexesOuter!
                                                                    .reduce((a,
                                                                            b) =>
                                                                        a + b);
                                                                print(sum +
                                                                    goalDetails[
                                                                            widget.destination]
                                                                        .length);

                                                                level[
                                                                    'level'] = ((sum +
                                                                            goalDetails[widget.destination]
                                                                                .length) /
                                                                        goalDetails[widget.destination]
                                                                            .length)
                                                                    .round();

                                                                for (int i = 0;
                                                                    i <
                                                                        selectedItemIndexesOuter!
                                                                            .length;
                                                                    i++) {
                                                                  reasons['reason ${i + 1}'] =
                                                                      selectedItemIndexesOuter![
                                                                          i];
                                                                }
                                                                print(level);
                                                                goalEvaluationApi()
                                                                    .updateEvaluation(
                                                                  widget.destination ==
                                                                          'reason'
                                                                      ? "YourWay"
                                                                      : widget.destination ==
                                                                              'identityStatement'
                                                                          ? "newIdentity"
                                                                          : "visualisingYourSelf",
                                                                  {
                                                                    ...level,
                                                                    ...reasons
                                                                  },
                                                                ).then((response) {
                                                                  if (response ==
                                                                      true) {
                                                                    Navigator.push(
                                                                        context,
                                                                        FadePageRoute(
                                                                            page: your_why(
                                                                          saved:
                                                                              true,
                                                                          destination:
                                                                              widget.destination,
                                                                        )));
                                                                  }
                                                                });
                                                                // goalEvaluationApi()
                                                                //     .addGoalEvaluation(
                                                                //         "YourWay",
                                                                //         {
                                                                //           'level':
                                                                //               sum + goalDetails[widget.destination].length,
                                                                //           "reason 1":
                                                                //               selectedItemIndexesOuter![0] + 1,
                                                                //         },
                                                                //         goalDetails[
                                                                //             'id']);
                                                              },
                                                              child: Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        "Laila",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                4.4,
                                                            width:
                                                                double.infinity,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppDimensions.height10(context) *
                                                                            1.7,
                                                                    fontFamily:
                                                                        "Laila",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: const Color(
                                                                        0xFF007AFF)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0.1,
                                                            child: Divider(
                                                              color: const Color(
                                                                      0XFF3C3C43)
                                                                  .withOpacity(
                                                                      0.29),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        'Must select answer from each row',
                                        style: TextStyle(
                                            color: Colors.red.withOpacity(0.8)),
                                      )));
                                    }
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 17.4,
                                    height:
                                        AppDimensions.height10(context) * 5.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.0),
                                    decoration: BoxDecoration(
                                      gradient:
                                          selectedItemIndexesOuter! != null
                                              ? const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffFCC10D),
                                                    Color(0xffFDA210),
                                                  ],
                                                )
                                              : LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    const Color(0xffFCC10D)
                                                        .withOpacity(0.5),
                                                    const Color(0xffFDA210)
                                                        .withOpacity(0.5),
                                                  ],
                                                ),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              5.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Save updates',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w600,
                                            color: selectedItemIndexesOuter! !=
                                                    null
                                                ? Colors.white
                                                : Colors.white
                                                    .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              )
            : const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              ),
      ),
    );
  }
}

// AlertDialog save_criteria = AlertDialog(
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
//   contentPadding: EdgeInsets.zero,
//   actionsPadding: EdgeInsets.zero,
//   titlePadding: EdgeInsets.zero,
//   title: Container(
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
//     margin: EdgeInsets.only(
//         top: AppDimensions.height10(context) * 1.9,
//         right: AppDimensions.height10(context) * 1.6,
//         left: AppDimensions.height10(context) * 1.6,
//         bottom: AppDimensions.height10(context) * 0.2),
//     height: AppDimensions.height10(context) * 2.2,
//     width: AppDimensions.height10(context) * 23.8,
//     child: Text(
//       "Save changes?",
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: AppDimensions.height10(context) * 1.7,
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   ),
//   content: Container(
//     margin: EdgeInsets.only(
//         bottom: AppDimensions.height10(context) * 1.5,
//         left: AppDimensions.height10(context) * 1.6,
//         right: AppDimensions.height10(context) * 1.6),
//     height: AppDimensions.height10(context) * 3.2,
//     width: AppDimensions.height10(context) * 23.8,
//     child: Text(
//       "Are you sure you want to save your new\nupdates?",
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: AppDimensions.height10(context) * 1.3,
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   ),
//   actions: <Widget>[
//     Column(
//       children: [
//         SizedBox(
//           height: AppDimensions.height10(context) * 0.1,
//           child: Divider(
//             color: const Color(0XFF3C3C43).withOpacity(0.29),
//           ),
//         ),
//         Container(
//           height: AppDimensions.height10(context) * 4.2,
//           width: double.infinity,
//           color: const Color(0xFF007AFF),
//           child: GestureDetector(
//             onTap: () {
//                Navigator.push(context,
//                               FadePageRoute(page: const your_why(criteria: 1, saved: true,)));
//             },
//             child: Center(
//               child: Text(
//                 'Yes',
//                 style: TextStyle(
//                     color: const Color(0xFFFFFFFF),
//                     fontSize: AppDimensions.height10(context) * 1.7,
//                     fontFamily: "Laila",
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: AppDimensions.height10(context) * 0.1,
//           child: Divider(
//             color: const Color(0XFF3C3C43).withOpacity(0.29),
//           ),
//         ),
//         SizedBox(
//           height: AppDimensions.height10(context) * 4.4,
//           width: double.infinity,
//           child: TextButton(
//             onPressed: () {},
//             child: Text(
//               'Cancel',
//               style: TextStyle(
//                   fontSize: AppDimensions.height10(context) * 1.7,
//                   fontFamily: "Laila",
//                   fontWeight: FontWeight.w400,
//                   color: const Color(0xFF007AFF)),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: AppDimensions.height10(context) * 0.1,
//           child: Divider(
//             color: const Color(0XFF3C3C43).withOpacity(0.29),
//           ),
//         ),
//       ],
//     ),
//   ],
// );

Widget showSaveWithout(BuildContext context) {
  return Container(
    width: AppDimensions.height10(context) * 27.0,
    height: AppDimensions.height10(context) * 18.2,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        margin: EdgeInsets.only(
            top: AppDimensions.height10(context) * 1.9,
            right: AppDimensions.height10(context) * 1.6,
            left: AppDimensions.height10(context) * 1.6,
            bottom: AppDimensions.height10(context) * 0.2),
        height: AppDimensions.height10(context) * 2.2,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Exit without saving changes?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      content: Container(
        margin: EdgeInsets.only(
            bottom: AppDimensions.height10(context) * 1.5,
            left: AppDimensions.height10(context) * 1.6,
            right: AppDimensions.height10(context) * 1.6),
        height: AppDimensions.height10(context) * 3.2,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Are you sure you want to exit, all your\nchanges will be lost?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.3,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            Container(
              height: AppDimensions.height10(context) * 4.2,
              width: double.infinity,
              color: const Color(0xFF007AFF),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: AppDimensions.height10(context) * 1.7,
                        fontFamily: "Laila",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 4.4,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.7,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF007AFF)),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget showAlertBox(BuildContext context) {
  return Container(
    width: AppDimensions.height10(context) * 27.0,
    height: AppDimensions.height10(context) * 18.2,
    child: AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
        margin: EdgeInsets.only(
            top: AppDimensions.height10(context) * 1.9,
            right: AppDimensions.height10(context) * 1.6,
            left: AppDimensions.height10(context) * 1.6,
            bottom: AppDimensions.height10(context) * 0.2),
        height: AppDimensions.height10(context) * 2.2,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Clear answers?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      content: Container(
        margin: EdgeInsets.only(
            bottom: AppDimensions.height10(context) * 1.5,
            left: AppDimensions.height10(context) * 1.6,
            right: AppDimensions.height10(context) * 1.6),
        height: AppDimensions.height10(context) * 3.2,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Are you sure you want to clear all your\nanswers for this Goal criterion?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimensions.height10(context) * 1.3,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            Container(
              height: AppDimensions.height10(context) * 4.2,
              width: double.infinity,
              color: const Color(0xFF007AFF),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: AppDimensions.height10(context) * 1.7,
                        fontFamily: "Laila",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 4.4,
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.7,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF007AFF)),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 0.1,
              child: Divider(
                color: const Color(0XFF3C3C43).withOpacity(0.29),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
