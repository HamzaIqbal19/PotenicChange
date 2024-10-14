import 'dart:math';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/GoalCategory.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
//import 'package:r_dart_library/asset_svg.dart';

class RandomCircles extends StatefulWidget {
  const RandomCircles({super.key});

  @override
  _RandomCirclesState createState() => _RandomCirclesState();
}

class _RandomCirclesState extends State<RandomCircles> {
  final Random _random = Random();
  final List<Circles> _circles = [];
  List<Map<String, dynamic>>? goalCategories;
  var goalDetail = "";
  var goalName;
  // final double containerHeight = AppDimensions2.height10 * 35.40;
  final double circleWidth = AppDimensions2.height10 * 13.4;
  final double circleHeight = AppDimensions2.height10 * 13.4;
  final double containerWidth = AppDimensions2.height10 * 95.00;
  final double overlapFactor = 0.60;
  double nextCircleX = 10.0; // Added a counter for X coordinate of next circle

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }

  void _fetchGoalNames() {
    AdminGoal.getAllCategoriesNames().then((response) {
      if (response.length != 0) {
        setState(() {
          goalCategories = response;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            for (var i = 0; i < response.length; i++) {
              _addCircle(response[i]);
            }
          });
        });
      } else {}
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: AppDimensions.width10(context) * 95.00,
        height: AppDimensions.height10(context) * 35.40,
        child: Stack(
          children: _circles,
        ),
      ),
    );
  }

  void _addCircle(var goal) {
    final circleX = nextCircleX;
    final circleY = _random.nextDouble() *
        (AppDimensions.height10(context) * 30.40 -
            AppDimensions.height10(context) * 7.40);

    // Check if the circle is within the container's width
    if (circleX + circleWidth > containerWidth) {
      return;
    }

    // The next circle's X coordinate starts 40px to the right of the current circle
    nextCircleX = circleX + circleWidth + 7;

    setState(() {
      _circles.add(
        Circles(
          x: circleX,
          y: circleY,
          circle_text: goal["name"],
          circle_id: goal["id"],
          circle_color1: 0xFFFC854F,
          circle_color2: 0xFFFAA960,
          circle_border: 3.0,
          circle_bordercolor: 0xFFFFFFFF,
          circle_height: AppDimensions.height10(context) * 13.4,
          circle_width: AppDimensions.width10(context) * 13.4,
          textfont: AppDimensions.height10(context) * 1.6,
          textcolor: 0xFFFFFFFF,
          // id: 1,
        ),
      );
    });
  }
}

class Circles extends StatelessWidget {
  final double x;
  final double y;
  final String circle_text;
  final int circle_id;
  final double textfont;
  final int textcolor;
  final int circle_color1;
  final int circle_color2;
  final double circle_height;
  final double circle_width;
  final double circle_border;
  final int circle_bordercolor;
  final bool state;
  // final String Route;

  const Circles({
    super.key,
    required this.x,
    required this.y,
    required this.circle_text,
    required this.circle_id,
    required this.circle_color1,
    required this.circle_color2,
    required this.circle_border,
    required this.circle_bordercolor,
    required this.circle_height,
    required this.circle_width,
    required this.textfont,
    required this.textcolor,
    this.state = false,
    // required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: x,
        top: y,
        child: AnimatedScaleButton(
          onTap: () {
            Navigator.push(
              context,
              FadePageRoute(
                page: GoalCategory(
                  "Category Name",
                  circle_text,
                  circle_id,
                ),
              ),
            );
          },
          child: Container(
              height: circle_height,
              width: circle_width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(70.0)),
                  border: Border.all(
                      width: circle_border, color: Color(circle_bordercolor)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(circle_color1), Color(circle_color2)])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    circle_text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: textfont,
                      color: Color(textcolor),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ));
  }
}
