// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/PracticeGoal/Create%20Practice.dart';
import 'package:potenic_app/Screen/Your_goals/add_your_practice.dart';
import 'package:potenic_app/Screen/Your_goals/goal&practice_info.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class veiw_all_goals_menu extends StatefulWidget {
  const veiw_all_goals_menu({super.key});

  @override
  State<veiw_all_goals_menu> createState() => _veiw_all_goals_menuState();
}

class _veiw_all_goals_menuState extends State<veiw_all_goals_menu> {
  var goalsDetails;
  bool Loader = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loader = false;
    });
  }

  void _fetchAllUserGoals() {
    AdminGoal.getUserGoalByUserId().then((response) {
      print(response);
      if (response.length != 0) {
        setState(() {
          goalsDetails = response;
        });
        loadData();
        print("================$goalsDetails");
        print(goalsDetails[0]['color']);
      }
    });
  }

  @override
  void initState() {
    print("========");
    super.initState();
    _fetchAllUserGoals();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            FadePageRoute(
                page: const your_goals_menu(
              cancel: false,
              membership: false,
              trial: false,
            )));
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      FadePageRoute(
                          page: const your_goals_menu(
                        cancel: false,
                        membership: false,
                        trial: false,
                      )));
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
                  onPressed: () async {
                    Navigator.push(context, FadePageRoute(page: Categories()));
                    final SharedPreferences prefs = await _prefs;
                    var route = prefs.setString('goal_route', 'view_all_goals');
                  },
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
          child: Loader == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        // onTap: (() => showAnimatedDialog(
                        //     animationType: DialogTransitionType.fadeScale,
                        //     curve: Curves.easeInOut,
                        //     duration: Duration(seconds: 1),
                        //     context: context,
                        //     builder: (BuildContext context) =>
                        //         )),
                        child: Container(
                          width: AppDimensions.height10(context) * 6.5,
                          height: AppDimensions.height10(context) * 6.5,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 6.4),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/menu_goals_p.webp'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 15.4,
                        height: AppDimensions.height10(context) * 3.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.6),
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
                            top: AppDimensions.height10(context) * 0.4),
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
                      ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppDimensions.height10(context) * 1.6),
                          itemCount: goalsDetails.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Container(
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
                                    width:
                                        AppDimensions.height10(context) * 20.5,
                                    height:
                                        AppDimensions.height10(context) * 3.5,
                                    margin: EdgeInsets.only(
                                      right: AppDimensions.height10(context) *
                                          15.0,
                                      top:
                                          AppDimensions.height10(context) * 1.5,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  3.5,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.5,
                                          margin: EdgeInsets.only(
                                              right: AppDimensions.height10(
                                                      context) *
                                                  0.8),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/menu_goals_b.webp'),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  13.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          child: Text(
                                            'Goal & Practice',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                color: const Color(0xff437296)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 35.3,
                                    height:
                                        AppDimensions.height10(context) * 51.8,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            2.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Mask Group.webp'),
                                          fit: BoxFit.cover,
                                        )),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  13.9,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  3.1),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Status: ',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            1.8,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFFFFFFFF)),
                                              ),
                                              goalsDetails[index]
                                                          ['goalStatus'] ==
                                                      'active'
                                                  ? Text(
                                                      'Active',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.8,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xFF156F6D)),
                                                    )
                                                  : Text(
                                                      'Inactive',
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.8,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: const Color(
                                                              0xFFDE7A11)),
                                                    )
                                            ],
                                          ),
                                        ),
                                        AnimatedScaleButton(
                                          onTap: () async {
                                            if (goalsDetails[index]
                                                        ['userPractices']
                                                    .length !=
                                                0) {
                                              Navigator.push(
                                                  context,
                                                  FadePageRoute(
                                                      page:
                                                          (const goal_menu_inactive(
                                                    premium: true,
                                                    isActive: false,
                                                    goal_evaluation: false,
                                                  ))));
                                            }

                                            final SharedPreferences prefs =
                                                await _prefs;
                                            var setId = prefs.setInt('goal_num',
                                                goalsDetails[index]['id']);
                                          },
                                          child: Container(
                                            // width:
                                            //     AppDimensions.height10(context) *
                                            //         26.8,
                                            height: AppDimensions.height10(
                                                    context) *
                                                26.8,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.9),
                                            child: Stack(children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      26.8,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          26.8,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(goalsDetails[
                                                                          index]
                                                                      [
                                                                      'color'] ==
                                                                  '1'
                                                              ? "assets/images/red_gradient.webp"
                                                              : goalsDetails[index]
                                                                          [
                                                                          'color'] ==
                                                                      '2'
                                                                  ? 'assets/images/orange_moon.webp'
                                                                  : goalsDetails[index]
                                                                              [
                                                                              'color'] ==
                                                                          '3'
                                                                      ? "assets/images/lightGrey_gradient.webp"
                                                                      : goalsDetails[index]['color'] ==
                                                                              '4'
                                                                          ? "assets/images/lightBlue_gradient.webp"
                                                                          : goalsDetails[index]['color'] == '5'
                                                                              ? "assets/images/medBlue_gradient.webp"
                                                                              : goalsDetails[index]['color'] == '6'
                                                                                  ? "assets/images/Blue_gradient.webp"
                                                                                  : 'assets/images/orange_moon.webp'),
                                                          fit: BoxFit.cover)),
                                                  child: Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                7.3,
                                                            bottom: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                0),
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            19.9,
                                                        child: Text(
                                                          goalsDetails[index]
                                                              ['name'],
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color(
                                                                  0xFF5B74A6)),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            20.2,
                                                        child: Text(
                                                            '“${goalsDetails[index]['reason'][0]['text']}”',
                                                            textAlign: TextAlign
                                                                .center,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                height:
                                                                    AppDimensions.height10(context) *
                                                                        0.15,
                                                                fontSize:
                                                                    AppDimensions.height10(
                                                                            context) *
                                                                        1.68,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                    0xFF5B74A6))),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                  alignment:
                                                      const Alignment(0, 0.8),
                                                  child:
                                                      goalsDetails[index][
                                                                      'userPractices']
                                                                  .length !=
                                                              0
                                                          ? ListView.builder(
                                                              shrinkWrap: true,
                                                              scrollDirection: Axis
                                                                  .horizontal,
                                                              itemCount: goalsDetails[
                                                                          index][
                                                                      'userPractices']
                                                                  .length,
                                                              padding: EdgeInsets.only(
                                                                  top: AppDimensions
                                                                          .height10(
                                                                              context) *
                                                                      15.9),
                                                              itemBuilder:
                                                                  ((context,
                                                                      index1) {
                                                                if (index1 ==
                                                                        4 &&
                                                                    goalsDetails[index]['userPractices']
                                                                            .length >
                                                                        4) {
                                                                  return Container(
                                                                    height:
                                                                        AppDimensions.height10(context) *
                                                                            5.5,
                                                                    width: AppDimensions.height10(
                                                                            context) *
                                                                        5.5,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border: Border.all(
                                                                            width: AppDimensions.height10(context) *
                                                                                0.2,
                                                                            color:
                                                                                const Color(0xffffffff))),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '+${goalsDetails[index]['userPractices'].length - 4}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: const Color(
                                                                              0xFFFFFFFF),
                                                                          fontSize: AppDimensions.height10(context) *
                                                                              1.8,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    )),
                                                                  );
                                                                } else if (index1 >
                                                                    4) {
                                                                  return Container();
                                                                } else {
                                                                  return Center(
                                                                    child:
                                                                        Align(
                                                                      widthFactor:
                                                                          0.7,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Container(
                                                                        height: AppDimensions.height10(context) *
                                                                            8.9,
                                                                        width: AppDimensions.height10(context) *
                                                                            8.9,
                                                                        padding:
                                                                            EdgeInsets.all(AppDimensions.height10(context)),
                                                                        decoration: BoxDecoration(
                                                                            // color: Colors.amber,
                                                                            shape: BoxShape.circle,
                                                                            border: Border.all(color: Colors.white, width: AppDimensions.height10(context) * 0.2),
                                                                            image: DecorationImage(
                                                                                image: AssetImage(goalsDetails[index]['userPractices'][index1]['color'] == '1'
                                                                                    ? "assets/images/Ellipse orange_wb.webp"
                                                                                    : goalsDetails[index]['userPractices'][index1]['color'] == '2'
                                                                                        ? 'assets/images/Ellipse 158_wb.webp'
                                                                                        : goalsDetails[index]['userPractices'][index1]['color'] == '3'
                                                                                            ? "assets/images/Ellipse 157_wb.webp"
                                                                                            : goalsDetails[index]['userPractices'][index1]['color'] == '4'
                                                                                                ? "assets/images/Ellipse light-blue_wb.webp"
                                                                                                : goalsDetails[index]['userPractices'][index1]['color'] == '5'
                                                                                                    ? "assets/images/Ellipse blue_wb.webp"
                                                                                                    : 'assets/images/Ellipse 158_wb.webp'),
                                                                                fit: BoxFit.contain)),
                                                                        child: Center(
                                                                            child: Text(
                                                                          goalsDetails[index]['userPractices'][index1]
                                                                              [
                                                                              'name'],
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: const Color(0xFFFFFFFF),
                                                                              fontSize: AppDimensions.height10(context) * 1.4,
                                                                              fontWeight: FontWeight.w400),
                                                                        )),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              }))
                                                          : AnimatedScaleButton(
                                                              onTap: () async {
                                                                Navigator.push(
                                                                    context,
                                                                    FadePageRoute(
                                                                        page:
                                                                            add_your_practice(
                                                                      goalName:
                                                                          goalsDetails[index]
                                                                              [
                                                                              'name'],
                                                                      
                                                                    )));
                                                                final SharedPreferences
                                                                    prefs =
                                                                    await _prefs;
                                                                var setId = prefs.setInt(
                                                                    'goal_num',
                                                                    goalsDetails[
                                                                            index]
                                                                        ['id']);
                                                              },
                                                              child: Container(
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    8.9,
                                                                width: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    8.9,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                        //color: Colors.amber,
                                                                        image: DecorationImage(
                                                                            image:
                                                                                AssetImage('assets/images/Ellipse_dotted_grey.webp'),
                                                                            fit: BoxFit.contain)),
                                                                child: Stack(
                                                                    children: [
                                                                      Center(
                                                                          child:
                                                                              Text(
                                                                        'Add\npractice',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            color: const Color(
                                                                                0xFFFFFFFF),
                                                                            fontSize: AppDimensions.height10(context) *
                                                                                1.4,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      )),
                                                                    ]),
                                                              ),
                                                            )),
                                            ]),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  25.8,
                                          height:
                                              AppDimensions.height10(context) *
                                                  11.4,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    11.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    11.4,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFDFBE0)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          9.3,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.55,
                                                      child: Text(
                                                        'No. of\nActive days',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xFF437296)),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.3,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.3,
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.8),
                                                      child: Text(
                                                        goalsDetails[index][
                                                                'goalTotalActiveDays']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                2.8,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xFF464646)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    11.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    11.4,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFDFBE0)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          9.3,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.4,
                                                      child: Text(
                                                        'Goal\nLevel',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: const Color(
                                                                0xFF437296)),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          6.3,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.3,
                                                      margin: EdgeInsets.only(
                                                          top: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            goalsDetails[index][
                                                                    'goalLevel']
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    2.8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: const Color(
                                                                    0xFF464646)),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                top: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.5),
                                                            child: Text(
                                                              '/5',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      AppDimensions.height10(
                                                                              context) *
                                                                          1.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
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
                                                    page:
                                                        const goal_prac_info()));
                                          },
                                          child: Align(
                                            alignment: const Alignment(0.92, 0),
                                            child: Container(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  3.0,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.0,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/ic_info_outline.webp'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                      SizedBox(
                        height: AppDimensions.height10(context) * 5.1,
                      )
                    ],
                  ),
                )
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
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
            image: AssetImage('assets/images/Mask Group.webp'),
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
                          image: AssetImage('assets/images/orange_moon.webp'),
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
                                    'assets/images/Ellipse_dotted_grey.webp'),
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
                                image: AssetImage(
                                    'assets/images/Ellipse 158.webp'),
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
                        image: AssetImage('assets/images/ic_info_outline.webp'),
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
            color: const Color(0xFF000000),
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
