import 'dart:math';
import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';
//import 'package:r_dart_library/asset_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Circles'),
        ),
        body: RandomCircles(),
      ),
    );
  }
}

class RandomCircles extends StatefulWidget {
  @override
  _RandomCirclesState createState() => _RandomCirclesState();
}

class _RandomCirclesState extends State<RandomCircles> {
  final Random _random = Random();
  final List<Circle> _circles = [];

  final double containerHeight = AppDimensions.height10 * 31.40;
  final double circleWidth = AppDimensions.height10 * 6.50;
  final double circleHeight = AppDimensions.height10 * 7.40;
  final double containerWidth =
      AppDimensions.height10 * 95.00; // You can adjust this value
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
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          children: _circles,
        ),
      ),
    );
  }

  void _addCircle() {
    final circleX = _random.nextDouble() * (containerWidth - circleWidth);
    final circleY = _random.nextDouble() * (containerHeight - circleHeight);

    for (var existingCircle in _circles) {
      final minDistance = overlapFactor *
          (max(existingCircle.width, existingCircle.height) / 2 +
              max(circleWidth, circleHeight) / 2);
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
          width: circleWidth,
          height: circleHeight,
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
              image: AssetImage('assets/images/Ellipse 158.png')),
          shape: BoxShape.circle,
        ),
        child: Stack(children: [
          Center(
              child: SizedBox(
            width: AppDimensions.height10 * 2.7,
            height: AppDimensions.height10 * 3.4,
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.4,
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                    text: 'Tue',
                  ),
                  TextSpan(
                      text: '01/07',
                      style: TextStyle(fontSize: AppDimensions.height10 * 0.9))
                ])),
          )),
          Align(
            alignment: Alignment(0, 1.15),
            child: Container(
              width: AppDimensions.height10 * 2.0,
              height: AppDimensions.height10 * 2.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/task_comp.png'))),
            ),
          )
        ]),
      ),
    );
  }
}
