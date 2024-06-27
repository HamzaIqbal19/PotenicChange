import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/Notification/emailLauncher.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your_goals/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_goals_menu.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

navigationRouting(BuildContext context, String route, String url) {
  switch (route) {
    case "dashboard":
      return Navigator.push(
          context, FadePageRoute(page: const practiceMenu(goal_eval: false)));
    case "hurdle":
      return Navigator.push(
          context, FadePageRouteReverse(page: const landing_hurdles()));
    case "inspiration":
      return Navigator.push(
          context,
          FadePageRouteReverse(
              page: const inspiration_landing(is_Updated: false)));
    case "goalMenu":
      return Navigator.push(
          context,
          FadePageRoute(
              page: (const goal_menu_inactive(
            isActive: false,
            goal_evaluation: false,
          ))));
    case "goalsJourney":
      return Navigator.push(
          context, FadePageRouteReverse(page: const view_all_goals_menu()));
    case "goalEvaluation":
      return Navigator.push(
          context,
          FadePageRoute(
              page: (const goal_menu_inactive(
            isActive: false,
            goal_evaluation: false,
          ))));
    case "email":
      return laucherForNotifications().emailLauncher();
    case "community":
      return laucherForNotifications().urlLauncher(url);
    default:
      return null;
  }
}

navigationIds(String route, data) async {
  final SharedPreferences prefs = await _prefs;
  if (route == "goalMenu") {
    await prefs.setInt("goal_num", data["route"]["userGoalId"]);
  } else if (route == 'dashboard') {
    await prefs.setInt("prac_num", data["route"]["userPracticeId"]);
  }
  //  ;
  // switch (route) {
  //   case "hurdle":
  //     return Navigator.push(
  //         context, FadePageRouteReverse(page: const landing_hurdles()));
  //   case "inspiration":
  //     return Navigator.push(
  //         context,
  //         FadePageRouteReverse(
  //             page: const inspiration_landing(is_Updated: false)));
  //   case "goalMenu":
  //     return Navigator.push(
  //         context,
  //         FadePageRoute(
  //             page: (const goal_menu_inactive(
  //           isActive: false,
  //           goal_evaluation: false,
  //         ))));
  //   case "goalsJourney":
  //     return Navigator.push(
  //         context, FadePageRouteReverse(page: const view_all_goals_menu()));
  //   case "goalEvaluation":
  //     return Navigator.push(
  //         context,
  //         FadePageRoute(
  //             page: (const goal_menu_inactive(
  //           isActive: false,
  //           goal_evaluation: false,
  //         ))));
  //   case "email":
  //     return laucherForNotifications().emailLauncher();
  //   case "community":
  //     return laucherForNotifications().urlLauncher(url);
  //   default:
  //     return null;
  // }
}
