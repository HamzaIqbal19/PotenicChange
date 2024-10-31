import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inpiration_motivation.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/splash_hurdles.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/settings.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/widgets/menuWidgets.dart';
import 'package:potenic_app/Screen/Notification%20Journey/message_center.dart';
import 'package:potenic_app/Screen/Onboarding%20Journey/on-boarding.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeName.dart';
import 'package:potenic_app/Screen/Subscription%20Journey/Subscription.dart';
import 'package:potenic_app/Screen/Subscription%20Journey/subscriptionComponents.dart';
import 'package:potenic_app/Screen/Subscription%20Journey/subscriptionService.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/resetDialog.dart';
import 'package:potenic_app/Widgets/tutorialBottomSheet.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
import '../Dashboard Behaviour Journey/loaders/TutorialController.dart';
import '../community/community.dart';
import 'goal_menu_inactive.dart';
import 'veiw_all_goals.dart';

class Menu extends StatefulWidget {
  const Menu({
    super.key,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool admin = false;
  bool subscribe = false;
  int trial = 0;
  String subId = '';
  String planId = '';
  bool yearly = false;
  int newMessages = 0;
  bool cancelAtPeriodEnd = false;
  String cancelDate = '1735549560';

  Future<void> getUserRole() async {
    final SharedPreferences prefs = await _prefs;
    var role = prefs.getString('userRole');
    var subscription = prefs.getString('subscriptionStatus');

    if (role == 'admin') {
      setState(() {
        admin = true;
      });
    }
    if (subscription == 'active') {
      setState(() {
        subscribe = true;
      });
    } else {
      setState(() {
        subscribe = false;
      });
    }
  }

  getSubscriptionData() {
    SubscriptionService().getCustomerData().then((value)  {

          setState(() {
            subId = value['subscriptions'] == null
                ? ''
                : value['subscriptions']['data'][0]['id'].toString();
            planId = value['subscriptions'] == null
                ? ''
                : value['subscriptions']['data'][0]['plan']['id'].toString();

            cancelAtPeriodEnd = value['subscriptions']['data'][0]['cancel_at_period_end'];
            cancelDate = value['subscriptions']['data'][0]['cancel_at'];

          });
          Future.delayed(const Duration(seconds: 2),(){
            setState(() {});
          });

          if (planId == 'price_1OlQz5RkeqntfFwk39D9nntN')
            {
              setState(() {
                yearly = true;
              });
            }
        });
  }

  getUser() {
    Authentication().getUserData().then((value) async{

      final SharedPreferences prefs = await _prefs;
      setState(() {
        newMessages = value["unreadMessageCenterCount"];
      });
      if(value['subscriptionStatus'] == 'active'){
        setState(() {
          subscribe = true;
        });
      }

      prefs.setString('subscriptionStatus', value['subscriptionStatus']);
    });
  }

  getUserTrial() {
    Authentication().getUserTrials().then((value) {
      print("Trial value $value");
      setState(() {
        trial = value['remainingDays'];
      });
      Future.delayed(const Duration(seconds: 2),(){
        setState(() {
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getUserRole();
    getSubscriptionData();
    getUserTrial();
  }

  @override
  Widget build(BuildContext context) {
    final TutorialController tutorialController = Get.put(TutorialController());
    final colorC = Color.alphaBlend(
        const Color(0xFF000000).withOpacity(0.2), const Color(0XFF5B74A6));
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context,
            FadePageRouteReverse(
              page: const ViewDashboard(
                missed: false,
                name: '',
                update: false,
                helpfulTips: false,
                record: 0,
              ),
            ));
        return Future.value(false);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarOpacity: 0.0,
            leading: Container(
              padding:
                  EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        FadePageRouteReverse(
                          page: const ViewDashboard(
                            missed: false,
                            name: '',
                            update: false,
                            helpfulTips: false,
                            record: 0,
                          ),
                        ));
                  },
                  icon: Image.asset(
                    'assets/images/Back.webp',
                    //  width: AppDimensions.width10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.8,
                    fit: BoxFit.contain,
                  )),
            ),
            centerTitle: true,
            title: SizedBox(
              width: AppDimensions.width10(context) * 17.0,
             // height: AppDimensions.height10(context) * 4.8,
              child: Center(
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 2.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          )),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 38.4,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 2.0),
                      color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.height10(context)*0.5,
                      ),
                      menuItems(context, () {
                        Navigator.push(context,
                            FadePageRoute(page: const view_all_goals_menu()));
                      }, 'Your goals', true),
                      menuItems(context, () {
                        Navigator.push(context,
                            FadePageRoute(page: const MessageCenter()));
                      }, 'Messages', true),
                      AnimatedScaleButton(
                        onTap: () {
                          // if (admin) {
                          //   dialog(context, "You are Potenic's admin.", () {
                          //     Navigator.pop(context);
                          //   }, false);
                          // } else {
                          if(cancelAtPeriodEnd){
                            subscribedUser(context, yearly, subId,cancelAtPeriodEnd,false);
                          }else if (trial != 0 && subscribe) {
                            subscribedUser(context, yearly, subId,false,true);
                              // dialog(context,
                              //     'Are you sure you want to cancel your subscription',
                              //     () {
                              //   SubscriptionService()
                              //       .cancelSubscriptionImmediatly(subId, true)
                              //       .then((value) {
                              //     if (value == 200) {
                              //       Navigator.push(
                              //           context,
                              //           FadePageRoute(
                              //               page: const ViewDashboard(
                              //             missed: false,
                              //             name: '',
                              //             update: false,
                              //             helpfulTips: false,
                              //             record: 0,
                              //           )));
                              //       unsubscribed(context);
                              //     }
                              //   });
                              // }, true);
                            } else
                            if (subscribe) {
                              // Navigator.push(context,
                              //     FadePageRoute(page: const Subscription()));
                              subscribedUser(context, yearly, subId,false,false);
                            } else {
                              Navigator.push(context,
                                  FadePageRoute(page: const Subscription()));
                            }
                          //}
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 33.4,
                          // height: AppDimensions.height10(context) * 5.0,
                          padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.height10(context) * 1.5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width:
                                          AppDimensions.height10(context) * 0.1,
                                      color: colorC))),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width:
                                          AppDimensions.width10(context) * 27.6,
                                      // height: AppDimensions.height10(context) * 1.9,
                                      child: RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontFamily: 'Laila',
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.15,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.74,
                                                  fontWeight: FontWeight.w500,
                                                  color: colorC),
                                              children: [
                                            const TextSpan(
                                                text:
                                                    'Membership subscription\n'),
                                            admin
                                                ?  TextSpan(
                                                    text: 'Current plan: Admin',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: AppDimensions.font10(
                                                            context) *
                                                            1.45,
                                                        color:
                                                            const Color(0xFF8C648A)))
                                                : TextSpan(
                                                    text: !subscribe
                                                        ? 'Current plan: Empowered Starter'
                                                        : 'Current plan: Ownership Plan',
                                                    style:  TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: AppDimensions.font10(
                                                            context) *
                                                            1.45,
                                                        color:
                                                            const Color(0xFF8C648A))),
                                            cancelAtPeriodEnd? TextSpan(
                                                text:
                                                '\nExpiry Date ${UnixTime().unixIntoDate(cancelDate)}',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: const Color(
                                                        0xFF8C648A),
                                                    fontSize: AppDimensions
                                                        .font10(
                                                        context) *
                                                        1.4))
                                                : const TextSpan(text: ''),
                                                 trial != 0 && subscribe
                                                ? TextSpan(
                                                    text:
                                                        '\n5 day trial, $trial remaining (Tap here to cancel)',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF8C648A),
                                                        fontSize: AppDimensions
                                                                .font10(
                                                                    context) *
                                                            1.4))
                                                : const TextSpan(text: '')
                                          ]))),
                                  SizedBox(
                                      width:
                                          AppDimensions.height10(context) * 2.4,
                                      height: AppDimensions.height10(context) *
                                          1.39,
                                      child: Image.asset(
                                        'assets/images/BTN Back.webp',
                                        //width: AppDimensions.width10(context) * 2.6,
                                        //height: AppDimensions.height10(context) * 2.6,
                                        color: colorC,
                                        fit: BoxFit.cover,
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      menuItems(context, () {
                        Navigator.push(
                            context, FadePageRoute(page: const Settings()));
                      }, 'Settings', false),
                      SizedBox(
                        height: AppDimensions.height10(context)*1,
                      ),
                    ],
                  ),
                ),
                admin
                    ? Container(
                        width: AppDimensions.width10(context) * 38.4,
                        // height: AppDimensions.height10(context) * 86.4,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0,
                            bottom: AppDimensions.height10(context) * 3.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: AppDimensions.width10(context) * 26.6,
                                height: AppDimensions.height10(context) * 2.4,
                                child: Text(
                                  'Journeys (DEV USE ONLY)',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0XFFFBFBFB)),
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 38.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: AppDimensions.height10(context)*0.5,
                                  ),
                                  menuItems(context, () async {
                                    final SharedPreferences prefs =
                                        await _prefs;
                                    prefs.remove('pracRoute');
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const OnBoarding()));
                                  }, 'J1 Onboarding', true),
                                  menuItems(context, () {},
                                      'J2 Record practice session', true),
                                  menuItems(context, () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const view_all_goals_menu()));
                                  }, 'J3 Your goals', true),
                                  menuItems(context, () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const hurdles_splash()));
                                  }, 'J4 Record hurdle', true),
                                  menuItems(context, () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const inspiration_motivation(
                                          goal_delete: false,
                                          inspirationName: '',
                                        )));
                                  }, 'J5 Record ispiration', true),
                                  menuItems(context, () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const goal_menu_inactive(
                                          isActive: true,
                                          goal_evaluation: true,
                                        )));
                                  }, 'J6 Goal evaluation', true),
                                  menuItems(
                                      context, () {}, 'J7 Practice evaluation', true),
                                  menuItems(context, () {
                                    Navigator.pop(context);
                                    community_sheet(context);
                                  }, 'J8 Community', true),
                                  menuItems(context, () {}, 'J9 Timeline', true),
                                  menuItems(
                                      context, () {}, 'J10 Goal achieved', true),
                                  menuItems(context, () {}, 'J11 Alerts', true),
                                  menuItems(context, () {
                                    Navigator.push(context,
                                        FadePageRoute(page: const Settings()));
                                  }, 'J12 Menu & Settings', true),
                                  menuItems(context, () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const ViewDashboard(
                                          missed: false,
                                          name: '',
                                          update: false,
                                          helpfulTips: false,
                                          record: 0,
                                        )));
                                  }, 'J13 Dashboard behaviour', true),
                                  menuItems(context, () {
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const ViewDashboard(
                                          missed: false,
                                          name: '',
                                          update: false,
                                          helpfulTips: true,
                                          record: 0,
                                        )));
                                    journeyBottomSheet(
                                        context,
                                        AppText().dashboardTitle,
                                        AppText().dashboardBody,
                                        AppLinks().dashboardLink,(){
                                      tutorialController.startTutorial();
                                    },false);
                                  }, 'J14 Helpful tips', true),
                                  menuItems(context, () {}, 'J15 Subscription', true),
                                  menuItems(context, () {}, 'J16 Offline mode', true),
                                  menuItems(context, () {},
                                      'Reset account to it’s default state', false),
                                  SizedBox(
                                    height: AppDimensions.height10(context) * 1,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void _canceled_plan(context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//       top: Radius.circular(AppDimensions.height10(context) * 2.0),
//     )),
//     builder: (context) => Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Container(
//           width: AppDimensions.width10(context) * 39.4,
//           height: AppDimensions.height10(context) * 75.5,
//           margin: EdgeInsets.only(
//               left: AppDimensions.width10(context) * 1.0,
//               right: AppDimensions.width10(context) * 1.0,
//               bottom: AppDimensions.height10(context) * 1.0),
//           decoration: BoxDecoration(
//               borderRadius:
//                   BorderRadius.circular(AppDimensions.height10(context) * 2.0),
//               gradient: const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
//           child: Column(
//             // alignment: AlignmentDirectional.topCenter,
//             //  mainAxisAlignment: MainAxisAlignment.start,
//             //  crossAxisAlignment: CrossAxisAlignment.center,
//             // mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 //color: Colors.amber,
//                 // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
//                 alignment: const Alignment(1, 0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     width: AppDimensions.width10(context) * 2.6,
//                     height: AppDimensions.height10(context) * 2.6,
//                     margin: EdgeInsets.only(
//                         top: AppDimensions.height10(context) * 1.9,
//                         right: AppDimensions.width10(context) * 1.5),
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image:
//                                 AssetImage('assets/images/Close_blue.webp'))),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(
//                     top: AppDimensions.height10(context) * 1.5,
//                     bottom: AppDimensions.height10(context) * 2.0),
//                 child: Image.asset(
//                   'assets/images/potenic__icon.webp',
//                   width: AppDimensions.width10(context) * 8.202,
//                   height: AppDimensions.height10(context) * 11.2,
//                 ),
//               ),
//               Container(
//                 width: AppDimensions.width10(context) * 30.7,
//                 height: AppDimensions.height10(context) * 6.8,
//                 // color: Colors.amber,
//                 alignment: Alignment.center,
//                 //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
//                 child: Text(
//                   'Ownership Plan is\nnow cancelled',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       height: AppDimensions.height10(context) * 0.12,
//                       fontSize: AppDimensions.font10(context) * 2.8,
//                       // letterSpacing: AppDimensions.height10(context) * 0.2,
//                       fontWeight: FontWeight.w700,
//                       color: const Color(0xFF437296)),
//                 ),
//               ),
//               Container(
//                   width: AppDimensions.width10(context) * 33.2,
//                   height: AppDimensions.height10(context) * 36.4,
//                   // color: Colors.grey,
//                   margin: EdgeInsets.only(
//                       top: AppDimensions.height10(context) * 1.9),
//                   child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                           style: TextStyle(
//                               fontSize: AppDimensions.font10(context) * 1.8,
//                               fontFamily: 'laila',
//                               height: AppDimensions.height10(context) * 0.15,
//                               fontWeight: FontWeight.w400,
//                               color: const Color(0xFF437296)),
//                           children: const [
//                             TextSpan(
//                                 text:
//                                     'We are sad you’ve decided to cancel\nyour subscription. \n\n',
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                             TextSpan(text: 'You’ve been downgraded to\n'),
//                             TextSpan(
//                                 text: 'Empowered Starter ',
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                             TextSpan(
//                                 text:
//                                     'Plan.\n\nWe know life circumstances change and\nevolve, so if you change your mind in\nthe future, you can always upgrade\nback to '),
//                             TextSpan(
//                                 text: 'Ownership Plan.\n\n',
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                             TextSpan(
//                               text:
//                                   'We always look to improve and provide\nbetter service - if you could let us know\nyour feedback by completing a short\nsurvey below we would be very grateful.\nYour experience is important to us. ',
//                             )
//                           ]))),
//               Container(
//                 width: AppDimensions.width10(context) * 33.5,
//                 height: AppDimensions.height10(context) * 5.0,
//                 margin:
//                     EdgeInsets.only(top: AppDimensions.height10(context) * 2.0),
//                 decoration: BoxDecoration(
//                     color: const Color(0xFF5A4D73),
//                     borderRadius: BorderRadius.circular(
//                         AppDimensions.height10(context) * 5.0)),
//                 child: Center(
//                   child: Text(
//                     'Feedback about their experience',
//                     style: TextStyle(
//                         fontSize: AppDimensions.font10(context) * 1.8,
//                         height: AppDimensions.height10(context) * 0.15,
//                         fontWeight: FontWeight.w600,
//                         color: const Color(0xFFFFFFFF)),
//                   ),
//                 ),
//               )
//             ],
//           )),
//     ),
//   );
// }

void activeReport(
    context, String goalName, String pracName, int color1, int color2) {
  //bool cancel = canceled;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 2.0)),
      builder: (context) => Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Color(0xFFFBFBFB)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Container(
              width: AppDimensions.width10(context) * 39.4,
              height: AppDimensions.height10(context) * 69.2,
              margin:
                  EdgeInsets.only(top: AppDimensions.height10(context) * 1.5),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                image: const DecorationImage(
                    image: AssetImage('assets/images/journey_0.webp'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(
                    AppDimensions.height10(context) * 2.0),
              ),
              child: Column(
                children: [
                  Container(
                    //color: Colors.amber,
                    // margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.5),
                    alignment: const Alignment(1, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.width10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.5,
                            right: AppDimensions.width10(context) * 1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Close_blue.webp'))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.5,
                        bottom: AppDimensions.height10(context) * 1.9),
                    child: Image.asset(
                      'assets/images/potenic__icon.webp',
                      width: AppDimensions.width10(context) * 8.202,
                      height: AppDimensions.height10(context) * 11.2,
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 23.8,
                    height: AppDimensions.height10(context) * 3.4,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.0),
                    child: Text(
                      'Congratulations!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: AppDimensions.font10(context) * 2.8,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 32.7,
                    //height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.0),
                    child: Text(
                      'Your 20 active day report is ready',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: AppDimensions.height10(context) * 0.12,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimensions.font10(context) * 2.0,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 33.8,
                    //height: AppDimensions.height10(context) * 6.8,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2.0),
                    child: Text(
                      'You have been consistently working on your\npractice for 20 active days now. We’ve put together\na practice report for you to review and evaluate\nyour journey.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppDimensions.font10(context) * 1.6,
                          color: const Color(0xff437296)),
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () {},
                    child: Container(
                      width: AppDimensions.width10(context) * 23.7,
                      height: AppDimensions.height10(context) * 25.5,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.2),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0XffD9B4B4), Color(0xFFF5EDED)]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  AppDimensions.height10(context)),
                              topRight: Radius.circular(
                                  AppDimensions.height10(context)),
                              bottomLeft: Radius.circular(
                                  AppDimensions.height10(context)),
                              bottomRight: Radius.circular(
                                  AppDimensions.height10(context) * 5))),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-2.5, -2.0),
                            child: Container(
                              width: AppDimensions.width10(context) * 18.7,
                              height: AppDimensions.height10(context) * 18.7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        color1 == 1
                                            ? "assets/images/red_gradient.webp"
                                            : color1 == 2
                                                ? 'assets/images/orange_moon.webp'
                                                : color1 == 3
                                                    ? "assets/images/lightGrey_gradient.webp"
                                                    : color1 == 4
                                                        ? "assets/images/lightBlue_gradient.webp"
                                                        : color1 == 5
                                                            ? "assets/images/medBlue_gradient.webp"
                                                            : color1 == 6
                                                                ? "assets/images/Blue_gradient.webp"
                                                                : 'assets/images/orange_moon.webp',
                                      ),
                                      fit: BoxFit.cover)),
                              child: Container(
                                width: AppDimensions.width10(context) * 11.5,
                                height: AppDimensions.height10(context) * 4.8,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 2),
                                alignment: const Alignment(-0.2, -0.1),
                                child: Text(
                                  capitalizeFirstLetter(goalName),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 2.0,
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff5B74A6)),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0.3, -0.4),
                            child: Container(
                              width: AppDimensions.width10(context) * 11.6,
                              height: AppDimensions.height10(context) * 11.6,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.width10(context)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(color2 == 1
                                          ? "assets/images/Ellipse orange.webp"
                                          : color2 == 2
                                              ? 'assets/images/Ellipse 158.webp'
                                              : color2 == 3
                                                  ? "assets/images/Ellipse 157.webp"
                                                  : color2 == 4
                                                      ? "assets/images/Ellipse light-blue.webp"
                                                      : color2 == 5
                                                          ? "assets/images/Ellipse blue.webp"
                                                          : 'assets/images/Ellipse 158.webp'),
                                      fit: BoxFit.contain)),
                              child: SizedBox(
                                width: AppDimensions.width10(context) * 9.5,
                                height: AppDimensions.height10(context) * 5.0,
                                child: Center(
                                  child: Text(
                                    capitalizeFirstLetter(pracName),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.6,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(-1, 0.85),
                            child: Container(
                              width: AppDimensions.width10(context) * 17.1,
                              height: AppDimensions.height10(context) * 6.4,
                              padding: EdgeInsets.only(
                                  left: AppDimensions.width10(context) * 0.84,
                                  top: AppDimensions.height10(context) * 1.04),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      // begin: Alignment.topCenter,
                                      // end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0XFF91698C)
                                            .withOpacity(0.7),
                                        const Color(0xFFC19CA7).withOpacity(0.7)
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          AppDimensions.height10(context)),
                                      bottomRight: Radius.circular(
                                          AppDimensions.height10(context)))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '20 day report',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.8,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.width10(context) * 5.03,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context)),
                                    child: Divider(
                                      height:
                                          AppDimensions.height10(context) * 0.1,
                                      color: const Color(0xFFFFFFFF)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context)),
                                    child: Text(
                                      'Ready',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.1,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}
