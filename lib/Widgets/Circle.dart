import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
//import 'package:flutter_ui/utilities/icons.dart';
// import 'package:flutter_ui/utilities/app_textstyles.dart';

class circles extends StatelessWidget {
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

  const circles({
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
    return Container(
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
            Container(
              width: AppDimensions.height10(context) * 10.9,
              child: Text(
                circle_text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: textfont,
                  color: Color(textcolor),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ));
  }
}
