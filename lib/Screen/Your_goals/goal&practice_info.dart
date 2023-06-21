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
                'assets/images/Back.webp',
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
                  'assets/images/Addgoal.webp',
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
          image: AssetImage('assets/images/Mask Group.webp'),
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/menu_goals_p.webp'),
                      fit: BoxFit.cover)),
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
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 0.4,
              ),
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
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            width: AppDimensions.height10(context) * 39.4,
            height: AppDimensions.height10(context) * 51.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(AppDimensions.height10(context) * 2.0),
                    topRight:
                        Radius.circular(AppDimensions.height10(context) * 2.0)),
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
                  // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                  alignment: const Alignment(1, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: AppDimensions.height10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.9,
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Close_blue.webp'))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.5,
                      bottom: AppDimensions.height10(context) * 1.9),
                  child: Image.asset(
                    'assets/images/potenic__icon.webp',
                    width: AppDimensions.height10(context) * 8.202,
                    height: AppDimensions.height10(context) * 11.2,
                  ),
                ),
                Container(
                  height: AppDimensions.height10(context) * 3.6,
                  width: AppDimensions.height10(context) * 28.6,
                  child: Center(
                    child: Text(
                      'Goal & Practice',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.height10(context) * 3.0,
                          color: const Color(0xFF437296)),
                    ),
                  ),
                ),
                Container(
                  //  height: AppDimensions.height10(context) * 23.8,
                  width: AppDimensions.height10(context) * 35.2,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.1),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'laila',
                          height: AppDimensions.height10(context) * 0.15,
                          fontSize: AppDimensions.height10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF437296),
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'This is a place to view your goals and their practices.\nYou can view all your ',
                          ),
                          const TextSpan(
                              text: 'active goals',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(
                              text:
                                  ' that you’re\ncurrently working on and also check your '),
                          const TextSpan(
                              text: 'inactive\ngoals ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(
                              text:
                                  'that you’ve created and saved for later.\n\n'),
                          const TextSpan(
                              text: 'You will be able to identify which '),
                          const TextSpan(
                              text: 'goal is active ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(text: 'or\n'),
                          const TextSpan(
                              text: 'inactive',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(text: ' by checking their '),
                          const TextSpan(
                              text: ' status',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(
                              text:
                                  '. If you click on a\ngoal panel window it will take you to a menu, where\nyou can further manage your goal status and\npractices assigned to it.'),
                          const TextSpan(text: '\n\nIf your '),
                          const TextSpan(
                              text: 'goal is active',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(
                              text: ', you will be able to see your\ncurrent '),
                          const TextSpan(
                              text: 'goal level ',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(text: 'and '),
                          const TextSpan(
                              text: 'number of active days',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          const TextSpan(text: ' you’ve\nbeen working on it.')
                        ]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

void prac_info_sheet(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10(context) * 39.4,
          height: AppDimensions.height10(context) * 57.0,
          margin: EdgeInsets.only(
              left: AppDimensions.height10(context) * 1.0,
              right: AppDimensions.height10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
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
                // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.height10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                height: AppDimensions.height10(context) * 3.6,
                width: AppDimensions.height10(context) * 28.6,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.4),
                child: Center(
                  child: Text(
                    'Goal & Practice',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.height10(context) * 3.0,
                        color: const Color(0xFF437296)),
                  ),
                ),
              ),
              Container(
                height: AppDimensions.height10(context) * 29.9,
                width: AppDimensions.height10(context) * 32.7,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.2),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF437296),
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'This is a place to view your goals and their practices.\nYou can view all your ',
                        ),
                        const TextSpan(
                            text: 'active goals',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(
                            text:
                                ' that you’re\ncurrently working on and also check your '),
                        const TextSpan(
                            text: 'inactive\ngoals',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(
                            text:
                                'that you’ve created and saved for\nlater.\n\n'),
                        const TextSpan(
                            text: 'You will be able to identify which '),
                        const TextSpan(
                            text: 'goal is active ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(text: 'or\n'),
                        const TextSpan(
                            text: 'inactive',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(text: ' by checking their '),
                        const TextSpan(
                            text: ' status',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(
                            text:
                                '. If you click on a\ngoal panel window it will take you to a menu, where\nyou can further manage your goal status and\npractices assigned to it.'),
                        const TextSpan(text: '\n\nIf your '),
                        const TextSpan(
                            text: 'goal is active',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(
                            text: ', you will be able to see your\ncurrent '),
                        const TextSpan(
                            text: 'goal level ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(text: 'and '),
                        const TextSpan(
                            text: 'number of active days',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        const TextSpan(text: ' you’ve\nbeen working on it.')
                      ]),
                ),
              )
            ],
          )),
    ),
  );
}
