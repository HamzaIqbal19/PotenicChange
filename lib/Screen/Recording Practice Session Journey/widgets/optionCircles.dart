
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

List<String> emotionSessionText = [
  'I feel very \nlow & \ndemotivated',
  'I feel slightly \nirritated, not \nfussed really',
  'I feel ok',
  'Motivated and \nready to start',
  'Great, cannot \nwait to start!',
];

List<String> afterSessionText = [
  'I feel very low\n& irritated',
  'I feel alright,\n but slightly\ndown',
  'I feel ok',
  'I feel focused\nand motivated',
  'I feel excited\nand good in\nmyself',
];

List<String> endOfSessionsText = [
  'Not great,\nhaven’t\nenjoyed it',
  'I got\ndistracted, it\nwas hard to\nfocus',
  'It was ok',
  'Good, I quite\nliked it',
  'Great, I\nenjoyed the\nexperience',
];


List emotionSessionColor = [
  const Color(0xff546096),
  const Color(0xff7291A0),
  const Color(0xffE1C44F),
  const Color(0xffFF7C42),
  const Color(0xff219653)
];

sessonCircles(BuildContext context,bool selected ,int index, before,endeOfSession){
  return Container(
    width: AppDimensionsUpdated.width10(context) * 18.1,
    height: AppDimensionsUpdated.width10(context) * 18.1,
    // margin: EdgeInsets.only(
    //     left: AppDimensionsUpdated.width10(context) * 0.5,
    //     right: AppDimensionsUpdated.width10(context) * 0.5),
    decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
            width:
            AppDimensionsUpdated.width10(context) * 0.2,
            color: selected
                ? Colors.white
                : Colors.transparent)),
    child: Container(
      height: AppDimensionsUpdated.width10(context) * 17.1,
      width: AppDimensionsUpdated.width10(context) * 17.1,
      margin: EdgeInsets.symmetric(
          vertical:
          AppDimensionsUpdated.height10(context) * 0.4,
          horizontal:
          AppDimensionsUpdated.width10(context) * 0.3),
      alignment: Alignment.center,
      decoration:endeOfSession?BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width:
            AppDimensionsUpdated.width10(context) * 0.2,
            color: Colors.white),
        gradient: RadialGradient(colors: <Color>[
          const Color(0xFFBDA7C2)
              .withOpacity(0.19), // yellow sun
          const Color(0xFFB38FB4)
              .withOpacity(.81), // blue sky
        ]),
      ): BoxDecoration(
        shape: BoxShape.circle,

        border: Border.all(
            width:
            AppDimensionsUpdated.width10(context) * 0.2,
            color: Colors.white),
        color: emotionSessionColor[index],
      ),
      child: Text(
       endeOfSession?endOfSessionsText[index]: before? emotionSessionText[index]:afterSessionText[index],
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize:
          AppDimensionsUpdated.font10(context) * 1.8,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  );
}