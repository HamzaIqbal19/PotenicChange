import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/app_dimensions.dart';

class CircularFormation extends StatelessWidget {
  final int selection;
  final double size;
  final Color circleColor;
  final List<Color> outerCircleColors;

  const CircularFormation({
    super.key,
    required this.size,
    required this.circleColor,
    required this.outerCircleColors,
    required this.selection,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.width10(context) * 15.0,
      height: AppDimensions.height10(context) * 15.0,
      child: CustomPaint(
        painter: CircularFormationPainter(
          circleColor: Colors.transparent,
          outerCircleColors: outerCircleColors,
        ),
        child: Container(
          width: AppDimensions.width10(context) * 10.1,
          height: AppDimensions.height10(context) * 10.1,
          //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 5.1),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(selection == 5
                      ? 'assets/images/Day Count.webp'
                      : selection == 4
                          ? 'assets/images/Countdown circle.webp'
                          : selection == 3
                              ? 'assets/images/Countdown circle_3.webp'
                              : selection == 2
                                  ? 'assets/images/Countdown circle_1.webp'
                                  : 'assets/images/Countdown circle_2.webp'),
                  fit: BoxFit.contain)),
        ),
      ),
    );
  }
}

class CircularFormationPainter extends CustomPainter {
  final Color circleColor;
  final List<Color> outerCircleColors;

  CircularFormationPainter({
    required this.circleColor,
    required this.outerCircleColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const circleRadius = 130.5;

    // Draw outer circle
    final circlePaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, circleRadius, circlePaint);

    // Draw smaller circles in circular formation
    final numCircles = outerCircleColors.length;
    const smallCircleRadius = 6.5;
    final angleIncrement = 2 * math.pi / numCircles;

    for (var i = 0; i < numCircles; i++) {
      final angle = angleIncrement * i;
      final x =
          center.dx + (circleRadius - 2 * smallCircleRadius) * math.cos(angle);
      final y =
          center.dy + (circleRadius - 2 * smallCircleRadius) * math.sin(angle);
      final smallCircleCenter = Offset(x, y);

      final smallCirclePaint = Paint()
        ..color = outerCircleColors[i]
        ..style = PaintingStyle.fill;
      canvas.drawCircle(smallCircleCenter, smallCircleRadius, smallCirclePaint);
    }
  }

  @override
  bool shouldRepaint(CircularFormationPainter oldDelegate) {
    return circleColor != oldDelegate.circleColor ||
        outerCircleColors != oldDelegate.outerCircleColors;
  }
}
