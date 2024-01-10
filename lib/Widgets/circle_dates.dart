import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/app_dimensions.dart';

class Circulardates extends StatelessWidget {
  final double size;
  final Widget centerContainer;
  final List<Widget> outerCircleContainers;

  const Circulardates({
    super.key,
    required this.size,
    required this.outerCircleContainers,
    required this.centerContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 24.0,
      height: AppDimensions.width10(context) * 24.0,
      color: Colors.transparent,
      child: Stack(
        children: [
          CustomPaint(
            painter: CircularFormationPainter(
              numOuterCircles: outerCircleContainers.length,
            ),
          ),
          Align(alignment: const Alignment(0, -0.5), child: centerContainer),
          Positioned.fill(
            child: Container(
              width: AppDimensions.width10(context) * 24.0,
              height: AppDimensions.width10(context) * 24.0,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.transparent),
              child: Stack(
                children: List.generate(
                  outerCircleContainers.length,
                  (index) {
                    final angle =
                        2 * math.pi / outerCircleContainers.length * index;
                    const radius = 85;
                    final offsetX = (size - 10) / 2 + radius * math.cos(angle);
                    final offsetY = (size - 10) / 2 + radius * math.sin(angle);

                    return Positioned(
                      left: offsetY,
                      bottom: offsetX,
                      child: outerCircleContainers[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularFormationPainter extends CustomPainter {
  final int numOuterCircles;

  CircularFormationPainter({
    required this.numOuterCircles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final circleRadius = size.width / 2;

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, circleRadius, paint);
  }

  @override
  bool shouldRepaint(CircularFormationPainter oldDelegate) {
    return numOuterCircles != oldDelegate.numOuterCircles;
  }
}
