

import 'package:flutter/cupertino.dart';
import 'package:potenic_app/utils/app_assets.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

greyGlared(BuildContext context){
  return Positioned(
    left: 0,
    right: 0,
    top: 30,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare3),
              fit: BoxFit.cover)),
    ),
  );
}

redGlared(BuildContext context){
  return Positioned(
    left: 0,
    right: 0,
    top: 30,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare1),
              fit: BoxFit.cover)),
    ),
  );
}

yellowGlared(BuildContext context){
  return Positioned(
    left: 0,
    right: 0,
    top: 60,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare2),
              fit: BoxFit.cover)),
    ),
  );
}

whiteGlared(BuildContext context){
  return Positioned(
    left: 0,
    right: 0,
    top: 30,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare4),
              fit: BoxFit.cover)),
    ),
  );
}

lightBlueGlared(BuildContext context){
  return Positioned(
    left: 0,
    right: 0,
    top: 50,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare5),
              fit: BoxFit.cover)),
    ),
  );
}

blueGlared(BuildContext context){
  return Positioned(
    left: 0,
    right: 0,
    top: 50,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare6),
              fit: BoxFit.cover)),
    ),
  );
}


getGlares(BuildContext context, color){
  if(color == "1"){
    return redGlared(context);
  }else if(color == "2"){
    return yellowGlared(context);
  }else if(color == "3"){
    return greyGlared(context);
  }else if(color == "4"){
    return whiteGlared(context);
  }else if(color == "5"){
    return lightBlueGlared(context);
  }else if(color == "6"){
    return blueGlared(context);
  }else {
    return yellowGlared(context);
  }
}