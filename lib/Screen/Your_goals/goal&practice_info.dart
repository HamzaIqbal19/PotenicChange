import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class goal_prac_info extends StatefulWidget {
  const goal_prac_info({super.key});

  @override
  State<goal_prac_info> createState() => _goal_prac_infoState();
}

class _goal_prac_infoState extends State<goal_prac_info> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBottomSheet();
  }

  getBottomSheet() {
    Timer(Duration(seconds: 5), () {
      prac_info_sheet(context);
    });
  }

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
                // width: AppDimensions.width10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.contain,
              )),
        ),
        actions: [
          Center(
            child: IconButton(
                onPressed: () async {
                  Navigator.push(
                      context, FadePageRouteReverse(page: Categories()));
                  final SharedPreferences prefs = await _prefs;
                  var route = prefs.setString('goal_route', 'view_all_goals');
                },
                icon: Image.asset(
                  'assets/images/Addgoal.webp',
                  width: AppDimensions.width10(context) * 2.6,
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
              width: AppDimensions.width10(context) * 6.5,
              height: AppDimensions.height10(context) * 6.5,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 6.4),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/menu_goals_p.webp'),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: AppDimensions.width10(context) * 15.4,
              height: AppDimensions.height10(context) * 3.4,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 0.6),
              child: Center(
                child: Text(
                  'Your Goals',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff)),
                ),
              ),
            ),
            Container(
              width: AppDimensions.width10(context) * 22.1,
              height: AppDimensions.height10(context) * 2.2,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 0.4,
              ),
              child: Center(
                child: Text(
                  'All your goals in one place',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
      // extendBody: true,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.transparent,
      //   elevation: 0,
      //   child: Container(
      //       width: AppDimensions.width10(context) * 40,

      //      padding: EdgeInsets.only(bottom: AppDimensions.height10(context)*3),
      //     margin: EdgeInsets.only(

      //         left: AppDimensions.width10(context) * 1.0,
      //         right: AppDimensions.width10(context) * 1.0,
      //         bottom: AppDimensions.height10(context) * 1.0),
      //     decoration: BoxDecoration(
      //         borderRadius:
      //             BorderRadius.circular(AppDimensions.height10(context) * 2.0),
      //         color: const Color(0xFFF5F5F5)),
      //       child: Column(
      //         // alignment: AlignmentDirectional.topCenter,
      //         //  mainAxisAlignment: MainAxisAlignment.start,
      //         //  crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Container(
      //             //color: Colors.amber,
      //             // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
      //             alignment: const Alignment(1, 0),
      //             child: GestureDetector(
      //               onTap: () {
      //                 Navigator.pop(context);
      //               },
      //               child: Container(
      //                 width: AppDimensions.width10(context) * 2.6,
      //                 height: AppDimensions.height10(context) * 2.6,
      //                 margin: EdgeInsets.only(
      //                     top: AppDimensions.height10(context) * 1.9,
      //                     right: AppDimensions.width10(context) * 1.5),
      //                 decoration: const BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     image: DecorationImage(
      //                         image:
      //                             AssetImage('assets/images/Close_blue.webp'))),
      //               ),
      //             ),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(
      //                 top: AppDimensions.height10(context) * 1.5,
      //                 bottom: AppDimensions.height10(context) * 1.9),
      //             child: Image.asset(
      //               'assets/images/potenic__icon.webp',
      //               width: AppDimensions.width10(context) * 8.202,
      //               height: AppDimensions.height10(context) * 11.2,
      //             ),
      //           ),
      //           Container(
      //             height: AppDimensions.height10(context) * 3.6,
      //             width: AppDimensions.width10(context) * 28.6,
      //             child: Center(
      //               child: Text(
      //                 'Goal & Practice',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.w700,
      //                     fontSize: AppDimensions.font10(context) * 2.8,
      //                     color: const Color(0xFF437296)),
      //               ),
      //             ),
      //           ),
      //           Container(
      //             //  height: AppDimensions.height10(context) * 23.8,
      //             width: AppDimensions.width10(context) * 35.2,
      //             margin: EdgeInsets.only(
      //                 top: AppDimensions.height10(context) * 1.1,
      //                 bottom: AppDimensions.height10(context)),
      //             child: RichText(
      //               text: TextSpan(
      //                   style: TextStyle(
      //                     fontFamily: 'laila',
      //                     //height: AppDimensions.height10(context) * 0.1,
      //                     fontSize: AppDimensions.font10(context) * 1.45,
      //                     fontWeight: FontWeight.w400,
      //                     color: const Color(0xFF437296),
      //                   ),
      //                   children: const [
      //                     TextSpan(
      //                       text:
      //                           'This is a place to view your goals and their practices.\nYou can view all your ',
      //                     ),
      //                     TextSpan(
      //                         text: 'active goals',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(
      //                         text:
      //                             ' that you’re\ncurrently working on and also check your '),
      //                     TextSpan(
      //                         text: 'inactive\ngoals ',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(
      //                         text:
      //                             'that you’ve created and saved for later.\n\n'),
      //                     TextSpan(text: 'You will be able to identify which '),
      //                     TextSpan(
      //                         text: 'goal is active ',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(text: 'or\n'),
      //                     TextSpan(
      //                         text: 'inactive',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(text: ' by checking their '),
      //                     TextSpan(
      //                         text: ' status',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(
      //                         text:
      //                             '. If you click on a\ngoal panel window it will take you to a menu, where\nyou can further manage your goal status and\npractices assigned to it.'),
      //                     TextSpan(text: '\n\nIf your '),
      //                     TextSpan(
      //                         text: 'goal is active',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(
      //                         text: ', you will be able to see your\ncurrent '),
      //                     TextSpan(
      //                         text: 'goal level ',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(text: 'and '),
      //                     TextSpan(
      //                         text: 'number of active days',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                         )),
      //                     TextSpan(text: ' you’ve\nbeen working on it.')
      //                   ]),
      //             ),
      //           )
      //         ],
      //       )),
      // ),
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
          width: AppDimensions.width10(context) * 40,
          padding: EdgeInsets.only(bottom: AppDimensions.height10(context) * 3),
          margin: EdgeInsets.only(
              left: AppDimensions.width10(context) * 1.0,
              right: AppDimensions.width10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
              color: const Color(0xFFF5F5F5)),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.width10(context) * 1.5),
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
                  width: AppDimensions.width10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                height: AppDimensions.height10(context) * 3.6,
                width: AppDimensions.width10(context) * 28.6,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.4),
                child: Center(
                  child: Text(
                    'Goal & Practice',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.font10(context) * 2.8,
                        color: const Color(0xFF437296)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 33.2,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.2),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.6,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Laila',
                        color: const Color(0xFF437296),
                      ),
                      children: const [
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
                                'that you’ve created and saved for later.\n\n'),
                        TextSpan(text: 'You will be able to identify which '),
                        TextSpan(
                            text: 'goal is active ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(text: 'or'),
                        TextSpan(
                            text: ' inactive',
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
                                '. If you click on a goal panel window it will take you to a menu, where you can further manage your goal status and practices assigned to it.'),
                        TextSpan(text: '\n\nIf your '),
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
                            text: 'number of active days',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            )),
                        TextSpan(text: ' you’ve been working on it.')
                      ]),
                ),
              )
            ],
          )),
    ),
  );
}
