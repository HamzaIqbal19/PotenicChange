

import 'package:flutter/cupertino.dart';
import 'package:potenic_app/utils/app_assets.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

greyGlared(BuildContext context,bool smallScreen){
  return Positioned(
    left: 0,
    right: 0,
    top: smallScreen?-90: -45,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare3),
              fit: BoxFit.cover)),
    ),
  );
}

redGlared(BuildContext context,bool smallScreen){
  return Positioned(
    left: 0,
    right: 0,
    top: smallScreen?-90:-45,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare1),
              fit: BoxFit.cover)),
    ),
  );
}

yellowGlared(BuildContext context,bool smallScreen){
  return Positioned(
    left: 0,
    right: 0,
    top: smallScreen?-55:-10,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare2),
              fit: BoxFit.cover)),
    ),
  );
}

whiteGlared(BuildContext context,bool smallScreen){
  return Positioned(
    left: 0,
    right: 0,
    top: smallScreen?-90:-45,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare4),
              fit: BoxFit.cover)),
    ),
  );
}

lightBlueGlared(BuildContext context,bool smallScreen){
  return Positioned(
    left: 0,
    right: 0,
    top: smallScreen?-55:-10,
    child: Container(
      height: AppDimensionsUpdated.height10(context)*100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage( AppAssets.glare5),
              fit: BoxFit.cover)),
    ),
  );
}

blueGlared(BuildContext context,bool smallScreen){
  return Positioned(
    left: 0,
    right: 0,
    top: smallScreen?-55:-10,
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
  bool smallScreen = MediaQuery.of(context).size.height < 690;
  if(color == "1"){
    return redGlared(context,smallScreen);
  }else if(color == "2"){
    return yellowGlared(context,smallScreen);
  }else if(color == "3"){
    return greyGlared(context,smallScreen);
  }else if(color == "4"){
    return whiteGlared(context,smallScreen);
  }else if(color == "5"){
    return lightBlueGlared(context,smallScreen);
  }else if(color == "6"){
    return blueGlared(context,smallScreen);
  }else {
    return yellowGlared(context,smallScreen);
  }
}