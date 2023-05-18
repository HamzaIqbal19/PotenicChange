import 'dart:math';
import 'package:flutter/material.dart';
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

  final double containerHeight = 314.0;
  final double circleWidth = 65.0;
  final double circleHeight = 74.0;
  final double containerWidth = 950.0; // You can adjust this value
  final double overlapFactor = 0.85; // You can adjust this value

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var i = 0; i < 100; i++) {
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
          shape: BoxShape.circle,
          color: Colors.red, // You can change the color
        ),
      ),
    );
  }
}
