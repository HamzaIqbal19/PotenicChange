import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/capture_inpirations_goals.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_landing.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_motivation.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_type.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_veiw_detail.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/note_access.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/video_access.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiratoinEdit/photoEdit.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiratoinEdit/videoEdit.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/record_inpiration_type.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_record_practice_summary.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_record_session.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/future_practice_menu.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/menu_dashboard_behaviour.dart';
import 'package:potenic_app/Screen/Goal%20Achieved%20Journey/congratulations.dart';
import 'package:potenic_app/Screen/Goal%20Achieved%20Journey/congratulations_journey.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/AllGoals.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Categories.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal%20Finished.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal-Visualising.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal-Why.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/GoalCategory.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/GoalName.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/Goal_Identity.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/StartProcess.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/goal_criteria.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/goal_criteria_impact.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/new_progress_score.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/practiceReportUnsub.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/practice_assesment_history.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/practice_progress.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/practice_score.dart';
import 'package:potenic_app/Screen/Goal%20Evaluation%20Journey/progress_report.dart';
import 'package:potenic_app/Screen/Goal%20Review%20Journey/StarReview.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_statement.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/hurdleMenu.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/splash_hurdles.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/ContactUs.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/account_deleted.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/edit_credentials.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/notifications.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/settings.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/success.dart';
import 'package:potenic_app/Screen/Notification%20Journey/message_center.dart';
import 'package:potenic_app/Screen/Onboarding%20Journey/on-boarding.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/Create%20Practice.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/Created%20Practice.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeName.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeReminder.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeRoutine.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/Activateyourstar.dart';
import 'package:potenic_app/Screen/Practice%20Review%20Journey/practiceReview.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeEmotions.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeMenu.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeStopwatch.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeSummary.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session%20Journey/recordPracticeWelldone.dart';
import 'package:potenic_app/Screen/ResetPassword/PasswordReset.dart';
import 'package:potenic_app/Screen/ResetPassword/Verification.dart';
import 'package:potenic_app/Screen/ResetPassword/reset.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpSuccessful.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';
import 'package:potenic_app/Screen/Splash/splash_page.dart';
import 'package:potenic_app/Screen/Timeline%20Journey/timeline.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_inactive_5goals.dart';
import 'package:potenic_app/Screen/Your%20Goals%20Journey/goal_menu_inactive.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/utils/route_names.dart';

class RouteFactories {
  static final GlobalKey<NavigatorState> splashKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> onBoardingKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> loginKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> signUpKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> loginEmailPassKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> signUpEmailPassKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> resetPasswordKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> signUpSuccessfullKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> verificationKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> emailSentKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> resetKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> startProcessKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> categoriesKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> allGoalsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> goalCategoryKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> goalNameKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> goalWhyKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> goalIdentityKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> visualisingKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> goalFinishedKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> startReviewKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> createPracticeKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceNameKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceRoutineKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceReminderKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceFinishedKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceReviewKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> activateStarKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> viewDashboardKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> goalMenuInactiveKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> newProgressScoreKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> goalCriteriaKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> goalCriteriaImpactKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> multipleGoalInactiveKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceMenuKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> emotionsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceReportUnsubKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceScoreKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> progressReportKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceProgressKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceAssesmentKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> clocksKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> feelingsAfterKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> practiceSummaryKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> endOfSessionKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> welldoneSplashKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> linkInfoKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> noteSavedKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> photoInfoKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> videoInfoKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> photoEditKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> videoEditKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> inspirationGoalsKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> inspirationLandingKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> inspirationMotivationKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> inspirationTypeKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> viewDetailsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> recordInspirationKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> recordSummaryKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> recordSessionKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> futurePracticeMenuKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> menuBehaviourKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> congratulationsJourneyKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> congratulationsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> hurdlesGoalImpactKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> hurdleNameKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> selectHurdleKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> hurldeStatementKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> feelingHurdlesKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> landingHurldesKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> summaryHurdlesKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> hurdleMenuKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> hurdleSplashKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> accountDeletedKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> contactUsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> editCredentialsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> notifiactionsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> successKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> messageCenterKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> timelineKey =
      GlobalKey<NavigatorState>();

