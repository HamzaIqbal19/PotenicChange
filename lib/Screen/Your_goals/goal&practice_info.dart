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
              width: AppDimensions.height10 * 6.5,
              height: AppDimensions.height10 * 6.5,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 6.4),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/menu_goals_p.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: AppDimensions.height10 * 15.4,
              height: AppDimensions.height10 * 3.4,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 0.6),
              child: Center(
                child: Text(
                  'Your Goals',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 2.8,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)),
                ),
              ),
            ),
            Container(
              width: AppDimensions.height10 * 22.1,
              height: AppDimensions.height10 * 2.2,
              margin: EdgeInsets.only(
                top: AppDimensions.height10 * 0.4,
              ),
              child: Center(
                child: Text(
                  'All your goals in one place',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.8,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            width: AppDimensions.height10 * 39.4,
            height: AppDimensions.height10 * 51.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppDimensions.height10 * 2.0),
                    topRight: Radius.circular(AppDimensions.height10 * 2.0)),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
            child: Column(
              // alignment: AlignmentDirectional.topCenter,
              //  mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.height10 * 2.6,
                      height: AppDimensions.height10 * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 1.9,
                          right: AppDimensions.height10 * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.png'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10 * 1.5,
                      bottom: AppDimensions.height10 * 1.9),
                  child: Image.asset(
                    'assets/images/potenic__icon.png',
                    width: AppDimensions.height10 * 8.202,
                    height: AppDimensions.height10 * 11.2,
                  ),
                ),
                Container(
                  height: AppDimensions.height10 * 3.6,
                  width: AppDimensions.height10 * 28.6,
                  child: Center(
                    child: Text(
                      'Goal & Practice',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.height10 * 3.0,
                          color: Color(0xFF437296)),
                    ),
                  ),
                ),
                Container(
                  //  height: AppDimensions.height10 * 23.8,
                  width: AppDimensions.height10 * 35.2,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.1),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'laila',
                          height: AppDimensions.height10 * 0.15,
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF437296),
                        ),
                        children: [
                          TextSpan(
                            text:
                                'This is a place to view your goals and their practices.\nYou can view all your ',
                          ),
                          TextSpan(
                              text: 'active goals',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text:
                                  ' that you’re\ncurrently working on and also check your '),
                          TextSpan(
                              text: 'inactive\ngoals ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text:
                                  'that you’ve created and saved for later.\n\n'),
                          TextSpan(text: 'You will be able to identify which '),
                          TextSpan(
                              text: 'goal is active ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: 'or\n'),
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
                                  '. If you click on a\ngoal panel window it will take you to a menu, where\nyou can further manage your goal status and\npractices assigned to it.'),
                          TextSpan(text: '\n\nIf your '),
                          TextSpan(
                              text: 'goal is active',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(
                              text: ', you will be able to see your\ncurrent '),
                          TextSpan(
                              text: 'goal level ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: 'and '),
                          TextSpan(
                              text: 'number of active days',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          TextSpan(text: ' you’ve\nbeen working on it.')
                        ]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

void prac_info_sheet(canceled) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: canceled,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10 * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10 * 39.4,
          height: AppDimensions.height10 * 57.0,
          margin: EdgeInsets.only(
              left: AppDimensions.height10 * 1.0,
              right: AppDimensions.height10 * 1.0,
              bottom: AppDimensions.height10 * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.height10 * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.9,
                        right: AppDimensions.height10 * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 1.5,
                    bottom: AppDimensions.height10 * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.png',
                  width: AppDimensions.height10 * 8.202,
                  height: AppDimensions.height10 * 11.2,
                ),
              ),
              Container(
                height: AppDimensions.height10 * 3.6,
                width: AppDimensions.height10 * 28.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.4),
                child: Center(
                  child: Text(
                    'Goal & Practice',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.height10 * 3.0,
                        color: Color(0xFF437296)),
                  ),
                ),
              ),
              Container(
                height: AppDimensions.height10 * 29.9,
                width: AppDimensions.height10 * 32.7,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.2),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.4,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF437296),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'This is a place to view your goals and their practices.\nYou can view all your ',
                        ),
                        TextSpan(
                            text: 'active goals',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(
                            text:
                                ' that you’re\ncurrently working on and also check your '),
                        TextSpan(
                            text: 'inactive\ngoals',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(
                            text:
                                'that you’ve created and saved for\nlater.\n\n'),
                        TextSpan(text: 'You will be able to identify which '),
                        TextSpan(
                            text: 'goal is active ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(text: 'or\n'),
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
                                '. If you click on a\ngoal panel window it will take you to a menu, where\nyou can further manage your goal status and\npractices assigned to it.'),
                        TextSpan(text: '\n\nIf your '),
                        TextSpan(
                            text: 'goal is active',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(
                            text: ', you will be able to see your\ncurrent '),
                        TextSpan(
                            text: 'goal level ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(text: 'and '),
                        TextSpan(
                            text: 'number of active days',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(text: ' you’ve\nbeen working on it.')
                      ]),
                ),
              )
            ],
          )),
    ),
  );
}
