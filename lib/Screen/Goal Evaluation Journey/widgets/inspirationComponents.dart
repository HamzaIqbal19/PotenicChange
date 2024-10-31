
import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

inspirationComponent(BuildContext context,inspirationId,mainImage,String text2,index){
  return inspirationId == '1'
      ? Container(
    width: AppDimensionsUpdated.width10(context) * 17.2,
    height: AppDimensionsUpdated.height10(context) * 16.9,
    margin: EdgeInsets.only(
        left:  index == 0? AppDimensions.width10(context) * 12:AppDimensions.width10(context) * 2,
        right: AppDimensions.width10(context) * 1,
        top: AppDimensions.height10(context),
        bottom: AppDimensions.height10(context)),
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(
          AppDimensions.height10(context) * 18),
      child: FadeInImage(
        placeholder: const AssetImage(
            'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
        image: NetworkImage(mainImage),
        fit: BoxFit.cover,
        placeholderFit: BoxFit.contain,
      ),
    ),
  )
      : Container(
    width: AppDimensionsUpdated.width10(context) * 17.2,
    height: AppDimensionsUpdated.height10(context) * 16.9,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(
        right: AppDimensions.width10(context) * 1,
        left:  index == 0? AppDimensions.width10(context) * 12:AppDimensions.width10(context) * 2,
        top: AppDimensionsUpdated.height10(context) * 1.9),
    decoration: BoxDecoration(
        gradient: inspirationId == '2'
            ? const RadialGradient(colors: [
          Color(0xFFE9A594),
          Color(0xFFEEBEB2)
        ])
            : const RadialGradient(colors: [
          Color(0xFFD9D9D9),
          Color(0xFFD9D9D9)
        ]),
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(inspirationId == '4'
                ? 'assets/images/distraction content.webp'
                : inspirationId == '3'
                ? 'assets/images/video_play.webp'
                : ''),
            fit: BoxFit.cover)),
    child: inspirationId == '2'
        ? Center(
      child: Text(
        text2,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: UpdatedDimensions.height10(
                context) *
                1.6),
      ),
    )
        : Container(),
  );
}

emptyInspiration(BuildContext context){
  return Container(
    width: AppDimensionsUpdated.width10(context) * 17.2,
    height: AppDimensionsUpdated.height10(context) * 16.9,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white,width: 1)
    ),
    child: Center(
      child: Text(
          "You haven’t\nadded no\ninspirations yet\n:(",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: UpdatedDimensions.height10(context) * 1.8),
      ),
    ),
  );
}