  static const int splashIndex = 0;
  static const int onBoardingIndex = 1;
  static const int homeIndex = 2;
  static const int loginindex = 3;
  static const int loginwithEmailPassindex = 4;
  static const int signUpSuccessfullIndex = 5;
  static const int resetPasswordIndex = 6;
  static const int signUpEmailPassIndex = 7;
  static const int signUpIndex = 8;
  static const int verificationIndex = 9;
  static const int emailSentIndex = 10;
  static const int resetIndex = 11;
  static const int startProcessIndex = 12;
  static const int categoriesIndex = 13;
  static const int allGoalsIndex = 14;
  static const int goalCategoryIndex = 15;
  static const int goalNameIndex = 16;
  static const int goalWhyIndex = 17;
  static const int goalIdentityIndex = 18;
  static const int visualisingIndex = 19;
  static const int goalFinishedIndex = 20;
  static const int startReviewIndex = 21;
  static const int createPracticeIndex = 22;
  static const int practiceNameIndex = 23;
  static const int practiceRoutineIndex = 24;
  static const int practiceReminderIndex = 25;
  static const int practiceFinishedIndex = 26;
  static const int practiceReviewIndex = 27;
  static const int activateStarIndex = 28;
  static const int viewDashboardIndex = 29;
  static const int goalMenuInactiveIndex = 30;
  static const int newProgressScoreIndex = 31;
  static const int goalCriteriaIndex = 32;
  static const int goalCriteriaImpactIndex = 33;
  static const int multipleGoalInactiveIndex = 34;
  static const int practiceMenuIndex = 35;
  static const int emotionsIndex = 36;
  static const int practiceReportUnsubIndex = 37;
  static const int practiceScoreIndex = 38;
  static const int progressReportIndex = 39;
  static const int practiceProgressIndex = 40;
  static const int practiceAssesmentIndex = 41;
  static const int clocksIndex = 42;
  static const int feelingsAfterIndex = 43;
  static const int practiceSummaryIndex = 44;
  static const int endOfSessionIndex = 45;
  static const int welldoneSplashIndex = 46;
  static const int linkInfoIndex = 47;
  static const int noteSavedIndex = 48;
  static const int photoInfoIndex = 49;
  static const int videoInfoIndex = 50;
  static const int photoEditIndex = 51;
  static const int videoEditIndex = 52;
  static const int inspirationGoalsIndex = 53;
  static const int inspirationLandingIndex = 54;
  static const int inspirationMotivationIndex = 55;
  static const int inspirationTypeIndex = 56;
  static const int viewDetailsIndex = 57;
  static const int recordInspirationIndex = 58;
  static const int recordSummaryIndex = 59;
  static const int recordSessionIndex = 60;
  static const int futurePracticeMenuIndex = 61;
  static const int menuBehaviourIndex = 62;
  static const int congratulationsJourneyIndex = 63;
  static const int congratulationsIndex = 64;
  static const int hurdlesGoalImpactIndex = 65;
  static const int hurdleNameIndex = 66;
  static const int selectHurdleIndex = 67;
  static const int hurldeStatementIndex = 68;
  static const int feelingHurdlesIndex = 69;
  static const int landingHurldesIndex = 70;
  static const int summaryHurdlesIndex = 71;
  static const int hurdleMenuIndex = 72;
  static const int hurdleSplashIndex = 73;
  static const int accountDeletedIndex = 74;
  static const int contactUsIndex = 75;
  static const int editCredentialsIndex = 76;
  static const int notifiactionsIndex = 78;
  static const int settingsIndex = 79;
  static const int successIndex = 80;
  static const int messageCenterIndex = 81;
  static const int timelineIndex = 82;

  static GlobalKey<NavigatorState> _currentNavigator = splashKey;
  static GlobalKey<NavigatorState> get currentNavigator => _currentNavigator;

