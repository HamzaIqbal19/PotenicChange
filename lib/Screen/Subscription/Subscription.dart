import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Subscription/subscriptionService.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/resetDialog.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_dimensions.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
void updateStatus() async {
  final SharedPreferences prefs = await _prefs;

  prefs.setString('subscriptionStatus', 'active');
}

class _SubscriptionState extends State<Subscription>
    with TickerProviderStateMixin {
  final GlobalKey<AdvanceExpansionTileState> _globalKey = GlobalKey();

  late AnimationController controller;

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
            Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    // width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    fit: BoxFit.contain,
                  )),
            )
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
                        fontSize: AppDimensions.font10(context) * 2.4,
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
                  'Get more value from Potenic to help you\nachieve personal transformation towards\nself-fulfilment consistently.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontWeight: FontWeight.w500,
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              Container(
                // height: AppDimensionsUpdated.height10(context) * 148.3,
                width: double.infinity,
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 2.8),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
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
                              fontSize: AppDimensions.font10(context) * 2.2,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        )),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 32.7,
                      margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 0.326,
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  //height: AppDimensionsUpdated.height10(context) * 0.15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Laila',
                                  color: const Color(0xFF437296)),
                              children: [
                                TextSpan(
                                    text:
                                        'Upgrade today to unlock the following benefits.\nYou get everything that is included in the\n',
                                    style: TextStyle(
                                      height: AppDimensionsUpdated.height10(
                                              context) *
                                          0.15,
                                    )),
                                const TextSpan(
                                  text: '‘Empowered Starter’',
                                  // style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const TextSpan(text: ' plan plus:')
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
                            .makePayment('price_1OlQz5RkeqntfFwkHoelDUgz')
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
                                              page: const view_goals(
                                            missed: false,
                                            name: '',
                                            update: false,
                                            helpfulTips: false,
                                            record: 0,
                                          ))),
                                      subscribed(context),
                                      updateStatus()
                                    }
                                });
                      },
                      child: priceBox(context, '£7.49', 'Per Month',
                          '5 days free', const Color(0xFFFA9934)),
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        SubscriptionService()
                            .makePayment('price_1OlQz5RkeqntfFwk39D9nntN')
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
                                              page: const view_goals(
                                            missed: false,
                                            name: '',
                                            update: false,
                                            helpfulTips: false,
                                            record: 0,
                                          ))),
                                      subscribed(context),
                                      updateStatus()
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
                      width: AppDimensionsUpdated.width10(context) * 14.9,
                      height: AppDimensionsUpdated.height10(context) * 1.9,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 3),
                      child: Center(
                        child: Text(
                          'Check what you get',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontWeight: FontWeight.w500,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 32.4,
                      height: AppDimensionsUpdated.height10(context) * 4.629,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 0.15),
                      child: Center(
                        child: Text(
                          'More focused ME time awaits\nyou from a single mouse click...',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
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
                                                  1.5,
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
                                                    1.5,
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
                                                  ' (create\nand save as many as\nyou like)')
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
                                        child: Text(
                                      'Up to 3 per\nactive goal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          color: const Color(0xFF437296)),
                                    )),
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
                                        child: Text(
                                      'Up to 5 per\nactive goal',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.font10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
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
                                                children: const [
                                          TextSpan(
                                            text: 'Define a ',
                                          ),
                                          TextSpan(
                                              text: 'sticky inspiring vision',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
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
                                                children: const [
                                          TextSpan(
                                            text: 'Build your',
                                          ),
                                          TextSpan(
                                              text: ' inspiration board',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
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
                                                children: const [
                                          TextSpan(
                                            text: 'Build ',
                                          ),
                                          TextSpan(
                                              text: ' self-reliance ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
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
                                                children: const [
                                          TextSpan(
                                              text: 'Goal evaluation ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
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
                                              text: 'Practice\nevaluation',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          TextSpan(
                                              text: ' and progress reports')
                                        ]))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensionsUpdated.height10(context) *
                                            7.3,
                                    height:
                                        AppDimensionsUpdated.height10(context) *
                                            4.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensionsUpdated.height10(
                                                context) *
                                            4.1),
                                    // height: AppDimensionsUpdated.height10(context) * 1.9,
                                    child: Center(
                                      child: Text(
                                        'Practice\nevaluation\nonly',
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
                      height: AppDimensionsUpdated.height10(context) * 8.827,
                      child: Column(
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
                                            FlutterWebBrowser.openWebPage(
                                              url:
                                                  "https://app.getterms.io/view/XWpOJ/tos/en-au",
                                              customTabsOptions:
                                                  const CustomTabsOptions(
                                                colorScheme:
                                                    CustomTabsColorScheme.dark,
                                                shareState:
                                                    CustomTabsShareState.on,
                                                instantAppsEnabled: true,
                                                showTitle: true,
                                                urlBarHidingEnabled: true,
                                              ),
                                              safariVCOptions:
                                                  const SafariViewControllerOptions(
                                                barCollapsingEnabled: true,
                                                preferredBarTintColor:
                                                    Colors.green,
                                                preferredControlTintColor:
                                                    Colors.amber,
                                                dismissButtonStyle:
                                                    SafariViewControllerDismissButtonStyle
                                                        .close,
                                                modalPresentationCapturesStatusBarAppearance:
                                                    true,
                                              ),
                                            );
                                          },
                                        style: const TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    const TextSpan(text: ' and '),
                                    TextSpan(
                                        text: 'Privacy policy',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            FlutterWebBrowser.openWebPage(
                                              url:
                                                  "https://app.getterms.io/view/XWpOJ/privacy/en-au",
                                              customTabsOptions:
                                                  const CustomTabsOptions(
                                                colorScheme:
                                                    CustomTabsColorScheme.dark,
                                                shareState:
                                                    CustomTabsShareState.on,
                                                instantAppsEnabled: true,
                                                showTitle: true,
                                                urlBarHidingEnabled: true,
                                              ),
                                              safariVCOptions:
                                                  const SafariViewControllerOptions(
                                                barCollapsingEnabled: true,
                                                preferredBarTintColor:
                                                    Colors.green,
                                                preferredControlTintColor:
                                                    Colors.amber,
                                                dismissButtonStyle:
                                                    SafariViewControllerDismissButtonStyle
                                                        .close,
                                                modalPresentationCapturesStatusBarAppearance:
                                                    true,
                                              ),
                                            );
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
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: AppDimensionsUpdated.height10(context) * 2.4),
                margin: EdgeInsets.only(
                    bottom: AppDimensionsUpdated.height10(context) * 9.4),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
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
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 34.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 9.4,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          3.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.12,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 1: \n',
                                            style: TextStyle(
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    0.13,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Is there a free trial on Ownership Plan?')
                                      ])),
                                ),
                                SizedBox(
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0,
                                ),
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          5.1,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.14,
                                              color: const Color(0xFF437296)),
                                          children: const [
                                        TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                                'Yes, we offer a free 5-day trial period for both monthly and yearly plans.')
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    AppDimensionsUpdated.height10(context) *
                                        1.5),
                            width: AppDimensionsUpdated.width10(context) * 7.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 34.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 17.2,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          5.9,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.13,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 2: \n',
                                            style: TextStyle(
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Can I upgrade from monthly to yearly or\ndowngrade from yearly to monthly?')
                                      ])),
                                ),
                                SizedBox(
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0,
                                ),
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          10.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.14,
                                              color: const Color(0xFF437296)),
                                          children: const [
                                        TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                                'You can upgrade to an yearly plan in any month\nbefore your recurring monthly billing is due. If you\nwant to downgrade from yearly plan, make sure to\nchoose monthly payment by the time your yearly plan is due to renew. ')
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    AppDimensionsUpdated.height10(context) *
                                        1.5),
                            width: AppDimensionsUpdated.width10(context) * 7.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensionsUpdated.width10(context) * 34.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 14.1,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  //   height: AppDimensionsUpdated.height10(context) * 3.6,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.12,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 3: \n',
                                            style: TextStyle(
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Can I cancel my subscription?')
                                      ])),
                                ),
                                SizedBox(
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0,
                                ),
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  //  height: AppDimensionsUpdated.height10(context) * 8.5,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.14,
                                              color: const Color(0xFF437296)),
                                          children: const [
                                        TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                                'Yes you can by going into your Account Settings.\nRemember to cancel your subscription plan no\nearlier than 3 working days before your plan is due to\nrenew.')
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    AppDimensionsUpdated.height10(context) *
                                        1.5),
                            width: AppDimensionsUpdated.width10(context) * 7.4,
                            height:
                                AppDimensionsUpdated.height10(context) * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensionsUpdated.height10(context) *
                                        2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensionsUpdated.height10(context) *
                                    1.052),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          7.6,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.13,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 4: \n',
                                            style: TextStyle(
                                                height: AppDimensionsUpdated
                                                        .height10(context) *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'I don’t want to upgrade to Ownership Plan,\nwhat happens to my Empowered Starter\nPlan?')
                                      ])),
                                ),
                                SizedBox(
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          1.0,
                                ),
                                SizedBox(
                                  width: AppDimensionsUpdated.width10(context) *
                                      34.4,
                                  //  height: AppDimensionsUpdated.height10(context) * 15.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensionsUpdated.height10(
                                                          context) *
                                                      0.14,
                                              color: const Color(0xFF437296)),
                                          children: const [
                                        TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                                'If you stay on our free Empowered Starter plan, you\nget it for lifetime. No subscription fees, it’s yours to\nown :)\n\nFor a more personalised experience and clarity on your growth progress towards self-fulfilment, we recommend you upgrade to our Ownership Plan (if you’re serious about your personal growth).')
                                      ])),
                                ),
                              ],
                            ),
                          ),
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

