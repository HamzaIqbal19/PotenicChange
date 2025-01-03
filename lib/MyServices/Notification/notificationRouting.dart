import 'package:flutter/material.dart';
import 'package:potenic_app/MyServices/Notification/emailLauncher.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_landing.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_menu_inactive.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/veiw_all_goals.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

navigationRouting(BuildContext context, String route, String url) {
  switch (route) {
    case "dashboard":
      return Navigator.push(
          context, FadePageRoute(page: const practiceMenu(goal_eval: false,completed: false,)));
    case "tutorial":
      return Navigator.push(
          context,
          FadePageRoute(
              page: const ViewDashboard(
            missed: false,
            name: '',
            update: false,
            helpfulTips: true,
            record: 0,
          )));
    case "practiceEvaluation":
      return Navigator.push(
          context, FadePageRoute(page: const practiceMenu(goal_eval: false,completed: false,)));
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
    case 'contactUs':
      return laucherForNotifications().contactUsLauncher();
    default:
      return null;
  }
}

navigationIds(data) async {
  final SharedPreferences prefs = await _prefs;
  if (data["route"] == "goalMenu") {
    await prefs.setInt("goal_num", int.parse(data["userGoalId"]));
  }
  if (data["route"] == 'dashboard') {
    await prefs.setInt("prac_num", int.parse(data["userPracticeId"]));
    await prefs.setInt("goal_num", int.parse(data["userGoalId"]));
  }
  if (data["route"] == 'practiceEvaluation') {
    await prefs.setInt("prac_num", int.parse(data["userPracticeId"]));
    await prefs.setInt("goal_num", int.parse(data["userGoalId"]));
  }

  if (data["route"] == 'goalEvaluation') {
    await prefs.setInt("goal_num", int.parse(data["userGoalId"]));
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
