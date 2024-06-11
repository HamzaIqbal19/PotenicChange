
import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/Notification/emailLauncher.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Widgets/fading.dart';

navigationRouting(BuildContext context,String route, String url){
  switch(route){
    case "hurdle":
      return Navigator.push(
          context,
          FadePageRouteReverse(
              page: const landing_hurdles()));
    case "inspiration":
      return Navigator.push(
          context,
          FadePageRouteReverse(
              page: const inspiration_landing(is_Updated: false)));
    case "email":
      return laucherForNotifications().emailLauncher();
    case "community":
      return laucherForNotifications().urlLauncher(url);
    default:
      return null;
  }
}