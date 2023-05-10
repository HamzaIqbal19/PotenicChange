import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Your_goals/add_your_practice.dart';
import 'package:potenic_app/Screen/Your_goals/goal&practice_info.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';

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
                  'assets/images/Addgoal.png',
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
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
              Container(
                width: AppDimensions.height10 * 6.5,
                height: AppDimensions.height10 * 6.5,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 6.4),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/menu_goals_p.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: AppDimensions.height10 * 15.4,
                height: AppDimensions.height10 * 3.4,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                child: Text(
                  'Your Goals',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.8,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 22.1,
                height: AppDimensions.height10 * 2.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.4),
                child: Text(
                  'All your goals in one place',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.8,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffffffff)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 39.5,
                height: AppDimensions.height10 * 62.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.1),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 20.5,
                      height: AppDimensions.height10 * 3.5,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10 * 13.0,
                        top: AppDimensions.height10 * 1.5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 3.5,
                            height: AppDimensions.height10 * 3.5,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 0.8),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu_goals_b.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 13.4,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Goal & Practice',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.height10 * 1.8,
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
                            MaterialPageRoute(
                                builder: (context) => const goal_menu_inactive(
                                      premium: true,
                                      isActive: false,
                                      goal_evaluation: false,
                                    )));
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
                width: AppDimensions.height10 * 39.5,
                height: AppDimensions.height10 * 62.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.1),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 20.5,
                      height: AppDimensions.height10 * 3.5,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10 * 13.0,
                        top: AppDimensions.height10 * 1.5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 3.5,
                            height: AppDimensions.height10 * 3.5,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 0.8),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu_goals_b.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 13.4,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Goal & Practice',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.height10 * 1.8,
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
                            MaterialPageRoute(
                                builder: (context) => const goal_menu_inactive(
                                      premium: false,
                                      isActive: true,
                                      goal_evaluation: false,
                                    )));
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
                width: AppDimensions.height10 * 39.5,
                height: AppDimensions.height10 * 62.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 4.1),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 20.5,
                      height: AppDimensions.height10 * 3.5,
                      margin: EdgeInsets.only(
                        right: AppDimensions.height10 * 13.0,
                        top: AppDimensions.height10 * 1.5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 3.5,
                            height: AppDimensions.height10 * 3.5,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 0.8),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu_goals_b.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 13.4,
                            height: AppDimensions.height10 * 2.2,
                            child: Text(
                              'Goal & Practice',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.height10 * 1.8,
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
                            MaterialPageRoute(
                                builder: (context) =>
                                    const multiple_goal_inactive(
                                        isActive: false)));
                      },
                      child: Container(
                        width: AppDimensions.height10 * 35.3,
                        height: AppDimensions.height10 * 51.8,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Mask Group.png'),
                              fit: BoxFit.cover,
                            )),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 13.9,
                              height: AppDimensions.height10 * 2.2,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 3.1),
                              child: Row(
                                children: [
                                  Text(
                                    'Status: ',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFFFFFF)),
                                  ),
                                  Text(
                                    'Active',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.8,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF156F6D)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 31.0,
                              height: AppDimensions.height10 * 26.8,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.9),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: AppDimensions.height10 * 26.8,
                                    height: AppDimensions.height10 * 26.8,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/image3.png'),
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
                                                              .height10 *
                                                          0),
                                                  width:
                                                      AppDimensions.height10 *
                                                          19.9,
                                                  child: Text(
                                                    'Control my anger',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10 *
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
                                          alignment: const Alignment(0, -0.1),
                                          child: Text(
                                              '“I am someone who is in\ncontrol of my anger”',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.height10 *
                                                          1.6,
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
                                  child: Container(
                                    width: AppDimensions.height10 * 31.0,
                                    height: AppDimensions.height10 * 8.9,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const Alignment(0.485, 0.8),
                                          child: Container(
                                            height:
                                                AppDimensions.height10 * 8.9,
                                            width: AppDimensions.height10 * 8.9,
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
                                                      AppDimensions.height10 *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(0.05, 0.8),
                                          child: Container(
                                            height:
                                                AppDimensions.height10 * 8.9,
                                            width: AppDimensions.height10 * 8.9,
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
                                                      AppDimensions.height10 *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(-0.5, 0.8),
                                          child: Container(
                                            height:
                                                AppDimensions.height10 * 8.9,
                                            width: AppDimensions.height10 * 8.9,
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
                                                        AppDimensions.height10 *
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
                                            height:
                                                AppDimensions.height10 * 8.9,
                                            width: AppDimensions.height10 * 8.9,
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
                                                      AppDimensions.height10 *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                          ),
                                        ),
                                        Align(
                                          alignment: const Alignment(1, 0.3),
                                          child: Container(
                                            height:
                                                AppDimensions.height10 * 5.5,
                                            width: AppDimensions.height10 * 5.5,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width:
                                                        AppDimensions.height10 *
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
                                                      AppDimensions.height10 *
                                                          1.4,
                                                  fontWeight: FontWeight.w400),
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
                              width: AppDimensions.height10 * 25.8,
                              height: AppDimensions.height10 * 11.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: AppDimensions.height10 * 11.4,
                                    height: AppDimensions.height10 * 11.4,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: AppDimensions.height10 * 9.3,
                                          height: AppDimensions.height10 * 3.55,
                                          child: Text(
                                            'No. of\nActive days',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF437296)),
                                          ),
                                        ),
                                        Container(
                                          width: AppDimensions.height10 * 6.3,
                                          height: AppDimensions.height10 * 3.3,
                                          margin: EdgeInsets.only(
                                              top:
                                                  AppDimensions.height10 * 0.8),
                                          child: Text(
                                            '21',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        2.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF464646)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 11.4,
                                    height: AppDimensions.height10 * 11.4,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFFFFF)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: AppDimensions.height10 * 9.3,
                                          height: AppDimensions.height10 * 3.4,
                                          child: Text(
                                            'Goal\nLevel',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.4,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF437296)),
                                          ),
                                        ),
                                        Container(
                                          width: AppDimensions.height10 * 6.3,
                                          height: AppDimensions.height10 * 3.3,
                                          margin: EdgeInsets.only(
                                              top:
                                                  AppDimensions.height10 * 0.8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '2',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            2.8,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xFF464646)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top:
                                                        AppDimensions.height10 *
                                                            1.5),
                                                child: Text(
                                                  '/5',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10 *
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
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const goal_prac_info()));
                              },
                              child: Align(
                                alignment: const Alignment(0.955, 0),
                                child: Container(
                                  width: AppDimensions.height10 * 2.5,
                                  height: AppDimensions.height10 * 2.5,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 0.0),
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
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 8.1),
                child: Container(
                  width: AppDimensions.height10 * 39.5,
                  height: AppDimensions.height10 * 62.9,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 4.1),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.height10 * 2.0),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10 * 20.5,
                        height: AppDimensions.height10 * 3.5,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 1.5,
                          right: AppDimensions.height10 * 13.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 3.5,
                              height: AppDimensions.height10 * 3.5,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 0.8),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/menu_goals_b.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: AppDimensions.height10 * 13.4,
                              height: AppDimensions.height10 * 2.2,
                              child: Text(
                                'Goal & Practice',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.height10 * 1.8,
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
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const add_your_practice()));
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
      width: AppDimensions.height10 * 35.3,
      height: AppDimensions.height10 * 51.8,
      margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.height10 * 2.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/Mask Group.png'),
            fit: BoxFit.cover,
          )),
      child: Column(
        children: [
          Container(
            width: AppDimensions.height10 * 13.9,
            height: AppDimensions.height10 * 2.2,
            margin: EdgeInsets.only(top: AppDimensions.height10 * 3.1),
            child: Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.8,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF)),
                ),
                isActive
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
            width: AppDimensions.height10 * 26.8,
            height: AppDimensions.height10 * 26.8,
            margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: AppDimensions.height10 * 26.8,
                  height: AppDimensions.height10 * 26.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/image3.png'),
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
                                    bottom: AppDimensions.height10 * 0),
                                width: AppDimensions.height10 * 19.9,
                                child: Text(
                                  'Control my anger',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF5B74A6)),
                                ),
                              ),
                            ],
                          )),
                      Align(
                        alignment: const Alignment(0, -0.1),
                        child: Text(
                            '“I am someone who is in\ncontrol of my anger”',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppDimensions.height10 * 1.6,
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
                        height: AppDimensions.height10 * 8.9,
                        width: AppDimensions.height10 * 8.9,
                        decoration: const BoxDecoration(
                            //color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Ellipse_dotted_grey.png'),
                                fit: BoxFit.contain)),
                        child: Stack(children: [
                          Center(
                              child: Text(
                            'Add practice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400),
                          )),
                        ]),
                      )
                    : Container(
                        height: AppDimensions.height10 * 8.9,
                        width: AppDimensions.height10 * 8.9,
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
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w400),
                        )),
                      ),
              ),
            ]),
          ),
          Container(
            width: AppDimensions.height10 * 25.8,
            height: AppDimensions.height10 * 11.4,
            margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: AppDimensions.height10 * 11.4,
                  height: AppDimensions.height10 * 11.4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 9.3,
                        height: AppDimensions.height10 * 3.55,
                        child: Text(
                          'No. of\nActive days',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 6.3,
                        height: AppDimensions.height10 * 3.3,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.8),
                        child: Text(
                          days_text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.8,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF464646)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 11.4,
                  height: AppDimensions.height10 * 11.4,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 9.3,
                        height: AppDimensions.height10 * 3.4,
                        child: Text(
                          'Goal\nLevel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 6.3,
                        height: AppDimensions.height10 * 3.3,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              goal_level,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 2.8,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF464646)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.5),
                              child: Text(
                                '/5',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.0,
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => const goal_prac_info()));
            },
            child: Align(
              alignment: const Alignment(0.955, 0),
              child: Container(
                width: AppDimensions.height10 * 2.5,
                height: AppDimensions.height10 * 2.5,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.0),
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
