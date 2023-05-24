import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';

import '../../utils/app_dimensions.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  late ScrollController _scrollController;

  bool _showBackToTopButton = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(660,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

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
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.height10 * 19.9,
                height: AppDimensions.height10 * 3.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 10.0),
                child: Center(
                  child: Text(
                    'Subscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 3.0,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 34.2,
                //  height: AppDimensions.height10 * 5.7,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.9),
                child: Text(
                  'Get more value from Potenic to help you\nachieve personal transformation towards\nself-fulfilment consistently.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.6,
                      fontWeight: FontWeight.w500,
                      height: AppDimensions.height10 * 0.15,
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 38.4,
                height: AppDimensions.height10 * 148.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: const Color(0xFFFBFBFB)),
                child: Column(
                  children: [
                    Container(
                        width: AppDimensions.height10 * 18.4,
                        height: AppDimensions.height10 * 3.356,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 4.129,
                        ),
                        child: Text(
                          'Ownership Plan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        )),
                    Container(
                      width: AppDimensions.height10 * 32.4,
                      height: AppDimensions.height10 * 7.522,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 0.326,
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Laila',
                                  color: const Color(0xFF437296)),
                              children: [
                                TextSpan(
                                    text:
                                        'Upgrade today to unlock the following benefits. You get everything that is included in the ',
                                    style: TextStyle(
                                      height: AppDimensions.height10 * 0.15,
                                    )),
                                const TextSpan(
                                  text: '‘Empowered Starter’',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const TextSpan(text: ' plan plus:')
                              ])),
                    ),
                    Container(
                      width: AppDimensions.height10 * 7.4,
                      height: AppDimensions.height10 * 0.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 0.149),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFA9934),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 0.5)),
                    ),
                    Container(
                      width: AppDimensions.height10 * 32.3,
                      height: AppDimensions.height10 * 19.9,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.49),
                      child: Column(
                        children: [
                          SizedBox(
                            width: AppDimensions.height10 * 32.3,
                            height: AppDimensions.height10 * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: AppDimensions.height10 * 2.9,
                                    height: AppDimensions.height10 * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.png'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 28.0,
                                  height: AppDimensions.height10 * 4.9,
                                  child: Text(
                                    'Multiple active goals (up to 3 with\nunlimited goals that can be saved for later)',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFF437296)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 32.3,
                            height: AppDimensions.height10 * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: AppDimensions.height10 * 2.9,
                                    height: AppDimensions.height10 * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.png'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 28.0,
                                  height: AppDimensions.height10 * 4.9,
                                  child: Text(
                                    'Multiple active practices (up to 5 per each\nactive goal)',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFF437296)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 32.3,
                            height: AppDimensions.height10 * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: AppDimensions.height10 * 2.9,
                                    height: AppDimensions.height10 * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.png'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 28.0,
                                  height: AppDimensions.height10 * 4.9,
                                  child: Text(
                                    'Personalised infographic practice growth\nreports (every 20 active days)',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFF437296)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 32.3,
                            height: AppDimensions.height10 * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: AppDimensions.height10 * 2.9,
                                    height: AppDimensions.height10 * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.png'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 28.0,
                                  height: AppDimensions.height10 * 4.9,
                                  child: Text(
                                    'Timeline of your recorded events all-in-one\nplace and more...',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
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
                      width: AppDimensions.height10 * 32.1,
                      height: AppDimensions.height10 * 7.6,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 1.8),
                          color: const Color(0xFFFA9934)),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 27.1,
                            height: AppDimensions.height10 * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 18.4,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    'Unlock ‘Ownership’ Plan',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 4.3,
                                  height: AppDimensions.height10 * 1.9,
                                  child: Text(
                                    '£7.49',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w500,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 27.1,
                            height: AppDimensions.height10 * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 7.0,
                                  height: AppDimensions.height10 * 1.7,
                                  child: Text(
                                    '5 days free',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10 * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 6.9,
                                  height: AppDimensions.height10 * 1.7,
                                  child: Center(
                                    child: Text(
                                      'Per Month',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w400,
                                          // height: AppDimensions.height10 * 0.15,
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const dashBoard(
                                      helpful_tips: false,
                                      dashboard_ctrl: true,
                                      membership: false,
                                      trial: true,
                                      cancel: false,
                                    )));
                        subscribed(context);
                      },
                      child: Container(
                        width: AppDimensions.height10 * 32.1,
                        height: AppDimensions.height10 * 7.6,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 1.3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 1.5),
                            color: const Color(0xFFFE6624)),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 27.1,
                              height: AppDimensions.height10 * 1.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 18.4,
                                    height: AppDimensions.height10 * 1.9,
                                    child: Text(
                                      'Unlock ‘Ownership’ Plan',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          // height: AppDimensions.height10 * 0.15,
                                          fontFamily: 'Laila',
                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDimensions.height10 * 4.3,
                                    height: AppDimensions.height10 * 1.9,
                                    child: Text(
                                      '£79.98',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.6,
                                          fontWeight: FontWeight.w500,
                                          // height: AppDimensions.height10 * 0.15,
                                          fontFamily: 'Laila',
                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 27.1,
                              height: AppDimensions.height10 * 1.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 0.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 7.0,
                                    height: AppDimensions.height10 * 1.7,
                                    child: Text(
                                      '5 days free',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w400,
                                          // height: AppDimensions.height10 * 0.15,

                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDimensions.height10 * 5.4,
                                    height: AppDimensions.height10 * 1.7,
                                    child: Center(
                                      child: Text(
                                        'Per Year',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            // height: AppDimensions.height10 * 0.15,

                                            color: const Color(0xFFFBFBFB)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _scrollToTop();
                      },
                      child: Container(
                        width: AppDimensions.height10 * 25.7,
                        height: AppDimensions.height10 * 4.0,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: AppDimensions.height10 * 0.1,
                                color: const Color(0xFFFA9934)),
                            color: const Color(0xFFFBFBFB),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 5.0)),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 5.3),
                              width: AppDimensions.height10 * 14.9,
                              height: AppDimensions.height10 * 1.9,
                              child: Center(
                                child: Text(
                                  'Check what you get',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w500,
                                      height: AppDimensions.height10 * 0.15,
                                      color: const Color(0xFF437296)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 1.5,
                                  top: AppDimensions.height10 * 0),
                              child: Image.asset(
                                'assets/images/Arrow.png',
                                height: AppDimensions.height10 * 1.2,
                                width: AppDimensions.height10 * 2.1,
                                color: const Color(0xFFFA9934),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 32.4,
                      height: AppDimensions.height10 * 4.629,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                      child: Center(
                        child: Text(
                          'More focused ME time awaits\nyou from a single mouse click...',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                              height: AppDimensions.height10 * 0.15,
                              color: const Color(0xFF437296)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 7.4,
                      height: AppDimensions.height10 * 0.2,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.471),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFA9934),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 0.5)),
                    ),
                    Container(
                      width: AppDimensions.height10 * 36.0,
                      height: AppDimensions.height10 * 58.8,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 2.1),
                      child: Stack(children: [
                        Column(
                          children: [
                            Align(
                              alignment: const Alignment(1, 0),
                              child: Container(
                                width: AppDimensions.height10 * 19.6,
                                height: AppDimensions.height10 * 3.934,
                                // alignment: Alignment(1, 0),
                                margin: EdgeInsets.only(
                                    top: AppDimensions.height10 * 1.3,
                                    right: AppDimensions.height10 * 0.4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 9.1,
                                      height: AppDimensions.height10 * 3.934,
                                      child: Center(
                                        child: Text(
                                          'Empowered\n(free)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontWeight: FontWeight.w700,
                                              // height:
                                              //     AppDimensions.height10 * 0.15,
                                              color: const Color(0xFF437296)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimensions.height10 * 7.7,
                                      height: AppDimensions.height10 * 19.67,
                                      child: Text(
                                        'Ownership',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w700,
                                            height:
                                                AppDimensions.height10 * 0.15,
                                            color: const Color(0xFF437296)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 4.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.066),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 4.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                              text: 'Active Goals',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          const TextSpan(
                                              text:
                                                  ' (create\nand save as many as\nyou like)')
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 5.9),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: Center(
                                        child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.8,
                                          fontWeight: FontWeight.w500,
                                          // height:
                                          //     AppDimensions.height10 *
                                          //         0.12,
                                          color: const Color(0xFF437296)),
                                    )),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 7.9),
                                    //   height: AppDimensions.height10 * 1.9,
                                    child: Center(
                                        child: Text(
                                      '3',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.8,
                                          fontWeight: FontWeight.w500,
                                          // height:
                                          //     AppDimensions.height10 *
                                          //         0.12,
                                          color: const Color(0xFF437296)),
                                    )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 4.9,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 4.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                              text: 'Active Practices\n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          const TextSpan(
                                              text:
                                                  '(create and save as many as you like)')
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 7.5,
                                    height: AppDimensions.height10 * 3.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 3.1),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: Center(
                                        child: Text(
                                      'Up to 3 per\nactive goal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w400,
                                          // height:
                                          //     AppDimensions.height10 *
                                          //         0.12,
                                          color: const Color(0xFF437296)),
                                    )),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 7.5,
                                    height: AppDimensions.height10 * 3.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 2.6),
                                    //   height: AppDimensions.height10 * 1.9,
                                    child: Center(
                                        child: Text(
                                      'Up to 5 per\nactive goal',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w400,
                                          // height:
                                          //     AppDimensions.height10 *
                                          //         0.12,
                                          color: const Color(0xFF437296)),
                                    )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 3.4,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 3.4,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                            text: 'Define a ',
                                          ),
                                          const TextSpan(
                                              text: 'sticky inspiring vision',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 5.7),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 7.4),
                                    // height: AppDimensions.height10 * 1.9,
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
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 3.4,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 3.4,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                            text: 'Build your',
                                          ),
                                          const TextSpan(
                                              text: ' inspiration board',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 5.7),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 7.4),
                                    // height: AppDimensions.height10 * 1.9,
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
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 5.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 5.1,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                            text: 'Build ',
                                          ),
                                          const TextSpan(
                                              text: ' self-reliance ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          const TextSpan(
                                              text:
                                                  'by capturing your hurdles (unlimited)')
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 5.7),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: const Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Color(0xFFFA9934),
                                    )),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 7.4),
                                    // height: AppDimensions.height10 * 1.9,
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
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 5.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 5.1,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                              text: 'Goal evaluation ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          const TextSpan(
                                              text:
                                                  'tools to help with clarity and focus')
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 5.7),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: Center(child: Container()),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 7.4),
                                    // height: AppDimensions.height10 * 1.9,
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
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 4.9,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 4.9,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                              text: 'Practice\nevaluation',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          const TextSpan(
                                              text: ' and progress reports')
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 7.3,
                                    height: AppDimensions.height10 * 4.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 4.1),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: Center(
                                      child: Text(
                                        'Practice\nevaluation\nonly',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            height:
                                                AppDimensions.height10 * 0.12,
                                            color: const Color(0xFF437296)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 4.1),
                                    // height: AppDimensions.height10 * 1.9,
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
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 1.0,
                                  bottom: AppDimensions.height10 * 1.0),
                              color: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 35.0,
                              height: AppDimensions.height10 * 5.1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.height10 * 13.9,
                                    height: AppDimensions.height10 * 5.1,
                                    child: Center(
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    fontFamily: 'laila',
                                                    fontSize:
                                                        AppDimensions.height10 *
                                                            1.4,
                                                    fontWeight: FontWeight.w400,
                                                    height:
                                                        AppDimensions.height10 *
                                                            0.12,
                                                    color: const Color(
                                                        0xFF437296)),
                                                children: [
                                          const TextSpan(
                                              text: 'Personalised\ntimeline  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                          const TextSpan(
                                              text: 'of recorded activities')
                                        ]))),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 5.7),
                                    // height: AppDimensions.height10 * 1.9,
                                    child: Center(child: Container()),
                                  ),
                                  Container(
                                    width: AppDimensions.height10 * 2.4,
                                    height: AppDimensions.height10 * 2.4,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10 * 7.4),
                                    // height: AppDimensions.height10 * 1.9,
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
                              width: AppDimensions.height10 * 35.3,
                              height: AppDimensions.height10 * 0.075,
                              margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.0,
                              ),
                              color: const Color(0xFFE0E0E0),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const Alignment(0.98, 1),
                          child: Container(
                            width: AppDimensions.height10 * 9.0,
                            height: AppDimensions.height10 * 58.2,
                            color: const Color(0xFFFA9934).withOpacity(0.1),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      width: AppDimensions.height10 * 34.4,
                      height: AppDimensions.height10 * 8.827,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.5),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 7.4,
                            height: AppDimensions.height10 * 0.2,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFA9934),
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 0.5)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 34.4,
                            height: AppDimensions.height10 * 2.893,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 2.8),
                            child: Center(
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.4,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'laila',
                                          // height: AppDimensions.height10 * 0.15,
                                          color: const Color(0xFF437296)),
                                      children: [
                                    const TextSpan(text: 'Read our '),
                                    const TextSpan(
                                        text: 'Terms of service',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    const TextSpan(text: ' and '),
                                    const TextSpan(
                                        text: 'Privacy policy',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline))
                                  ])),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10 * 34.4,
                            height: AppDimensions.height10 * 2.893,
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Recurring billing. Cancel anytime. You’re in control.',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  height: AppDimensions.height10 * 0.15,
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
                    top: AppDimensions.height10 * 3.235,
                    bottom: AppDimensions.height10 * 3.133),
                child: Image.asset(
                  'assets/images/Arrow.png',
                  height: AppDimensions.height10 * 4.811,
                  width: AppDimensions.height10 * 4.811,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 38.4,
                height: AppDimensions.height10 * 85.4,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 9.4),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: const Color(0xFFFBFBFB)),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10 * 8.0,
                      height: AppDimensions.height10 * 4.834,
                      alignment: Alignment.topCenter,
                      margin:
                          EdgeInsets.only(top: AppDimensions.height10 * 3.786),
                      child: Text(
                        'FAQ',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.8,
                            fontWeight: FontWeight.w700,
                            height: AppDimensions.height10 * 0.15,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10 * 34.4,
                      // height: AppDimensions.height10 * 72.2,
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 34.4,
                            height: AppDimensions.height10 * 9.4,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 3.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensions.height10 * 0.12,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 1: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10 *
                                                    0.13,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Is there a free trial on Ownership Plan?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 5.1,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensions.height10 * 0.14,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        const TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        const TextSpan(
                                            text:
                                                'Yes, we offer a free 5-day trial period for both monthly and yearly plans')
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10 * 1.5),
                            width: AppDimensions.height10 * 7.4,
                            height: AppDimensions.height10 * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 34.4,
                            height: AppDimensions.height10 * 17.2,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 5.9,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensions.height10 * 0.13,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 2: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10 *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Can I upgrade from monthly to yearly or\ndowngrade from yearly to monthly?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 10.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensions.height10 * 0.14,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        const TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        const TextSpan(
                                            text:
                                                'You can upgrade to an yearly plan in any month\nbefore your recurring monthly billing is due. If you\nwant to downgrade from yearly plan, make sure to\nchoose monthly payment by the time your yearly plan is due to renew. ')
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10 * 1.5),
                            width: AppDimensions.height10 * 7.4,
                            height: AppDimensions.height10 * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 34.4,
                            height: AppDimensions.height10 * 13.1,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 3.6,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensions.height10 * 0.12,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 3: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10 *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Can I cancel my subscription?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 8.5,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensions.height10 * 0.14,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        const TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        const TextSpan(
                                            text:
                                                'Yes you can by going into your Account Settings.\nRemember to cancel your subscription plan no\nearlier than 3 working days before your plan is due\nto renew.')
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.height10 * 1.5),
                            width: AppDimensions.height10 * 7.4,
                            height: AppDimensions.height10 * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10 * 34.4,
                            height: AppDimensions.height10 * 20.5,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10 * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 7.6,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height:
                                                  AppDimensions.height10 * 0.13,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 4: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10 *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'I don’t want to upgrade to Ownership Plan,\nwhat happens to my Empowered Starter\nPlan?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10 * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10 * 34.4,
                                  height: AppDimensions.height10 * 11.9,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize:
                                                  AppDimensions.height10 * 1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height:
                                                  AppDimensions.height10 * 0.14,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        const TextSpan(
                                            text: 'Answer:  \n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        const TextSpan(
                                            text:
                                                'If you stay on our free Empowered Starter plan, you\nget it for lifetime. No subscription fees, it’s yours to\nown :) For a more personalised experience and\nclarity on your growth progress, we recommend you\nupgrade to our Ownership Plan (of course, if you’re\nserious about your personal growth).')
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

