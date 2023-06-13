// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/Your_goals/add_your_practice.dart';
import 'package:potenic_app/Screen/Your_goals/goal&practice_info.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/fading.dart';

import '../../utils/app_dimensions.dart';

class veiw_all_goals_menu extends StatelessWidget {
  const veiw_all_goals_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.png',
                width: AppDimensions.height10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        actions: [
          Center(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, FadePageRoute(page: const Categories()));
                },
                icon: Image.asset(
                  'assets/images/Addgoal.png',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
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
            children: [
              GestureDetector(
                onTap: (() => showAnimatedDialog(
                    // animationType: DialogTransitionType.fadeScale,
                    // curve: Curves.easeInOut,
                    // duration: Duration(seconds: 1),
                    context: context,
                    builder: (BuildContext context) => showBreakcomm(context))),
                child: Container(
                  width: AppDimensions.height10(context) * 6.5,
                  height: AppDimensions.height10(context) * 6.5,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 6.4),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/menu_goals_p.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 15.4,
                height: AppDimensions.height10(context) * 3.4,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.6),
                child: Center(
                  child: Text(
                    'Your Goals',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffff)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 22.1,
                height: AppDimensions.height10(context) * 2.2,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.4),
                child: Center(
                  child: Text(
                    'All your goals in one place',
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffffffff)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 39.5,
                height: AppDimensions.height10(context) * 62.9,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 20.5,
                      height: AppDimensions.height10(context) * 3.5,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 15.0,
                        top: AppDimensions.height10(context) * 1.5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 3.5,
                            height: AppDimensions.height10(context) * 3.5,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 0.8),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu_goals_b.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 13.4,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Goal & Practice',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  color: const Color(0xff437296)),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: (const goal_menu_inactive(
                              premium: true,
                              isActive: false,
                              goal_evaluation: false,
                            ))));
                      },
                      child: const goal_card(
                        days_text: '0',
                        goal_level: '-',
                        isActive: false,
                        add_practice: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 39.5,
                height: AppDimensions.height10(context) * 62.9,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 20.5,
                      height: AppDimensions.height10(context) * 3.5,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 15.0,
                        top: AppDimensions.height10(context) * 1.5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 3.5,
                            height: AppDimensions.height10(context) * 3.5,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 0.8),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu_goals_b.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 13.4,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Goal & Practice',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  color: const Color(0xff437296)),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: (const goal_menu_inactive(
                              premium: false,
                              isActive: true,
                              goal_evaluation: false,
                            ))));
                      },
                      child: const goal_card(
                        days_text: '10',
                        goal_level: '1',
                        isActive: true,
                        add_practice: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 39.5,
                height: AppDimensions.height10(context) * 62.9,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 4.1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 2.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 20.5,
                      height: AppDimensions.height10(context) * 3.5,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10(context) * 15.0,
                        top: AppDimensions.height10(context) * 1.5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 3.5,
                            height: AppDimensions.height10(context) * 3.5,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 0.8),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu_goals_b.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 13.4,
                            height: AppDimensions.height10(context) * 2.2,
                            child: Text(
                              'Goal & Practice',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.8,
                                  color: const Color(0xff437296)),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const multiple_goal_inactive(
                                    isActive: false)));
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 35.3,
                        height: AppDimensions.height10(context) * 51.8,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Mask Group.png'),
                              fit: BoxFit.cover,
                            )),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 13.9,
                              height: AppDimensions.height10(context) * 2.2,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 3.1),
                              child: Row(
                                children: [
                                  Text(
                                    'Status: ',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                  Text(
                                    'Active',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.8,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF156F6D)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 31.0,
                              height: AppDimensions.height10(context) * 26.8,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.9),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 26.8,
                                    height:
                                        AppDimensions.height10(context) * 26.8,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/orange_moon.png'),
                                            fit: BoxFit.cover)),
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: const Alignment(0, -0.5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0),
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      19.9,
                                                  child: Text(
                                                    'Control my anger',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            2.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFF5B74A6)),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Align(
                                          alignment: const Alignment(0, -0.22),
                                          child: Text(
                                              '“I am someone who is in\ncontrol of my anger”',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.68,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.15,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xFF5B74A6))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, 0.8),
                                  child: SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 31.0,
                                    height:
                                        AppDimensions.height10(context) * 8.9,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const Alignment(0.485, 0.8),
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            decoration: const BoxDecoration(
                                                //color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Ellipse blue.png'),
                                                    fit: BoxFit.contain)),
                                            child: Center(
                                                child: Text(
                                              'Mirror\npractice',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(0.05, 0.8),
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.9,
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
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(-0.5, 0.8),
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            decoration: const BoxDecoration(
                                                //color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Ellipse purple.png'),
                                                    fit: BoxFit.contain)),
                                            child: Stack(children: [
                                              Center(
                                                  child: Text(
                                                'Count\ndown',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.4,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                            ]),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(-1, 0.8),
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            width: AppDimensions.height10(
                                                    context) *
                                                8.9,
                                            decoration: const BoxDecoration(
                                                //color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Ellipse 158.png'),
                                                    fit: BoxFit.contain)),
                                            child: Center(
                                                child: Text(
                                              'Meditation',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(0.99, 0.3),
                                          child: Container(
                                            height: AppDimensions.height10(
                                                    context) *
                                                5.5,
                                            width: AppDimensions.height10(
                                                    context) *
                                                5.5,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.2,
                                                    color: const Color(
                                                        0xffffffff))),
                                            child: Center(
                                                child: Text(
                                              '+2',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.8,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 25.8,
                              height: AppDimensions.height10(context) * 11.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 11.4,
                                    height:
                                        AppDimensions.height10(context) * 11.4,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  9.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.55,
                                          child: Text(
                                            'No. of\nActive days',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF437296)),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  6.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.3,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.8),
                                          child: Text(
                                            '21',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF464646)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 11.4,
                                    height:
                                        AppDimensions.height10(context) * 11.4,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  9.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          child: Text(
                                            'Goal\nLevel',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.4,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF437296)),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  6.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.3,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  0.8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '2',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.8,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF464646)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: AppDimensions.height10(
                                                            context) *
                                                        1.5),
                                                child: Text(
                                                  '/5',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: const Color(
                                                          0xFF464646)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const goal_prac_info()));
                              },
                              child: Align(
                                alignment: const Alignment(0.92, 0),
                                child: Container(
                                  width: AppDimensions.height10(context) * 3.0,
                                  height: AppDimensions.height10(context) * 3.0,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ic_info_outline.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 8.1),
                child: Container(
                  width: AppDimensions.height10(context) * 39.5,
                  height: AppDimensions.height10(context) * 62.9,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 4.1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 2.0),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 20.5,
                        height: AppDimensions.height10(context) * 3.5,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.5,
                          right: AppDimensions.height10(context) * 15.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 3.5,
                              height: AppDimensions.height10(context) * 3.5,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10(context) * 0.8),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/menu_goals_b.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: AppDimensions.height10(context) * 13.4,
                              height: AppDimensions.height10(context) * 2.2,
                              child: Text(
                                'Goal & Practice',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.8,
                                    color: const Color(0xff437296)),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              FadePageRoute(page: const add_your_practice()));
                        },
                        child: const goal_card(
                          days_text: '0',
                          goal_level: '-',
                          isActive: false,
                          add_practice: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class goal_card extends StatelessWidget {
  final bool isActive;
  final String days_text;
  final String goal_level;
  final bool add_practice;

  const goal_card(
      {super.key,
      required this.days_text,
      required this.goal_level,
      required this.isActive,
      required this.add_practice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10(context) * 35.3,
      height: AppDimensions.height10(context) * 51.8,
      margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/Mask Group.png'),
            fit: BoxFit.cover,
          )),
      child: Column(
        children: [
          Container(
            width: AppDimensions.height10(context) * 13.9,
            height: AppDimensions.height10(context) * 2.2,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 3.1),
            child: Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF)),
                ),
                isActive
                    ? Text(
                        'Active',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.8,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF156F6D)),
                      )
                    : Text(
                        'Inactive',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.8,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFDE7A11)),
                      )
              ],
            ),
          ),
          Container(
            width: AppDimensions.height10(context) * 26.8,
            height: AppDimensions.height10(context) * 26.8,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.9),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: AppDimensions.height10(context) * 26.8,
                  height: AppDimensions.height10(context) * 26.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/orange_moon.png'),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Align(
                          alignment: const Alignment(0, -0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0),
                                width: AppDimensions.height10(context) * 19.9,
                                child: Text(
                                  'Control my anger',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF5B74A6)),
                                ),
                              ),
                            ],
                          )),
                      Align(
                        alignment: const Alignment(0, -0.20),
                        child: Text(
                            '“I am someone who is in\ncontrol of my anger”',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                height: AppDimensions.height10(context) * 0.15,
                                fontSize:
                                    AppDimensions.height10(context) * 1.68,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF5B74A6))),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.8),
                child: add_practice
                    ? Container(
                        height: AppDimensions.height10(context) * 8.9,
                        width: AppDimensions.height10(context) * 8.9,
                        decoration: const BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Ellipse_dotted_grey.png'),
                                fit: BoxFit.contain)),
                        child: Stack(children: [
                          Center(
                              child: Text(
                            'Add\npractice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400),
                          )),
                        ]),
                      )
                    : Container(
                        height: AppDimensions.height10(context) * 8.9,
                        width: AppDimensions.height10(context) * 8.9,
                        decoration: const BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Ellipse 158.png'),
                                fit: BoxFit.contain)),
                        child: Center(
                            child: Text(
                          'Meditation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize: AppDimensions.height10(context) * 1.4,
                              fontWeight: FontWeight.w400),
                        )),
                      ),
              ),
            ]),
          ),
          Container(
            width: AppDimensions.height10(context) * 25.8,
            height: AppDimensions.height10(context) * 11.4,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: AppDimensions.height10(context) * 11.4,
                  height: AppDimensions.height10(context) * 11.4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensions.height10(context) * 9.3,
                        height: AppDimensions.height10(context) * 3.55,
                        child: Text(
                          'No. of\nActive days',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 6.3,
                        height: AppDimensions.height10(context) * 3.3,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.8),
                        child: Text(
                          days_text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.8,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF464646)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10(context) * 11.4,
                  height: AppDimensions.height10(context) * 11.4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppDimensions.height10(context) * 9.3,
                        height: AppDimensions.height10(context) * 3.4,
                        child: Text(
                          'Goal\nLevel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 6.3,
                        height: AppDimensions.height10(context) * 3.3,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              goal_level,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF464646)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.5),
                              child: Text(
                                '/5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.0,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFF464646)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, FadePageRoute(page: const goal_prac_info()));
            },
            child: Align(
              alignment: const Alignment(0.92, 0),
              child: Container(
                width: AppDimensions.height10(context) * 3.0,
                height: AppDimensions.height10(context) * 3.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ic_info_outline.png'),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showBreakcomm(BuildContext context) {
  SizedBox(
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
          "Break commitment & stop goal",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF000000),
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
        height: AppDimensions.height10(context) * 3.3,
        width: AppDimensions.height10(context) * 23.8,
        child: Text(
          "Are you sure you want to stop this goal\nand break your commitment?",
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
                    'No',
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
                  'Break commitment',
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
