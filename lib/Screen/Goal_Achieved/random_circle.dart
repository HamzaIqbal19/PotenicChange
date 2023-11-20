import 'dart:math';
import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';
//import 'package:r_dart_library/asset_svg.dart';

class RandomCircles extends StatefulWidget {
  @override
  _RandomCirclesState createState() => _RandomCirclesState();
}

class _RandomCirclesState extends State<RandomCircles> {
  final Random _random = Random();
  final List<Circle> _circles = [];

  final double containerHeight = AppDimensions2.height10 * 31.40;
  final double circleWidth = AppDimensions2.height10 * 6.50;
  final double circleHeight = AppDimensions2.height10 * 7.40;
  final double containerWidth =
      AppDimensions2.height10 * 95.00; // You can adjust this value
  final double overlapFactor = 0.85; // You can adjust this value

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var i = 0; i < 87; i++) {
        _addCircle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: AppDimensions.width10(context) * 95.00,
        height: AppDimensions.height10(context) * 31.40,
        child: Stack(
          children: _circles,
        ),
      ),
    );
  }

  void _addCircle() {
    final circleX = _random.nextDouble() *
        (AppDimensions.height10(context) * 95.00 -
            AppDimensions.height10(context) * 6.50);
    final circleY = _random.nextDouble() *
        (AppDimensions.height10(context) * 31.40 -
            AppDimensions.height10(context) * 7.40);

    for (var existingCircle in _circles) {
      final minDistance = overlapFactor *
          (max(existingCircle.width, existingCircle.height) / 2 +
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
        Circle(
          x: circleX,
          y: circleY,
          width: AppDimensions.width10(context) * 6.50,
          height: AppDimensions.height10(context) * 7.40,
        ),
      );
    });
  }
}

class Circle extends StatelessWidget {
  final double x;
  final double y;
  final double width;
  final double height;

  const Circle({
    Key? key,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Ellipse 158.webp')),
          shape: BoxShape.circle,
        ),
        child: Stack(children: [
          Center(
              child: SizedBox(
            width: AppDimensions.width10(context) * 2.7,
            height: AppDimensions.height10(context) * 3.4,
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.font10(context) * 1.4,
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                    text: 'Tue',
                  ),
                  TextSpan(
                      text: '01/07',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 0.9))
                ])),
          )),
          Align(
            alignment: Alignment(0, 1.15),
            child: Container(
              width: AppDimensions.width10(context) * 2.0,
              height: AppDimensions.height10(context) * 2.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/task_comp.webp'))),
            ),
          )
        ]),
      ),
    );
  }
}
