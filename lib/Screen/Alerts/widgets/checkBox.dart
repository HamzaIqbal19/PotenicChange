
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_assets.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

checkBox(BuildContext context, checked){
  return Container(
    height: AppDimensionsUpdated.height10(context)*3.3,
    width: AppDimensionsUpdated.width10(context)*3.3,
    decoration:checked?BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xFFFBFBFB)),
      image: const DecorationImage(
        image: AssetImage(AppAssets.checkBox),
        fit: BoxFit.cover,
      )
    ): BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xFFFBFBFB)),

    ),

  );
}