subscribed(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.5,
                    bottom: AppDimensionsUpdated.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 30.7,
                height: AppDimensionsUpdated.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.2),
                child: Text(
                  'Your Ownership Plan\nStarts Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.4,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensionsUpdated.width10(context) * 33.2,
                  //  height: AppDimensionsUpdated.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontFamily: 'laila',
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                                text: 'Your first steps & 5 day trial\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'You’re now on a 5-day trial.\n\nPlease check your email (you should have\nreceived a confirmation welcome email).\n\nWe look forward to supporting you on your\npersonal development journey!')
                          ]))),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 3),
            ],
          )),
    ),
  );
}

planBox(BuildContext context, message) {
  return SizedBox(
    width: AppDimensionsUpdated.width10(context) * 33.5,
    height: AppDimensionsUpdated.height10(context) * 4.9,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: AppDimensionsUpdated.width10(context) * 3,
            height: AppDimensionsUpdated.height10(context) * 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/tick_circle.webp'))),
          ),
        ),
        SizedBox(
          width: AppDimensionsUpdated.width10(context) * 1.4,
        ),
        SizedBox(
          height: AppDimensionsUpdated.height10(context) * 4.9,
          width: AppDimensionsUpdated.width10(context) * 28.5,
          child: Text(
            message,
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.52,
                fontWeight: FontWeight.w400,
                // height: AppDimensionsUpdated.height10(context) * 0.15,
                fontFamily: 'Laila',
                color: const Color(0xFF437296)),
          ),
        )
      ],
    ),
  );
}

