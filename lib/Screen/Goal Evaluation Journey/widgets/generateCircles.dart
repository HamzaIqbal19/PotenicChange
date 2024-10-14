import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

List<Widget> generateCircleEmptyContainers(BuildContext context, int count,) {
  return List.generate(count, (index) {
    return Container(
      width: AppDimensions.width10(context) * 2.3,
      height: AppDimensions.height10(context) * 2.3,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF2F2F2),
        image: null,
      ),
    );
  });
}


List<Widget> generateCircleContainers(BuildContext context, int count, {bool hasImage = false}) {
  return List.generate(count, (index) {
    return Container(
      width: AppDimensions.width10(context) * 2.3,
      height: AppDimensions.height10(context) * 2.3,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: null,
        image: DecorationImage(
          image: AssetImage('assets/images/Tick_dates.webp'),
        ),
      ),
    );
  });
}