  static void updateCurrentNavigator(int currentIndex) {
    switch (currentIndex) {
      case splashIndex:
        _currentNavigator = splashKey;
        break;
      case onBoardingIndex:
        _currentNavigator = onBoardingKey;
        break;
      case homeIndex:
        _currentNavigator = homeKey;
        break;
      case loginindex:
        _currentNavigator = loginKey;
        break;
      case loginwithEmailPassindex:
        _currentNavigator = loginEmailPassKey;
        break;
      case signUpIndex:
        _currentNavigator = signUpKey;
        break;
      case signUpEmailPassIndex:
        _currentNavigator = signUpEmailPassKey;
        break;
      case signUpSuccessfullIndex:
        _currentNavigator = signUpSuccessfullKey;
        break;
      case resetPasswordIndex:
        _currentNavigator = resetPasswordKey;
        break;
      case verificationIndex:
        _currentNavigator = verificationKey;
        break;
      case emailSentIndex:
        _currentNavigator = emailSentKey;
        break;
      case resetIndex:
        _currentNavigator = resetKey;
        break;
      case startProcessIndex:
        _currentNavigator = startProcessKey;
        break;
      case categoriesIndex:
        _currentNavigator = categoriesKey;
        break;
      case allGoalsIndex:
        _currentNavigator = allGoalsKey;
        break;
      case goalCategoryIndex:
        _currentNavigator = goalCategoryKey;
        break;
      case goalNameIndex:
        _currentNavigator = goalNameKey;
        break;
      case goalWhyIndex:
        _currentNavigator = goalWhyKey;
        break;
      case goalIdentityIndex:
        _currentNavigator = goalIdentityKey;
        break;
      case visualisingIndex:
        _currentNavigator = visualisingKey;
        break;
      case goalFinishedIndex:
        _currentNavigator = goalFinishedKey;
        break;
      case startReviewIndex:
        _currentNavigator = startReviewKey;
        break;
      case createPracticeIndex:
        _currentNavigator = createPracticeKey;
        break;
      case practiceNameIndex:
        _currentNavigator = practiceNameKey;
        break;
      case practiceRoutineIndex:
        _currentNavigator = practiceRoutineKey;
        break;
      case practiceReminderIndex:
        _currentNavigator = practiceReminderKey;
        break;
      case practiceFinishedIndex:
        _currentNavigator = practiceFinishedKey;
        break;
      case practiceReviewIndex:
        _currentNavigator = practiceReviewKey;
        break;
      case activateStarIndex:
        _currentNavigator = activateStarKey;
        break;
      case viewDashboardIndex:
        _currentNavigator = viewDashboardKey;
        break;
      case goalMenuInactiveIndex:
        _currentNavigator = goalMenuInactiveKey;
        break;
      case newProgressScoreIndex:
        _currentNavigator = newProgressScoreKey;
        break;
      case goalCriteriaIndex:
        _currentNavigator = goalCriteriaKey;
        break;
      case goalCriteriaImpactIndex:
        _currentNavigator = goalCriteriaImpactKey;
        break;
      case multipleGoalInactiveIndex:
        _currentNavigator = multipleGoalInactiveKey;
        break;
      case practiceMenuIndex:
        _currentNavigator = practiceMenuKey;
        break;
      case emotionsIndex:
        _currentNavigator = emotionsKey;
        break;
      case practiceReportUnsubIndex:
        _currentNavigator = practiceReportUnsubKey;
        break;

      case practiceScoreIndex:
        _currentNavigator = practiceScoreKey;
        break;
      case progressReportIndex:
        _currentNavigator = progressReportKey;
        break;
      case practiceProgressIndex:
        _currentNavigator = practiceProgressKey;
        break;
      case practiceAssesmentIndex:
        _currentNavigator = practiceAssesmentKey;
        break;
      case clocksIndex:
        _currentNavigator = clocksKey;
        break;
      case feelingsAfterIndex:
        _currentNavigator = feelingsAfterKey;
        break;
      case practiceSummaryIndex:
        _currentNavigator = practiceSummaryKey;
        break;
      case endOfSessionIndex:
        _currentNavigator = endOfSessionKey;
        break;
      case welldoneSplashIndex:
        _currentNavigator = welldoneSplashKey;
        break;
      case linkInfoIndex:
        _currentNavigator = linkInfoKey;
        break;
      case noteSavedIndex:
        _currentNavigator = noteSavedKey;
        break;
      case photoInfoIndex:
        _currentNavigator = photoInfoKey;
        break;
      case videoInfoIndex:
        _currentNavigator = videoInfoKey;
        break;
      case photoEditIndex:
        _currentNavigator = photoEditKey;
        break;
      case videoEditIndex:
        _currentNavigator = videoEditKey;
        break;
      case inspirationGoalsIndex:
        _currentNavigator = inspirationGoalsKey;
        break;
      case inspirationLandingIndex:
        _currentNavigator = inspirationLandingKey;
        break;
      case inspirationMotivationIndex:
        _currentNavigator = inspirationMotivationKey;
        break;
      case inspirationTypeIndex:
        _currentNavigator = inspirationTypeKey;
        break;
      case viewDetailsIndex:
        _currentNavigator = viewDetailsKey;
        break;
      case recordInspirationIndex:
        _currentNavigator = recordInspirationKey;
        break;
      case recordSummaryIndex:
        _currentNavigator = recordSummaryKey;
        break;
      case recordSessionIndex:
        _currentNavigator = recordSessionKey;
        break;
      case futurePracticeMenuIndex:
        _currentNavigator = futurePracticeMenuKey;
        break;
      case menuBehaviourIndex:
        _currentNavigator = menuBehaviourKey;
        break;
      case congratulationsIndex:
        _currentNavigator = congratulationsKey;
        break;
      case congratulationsJourneyIndex:
        _currentNavigator = congratulationsJourneyKey;
        break;
      case hurdlesGoalImpactIndex:
        _currentNavigator = hurdlesGoalImpactKey;
        break;
      case hurdleNameIndex:
        _currentNavigator = hurdleNameKey;
        break;
      case selectHurdleIndex:
        _currentNavigator = selectHurdleKey;
        break;
      case hurldeStatementIndex:
        _currentNavigator = hurldeStatementKey;
        break;
      case feelingHurdlesIndex:
        _currentNavigator = feelingHurdlesKey;
        break;
      case landingHurldesIndex:
        _currentNavigator = landingHurldesKey;
        break;
      case summaryHurdlesIndex:
        _currentNavigator = summaryHurdlesKey;
        break;
      case hurdleMenuIndex:
        _currentNavigator = hurdleMenuKey;
        break;
      case hurdleSplashIndex:
        _currentNavigator = hurdleSplashKey;
        break;
      case accountDeletedIndex:
        _currentNavigator = accountDeletedKey;
        break;
      case contactUsIndex:
        _currentNavigator = contactUsKey;
        break;
      case editCredentialsIndex:
        _currentNavigator = editCredentialsKey;
        break;
      case notifiactionsIndex:
        _currentNavigator = notifiactionsKey;
        break;
      case settingsIndex:
        _currentNavigator = settingsKey;
        break;
      case successIndex:
        _currentNavigator = successKey;
        break;
      case messageCenterIndex:
        _currentNavigator = messageCenterKey;
        break;
      case timelineIndex:
        _currentNavigator = timelineKey;
        break;
    }
  }

