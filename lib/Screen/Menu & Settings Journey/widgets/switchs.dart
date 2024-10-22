
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

Widget notificationSwitch(BuildContext context, title, value, ValueChanged<bool> onChanged){
  return SizedBox(
   // height: AppDimensions.height10(context) * 5.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
         // width: AppDimensions.width10(context) * 24.7,
          height: AppDimensions.height10(context) * 4.7,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize:
                  AppDimensions.font10(context) *
                      2,
                  fontWeight: FontWeight.w500,
                  color: const Color(0XFF5B74A6)),
            ),
          ),
        ),
        switchWidget(context, value, onChanged)

      ],
    ),
  );
}

Widget switchWidget(BuildContext context, value, ValueChanged<bool> onChanged){
  return FlutterSwitch(
    width: AppDimensions.width10(context) * 5.1,
    height: AppDimensions.height10(context) * 3.1,
    valueFontSize: 12.0,
    toggleSize: 18.0,
    activeColor: const Color(0xFF34C759),
    inactiveColor: const Color(0xFF2F3A4B),
    value: value,
    onToggle: onChanged,
  );
}

Widget seperator(BuildContext context){
  return Container(
    width: AppDimensions.width10(context) * 33.4,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width:
                AppDimensions.width10(context) * 0.1,
                color: const Color(0xFF000000)))),
  );
}


