import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_dimensions.dart';
import 'subscriptionComponents.dart';
import 'subscriptionService.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
void updateStatus(String status) async {
  final SharedPreferences prefs = await _prefs;

  prefs.setString('subscriptionStatus', status);
}

class _SubscriptionState extends State<Subscription>
    with TickerProviderStateMixin {
  final GlobalKey<AdvanceExpansionTileState> _globalKey = GlobalKey();

  int trial = 5;
  late AnimationController controller;
  getUserTrial() {
    Authentication().getUserTrials().then((value) {
      print("Trial value $value");
      setState(() {
        trial = value['remainingDays'];
      });
    });
  }
  //late Animation<double> opacityAnimation;

  @override
  initState() {
    super.initState();
    // Initialize AnimationController
    initController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initController() {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(microseconds: 300);
    controller.reverseDuration = const Duration(seconds: 1);
    // opacityAnimation = CurvedAnimation(
    //     parent: Tween<double>(begin: 1, end: 1).animate(controller),
    //     curve: Curves.easeInOut);
  }

  //bool cancel = canceled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            Buttons().closeButton(context, () {
              Navigator.pop(context);
            })
          ]),
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
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 10.0),
                child: Center(
                  child: Text(
                    'Subscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 3,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 34.2,
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 0.9),
                child: Text(
                  'Get more value from Potenic to help you achieve personal transformation towards self-fulfilment consistently.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.9,
                      fontWeight: FontWeight.w500,
                      height: AppDimensionsUpdated.height10(context) * 0.155,
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              Container(
                // height: AppDimensionsUpdated.height10(context) * 148.3,
                width: AppDimensionsUpdated.height10(context) * 38.4,

                margin: EdgeInsets.only(

                    top: AppDimensionsUpdated.height10(context) * 2.8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensionsUpdated.height10(context) * 2.0),
                    color: const Color(0xFFFBFBFB)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        width: AppDimensionsUpdated.width10(context) * 18.4,
                        margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 4.129,
                        ),
                        child: Text(
                          'Ownership Plan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        )),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 35,
                      margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 0.326,
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.5,
                                  //height: AppDimensionsUpdated.height10(context) * 0.15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Laila',
                                  color: const Color(0xFF437296)),
                              children: const [
                                TextSpan(
                                  text:
                                      'Upgrade today to unlock the following benefits. You get everything that is included in the\n',
                                ),
                                TextSpan(
                                    text: '‘Empowered Starter’',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )),
                                TextSpan(text: ' plan plus:')
                              ])),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 7.4,
                      height: AppDimensionsUpdated.height10(context) * 0.2,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 1.149),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFA9934),
                          borderRadius: BorderRadius.circular(
                              AppDimensionsUpdated.height10(context) * 0.5)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 2.49),
                      child: Column(
                        children: [
                          planBox(context,
                              'Multiple active goals (up to 3 with unlimited\ngoals that can be saved for later)'),
                          planBox(context,
                              'Multiple active practices (up to 5 per each\nactive goal)'),
                          planBox(context,
                              'Personalised infographic practice growth\nreports (every 20 active days)'),
                          planBox(context,
                              'Timeline of your recorded events all-in-one\nplace and more...'),
                        ],
                      ),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        SubscriptionService()
                            .makePayment('price_1OlQz5RkeqntfFwkHoelDUgz', 0)
                            .then((value) => {
                                  print("Subscriptiondata $value"),
                                  if (value['status'] == 'active' ||
                                      value['status'] == 'trialing')
                                    {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const ViewDashboard(
                                            missed: false,
                                            name: '',
                                            update: false,
                                            helpfulTips: false,
                                            record: 0,
                                          ))),
                                      subscribed(context),
                                      updateStatus('active')
                                    }
                                });
                      },
                      child: priceBox(context, '£7.49', 'Per Month',
                          '5 days free', const Color(0xFFFA9934)),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        SubscriptionService()
                            .makePayment('price_1OlQz5RkeqntfFwk39D9nntN', 0)
                            .then((value) => {
                                  print(
                                      'Response Stripe Value: ${value['status']}'),
                                  print('Response Stripe Value: $value'),
                                  if (value['status'] == 'active' ||
                                      value['status'] == 'trialing')
                                    {
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: const ViewDashboard(
                                            missed: false,
                                            name: '',
                                            update: false,
                                            helpfulTips: false,
                                            record: 0,
                                          ))),
                                      subscribed(context),
                                      updateStatus('active')
                                    }
                                });
                      },
                      child: priceBox(context, '£79.98', 'Per Year',
                          '5 days free', const Color(0xFFFE6624)),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 7.4,
                      height: AppDimensionsUpdated.height10(context) * 0.2,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 2.471),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFA9934),
                          borderRadius: BorderRadius.circular(
                              AppDimensionsUpdated.height10(context) * 0.5)),
                    ),
                    Container(
                      // width: AppDimensionsUpdated.width10(context) * 14.9,
                      // height: AppDimensionsUpdated.height10(context) * 1.9,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 3),
                      child: Center(
                        child: Text(
                          'Check what you get',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.2,
                              fontWeight: FontWeight.w600,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      // width: AppDimensionsUpdated.width10(context) * 32.4,
                      // height: AppDimensionsUpdated.height10(context) * 4.629,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 0.15),
                      child: Center(
                        child: Text(
                          'More focused ME time awaits you\nfrom a single mouse click...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 2.0,
                              fontWeight: FontWeight.w400,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 36.0,
                      height: AppDimensionsUpdated.height10(context) * 58.8,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 2.1),
                      child: Stack(children: [
                        Column(
                          children: [
                            Align(
                              alignment: const Alignment(1, 0),
                              child: Container(
                                width: AppDimensionsUpdated.width10(context) *
                                    19.6,
                                height: AppDimensionsUpdated.height10(context) *
                                    3.934,
                                // alignment: Alignment(1, 0),
                                margin: EdgeInsets.only(
                                    top:
                                        AppDimensionsUpdated.height10(context) *
                                            1.3,
                                    right:
                                        AppDimensionsUpdated.height10(context) *
                                            0.4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: AppDimensionsUpdated.height10(
                                              context) *
                                          9.1,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          3.934,
                                      child: Center(
                                        child: Text(
                                          'Empowered\n(free)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w700,
                                              // height:
                                              //     AppDimensionsUpdated.height10(context) * 0.15,
                                              color: const Color(0xFF437296)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimensionsUpdated.height10(
                                              context) *
                                          7.7,
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          19.67,
                                      child: Text(
                                        'Ownership',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.6,
                                            fontWeight: FontWeight.w700,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.15,
                                            color: const Color(0xFF437296)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 4.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.066),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            4.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: const [
                                          TextSpan(
                                              text: 'Active Goals',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text:
                                                  '\n(create and save as\nmany as you like)')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            5.9),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(
                                        child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.9,
                                          fontWeight: FontWeight.w500,
                                          // height:
                                          //     AppDimensionsUpdated.height10(context) *
                                          //         0.12,
                                          color: const Color(0xFF437296)),
                                    )),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            7.9),
                                    //   height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(
                                        child: Text(
                                      '3',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.9,
                                          fontWeight: FontWeight.w500,
                                          // height:
                                          //     AppDimensionsUpdated.height10(context) *
                                          //         0.12,
                                          color: const Color(0xFF437296)),
                                    )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 4.9,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            4.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: const [
                                          TextSpan(
                                              text: 'Active Practices\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text:
                                                  '(create and save as many as you like)')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            7.5,
                                    // height: AppDimensionsUpdated.height10(context) * 3.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            3.1),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: const [
                                          TextSpan(
                                            text: 'Up to ',
                                          ),
                                          TextSpan(
                                              text: '3 per\nactive goal',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            7.5,
                                    //height: AppDimensionsUpdated.height10(context) * 3.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            2.6),
                                    //   height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: const [
                                          TextSpan(
                                            text: 'Up to ',
                                          ),
                                          TextSpan(
                                              text: '5 per\nactive goal',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
                                        ]))),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 3.4,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            3.4,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                            text: 'Define a ',
                                          ),
                                          TextSpan(
                                              text: 'sticky inspiring vision',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.13,
                                              ))
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            5.7),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            7.4),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 3.4,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            3.4,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                            text: 'Build your',
                                          ),
                                          TextSpan(
                                              text: ' inspiration board',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.13,
                                              ))
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            5.7),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            7.4),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 5.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            5.1,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                            text: 'Build ',
                                          ),
                                          TextSpan(
                                              text: ' self-reliance ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.13,
                                              )),
                                          const TextSpan(
                                              text:
                                                  'by capturing your hurdles (unlimited)')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            5.7),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            7.4),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 5.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            5.1,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          TextSpan(
                                              text: 'Goal evaluation ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.13,
                                              )),
                                          const TextSpan(
                                              text:
                                                  'tools to help with clarity and focus')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            5.7),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(child: Container()),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            7.4),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 4.9,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            4.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: const [
                                          TextSpan(
                                              text: 'Practice evaluation\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text: ' and progress reports')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            9.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            4.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            1.6),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(
                                      child: Text(
                                        'Practice \nevaluation\nonly',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.5,
                                            fontWeight: FontWeight.w400,
                                            height: AppDimensions.height10(
                                                    context) *
                                                0.12,
                                            color: const Color(0xFF437296)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            4.1),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensionsUpdated.height10(context) *
                                      1.0,
                                  bottom:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.0,
                              height:
                                  AppDimensionsUpdated.height10(context) * 5.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            13.9,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            5.1,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.font10(
                                                                context) *
                                                            1.45,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10(
                                                                context) *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: const [
                                          TextSpan(
                                              text: 'Personalised\ntimeline  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text: 'of recorded activities')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            5.7),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(child: Container()),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            7.4),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width:
                                  AppDimensionsUpdated.width10(context) * 35.3,
                              height: AppDimensionsUpdated.height10(context) *
                                  0.075,
                              margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.0,
                              ),
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Align(
                          alignment: const Alignment(0.98, 1),
                          child: Container(
                            width: AppDimensionsUpdated.width10(context) * 9.0,
                            height:
                                AppDimensionsUpdated.height10(context) * 58.2,
                            color: const Color(0xFFFA9934).withOpacity(0.1),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: AppDimensionsUpdated.width10(context) * 34.4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 34.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 2.893,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    2.8),
                            child: Center(
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'laila',
                                          // height: AppDimensionsUpdated.height10(context) * 0.15,
                                          color: const Color(0xFF437296)),
                                      children: [
                                    const TextSpan(text: 'Read our '),
                                    TextSpan(
                                        text: 'Terms of service',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            webVisit(AppLinks().termsOfService);
                                          },
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                        text: 'Privacy policy',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            webVisit(AppLinks().privacyPolicy);
                                          },
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline))
                                  ])),
                            ),
                          ),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 34.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 2.893,
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Recurring billing. Cancel anytime. You’re in control.',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          0.15,
                                  color: const Color(0xFF437296)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 3.235,
                    bottom: AppDimensionsUpdated.height10(context) * 3.133),
                child: Image.asset(
                  'assets/images/Arrow.webp',
                  height: AppDimensionsUpdated.height10(context) * 4.811,
                  width: AppDimensionsUpdated.width10(context) * 4.811,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.height10(context) * 38.4,
                padding: EdgeInsets.only(

                    bottom: AppDimensionsUpdated.height10(context) * 2.4),
                margin: EdgeInsets.only(

                    bottom: AppDimensionsUpdated.height10(context) * 9.4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppDimensionsUpdated.height10(context) * 2.0),
                    color: const Color(0xFFFBFBFB)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 8.0,
                      height: AppDimensionsUpdated.height10(context) * 4.834,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 3.786),
                      child: Text(
                        'FAQ',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 2.8,
                            fontWeight: FontWeight.w700,
                            height:
                                AppDimensionsUpdated.height10(context) * 0.15,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    SizedBox(
                      width: AppDimensionsUpdated.width10(context) * 34.4,
                      // height: AppDimensionsUpdated.height10(context) * 72.2,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          faqsBoxc(context, '1', AppText().question1,
                              AppText().answer1),
                          faqsBoxc(context, '2', AppText().question2,
                              AppText().answer2),
                          faqsBoxc(context, '3', AppText().question3,
                              AppText().answer3),
                          faqsBoxc(context, '4', AppText().question4,
                              AppText().answer4),
                          faqsBoxc(context, '5', AppText().question5,
                              AppText().answer5),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