void subscribed(canceled) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: canceled,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10 * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10 * 39.4,
          height: AppDimensions.height10 * 57.0,
          margin: EdgeInsets.only(
              left: AppDimensions.height10 * 1.0,
              right: AppDimensions.height10 * 1.0,
              bottom: AppDimensions.height10 * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.height10 * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensions.height10 * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 1.9,
                        right: AppDimensions.height10 * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/Close_blue.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 1.5,
                    bottom: AppDimensions.height10 * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.png',
                  width: AppDimensions.height10 * 8.202,
                  height: AppDimensions.height10 * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10 * 30.7,
                height: AppDimensions.height10 * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.2),
                child: Text(
                  'Your Ownership Plan\nStarts Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10 * 0.15,
                      fontSize: AppDimensions.height10 * 2.8,
                      // letterSpacing: AppDimensions.height10 * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 33.2,
                  //  height: AppDimensions.height10 * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.8,
                              fontFamily: 'laila',
                              height: AppDimensions.height10 * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: [
                            const TextSpan(
                                text: 'Your first steps & 5 day trial\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            const TextSpan(
                                text:
                                    'You’re now on a 5-day trial.\n\nPlease check your email (you should\nhave received a confirmation welcome\nemail).\n\nWe look forward to supporting you on\nyour personal development journey!')
                          ]))),
            ],
          )),
    ),
  );
}
