import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Goal%20Review%20Journey/StarReview.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/Create%20Practice.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_dimensions.dart';
import 'veiw_all_goals.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class add_your_practice extends StatefulWidget {
  final String goalName;
  const add_your_practice({super.key, required this.goalName});

  @override
  State<add_your_practice> createState() => _add_your_practiceState();
}

class _add_your_practiceState extends State<add_your_practice> {
  String goalColor = '';
  void getRecorDetails() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      goalColor = prefs.getString('dash_goalColor')!;
    });
  }

  @override
  void initState() {
    getRecorDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Buttons().closeButton(context, () {
              Navigator.push(context,
                  FadePageRouteReverse(page: const view_all_goals_menu()));
            })
          ]),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            // color: Colors.amber,
            //width: AppDimensions.width10(context) * 17.1,
            height: AppDimensions.height10(context) * 2.2,
            margin: EdgeInsets.only(
              top: AppDimensions.height10(context) * 5.2,

              // right: AppDimensions.width10(context) * 12.1
            ),
            child: Center(
              child: Text(
                'Goal Menu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppDimensions.font10(context) * 1.8,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffffffff)),
              ),
            ),
          ),
          Container(
            // color: Colors.amber,
            width: AppDimensions.width10(context) * 17.1,
            height: AppDimensions.height10(context) * 2.4,
            margin: EdgeInsets.only(
                top: AppDimensions.height10(context) * 0.5,
                left: AppDimensions.width10(context) * 12.2,
                right: AppDimensions.width10(context) * 12.1),
            child: Text(
              widget.goalName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 2.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffffffff)),
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 7.9,
            height: AppDimensions.height10(context) * 7.9,
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.3),
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                  image: AssetImage(goalColor == '1'
                      ? "assets/images/red_gradient.webp"
                      : goalColor == '2'
                          ? 'assets/images/orange_moon.webp'
                          : goalColor == '3'
                              ? "assets/images/lightGrey_gradient.webp"
                              : goalColor == '4'
                                  ? "assets/images/lightBlue_gradient.webp"
                                  : goalColor == '5'
                                      ? "assets/images/medBlue_gradient.webp"
                                      : goalColor == '6'
                                          ? "assets/images/Blue_gradient.webp"
                                          : 'assets/images/orange_moon.webp'),
                  fit: BoxFit.contain),
            ),
          ),
          Container(
            width: double.infinity,
            height: AppDimensions.height10(context) * 0.1,
            color: const Color(0xFFFFFFFF).withOpacity(0.5),
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.9),
          ),
          AnimatedScaleButton(
            onTap: () async {
              Navigator.push(
                  context, FadePageRoute(page: const CreatePractice()));
              final SharedPreferences prefs = await _prefs;
              await prefs.setString('goal_route', 'view_all_goals_2');
              await prefs.setString('goalName', widget.goalName);
            },
            child: Container(
              width: AppDimensions.width10(context) * 17.5,
              height: AppDimensions.height10(context) * 17.5,
              padding: EdgeInsets.all(AppDimensions.height10(context) * 0.5),
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFFFFFF), width: 3)),
              child: Container(
                width: AppDimensions.width10(context) * 15.5,
                height: AppDimensions.height10(context) * 15.5,
                padding: EdgeInsets.all(AppDimensions.height10(context) * 0.7),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFFFFFFFF), width: 4)),
                child: Container(
                  width: AppDimensions.width10(context) * 13.4,
                  height: AppDimensions.height10(context) * 13.2,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/circle_grey.webp'))),
                  child: Center(
                    child: Text(
                      'Add new\npractice',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.8,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: AppDimensions.height10(context) * 0.1,
            color: const Color(0xFFFFFFFF).withOpacity(0.5),
            margin: EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
          ),
          AnimatedScaleButton(
            onTap: () async {
              Navigator.push(
                  context,
                  FadePageRoute(
                      page: const StarReview(
                    route: 'add_your_practice',
                  )));
              final SharedPreferences prefs = await _prefs;
              await prefs.setString('goal_route', 'view_all_goals');
            },
            child: Container(
              width: AppDimensions.width10(context) * 36.4,
              height: AppDimensions.height10(context) * 6.0,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
                color: const Color(0xFFFFFFFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 18.5,
                    height: AppDimensions.height10(context) * 2.2,
                    margin: EdgeInsets.only(
                        left: AppDimensions.width10(context) * 1.99),
                    child: Text(
                      'Goal details',
                      style: TextStyle(
                        color: const Color(0xff646464),
                        fontSize: AppDimensions.font10(context) * 1.8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                      width: AppDimensions.width10(context) * 2.4,
                      height: AppDimensions.height10(context) * 1.39,
                      margin: EdgeInsets.only(
                          right: AppDimensions.width10(context) * 2.391),
                      child: Image.asset(
                        'assets/images/BTN Back.webp',
                        //width: AppDimensions.width10(context) * 2.6,
                        //height: AppDimensions.height10(context) * 2.6,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
