

import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

appBarTitle(BuildContext context,String text,colored){
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      color:colored?const Color(0xff437296): Colors.white,
      fontSize: AppDimensions.font10(context) * 2.2,
    ),
  );
}