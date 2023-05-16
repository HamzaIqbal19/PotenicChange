// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class your_why extends StatefulWidget {
  final bool evaluation;
  const your_why({super.key, required this.evaluation});

  @override
  State<your_why> createState() => _your_whyState();
}

class _your_whyState extends State<your_why> {
  bool select_item = true;
  bool bt_visible = false;
  bool saved = false;
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
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.png',
                width: AppDimensions.height10 * 3.0,
                height: AppDimensions.height10 * 3.0,
                fit: BoxFit.cover,
              )),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: AppDimensions.height10 * 36.5,
                height: widget.evaluation
                    ? AppDimensions.height10 * 48.2
                    : AppDimensions.height10 * 52.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.4),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: widget.evaluation
                          ? [
                              const Color(0xFFF9DCC0).withOpacity(0),
                              const Color(0XFF825179).withOpacity(1)
                            ]
                          : [
                              const Color(0xFFF9DCC0).withOpacity(0),
                              const Color(0XFFFF7975).withOpacity(1)
                            ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: widget.evaluation
                          ? AppDimensions.height10 * 30.1
                          : AppDimensions.height10 * 24.0,
                      height: widget.evaluation
                          ? AppDimensions.height10 * 3.6
                          : AppDimensions.height10 * 3.3,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 7.1),
                      child: Text(
                        widget.evaluation
                            ? 'Practice Evaluation'
                            : 'Goal Criteria 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: widget.evaluation
                          ? AppDimensions.height10 * 32.1
                          : AppDimensions.height10 * 24.0,
                      height: widget.evaluation
                          ? AppDimensions.height10 * 4.4
                          : AppDimensions.height10 * 3.7,
                      margin: EdgeInsets.only(
                          top: widget.evaluation
                              ? AppDimensions.height10 * 3.1
                              : AppDimensions.height10 * 0),
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.evaluation
                            ? '‘Meditation’ for goal ‘Control My Anger’\n20 active day'
                            : 'Your Why',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: widget.evaluation
                                ? AppDimensions.height10 * 1.8
                                : AppDimensions.height10 * 3.0,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: widget.evaluation
                          ? AppDimensions.height10 * 32.1
                          : AppDimensions.height10 * 17.4,
                      height: widget.evaluation
                          ? AppDimensions.height10 * 1.9
                          : AppDimensions.height10 * 2.4,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.5),
                      child: Text(
                        widget.evaluation
                            ? 'from [dd/mmm/yy] to [dd/mmm/yy]'
                            : 'Control My Anger',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: widget.evaluation
                                ? AppDimensions.height10 * 1.6
                                : AppDimensions.height10 * 2.0,
                            fontWeight: widget.evaluation
                                ? FontWeight.w500
                                : FontWeight.w600,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 8.7,
                      height: AppDimensions.height10 * 8.7,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.2),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimensions.height10 * 0.1,
                            color: const Color(0xFFFFFFFF)),
                        shape: BoxShape.circle,
                        color: widget.evaluation
                            ? Colors.transparent
                            : const Color(0xFFFFFFFF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: AppDimensions.height10 * 3.4,
                            height: AppDimensions.height10 * 1.3,
                            child: Text(
                              'Level',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w500,
                                  color: widget.evaluation
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF646464)),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 3.2,
                            height: AppDimensions.height10 * 3.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.evaluation ? '-' : '2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 2.4,
                                      fontWeight: FontWeight.w500,
                                      color: widget.evaluation
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFF646464)),
                                ),
                                Text(
                                  '/5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w300,
                                      color: widget.evaluation
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFF646464)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    widget.evaluation
                        ? Container()
                        : SizedBox(
                            width: AppDimensions.height10 * 23.4,
                            height: AppDimensions.height10 * 7.3,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(-1, -0.5),
                                  child: Container(
                                    width: AppDimensions.height10 * 2.5,
                                    height: AppDimensions.height10 * 1.6,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/colon.png'),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(1, 0),
                                  child: SizedBox(
                                    width: AppDimensions.height10 * 21.4,
                                    height: AppDimensions.height10 * 7.3,

                                    ///color: Colors.amber,
                                    child: Center(
                                      child: Text(
                                        "I'm making small steps\ntowards my why",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.8,
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
                      width: AppDimensions.height10 * 28.8,
                      height: AppDimensions.height10 * 4.2,
                      alignment: Alignment.topCenter,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.3),
                      child: Text(
                        widget.evaluation
                            ? 'Please assess the practice on helping\nyou reach your goal so far...'
                            : "Please give a score on how close you\nare towards achieving your goal.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                    ),
                    Container(
                      // width: AppDimensions.height10 * 2.1,
                      //height: AppDimensions.height10 * 4.3,
                      margin: EdgeInsets.only(
                          top: widget.evaluation
                              ? AppDimensions.height10 * 0
                              : AppDimensions.height10 * 1.5),
                      child: Image.asset(
                        'assets/images/Arrow.png',
                        width: AppDimensions.height10 * 4.1,
                        height: AppDimensions.height10 * 4.1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 4.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        widget.evaluation ? 'Question 1' : 'Why reason 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 6.8,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        widget.evaluation
                            ? 'How effective has this practice been in\nmoving you closer to reaching your goal?'
                            : 'I want to achieve this goal to be in control\nof my anger and to regain control of my\nlife.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w500,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648A)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? 'No help at all'
                                  : 'I’m not\nmaking any\nprogress',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.evaluation
                                ? select_item
                                : select_item = true;
                          });
                        },
                        child: Container(
                          width: AppDimensions.height10 * 12.95,
                          height: AppDimensions.height10 * 12.95,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 1.5),
                          child: Stack(children: [
                            Container(
                              width: AppDimensions.height10 * 12.95,
                              height: AppDimensions.height10 * 12.95,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: select_item
                                      ? LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: widget.evaluation
                                              ? [
                                                  const Color(0xFFA88CA5),
                                                  const Color(0xFFBF9BA7)
                                                ]
                                              : [
                                                  const Color(0XFFFA9E71),
                                                  const Color(0xFFFA9E71)
                                                ])
                                      : const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                              Color(0XFFFFFFFF),
                                              Color(0xFFFFFFFF)
                                            ]),
                                  border: Border.all(
                                      width: AppDimensions.height10 * 0.3,
                                      color: widget.evaluation
                                          ? const Color(0xFFFFFFFF)
                                          : select_item
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFFEE8F70))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 3.2,
                                          fontWeight: FontWeight.w500,
                                          color: select_item
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFFFA9934)),
                                    ),
                                  ),
                                  Text(
                                    widget.evaluation
                                        ? 'There is slow\nprogress'
                                        : 'I’m making\nsmall steps\nforward',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: select_item
                                            ? const Color(0xFFFFFFFF)
                                            : const Color(0xFFFA9934)),
                                  )
                                ],
                              ),
                            ),
                            select_item
                                ? Align(
                                    alignment: const Alignment(0, 1.6),
                                    child: widget.evaluation
                                        ? Container()
                                        : Container(
                                            width: AppDimensions.height10 * 4.0,
                                            height:
                                                AppDimensions.height10 * 4.0,
                                            padding: EdgeInsets.all(
                                                AppDimensions.height10 * 0.2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width:
                                                        AppDimensions.height10 *
                                                            0.1,
                                                    color: const Color(
                                                        0xFFFFFFFF))),
                                            child: Container(
                                              width:
                                                  AppDimensions.height10 * 2.4,
                                              height:
                                                  AppDimensions.height10 * 2.4,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: AppDimensions
                                                              .height10 *
                                                          0.1,
                                                      color: const Color(
                                                          0xFFFFFFFF)),
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(widget
                                                              .evaluation
                                                          ? 'assets/images/Tick.png'
                                                          : 'assets/images/circle_tick.png'))),
                                            ),
                                          ),
                                  )
                                : Container()
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.evaluation
                                ? select_item
                                : select_item = false;
                            widget.evaluation ? select_item : bt_visible = true;
                          });
                        },
                        child: Container(
                          width: AppDimensions.height10 * 12.95,
                          height: AppDimensions.height10 * 12.95,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 1.5),
                          child: Stack(children: [
                            Container(
                              width: AppDimensions.height10 * 12.95,
                              height: AppDimensions.height10 * 12.95,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: select_item
                                      ? const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                              Color(0XFFFFFFFF),
                                              Color(0xFFFFFFFF)
                                            ])
                                      : LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: widget.evaluation
                                              ? [
                                                  const Color(0xFFA88CA5),
                                                  const Color(0xFFBF9BA7)
                                                ]
                                              : [
                                                  const Color(0XFFFA9E71),
                                                  const Color(0xFFFA9E71)
                                                ]),
                                  border: Border.all(
                                      width: AppDimensions.height10 * 0.3,
                                      color: widget.evaluation
                                          ? const Color(0xFF8C648A)
                                          : select_item
                                              ? const Color(0xFFEE8F70)
                                              : const Color(0xFFFFFFFF))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 3.2,
                                          fontWeight: FontWeight.w500,
                                          color: widget.evaluation
                                              ? const Color(0xFF8C648AF)
                                              : select_item
                                                  ? const Color(0xFFFA9934)
                                                  : const Color(0xFFFFFFFF)),
                                    ),
                                  ),
                                  Text(
                                    widget.evaluation
                                        ? "There've been\nsome\nprogress"
                                        : 'I’m making\nconsiderable\nsteps forward',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: widget.evaluation
                                            ? const Color(0xFF8C648AF)
                                            : select_item
                                                ? const Color(0xFFFA9934)
                                                : const Color(0xFFFFFFFF)),
                                  )
                                ],
                              ),
                            ),
                            select_item
                                ? Container()
                                : Align(
                                    alignment: const Alignment(0, 1.6),
                                    child: Container(
                                      width: AppDimensions.height10 * 4.0,
                                      height: AppDimensions.height10 * 4.0,
                                      padding: EdgeInsets.all(
                                          AppDimensions.height10 * 0.2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width:
                                                  AppDimensions.height10 * 0.1,
                                              color: const Color(0xFFFFFFFF))),
                                      child: Container(
                                        width: AppDimensions.height10 * 2.4,
                                        height: AppDimensions.height10 * 2.4,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: AppDimensions.height10 *
                                                    0.1,
                                                color: const Color(0xFFFFFFFF)),
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/circle_tick.png'))),
                                      ),
                                    ),
                                  )
                          ]),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "There's been good\nimprovement"
                                  : "There's been good\nimprovement",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        // margin: EdgeInsets.only(right: AppDimensions.height10*1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '5',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              "It's been very\neffective so far",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.2,
                height: AppDimensions.height10 * 0.1,
                color: widget.evaluation
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF437296),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    bottom: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        widget.evaluation ? 'Question 2' : 'Why reason 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 6.8,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        widget.evaluation
                            ? 'How much have you enjoyed performing\nthe practice during this period?'
                            : 'I want to be closer and respect my wife and\nchildren. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            fontWeight: FontWeight.w500,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "Didn’t like it,\nnot useful to\nme"
                                  : 'I’m not\nmaking any\nprogress',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        child: Stack(children: [
                          Container(
                            width: AppDimensions.height10 * 12.95,
                            height: AppDimensions.height10 * 12.95,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: widget.evaluation
                                        ? [
                                            const Color(0xFFFFFFFF),
                                            const Color(0xFFFFFFFF)
                                          ]
                                        : [
                                            const Color(0XFFFA9E71),
                                            const Color(0xFFFA9E71)
                                          ]),
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.3,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648A)
                                        : const Color(0xFFFFFFFF))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: widget.evaluation
                                            ? const Color(0xFF8C648A)
                                            : const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Text(
                                  widget.evaluation
                                      ? "It's not been\nbad"
                                      : 'I’m making\nsmall steps\nforward',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: widget.evaluation
                                          ? const Color(0xFF8C648A)
                                          : const Color(0xFFFFFFFF)),
                                )
                              ],
                            ),
                          ),
                          widget.evaluation
                              ? Container()
                              : Align(
                                  alignment: const Alignment(0, 1.6),
                                  child: Container(
                                    width: AppDimensions.height10 * 4.0,
                                    height: AppDimensions.height10 * 4.0,
                                    padding: EdgeInsets.all(
                                        AppDimensions.height10 * 0.2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: AppDimensions.height10 * 0.1,
                                            color: const Color(0xFFFFFFFF))),
                                    child: Container(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 2.4,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width:
                                                  AppDimensions.height10 * 0.1,
                                              color: const Color(0xFFFFFFFF)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/circle_tick.png'))),
                                    ),
                                  ),
                                )
                        ]),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "I'm starting to\nenjoy it"
                                  : 'I’m making\nconsiderable\nsteps forward',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "I quite like\nworking on it"
                                  : 'I am almost\nthere',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        // margin: EdgeInsets.only(right: AppDimensions.height10*1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '5',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "It's been fun\nand truly\nenjoyable"
                                  : 'I’m definitely\nliving my\nwhy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.2,
                height: AppDimensions.height10 * 0.1,
                color: widget.evaluation
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF437296),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    bottom: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        widget.evaluation ? 'Question 3' : 'Why reason 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 6.8,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        widget.evaluation
                            ? 'How confident are you that this\npractice will help move you closer\ntowards your goal?'
                            : 'I don’t want my anger to hold me back\nfrom enjoying life.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "I don't feel\nconfident at\nthis point"
                                  : 'I’m not\nmaking any\nprogress',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        child: Stack(children: [
                          Container(
                            width: AppDimensions.height10 * 12.95,
                            height: AppDimensions.height10 * 12.95,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: widget.evaluation
                                        ? [
                                            const Color(0XFFFFFFFF),
                                            const Color(0xFFFFFFFF)
                                          ]
                                        : [
                                            const Color(0XFFFA9E71),
                                            const Color(0xFFFA9E71)
                                          ]),
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.3,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648A)
                                        : const Color(0xFFEE8F70))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: widget.evaluation
                                            ? const Color(0xFF8C648AF)
                                            : const Color(0xFFFFFFFFF)),
                                  ),
                                ),
                                Text(
                                  widget.evaluation
                                      ? "I feel it is\npossible"
                                      : 'I’m making\nsmall steps\nforward',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: widget.evaluation
                                          ? const Color(0xFF8C648AF)
                                          : const Color(0xFFFFFFFFF)),
                                )
                              ],
                            ),
                          ),
                          widget.evaluation
                              ? Container()
                              : Align(
                                  alignment: const Alignment(0, 1.6),
                                  child: Container(
                                    width: AppDimensions.height10 * 4.0,
                                    height: AppDimensions.height10 * 4.0,
                                    padding: EdgeInsets.all(
                                        AppDimensions.height10 * 0.2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: AppDimensions.height10 * 0.1,
                                            color: const Color(0xFFFFFFFF))),
                                    child: Container(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 2.4,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width:
                                                  AppDimensions.height10 * 0.1,
                                              color: const Color(0xFFFFFFFF)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/circle_tick.png'))),
                                    ),
                                  ),
                                )
                        ]),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "I feel it is\npossible"
                                  : 'I’m making\nconsiderable\nsteps forward',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "It's helping\nme already"
                                  : 'I am almost\nthere',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        // margin: EdgeInsets.only(right: AppDimensions.height10*1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '5',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "Very\nconfident "
                                  : 'I’m definitely\nliving my\nwhy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.2,
                height: AppDimensions.height10 * 0.1,
                color: widget.evaluation
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF437296),
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    bottom: AppDimensions.height10 * 3.0),
              ),
              Container(
                width: AppDimensions.height10 * 37.0,
                height: AppDimensions.height10 * 11.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppDimensions.height10 * 15.5,
                      height: AppDimensions.height10 * 2.9,
                      child: Text(
                        widget.evaluation ? 'Question 4' : 'Why reason 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.4,
                            fontWeight: FontWeight.w600,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 37.0,
                      height: AppDimensions.height10 * 6.8,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      child: Text(
                        widget.evaluation
                            ? 'How easy is it to implement this\npractice in to your life?'
                            : 'I don’t want my anger to hold me back\nfrom enjoying life.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.8,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: widget.evaluation
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF437296)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 16.3,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 3.0,
                    left: AppDimensions.height10 * 0.425),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "I feel it's\nalmost\nimpossible"
                                  : 'I’m not\nmaking any\nprogress',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        child: Stack(children: [
                          Container(
                            width: AppDimensions.height10 * 12.95,
                            height: AppDimensions.height10 * 12.95,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: widget.evaluation
                                        ? [
                                            const Color(0XFFFFFFFF),
                                            const Color(0xFFFFFFFF)
                                          ]
                                        : [
                                            const Color(0XFFFA9E71),
                                            const Color(0xFFFA9E71)
                                          ]),
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.3,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648A)
                                        : const Color(0xFFEE8F70))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 3.2,
                                        fontWeight: FontWeight.w500,
                                        color: widget.evaluation
                                            ? const Color(0xFF8C648AF)
                                            : const Color(0xFFFFFFFFF)),
                                  ),
                                ),
                                Text(
                                  widget.evaluation
                                      ? "It feels\nchallenging"
                                      : 'I’m making\nsmall steps\nforward',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.4,
                                      fontWeight: FontWeight.w400,
                                      color: widget.evaluation
                                          ? const Color(0xFF8C648AF)
                                          : const Color(0xFFFFFFFFF)),
                                )
                              ],
                            ),
                          ),
                          widget.evaluation
                              ? Container()
                              : Align(
                                  alignment: const Alignment(0, 1.6),
                                  child: Container(
                                    width: AppDimensions.height10 * 4.0,
                                    height: AppDimensions.height10 * 4.0,
                                    padding: EdgeInsets.all(
                                        AppDimensions.height10 * 0.2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: AppDimensions.height10 * 0.1,
                                            color: const Color(0xFFFFFFFF))),
                                    child: Container(
                                      width: AppDimensions.height10 * 2.4,
                                      height: AppDimensions.height10 * 2.4,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width:
                                                  AppDimensions.height10 * 0.1,
                                              color: const Color(0xFFFFFFFF)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/circle_tick.png'))),
                                    ),
                                  ),
                                )
                        ]),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '3',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "I find it hard,\nbut willing to\nwork on it"
                                  : 'I’m making\nconsiderable\nsteps forward',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '4',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "Relatively\neasy"
                                  : 'I am almost\nthere',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 12.95,
                        height: AppDimensions.height10 * 12.95,
                        // margin: EdgeInsets.only(right: AppDimensions.height10*1.5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFFFFF),
                            border: Border.all(
                                width: AppDimensions.height10 * 0.3,
                                color: widget.evaluation
                                    ? const Color(0xFF8C648A)
                                    : const Color(0xFFEE8F70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '5',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 3.2,
                                    fontWeight: FontWeight.w500,
                                    color: widget.evaluation
                                        ? const Color(0xFF8C648AF)
                                        : const Color(0xFFFA9934)),
                              ),
                            ),
                            Text(
                              widget.evaluation
                                  ? "It's tough work,\nbut I am\nenjoying it "
                                  : 'I’m definitely\nliving my\nwhy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: widget.evaluation
                                      ? const Color(0xFF8C648AF)
                                      : const Color(0xFFFA9934)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              saved
                  ? Container(
                      width: AppDimensions.height10 * 38.259,
                      height: AppDimensions.height10 * 9.707,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 9.9,
                          bottom: AppDimensions.height10 * 2.193),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFD4B7B9), Color(0xFF91698C)])),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.261),
                            width: AppDimensions.height10 * 4.437,
                            height: AppDimensions.height10 * 4.437,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/circle_tick.png'))),
                          ),
                          Container(
                            width: AppDimensions.height10 * 10.8,
                            height: AppDimensions.height10 * 3.673,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.232),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  //  width: AppDimensions.height10 * 4.6,
                                  height: AppDimensions.height10 * 1.4,
                                  //   color: Colors.amber,
                                  child: Text(
                                    'Changes saved',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.3,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                                SizedBox(
                                  // width: AppDimensions.height10 * 6.9,
                                  height: AppDimensions.height10 * 2.2,
                                  child: Text(
                                    'Goal Criteria',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                saved = false;
                              });
                            },
                            child: Container(
                              width: AppDimensions.height10 * 8.1,
                              height: AppDimensions.height10 * 6.0,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 11.2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFFFFFFF), width: 1),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Undo',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.8,
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
                      width: AppDimensions.height10 * 35.4,
                      height: AppDimensions.height10 * 5.0,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 10.9,
                          bottom: AppDimensions.height10 * 3.6),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 8.0,
                            height: AppDimensions.height10 * 5.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: bt_visible
                                          ? const Color(0xFFFA9934)
                                          : const Color(0xFFFA9934)
                                              .withOpacity(0.5)),
                                )),
                          ),
                          Container(
                            width: AppDimensions.height10 * 8.0,
                            height: AppDimensions.height10 * 5.0,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Clear',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: bt_visible
                                          ? const Color(0xFFFA9934)
                                          : const Color(0xFFFA9934)
                                              .withOpacity(0.5)),
                                )),
                          ),
                          Container(
                            width: AppDimensions.height10 * 17.4,
                            height: AppDimensions.height10 * 5.0,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.0),
                            decoration: BoxDecoration(
                              gradient: bt_visible
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
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (bt_visible == true) {
                                    setState(() {
                                      saved = true;
                                    });
                                  }
                                },
                                child: Text(
                                  'Save updates',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: bt_visible
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5)),
                                )),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