priceBox(BuildContext context, price, duration, trialPeriod, color) {
  return Container(
    width: AppDimensionsUpdated.width10(context) * 32.1,
    height: AppDimensionsUpdated.height10(context) * 7.6,
    margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.3),
    decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 1.8),
        color: color),
    child: Column(
      children: [
        Container(
          width: AppDimensionsUpdated.width10(context) * 27.1,
          height: AppDimensionsUpdated.height10(context) * 1.9,
          margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 1.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 18.4,
                height: AppDimensionsUpdated.height10(context) * 1.9,
                child: Text(
                  'Unlock ‘Ownership’ Plan',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.7,
                      fontWeight: FontWeight.w500,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 4.3,
                height: AppDimensionsUpdated.height10(context) * 1.9,
                child: Text(
                  price,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.7,
                      fontWeight: FontWeight.w500,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              )
            ],
          ),
        ),
        Container(
          width: AppDimensionsUpdated.width10(context) * 27.1,
          height: AppDimensionsUpdated.height10(context) * 1.9,
          margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 7.0,
                height: AppDimensionsUpdated.height10(context) * 1.7,
                child: Text(
                  trialPeriod,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.5,
                      fontWeight: FontWeight.w400,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 6.9,
                height: AppDimensionsUpdated.height10(context) * 1.7,
                child: Center(
                  child: Text(
                    duration,
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 1.5,
                        fontWeight: FontWeight.w400,
                        // height: AppDimensionsUpdated.height10(context) * 0.15,
                        fontFamily: 'Laila',
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

unsubscribed(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.5,
                    bottom: AppDimensionsUpdated.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 30.7,
                height: AppDimensionsUpdated.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.2),
                child: Text(
                  'Ownership Plan\nis now cancelled',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.4,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensionsUpdated.width10(context) * 33.2,
                  //  height: AppDimensionsUpdated.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontFamily: 'laila',
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                                text:
                                    'We are sad you’ve decided to cancel your\nsubscription\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'You’ve been downgraded to Empowered Starter Plan. We know life circumstances change and evolve, so if you change your mind in the future, you can always upgrade back to\n'),
                            TextSpan(
                                text: 'Ownership Plan\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'We always look to improve and provide better service - if you could let us know your feedback by completing a short survey below we would be very grateful. Your experience is important to us.\n'),
                          ]))),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 2),
              GestureDetector(
                onTap: () {
                  webVisit(AppLinks().feedbackForm);
                },
                child: Buttons().linearGradButton(
                    AppDimensionsUpdated.height10(context) * 5,
                    AppDimensionsUpdated.height10(context) * 33.5,
                    'Send Feedback',
                    AppDimensionsUpdated.height10(context) * 2,
                    const Color(0xFF5A4D73),
                    const Color(0xFF5A4D73),
                    false),
              ),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 3),
            ],
          )),
    ),
  );
}

