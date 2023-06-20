import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class goal_prac_info extends StatelessWidget {
  const goal_prac_info({super.key});

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
                onPressed: () {},
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
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: AppDimensions.height10(context) * 6.5,
              height: AppDimensions.height10(context) * 6.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 6.4),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/menu_goals_p.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: AppDimensions.height10(context) * 15.4,
              height: AppDimensions.height10(context) * 3.4,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 0.6),
              child: Text(
                'Your Goals',
                style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.8,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff)),
              ),
            ),
            Container(
              width: AppDimensions.height10(context) * 22.1,
              height: AppDimensions.height10(context) * 2.2,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 0.4,
              ),
              child: Text(
                'All your goals in one place',
                style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 1.8,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffffffff)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xFFBFB1BE),
          child: Container(
            height: AppDimensions.height10(context) * 45.1,
            width: AppDimensions.height10(context) * 41.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(AppDimensions.height10(context) * 2.0),
                  topRight:
                      Radius.circular(AppDimensions.height10(context) * 2.0)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffE1B3B7),
                  Color(0xffC9B9CB),
                ],
              ),
            ),
            child: Column(
              children: [
                Align(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 37.3),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              'assets/images/Close_blue.png',
                              width: AppDimensions.height10(context) * 2.6,
                              height: AppDimensions.height10(context) * 2.6,
                              fit: BoxFit.cover,
                            )),
                      )),
                ),
                Container(
                  height: AppDimensions.height10(context) * 3.6,
                  width: AppDimensions.height10(context) * 28.6,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 0.4),
                  child: Center(
                    child: Text(
                      'Goal & Practice',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.height10(context) * 3.0,
                          color: Color(0xFF437296)),
                    ),
                  ),
                ),
                Container(
                  height: AppDimensions.height10(context) * 29.9,
                  width: AppDimensions.height10(context) * 32.7,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 2.2),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF437296),
                        ),
                        children: [
                          TextSpan(
                            text:
                                'This is a place to view your goals and their practices. You can view all your ',
                          ),
                          TextSpan(
                              text: 'active goals',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text:
                                  ' that you’re currently working on and also check your '),
                          TextSpan(
                              text: 'inactive goals',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text:
                                  'that you’ve created and saved for\nlater.\n\n\n'),
                          TextSpan(text: 'You will be able to identify which '),
                          TextSpan(
                              text: 'goal is active ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: 'or '),
                          TextSpan(
                              text: 'inactive',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: ' by checking their '),
                          TextSpan(
                              text: ' status',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text:
                                  '. If you click on a goal panel window it will take you to a menu,\nwhere you can further manage your goal status\nand practices assigned to it.'),
                          TextSpan(text: '\n\n\nIf your '),
                          TextSpan(
                              text: 'goal is active',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text: ', you will be able to see your current '),
                          TextSpan(
                              text: 'goal level ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: 'and '),
                          TextSpan(
                              text: 'number of active days ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: '\nyou’ve been working on it.')
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
