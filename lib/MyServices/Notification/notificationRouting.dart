
import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/Notification/emailLauncher.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
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
    // case "goalMenu":
    //   return  Navigator.push(
    //       context,
    //       FadePageRoute(
    //           page: (const goal_menu_inactive(
    //             isActive: false,
    //             goal_evaluation: false,
    //           ))));
    case "goalsJourney":
      return Navigator.push(
          context,
          FadePageRouteReverse(
              page: const view_all_goals_menu()));
    // case "goalEvaluation":
    //   return  Navigator.push(
    //       context,
    //       FadePageRoute(
    //           page: (const goal_menu_inactive(
    //             isActive: false,
    //             goal_evaluation: false,
    //           ))));
    case "email":
      return laucherForNotifications().emailLauncher();
    case "community":
      return laucherForNotifications().urlLauncher(url);
    default:
      return null;
  }
}