import 'package:flutter/material.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class CustomTextfields {
  Widget AuthTextField({
    controller,
    context,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextInputType? textInputType,
    String hintText = '',
    String labeText = '',
    bool passObscure = true,
    void Function(String)? onFieldSubmitted,
  }) {
    return Container(
        height: AppDimensions.height10(context) * 6.7,
        width: AppDimensions.width10(context) * 36,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.all(
                Radius.circular(AppDimensions.height10(context) * 1.8))),
        child: TextFormField(
          cursorHeight: 20,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: passObscure,
          controller: controller,
          keyboardType: textInputType,
          style: TextStyle(
              color: const Color(0xFF8C648A),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              fontSize: AppDimensions.height10(context) * 2.4),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
              color: const Color(0xFF8C648A),
              fontWeight: FontWeight.w600,
              fontSize: AppDimensions.font10(context) * 2.4,
            ),
            hintText: hintText,
            labelText: labeText,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.only(
              top: 6,
              bottom: 5,
              left: 20.0,
              //  right: 10.0
            ),
          ),
          onChanged: onChanged,
          validator: validator,
        ));
  }

  Widget errorText({String texterror = "", context}) {
    return Text(
      texterror,
      style: TextStyle(
        color: const Color(0xFFFE6624),
        fontSize: AppDimensions.font10(context) * 1.4,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget visibleIcon({
    void Function()? onpress,
    context,
    bool passObscure = true,
  }) {
    return GestureDetector(
      onTap: onpress,
      // () {
      //   setState(() {
      //     passObscure = !passObscure;
      //   });
      // },
      child: Container(
        padding: EdgeInsets.only(top: AppDimensions.height10(context) * 1),
        // height:
        //     AppDimensions.height10(context) * 2.4,
        width: AppDimensions.width10(context) * 2.4,
        margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 1.0),
        child: Image.asset(
          passObscure
              ? 'assets/images/visible-icon-9.webp'
              : 'assets/images/ic_remove_red_eye.webp',
          color: const Color(0xFF8C648A),
          height: AppDimensions.height10(context) * 2.4,
          width: AppDimensions.width10(context) * 2.4,
        ),
      ),
    );
  }
}
