import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class BottomScrollView {
  Widget scroll(
      {context,
      List<dynamic>? list,
      void Function(int)? onSelectedItemChanged}) {
    return ListWheelScrollView(
      itemExtent: 40,
      magnification: 1.3,
      physics: const FixedExtentScrollPhysics(),
      useMagnifier: true, // Set the height of each statement
      onSelectedItemChanged: onSelectedItemChanged,
      children: list!
          .map((statement) => Text(statement,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 2.0,
                fontWeight: FontWeight.w400,
              )))
          .toList(),
    );
  }

  Widget line(context, {double? top}) {
    return Positioned(
      top: top!,
      right: AppDimensions.height10(context) * 2.0,
      left: AppDimensions.height10(context) * 2.0,
      child: Align(
        alignment: const Alignment(0, 0),
        child: Container(
            width: 400,
            height: 1,
            color: const Color(0xFF828282).withOpacity(0.5)),
      ),
    );
  }
}
