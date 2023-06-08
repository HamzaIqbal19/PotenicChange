import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation/new_progress_score.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReview.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';
import '../Recording Practice Session/recordPracticeMenu.dart';

class goal_menu_inactive extends StatefulWidget {
  final bool isActive;
  final bool goal_evaluation;
  final bool premium;
  const goal_menu_inactive({
    super.key,
    required this.isActive,
    required this.goal_evaluation,
    required this.premium,
  });

  @override
  State<goal_menu_inactive> createState() => _goal_menu_inactiveState();
}

class _goal_menu_inactiveState extends State<goal_menu_inactive> {
  @override
  int goal_level = 0;
  Widget build(BuildContext context) {
    //bool premium = false;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/prac_assesment.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                // color: Colors.amber,
                //width: AppDimensions.height10 * 17.1,
                height: AppDimensions.height10 * 2.2,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 5.2,
                  // left: AppDimensions.height10 * 12.2,
                  // right: AppDimensions.height10 * 12.1
                ),
                child: Center(
                  child: Text(
                    'Goal Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.8,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffffffff)),
                  ),
                ),
              ),
              Container(
                // color: Colors.amber,
                width: AppDimensions.height10 * 17.1,
                height: AppDimensions.height10 * 2.4,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 0.5,
                    left: AppDimensions.height10 * 12.2,
                    right: AppDimensions.height10 * 12.1),
                child: Text(
                  'Control my anger',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffffffff)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.premium
                      ? Navigator.push(
                          context,
                          FadePageRoute(
                              page: (const goal_menu_inactive(
                            premium: false,
                            isActive: true,
                            goal_evaluation: true,
                          ))))
                      : Navigator.push(
                          context,
                          FadePageRoute(
                              page: (const goal_menu_inactive(
                            premium: true,
                            isActive: true,
                            goal_evaluation: true,
                          ))));
                },
                child: Container(
                  width: AppDimensions.height10 * 8.39,
                  height: AppDimensions.height10 * 9.3,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 2.03),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/orange_flair.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 37.4,
                height: AppDimensions.height10 * 14.7,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.81),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: const Color(0xFFF5F5F5)),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (goal_level == 0) {
                          setState(() {
                            goal_level = 2;
                          });
                        } else if (goal_level == 2) {
                          setState(() {
                            goal_level = 0;
                          });
                        }
                        print(goal_level);
                      },
                      child: Container(
                        width: AppDimensions.height10 * 37.4,
                        height: AppDimensions.height10 * 12.0,
                        decoration: widget.premium
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Rectangle 192.png'),
                                  fit: BoxFit.cover,
                                ))
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFFF7975).withOpacity(0.8),
                                  const Color(0xFFF9DCC0).withOpacity(0)
                                ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const new_progress_score()));
                              },
                              child: Container(
                                width: goal_level == 2
                                    ? AppDimensions.height10 * 10.135
                                    : AppDimensions.height10 * 10.1,
                                height: goal_level == 2
                                    ? AppDimensions.height10 * 10.135
                                    : AppDimensions.height10 * 10.1,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 0.6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(goal_level == 2
                                        ? 'assets/images/Nebula pie 2.png'
                                        : goal_level == 3
                                            ? 'assets/images/Nebula pie 3.png'
                                            : "assets/images/Nebula Pie.png"),
                                  ),
                                  // color: Colors.amber,
                                ),
                                child: Align(
                                  alignment: goal_level != 0
                                      ? const Alignment(0, -0.1)
                                      : const Alignment(0, -0.07),
                                  child: Text(
                                    widget.premium
                                        ? goal_level == 0
                                            ? '-'
                                            : '$goal_level'
                                        : '-',
                                    style: TextStyle(
                                        fontSize: widget.premium
                                            ? goal_level == 0
                                                ? AppDimensions.height10 * 2.8
                                                : AppDimensions.height10 * 2.0
                                            : AppDimensions.height10 * 2.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF464646)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 20.9,
                              height: AppDimensions.height10 * 9.1,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      // width: AppDimensions.height10 * 16.5,
                                      height: AppDimensions.height10 * 1.9,

                                      child: Text(
                                        'Goal level evaluation',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w700,
                                            color: widget.premium
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF464646)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      // width: AppDimensions.height10 * 9.5,
                                      height: AppDimensions.height10 * 2.2,

                                      child: Text(
                                        'for 01 FEB 23!',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.5,
                                            fontWeight: FontWeight.w500,
                                            color: widget.premium
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF464646)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 20.9,
                                    height: AppDimensions.height10 * 5,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.premium
                                          ? "I'm making small steps\nforward"
                                          : 'Only available to Premium\nCustomers',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.5,
                                          fontWeight: FontWeight.w400,
                                          color: widget.premium
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFF464646)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: AppDimensions.height10 * 2.4,
                                height: AppDimensions.height10 * 1.31,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 0.8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/BTN Back.png',
                                    color: const Color(0xFFFFFFFF),
                                    //width: AppDimensions.height10 * 2.6,
                                    //height: AppDimensions.height10 * 2.6,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(-0.8, 0.875),
                      child: Container(
                        width: AppDimensions.height10 * 18.5,
                        height: AppDimensions.height10 * 1.6,
                        child: Row(
                          children: [
                            Text(
                              'Next score needed in ',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.3,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff464646)),
                            ),
                            Text(
                              '-00',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.3,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff464646)),
                            ),
                            Text(
                              ' days',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.3,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff464646)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.goal_evaluation
                        ? Container()
                        : Align(
                            alignment: const Alignment(-0.975, -1.275),
                            child: Container(
                              width: AppDimensions.height10 * 11.9,
                              height: AppDimensions.height10 * 2.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10 * 2.0),
                                  color: const Color(0xFFFFFFFF)),
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 0.8,
                                    top: AppDimensions.height10 * 0.5,
                                    bottom: AppDimensions.height10 * 0.5),
                                child: Text(
                                  'Score needed!',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF646464)),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.isActive
                      ? widget.goal_evaluation
                          ? Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const multiple_goal_inactive(
                                      isActive: true)))
                          : Navigator.push(
                              context,
                              FadePageRoute(
                                  page: const goal_inactive(isActive: true)))
                      : Navigator.push(
                          context,
                          FadePageRoute(
                              page: const goal_inactive(
                            isActive: false,
                          )));
                },
                child: Container(
                  width: AppDimensions.height10 * 37.4,
                  height: AppDimensions.height10 * 6.0,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                  padding: EdgeInsets.only(
                      left: AppDimensions.height10 * 2.0,
                      right: AppDimensions.height10 * 1.9),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: const Color(0xFFF5F5F5),
                    border: Border.all(
                        color: const Color(0xFFFFFFFF),
                        width: AppDimensions.height10 * 0.1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'This goal is ',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: widget.isActive
                                      ? const Color(0xFF156F6D)
                                      : const Color(0xFFDE7A11)),
                            ),
                            widget.isActive
                                ? Text(
                                    'Active',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF156F6D)),
                                  )
                                : Text(
                                    'Inactive',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFFDE7A11)),
                                  )
                          ],
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 3.6,
                        height: AppDimensions.height10 * 2.2,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF437296),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
              ),
              widget.goal_evaluation
                  ? Container(
                      width: AppDimensions.height10 * 45.4,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 3.0,
                        //  left: AppDimensions.height10 * 2.6
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const practiceMenu(
                                      goal_eval: true,
                                    )));
                              },
                              child: Container(
                                width: AppDimensions.height10 * 13.8,
                                height: AppDimensions.height10 * 13.8,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 2.6),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Ellipse 158.png'),
                                  fit: BoxFit.contain,
                                )),
                                child: Center(
                                  child: Text(
                                    'Meditation',
                                    style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10 * 13.8,
                              width: AppDimensions.height10 * 13.8,
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.height10 * 2.0),
                              decoration: const BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse 157.png'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                  child: Text(
                                'Count\ndown',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.8,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                            ),
                            Container(
                              height: AppDimensions.height10 * 13.8,
                              width: AppDimensions.height10 * 13.8,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 4.0),
                              decoration: const BoxDecoration(
                                  //color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Ellipse orange.png'),
                                      fit: BoxFit.contain)),
                              child: Center(
                                  child: Text(
                                'Count\ntemper\nepisodes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppDimensions.height10 * 1.8,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const practiceMenu(
                              goal_eval: true,
                            )));
                      },
                      child: Container(
                        width: AppDimensions.height10 * 13.8,
                        height: AppDimensions.height10 * 13.8,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/Ellipse 158.png'),
                          fit: BoxFit.contain,
                        )),
                        child: Center(
                          child: Text(
                            'Meditation',
                            style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.8,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
              Container(
                width: double.infinity,
                height: AppDimensions.height10 * 0.1,
                color: const Color(0xFFFFFFFF).withOpacity(0.5),
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 20.0,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10 * 2.0,
                  //bottom: AppDimensions.height10 * 8.4
                ),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 6.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.height10 * 2.0),
                        color: const Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 18.5,
                            height: AppDimensions.height10 * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.99),
                            child: Text(
                              'Progress report  (00)',
                              style: TextStyle(
                                color: const Color(0xff646464),
                                fontSize: AppDimensions.height10 * 1.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                              width: AppDimensions.height10 * 2.4,
                              height: AppDimensions.height10 * 1.39,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 2.391),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  //width: AppDimensions.height10 * 2.6,
                                  //height: AppDimensions.height10 * 2.6,
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: AppDimensions.height10 * 36.0,
                        height: AppDimensions.height10 * 6.0,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: widget.premium
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFFFFFF).withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppDimensions.height10 * 19.2,
                              height: AppDimensions.height10 * 2.2,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 1.99),
                              child: Text(
                                widget.premium
                                    ? 'Timeline'
                                    : 'Timeline (Premium only)',
                                style: TextStyle(
                                  color: const Color(0xff646464),
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                                width: AppDimensions.height10 * 2.4,
                                height: AppDimensions.height10 * 1.39,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 2.391),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/BTN Back.png',
                                    //width: AppDimensions.height10 * 2.6,
                                    //height: AppDimensions.height10 * 2.6,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, FadePageRoute(page: const StarReview()));
                      },
                      child: Container(
                        width: AppDimensions.height10 * 36.0,
                        height: AppDimensions.height10 * 6.0,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: const Color(0xFFFFFFFF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppDimensions.height10 * 18.5,
                              height: AppDimensions.height10 * 2.2,
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 1.99),
                              child: Text(
                                'Goal details',
                                style: TextStyle(
                                  color: const Color(0xff646464),
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                                width: AppDimensions.height10 * 2.4,
                                height: AppDimensions.height10 * 1.39,
                                margin: EdgeInsets.only(
                                    right: AppDimensions.height10 * 2.391),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/BTN Back.png',
                                    //width: AppDimensions.height10 * 2.6,
                                    //height: AppDimensions.height10 * 2.6,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              widget.goal_evaluation
                  ? Container(
                      width: AppDimensions.height10 * 17.0,
                      height: AppDimensions.height10 * 0.5,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 14.1,
                          bottom: AppDimensions.height10 * 1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0),
                          color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                    )
                  : SizedBox(
                      height: AppDimensions.height10 * 8.4,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
