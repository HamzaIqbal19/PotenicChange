import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/future_practice_menu.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/goalWidget.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Recording Practice Session/recordPracticeEmotions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


dashboardNoPastSession(BuildContext context, smallScreen,allGoals,pastSession ,activePractices, currentDay){

  return  SingleChildScrollView(
    child:  Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              child: Center(
                  child: Text(
                    currentDay?"You have no\nplanned sessions today":
                    pastSession
                        ? 'You had no\nsessions on this date'
                        : 'You have no\nscheduled sessions\nfor this date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: UpdatedDimensions.font10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'laila'),
                  )),
            ),
            Container(
              //height: UpdatedDimensions.height10(context) * 6.8,
              margin: EdgeInsets.only(
                  top: UpdatedDimensions.height10(context) * 2,
                  bottom: UpdatedDimensions.height10(context) * 4.2),
              child: Center(
                  child: Text(
                    currentDay?"Record a practice session from\none of your active goals below":
                    pastSession
                        ? 'If you forgot to record your\npractices, you can do it here'
                        : 'View and update your schedule\nfrom active goals below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: UpdatedDimensions.font10(context) * 1.8,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'laila'),
                  )),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allGoals.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return Container(
                  height: UpdatedDimensions.height10(context) * 31.3,
                  //width: UpdatedDimensions.width10(context) * 46.4,
                  margin: EdgeInsets.only(
                      bottom:
                      UpdatedDimensions.height10(context) * 3.2),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                      children: [
                  goalWidget(context, smallScreen
                      ? UpdatedDimensions.height10(context) * 29.9
                      : UpdatedDimensions.height10(context) * 26.8, smallScreen
                      ? UpdatedDimensions.height10(context) * 29.9
                      : UpdatedDimensions.height10(context) * 26.8, allGoals[index]
                  ['color']??'2', allGoals[index]['name'], allGoals[index]
                  ['identityStatement'][0]
                  ['text'], UpdatedDimensions.font10(context) * 2.0, UpdatedDimensions.font10(context) * 1.6, Color(0xff5B74A6)),

                    ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: allGoals[index]['userPractices']
                            .length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: ((context, index1) {
                          return Align(
                            alignment: const Alignment(0, 1),
                            child: Container(
                              margin:allGoals[index]['userPractices']
                                  .length>1? index1==0? EdgeInsets.only(left: UpdatedDimensions.width10(context)*13):EdgeInsets.zero:EdgeInsets.zero,
                              child: AnimatedScaleButton(
                                onTap: () async {
                               if( pastSession || currentDay) {
                                 Navigator.push(
                                     context,
                                     FadePageRoute(
                                         page: emotions(
                                           summary: false,
                                           pracName: allGoals[index][
                                           'userPractices']
                                           [index1]['name'],
                                           record: true,
                                           selected: 0,
                                         )));
                               }else{

                                 Navigator.pushReplacement(
                                      context,
                                      FadePageRoute(
                                          page:
                                           futurePracticeMenu(pracName: allGoals[index][
                                          'userPractices']
                                          [index1]['name'])));

                                  final SharedPreferences prefs =
                                  await _prefs;
                                  await prefs.setInt('goal_num',
                                      allGoals[index]['id']);

                                    await prefs.setInt(
                                        'prac_num',
                                        allGoals[index]
                                        ['userPractices']
                                        [index1]['id']);


                                  await prefs.setString(
                                      'practice_review',
                                      'record_session');}
                                },
                                child: practiceWidget(context, smallScreen
                                    ? UpdatedDimensions.height10(context) * 15.6
                                    : UpdatedDimensions.height10(context) * 14.1, smallScreen
                                    ? UpdatedDimensions.height10(context) * 15.6
                                    : UpdatedDimensions.height10(context) * 14.1, allGoals[index]['userPractices'][index1]['color']??'2', allGoals[index]['userPractices'][index1]['name'], 'Not Started'),
                              ),
                            ),
                          );
                        })),

                      ]),
                );
              }),
            ),
            SizedBox(
              height: UpdatedDimensions.height10(context) * 3,
            ),
            AnimatedScaleButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    FadePageRoute(page: const view_all_goals_menu()));
              },
              child: Container(
                height: UpdatedDimensions.height10(context) * 5.5,
                child: Container(
                  height: UpdatedDimensions.height10(context) * 5.2,
                  width: UpdatedDimensions.width10(context) * 24.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(
                        UpdatedDimensions.height10(context) * 5.0)),
                  ),
                  child: Center(
                      child: Text(
                        'View all your goals',
                        style: TextStyle(
                            color: const Color(0xFFFBFBFB),
                            fontSize: UpdatedDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: UpdatedDimensions.height10(context) * 10,
            )
          ],
        ),


      ],
    ),
  );
}