subscribedUser(context, bool yearly, String subId) {
  String planId = !yearly
      ? 'price_1OlQz5RkeqntfFwk39D9nntN'
      : "price_1OlQz5RkeqntfFwkHoelDUgz";
  print('Yearly: $yearly');
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.5,
                    bottom: AppDimensionsUpdated.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 30.7,
                height: AppDimensionsUpdated.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.2),
                child: Text(
                  'Your Membership',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.4,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensionsUpdated.width10(context) * 33.2,
                  //  height: AppDimensionsUpdated.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontFamily: 'laila',
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                              text:
                                  "We wanted to take a moment to express our gratitude for being part of of the Potenic family:tada:. Your commitment to enhancing your experience means the world to us.\n\nWe’re thrilled to have you on board, and look forward to continuing this journey together.\n\nIf you have any questions or need assistance, feel free to reach out to our support team. Thank you for choosing Potenic.",
                            ),
                          ]))),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 2),
              AnimatedScaleButton(
                onTap: () {
                  dialog(context,
                      'Are you sure you want to change your membership plan? The plans will be changed after current duration ends.',
                      () {
                    SubscriptionService().makePayment(planId).then((value) => {
                          print('Response Stripe Value: ${value['status']}'),
                          print('Response Stripe Value: $value'),
                          if (value['status'] == 'active' ||
                              value['status'] == 'trialing')
                            {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const view_goals(
                                    missed: false,
                                    name: '',
                                    update: false,
                                    helpfulTips: false,
                                    record: 0,
                                  ))),
                              subscribed(context),
                              updateStatus()
                            }
                        });
                  }, true);
                },
                child: Buttons().linearGradButton(
                    AppDimensionsUpdated.height10(context) * 5,
                    AppDimensionsUpdated.height10(context) * 33.5,
                    yearly
                        ? 'Renew as Monthly Membership'
                        : 'Renew as Yearly Membership',
                    AppDimensionsUpdated.height10(context) * 2,
                    const Color(0xFF5A4D73),
                    const Color(0xFF5A4D73),
                    false),
              ),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 2),
              AnimatedScaleButton(
                onTap: () {
                  dialog(context,
                      'Are you sure you want to cancel your subscription?', () {
                    SubscriptionService()
                        .cancelSubscription(subId, true)
                        .then((value) async {
                      if (value == 200) {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const view_goals(
                              missed: false,
                              name: '',
                              update: false,
                              helpfulTips: false,
                              record: 0,
                            )));
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setString('subscriptionStatus', 'inactive');
                        unsubscribed(context);
                      }
                    });
                  }, true);
                },
                child: Buttons().linearGradButton(
                    AppDimensionsUpdated.height10(context) * 5,
                    AppDimensionsUpdated.height10(context) * 33.5,
                    'Cancel Membership',
                    AppDimensionsUpdated.height10(context) * 2,
                    const Color(0xFF5A4D73).withOpacity(0.5),
                    const Color(0xFF5A4D73).withOpacity(0.5),
                    false),
              ),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 3),
            ],
          )),
    ),
  );
}
