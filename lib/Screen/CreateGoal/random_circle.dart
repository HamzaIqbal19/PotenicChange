import 'dart:math';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';

import '../../utils/app_dimensions.dart';
//import 'package:r_dart_library/asset_svg.dart';


class RandomCircles extends StatefulWidget {
  @override
  _RandomCirclesState createState() => _RandomCirclesState();
}

class _RandomCirclesState extends State<RandomCircles> {
  final Random _random = Random();
  final List<Circles> _circles = [];
  List<Map<String, dynamic>>? goalCategories;
  final double containerHeight = AppDimensions2.height10 * 31.40;
  final double circleWidth = AppDimensions2.height10 * 6.50;
  final double circleHeight = AppDimensions2.height10 * 7.40;
  final double containerWidth =
      AppDimensions2.height10 * 95.00; // You can adjust this value
  final double overlapFactor = 0.60; // You can adjust this value

  @override
  void initState() {
    super.initState();
    _fetchGoalNames();
  }


  void _fetchGoalNames() {
    AdminGoal.getAllCategoriesNames().then((response) {
      if (response.length != 0) {
        setState(() {
          // Loading = false;
          goalCategories = response;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            for (var i = 0; i < response.length; i++) {
              _addCircle(response[i]);
            }
          });
          // count = response.length ~/ 2;
        });
        print("response123:$goalCategories");
      } else {
        // setState(() {
        //   Loading = false;
        // });
        print("response:$response");
      }
    }).catchError((error) {
      // setState(() {
      //   Loading = false;
      // });
      print("error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color:Colors.orange,
        width: AppDimensions.height10(context) * 95.00,
        height: AppDimensions.height10(context) * 35.40,
        child: Stack(
          children: _circles,
        ),
      ),
    );
  }

  void _addCircle(var goal) {
    final circleX = _random.nextDouble() *
        (AppDimensions.height10(context) * 95.00 -
            AppDimensions.height10(context) * 6.50);
    final circleY = _random.nextDouble() *
        (AppDimensions.height10(context) * 31.40 -
            AppDimensions.height10(context) * 7.40);

    for (var existingCircle in _circles) {
      final minDistance = overlapFactor *
          (max(existingCircle.circle_width, existingCircle.circle_height) / 2 +
              max(AppDimensions.height10(context) * 6.50,
                      AppDimensions.height10(context) * 7.40) /
                  2);
      final actualDistance = sqrt(pow(existingCircle.x - circleX, 2) +
          pow(existingCircle.y - circleY, 2));

      if (actualDistance <= minDistance) {
        return; // If the circle overlaps an existing one, abort the creation of the new circle
      }
    }

    setState(() {
      _circles.add(
        Circles(
            x: circleX,
            y: circleY,
            circle_text: goal["name"],
            circle_color1: 0xFFFFFFFF,
            circle_color2: 0xFFFFFFFF,
            circle_border: 3.0,
            circle_bordercolor: 0xFFEE8E6F,
            circle_height: AppDimensions
                .height10(context) *
                13.4,
            circle_width:
            AppDimensions.height10(
                context) *
                13.4,
            textfont: AppDimensions.height10(
                context) *
                1.6,
            textcolor: 0xFFFA9934),
      );
    });
  }
}

class Circles extends StatelessWidget {
  final double x;
  final double y;
  final String circle_text;
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
    required this.x,
    required this.y,
    required this.circle_text,
    required this.circle_color1,
    required this.circle_color2,
    required this.circle_border,
    required this.circle_bordercolor,
    required this.circle_height,
    required this.circle_width,
    required this.textfont,
    required this.textcolor,
    this.state = false,
  });

  @override
  Widget build(BuildContext context) {
    return
     Positioned(
       left: x,
      top: y,
      child:Container(
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
        ))
     );
  }
}