  static void popCurrentRouteToFirst() {
    if (currentNavigator.currentState != null) {
      currentNavigator.currentState!.popUntil((route) => route.isFirst);
    }
  }

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const SplashPage());
      case RouteNames.onboarding:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const OnBoarding());
      case RouteNames.login:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const LoginPage());
      case RouteNames.loginEmailPass:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const Loginemailandpassword());
      case RouteNames.signUp:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const SignUpPage());
      case RouteNames.signUpEmailPass:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const SignUpWithEmail());
      case RouteNames.signUpSuccessfull:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const SignUpSuccessful(
                  name: '',
                ));
      // case RouteNames.liquidityPool:
      // return MaterialPageRoute(
      //     settings: settings, builder: (context) => const LiquidityPool());
      case RouteNames.resetPassword:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const PasswordReset());
      case RouteNames.verification:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const Verification(
                  email: '',
                ));
      case RouteNames.reset:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const reset());
      case RouteNames.startProcess:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const StartProcess());
      case RouteNames.categories:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const Categories());
      // case RouteNames.otpEmail:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (context) => OtpEmailVerify());
      case RouteNames.allGoals:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const AllGoals());
      // case RouteNames.referralCode:
      //   return
      case RouteNames.goalCategory:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const GoalCategory(
                  '',
                  '',
                  0,
                ));

      case RouteNames.goalName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => GoalName(catId,
                comingFromEditScreen: true, route: '', saved: true));
      case RouteNames.goalWhy:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const GoalWhy(
                  comingFromEditScreen: false,
                  route: '',
                  saved: true,
                ));
      case RouteNames.goalIdentity:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const Goal_Identity(
                  comingFromEditScreen: false,
                  route: '',
                  saved: true,
                ));
      case RouteNames.visualising:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const Visualising(
                  comingFromEditScreen: true,
                  saved: true,
                  route: '',
                ));
      case RouteNames.goalFinished:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const GoalFinished());
      case RouteNames.starReview:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const StarReview(
                  route: '',
                ));
      case RouteNames.createPractice:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const CreatePractice());

      case RouteNames.practiceName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const PracticeName(
                  comingFromEditScreen: false,
                ));
      case RouteNames.practiceRoutine:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const PracticeRoutine());
      case RouteNames.practiceReminder:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const PracticeReminder(
                  comingFromEditScreen: false,
                  goalColor: '',
                  pracColor: '',
                  praticeName: '',
                  goalName: '',
                ));
      case RouteNames.practiceFinished:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const PracticeFinished());
      case RouteNames.practiceReview:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const PracticeReview());
      case RouteNames.activateStar:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const ActivateStar());
      case RouteNames.viewDashboard:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const ViewDashboard(
                  missed: true,
                  update: false,
                  name: '',
                  helpfulTips: false,
                  record: 0,
                ));
      case RouteNames.goalMenuInactive:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const goal_menu_inactive(
                  isActive: true,
                  goal_evaluation: true,
                ));
      case RouteNames.newProgressScore:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const new_progress_score(
                  premium: true,
                  evaluationIndex: 0,
                  dateChange: false,
                ));
      case RouteNames.goalCriteria:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const your_why(
                  destination: '',
                  index: 0,
                  premium: false,
                ));

      case RouteNames.goalCriteriaImpact:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const your_impact(
                  index: 0,
                  premium: false,
                ));
      case RouteNames.multipleGoalInactive:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const multiple_goal_inactive());
      case RouteNames.practiceMenu:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const practiceMenu(
                  goal_eval: false,
                  completed: true,
                ));
      case RouteNames.emotions:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const emotions(
                  summary: false,
                  selected: 0,
                  pracName: '',
                  record: true,
                ));
      case RouteNames.progressReportUnsub:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const progress_report_unsub());
      case RouteNames.practiceScore:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const prac_score(
                  route: '',
                  index: 0,
                  secondaryRoute: '',
                ));
      case RouteNames.progressReport:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const ProgressReport(
                  index: 0,
                ));
      case RouteNames.practiceProgress:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const practice_progress(
                  days: 0,
                  route: '',
                ));
      case RouteNames.practiceAssesment:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const practice_assesment(
                  days: 0,
                  route: '',
                ));
      case RouteNames.clocks:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const clocks());
      case RouteNames.feelingsAfter:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const feelingsAfter(
                  summary: false,
                  selected: 0,
                ));
      case RouteNames.practiceSummary:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const practice_summary(
                  view: true,
                  newSession: '',
                ));
      case RouteNames.endOfSession:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const endofSession(
                  selected: 0,
                  summary: true,
                ));
      case RouteNames.welldoneSplash:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const welldone_splash());
      case RouteNames.linkInfo:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const link_info(
                  link_state: true,
                ));
      case RouteNames.noteSaved:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const noteSaved());

      case RouteNames.photoInfo:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const photo_info());

      case RouteNames.videoInfo:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const video_info(
                  link_state: true,
                ));

      case RouteNames.photoEdit:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const photo_Edit(
                  updateData: false,
                ));

      case RouteNames.videoEdit:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const videoEdit(
                  note: false,
                  context: true,
                  updateData: false,
                ));

      case RouteNames.inspirationGoals:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const inspiraton_goals(
                data_saved: true,
                route: '',
                note: true,
                context: true,
                update: true));

      case RouteNames.inspirationLanding:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const inspiration_landing(
                  is_Updated: true,
                ));

      case RouteNames.inspirationMotivation:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const inspiration_motivation(
                  goal_delete: true,
                  inspirationName: '',
                ));

      case RouteNames.inspirationType:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const inspiration_type());

      case RouteNames.viewDetails:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const view_details());

      case RouteNames.recordInspiration:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const record_inspiration());

      case RouteNames.recordSummary:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const record_summary());

      case RouteNames.recordSession:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const record_session(
                  past_session: true,
                ));

      case RouteNames.futurePracticeMenu:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const futurePracticeMenu(
                  pracName: '',
                ));

      case RouteNames.menuBehaviour:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const menu_behaviour());

      case RouteNames.congratulations:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const congratulations());

      case RouteNames.congratulationsJourney:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const Congratulations_journey());
      case RouteNames.hurdlesGoalImpact:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const hurdles_goal_impact(
                  summary: true,
                ));
      case RouteNames.hurdleName:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const hurdle_name(
                  update: true,
                ));
      case RouteNames.selectHurdle:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const select_hurdle(
                  update: true,
                ));
      case RouteNames.hurldeStatement:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const hurdle_statement(
                  update: true,
                ));
      case RouteNames.feelingHurdles:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const felling_hurdles(
                  update: true,
                ));
      case RouteNames.landingHurldes:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const landing_hurdles());
      case RouteNames.summaryHurdles:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const summary_hurdles(
                  delete_hurdle: true,
                ));

      case RouteNames.hurdleMenu:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const hurdle_menu());
      case RouteNames.hurdleSplash:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const hurdles_splash());
      case RouteNames.accountDeleted:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const Acc_deleted());
      case RouteNames.contactUs:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const ContactUs());
      case RouteNames.editCredentials:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const edit_credentials(
                  email: true,
                  password_edit: true,
                ));
      case RouteNames.notifiactions:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const notifications());
      case RouteNames.settings:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const Settings());
      case RouteNames.success:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const Success());
      case RouteNames.messageCenter:
        return MaterialPageRoute(
            settings: settings, builder: (context) => const MessageCenter());
      case RouteNames.timeline:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => const timeline(
                  goalId: 0,
                  pracId: 0,
                ));

      default:
        return errorRoute;
    }
  }

  static Route get errorRoute => MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(child: Text('Error')),
          );
        },
      );
}
