import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/ReviewPractice/practiceReview.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Recording Practice Session/recordPracticeEmotions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


dashboardNoPastSession(BuildContext context, allGoals,past_session ,activePractices){
  return  SingleChildScrollView(

    child:  Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 3.0,
                  ),
              child: Center(
                  child: Text(
                    past_session
                        ? 'You have no\nscheduled sessions for this date'
                        : 'You have no\nscheduled sessions\nfor this date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'laila'),
                  )),
            ),
            Container(
              //height: AppDimensions.height10(context) * 6.8,

              margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 2,
                  bottom: AppDimensions.height10(context) * 4.2),
              child: Center(
                  child: Text(
                    past_session
                        ? 'If you forgot to record your\npractices, you can do it here'
                        : 'View and update your schedule\nfrom active goals below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 1.8,
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
                  height: AppDimensions.height10(context) * 31.3,
                  //width: AppDimensions.width10(context) * 46.4,

                  margin: EdgeInsets.only(
                      bottom:
                      AppDimensions.height10(context) * 3.2),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                      children: [
                    Container(
                        width: AppDimensions.width10(context) *
                            26.8,
                        height: AppDimensions.height10(context) *
                            26.8,
                        margin: EdgeInsets.only(
                          left: AppDimensions.width10(context) *
                              2.3,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            AppDimensions.height10(context) *
                                2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(allGoals[index]
                                ['color'] ==
                                    '1'
                                    ? "assets/images/red_gradient.webp"
                                    : allGoals[index]['color'] ==
                                    '2'
                                    ? 'assets/images/orange_moon.webp'
                                    : allGoals[index]
                                ['color'] ==
                                    '3'
                                    ? "assets/images/lightGrey_gradient.webp"
                                    : allGoals[index]['color'] ==
                                    '4'
                                    ? "assets/images/lightBlue_gradient.webp"
                                    : allGoals[index]
                                ['color'] ==
                                    '5'
                                    ? "assets/images/medBlue_gradient.webp"
                                    : allGoals[index]['color'] == '6'
                                    ? "assets/images/Blue_gradient.webp"
                                    : 'assets/images/orange_moon.webp'),
                                colorFilter: const ColorFilter.mode(Color.fromRGBO(0, 0, 0, 0.5), BlendMode.dstATop),
                                fit: BoxFit.cover)),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                          SizedBox(
                            height: AppDimensions.height10(
                                context) *
                                7.5,
                          ),
                          Text(
                            allGoals[index]['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AppDimensions.font10(
                                    context) *
                                    2.0,
                                height: AppDimensions.height10(
                                    context) *
                                    0.14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff5B74A6)),
                          ),
                          SizedBox(
                            height:
                            AppDimensions.height10(context),
                          ),
                          Text(
                              allGoals[index]
                              ['identityStatement'][0]
                              ['text'],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize:
                                  AppDimensions.font10(
                                      context) *
                                      1.6,
                                  fontWeight: FontWeight.w400,
                                  color:
                                  const Color(0xff5B74A6))),
                        ])),
                    ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: past_session
                            ? activePractices[index]['practices']
                            .length
                            : allGoals[index]['userPractices']
                            .length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: ((context, index1) {
                          return Align(
                            alignment: const Alignment(0, 1),
                            child: AnimatedScaleButton(
                              onTap: () async {
                              past_session
                                    ? Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: emotions(
                                          summary: false,
                                          pracName: past_session
                                              ? activePractices[
                                          index]
                                          ['practices']
                                          [index1]['name']
                                              : allGoals[index][
                                          'userPractices']
                                          [index1]['name'],
                                          record: true,
                                          selected: 0,
                                        )))
                                    : Navigator.pushReplacement(
                                    context,
                                    FadePageRoute(
                                        page:
                                        const PracticeReview()));

                                final SharedPreferences prefs =
                                await _prefs;
                                await prefs.setInt('goal_num',
                                    allGoals[index]['id']);
                                if (past_session == true) {
                                  await prefs.setInt(
                                      'prac_num',
                                      activePractices[index]
                                      ['practices'][index1]
                                      ['id']);
                                } else {
                                  await prefs.setInt(
                                      'prac_num',
                                      allGoals[index]
                                      ['userPractices']
                                      [index1]['id']);
                                }

                                await prefs.setString(
                                    'practice_review',
                                    'record_session');
                              },
                              child: Container(
                                height: AppDimensions.height10(
                                    context) *
                                    13.8,
                                width: AppDimensions.height10(
                                    context) *
                                    13.8,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    AppDimensions.height10(
                                        context) *
                                        1),
                                margin: EdgeInsets.only(
                                    left: index1 == 0
                                        ? AppDimensions.height10(
                                        context) *
                                        2.9
                                        : 0,
                                    right: AppDimensions.height10(
                                        context) *
                                        1.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: past_session
                                          ? AssetImage(activePractices[index]
                                      ['practices']
                                      [index1]
                                      ['color']
                                          .toString() ==
                                          '1'
                                          ? "assets/images/Ellipse orange.webp"
                                          : activePractices[index]
                                      ['practices'][index1][
                                      'color']
                                          .toString() ==
                                          '2'
                                          ? 'assets/images/Ellipse 158.webp'
                                          : activePractices[index]['practices'][index1]['color']
                                          .toString() ==
                                          '3'
                                          ? "assets/images/Ellipse 157.webp"
                                          : activePractices[index]['practices'][index1]['color'].toString() ==
                                          '4'
                                          ? "assets/images/Ellipse light-blue.webp"
                                          : activePractices[index]['practices'][index1]['color'].toString() == '5'
                                          ? "assets/images/Ellipse blue.webp"
                                          : 'assets/images/Ellipse 158.webp')
                                          : AssetImage(allGoals[index]['userPractices'][index1]['color'] == '1'
                                          ? "assets/images/Ellipse orange.webp"
                                          : allGoals[index]['userPractices'][index1]['color'] == '2'
                                          ? 'assets/images/Ellipse 158.webp'
                                          : allGoals[index]['userPractices'][index1]['color'] == '3'
                                          ? "assets/images/Ellipse 157.webp"
                                          : allGoals[index]['userPractices'][index1]['color'] == '4'
                                          ? "assets/images/Ellipse light-blue.webp"
                                          : allGoals[index]['userPractices'][index1]['color'] == '5'
                                          ? "assets/images/Ellipse blue.webp"
                                          : 'assets/images/Ellipse 158.webp'),
                                      fit: BoxFit.cover),
                                ),
                                child: Center(
                                  child: Text(
                                    past_session
                                        ? activePractices[index]
                                    ['practices']
                                    [index1]['name']
                                        .toString()
                                        : allGoals[index]
                                    ['userPractices']
                                    [index1]['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'laila',
                                        fontSize:
                                        AppDimensions.font10(
                                            context) *
                                            1.8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ]),
                );
              }),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 3,
            ),
            AnimatedScaleButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    FadePageRoute(page: const view_all_goals_menu()));
              },
              child: Container(
                height: AppDimensions.height10(context) * 5.5,
                child: Container(
                  height: AppDimensions.height10(context) * 5.2,
                  width: AppDimensions.width10(context) * 24.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(
                        AppDimensions.height10(context) * 5.0)),
                  ),
                  child: Center(
                      child: Text(
                        'View all your goals',
                        style: TextStyle(
                            color: const Color(0xFFFBFBFB),
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 10,
            )
          ],
        ),


      ],
    )
        ,
  );
}