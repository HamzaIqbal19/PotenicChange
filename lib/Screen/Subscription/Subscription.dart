import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/dashboardViewgoals.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
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
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
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
                width: AppDimensions.height10(context) * 19.9,
                height: AppDimensions.height10(context) * 3.6,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 10.0),
                child: Center(
                  child: Text(
                    'Subscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 3.1,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 34.2,
                //  height: AppDimensions.height10(context) * 5.7,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 0.9),
                child: Text(
                  'Get more value from Potenic to help you\nachieve personal transformation towards\nself-fulfilment consistently.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                      height: AppDimensions.height10(context) * 0.15,
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 38.4,
                // height: AppDimensions.height10(context) * 148.3,
                margin:
                    EdgeInsets.only(top: AppDimensions.height10(context) * 2.8),
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
                        AppDimensions.height10(context) * 2.0),
                    color: const Color(0xFFFBFBFB)),
                child: Column(
                  children: [
                    Container(
                        width: AppDimensions.height10(context) * 18.4,
                        height: AppDimensions.height10(context) * 3.356,
                        margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 4.129,
                        ),
                        child: Text(
                          'Ownership Plan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 2.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF437296)),
                        )),
                    Container(
                      width: AppDimensions.height10(context) * 32.4,
                      height: AppDimensions.height10(context) * 7.522,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 0.326,
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.5,
                                  //height: AppDimensions.height10(context) * 0.15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Laila',
                                  color: const Color(0xFF437296)),
                              children: [
                                TextSpan(
                                    text:
                                        'Upgrade today to unlock the following benefits. You get everything that is included in the ',
                                    style: TextStyle(
                                      height: AppDimensions.height10(context) *
                                          0.15,
                                    )),
                                const TextSpan(
                                  text: '‘Empowered Starter’',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const TextSpan(text: ' plan plus:')
                              ])),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 7.4,
                      height: AppDimensions.height10(context) * 0.2,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.149),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFA9934),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 0.5)),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 32.3,
                      height: AppDimensions.height10(context) * 19.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 2.49),
                      child: Column(
                        children: [
                          SizedBox(
                            width: AppDimensions.height10(context) * 32.3,
                            height: AppDimensions.height10(context) * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 2.9,
                                    height:
                                        AppDimensions.height10(context) * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.webp'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 28.0,
                                  height: AppDimensions.height10(context) * 4.9,
                                  child: Text(
                                    'Multiple active goals (up to 3 with\nunlimited goals that can be saved for later)',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10(context) * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFF437296)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 32.3,
                            height: AppDimensions.height10(context) * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 2.9,
                                    height:
                                        AppDimensions.height10(context) * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.webp'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 28.0,
                                  height: AppDimensions.height10(context) * 4.9,
                                  child: Text(
                                    'Multiple active practices (up to 5 per each\nactive goal)',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10(context) * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFF437296)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 32.3,
                            height: AppDimensions.height10(context) * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 2.9,
                                    height:
                                        AppDimensions.height10(context) * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.webp'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 28.0,
                                  height: AppDimensions.height10(context) * 4.9,
                                  child: Text(
                                    'Personalised infographic practice growth\nreports (every 20 active days)',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10(context) * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFF437296)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 32.3,
                            height: AppDimensions.height10(context) * 4.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 2.9,
                                    height:
                                        AppDimensions.height10(context) * 2.9,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tick_circle.webp'))),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 28.0,
                                  height: AppDimensions.height10(context) * 4.9,
                                  child: Text(
                                    'Timeline of your recorded events all-in-one\nplace and more...',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10(context) * 0.15,
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
                      width: AppDimensions.height10(context) * 32.1,
                      height: AppDimensions.height10(context) * 7.6,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 1.8),
                          color: const Color(0xFFFA9934)),
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 27.1,
                            height: AppDimensions.height10(context) * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 18.4,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    'Unlock ‘Ownership’ Plan',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w500,
                                        // height: AppDimensions.height10(context) * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 4.3,
                                  height: AppDimensions.height10(context) * 1.9,
                                  child: Text(
                                    '£7.49',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w500,
                                        // height: AppDimensions.height10(context) * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 27.1,
                            height: AppDimensions.height10(context) * 1.9,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 7.0,
                                  height: AppDimensions.height10(context) * 1.7,
                                  child: Text(
                                    '5 days free',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.5,
                                        fontWeight: FontWeight.w400,
                                        // height: AppDimensions.height10(context) * 0.15,
                                        fontFamily: 'Laila',
                                        color: const Color(0xFFFBFBFB)),
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 6.9,
                                  height: AppDimensions.height10(context) * 1.7,
                                  child: Center(
                                    child: Text(
                                      'Per Month',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          // height: AppDimensions.height10(context) * 0.15,
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
                            FadePageRoute(
                                page: const dashBoard(
                              saved: false,
                              helpful_tips: false,
                              dashboard_ctrl: true,
                              membership: false,
                              trial: true,
                              cancel: false,
                            )));
                        showModalBottomSheet(
                          context: context,
                          transitionAnimationController: controller,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                AppDimensions.height10(context) * 2.0),
                          )),
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                  width: AppDimensions.height10(context) * 39.4,
                                  height:
                                      AppDimensions.height10(context) * 57.0,
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 1.0,
                                      right:
                                          AppDimensions.height10(context) * 1.0,
                                      bottom: AppDimensions.height10(context) *
                                          1.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFFF8F7F9),
                                            Color(0xFFE1D7D8)
                                          ])),
                                  child: Column(
                                    // alignment: AlignmentDirectional.topCenter,
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    //  crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        //color: Colors.amber,
                                        // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                                        alignment: const Alignment(1, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                2.6,
                                            height: AppDimensions.height10(
                                                    context) *
                                                2.6,
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.9,
                                                right: AppDimensions.height10(
                                                        context) *
                                                    1.5),
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
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            bottom: AppDimensions.height10(
                                                    context) *
                                                1.9),
                                        child: Image.asset(
                                          'assets/images/potenic__icon.webp',
                                          width:
                                              AppDimensions.height10(context) *
                                                  8.202,
                                          height:
                                              AppDimensions.height10(context) *
                                                  11.2,
                                        ),
                                      ),
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            30.7,
                                        height:
                                            AppDimensions.height10(context) *
                                                6.8,
                                        // color: Colors.amber,
                                        alignment: Alignment.center,
                                        //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                                        child: Text(
                                          'Your Ownership Plan\nStarts Today',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.8,
                                              // letterSpacing: AppDimensions.height10(context) * 0.2,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xFF437296)),
                                        ),
                                      ),
                                      Container(
                                          width: AppDimensions.height10(context) *
                                              33.2,
                                          //  height: AppDimensions.height10(context) * 10.8,
                                          // color: Colors.grey,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.9),
                                          child: RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      fontSize:
                                                          AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.8,
                                                      fontFamily: 'laila',
                                                      height:
                                                          AppDimensions.height10(
                                                                  context) *
                                                              0.15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFF437296)),
                                                  children: const [
                                                    TextSpan(
                                                        text:
                                                            'Your first steps & 5 day trial\n\n',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    TextSpan(
                                                        text:
                                                            'You’re now on a 5-day trial.\n\nPlease check your email (you should\nhave received a confirmation welcome\nemail).\n\nWe look forward to supporting you on\nyour personal development journey!')
                                                  ]))),
                                    ],
                                  )),
                            );
                          },
                        ).whenComplete(() => initController());
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 32.1,
                        height: AppDimensions.height10(context) * 7.6,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 1.3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 1.5),
                            color: const Color(0xFFFE6624)),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10(context) * 27.1,
                              height: AppDimensions.height10(context) * 1.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 1.7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 18.4,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      'Unlock ‘Ownership’ Plan',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w500,
                                          // height: AppDimensions.height10(context) * 0.15,
                                          fontFamily: 'Laila',
                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 4.3,
                                    height:
                                        AppDimensions.height10(context) * 1.9,
                                    child: Text(
                                      '£79.98',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.7,
                                          fontWeight: FontWeight.w500,
                                          // height: AppDimensions.height10(context) * 0.15,
                                          fontFamily: 'Laila',
                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10(context) * 27.1,
                              height: AppDimensions.height10(context) * 1.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 0.5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 7.0,
                                    height:
                                        AppDimensions.height10(context) * 1.7,
                                    child: Text(
                                      '5 days free',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          // height: AppDimensions.height10(context) * 0.15,

                                          color: const Color(0xFFFBFBFB)),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 5.4,
                                    height:
                                        AppDimensions.height10(context) * 1.7,
                                    child: Center(
                                      child: Text(
                                        'Per Year',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                            fontWeight: FontWeight.w400,
                                            // height: AppDimensions.height10(context) * 0.15,

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
                        // _scrollToTop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 3.0),
                        child: Column(
                          children: [
                            AdvanceExpansionTile(
                              key: _globalKey,
                              hideIcon: true,
                              tilePadding: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 6.3,
                                  right: AppDimensions.height10(context) * 6.3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0, color: Colors.transparent)),
                              title: Container(
                                width: AppDimensions.height10(context) * 25.7,
                                height: AppDimensions.height10(context) * 4.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFFFA9934)),
                                    color: const Color(0xFFFBFBFB),
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 5.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: AppDimensions.height10(context) *
                                          14.9,
                                      height:
                                          AppDimensions.height10(context) * 1.9,
                                      child: Center(
                                        child: Text(
                                          'Check what you get',
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.7,
                                              fontWeight: FontWeight.w500,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.15,
                                              color: const Color(0xFF437296)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          top: AppDimensions.height10(context) *
                                              0),
                                      child: Image.asset(
                                        'assets/images/Arrow.webp',
                                        height:
                                            AppDimensions.height10(context) *
                                                1.2,
                                        width: AppDimensions.height10(context) *
                                            2.1,
                                        color: const Color(0xFFFA9934),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  width: AppDimensions.height10(context) * 32.4,
                                  height:
                                      AppDimensions.height10(context) * 4.629,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.0),
                                  child: Center(
                                    child: Text(
                                      'More focused ME time awaits\nyou from a single mouse click...',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.1,
                                          fontWeight: FontWeight.w600,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          color: const Color(0xFF437296)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 7.4,
                                  height: AppDimensions.height10(context) * 0.2,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          2.471),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFA9934),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              0.5)),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 36.0,
                                  height:
                                      AppDimensions.height10(context) * 58.8,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          2.1),
                                  child: Stack(children: [
                                    Column(
                                      children: [
                                        Align(
                                          alignment: const Alignment(1, 0),
                                          child: Container(
                                            width: AppDimensions.height10(
                                                    context) *
                                                19.6,
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.934,
                                            // alignment: Alignment(1, 0),
                                            margin: EdgeInsets.only(
                                                top: AppDimensions.height10(
                                                        context) *
                                                    1.3,
                                                right: AppDimensions.height10(
                                                        context) *
                                                    0.4),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      9.1,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          3.934,
                                                  child: Center(
                                                    child: Text(
                                                      'Empowered\n(free)',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              1.5,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          // height:
                                                          //     AppDimensions.height10(context) * 0.15,
                                                          color: const Color(
                                                              0xFF437296)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      7.7,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          19.67,
                                                  child: Text(
                                                    'Ownership',
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.5,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.15,
                                                        color: const Color(
                                                            0xFF437296)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.9,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.066),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.9,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                          text: 'Active Goals',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      TextSpan(
                                                          text:
                                                              ' (create\nand save as many as\nyou like)')
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.0,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.9),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child: Center(
                                                    child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.9,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      // height:
                                                      //     AppDimensions.height10(context) *
                                                      //         0.12,
                                                      color: const Color(
                                                          0xFF437296)),
                                                )),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.0,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            7.9),
                                                //   height: AppDimensions.height10(context) * 1.9,
                                                child: Center(
                                                    child: Text(
                                                  '3',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.9,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      // height:
                                                      //     AppDimensions.height10(context) *
                                                      //         0.12,
                                                      color: const Color(
                                                          0xFF437296)),
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.9,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.9,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                          text:
                                                              'Active Practices\n',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      TextSpan(
                                                          text:
                                                              '(create and save as many as you like)')
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    7.5,
                                                // height: AppDimensions.height10(context) * 3.6,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            3.1),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child: Center(
                                                    child: Text(
                                                  'Up to 3 per\nactive goal',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.5,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.15,
                                                      color: const Color(
                                                          0xFF437296)),
                                                )),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    7.5,
                                                //height: AppDimensions.height10(context) * 3.6,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.6),
                                                //   height: AppDimensions.height10(context) * 1.9,
                                                child: Center(
                                                    child: Text(
                                                  'Up to 5 per\nactive goal',
                                                  style: TextStyle(
                                                      fontSize: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          1.5,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          0.15,
                                                      color: const Color(
                                                          0xFF437296)),
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                        text: 'Define a ',
                                                      ),
                                                      TextSpan(
                                                          text:
                                                              'sticky inspiring vision',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.7),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFFFA9934),
                                                )),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            7.4),
                                                // height: AppDimensions.height10(context) * 1.9,
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
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  3.4,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    3.4,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                        text: 'Build your',
                                                      ),
                                                      TextSpan(
                                                          text:
                                                              ' inspiration board',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.7),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFFFA9934),
                                                )),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            7.4),
                                                // height: AppDimensions.height10(context) * 1.9,
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
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.1,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    5.1,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                        text: 'Build ',
                                                      ),
                                                      TextSpan(
                                                          text:
                                                              ' self-reliance ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      TextSpan(
                                                          text:
                                                              'by capturing your hurdles (unlimited)')
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.7),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.check,
                                                  color: Color(0xFFFA9934),
                                                )),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            7.4),
                                                // height: AppDimensions.height10(context) * 1.9,
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
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.1,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    5.1,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                          text:
                                                              'Goal evaluation ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      TextSpan(
                                                          text:
                                                              'tools to help with clarity and focus')
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.7),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child:
                                                    Center(child: Container()),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            7.4),
                                                // height: AppDimensions.height10(context) * 1.9,
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
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.9,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.9,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                          text:
                                                              'Practice\nevaluation',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      TextSpan(
                                                          text:
                                                              ' and progress reports')
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    7.3,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    4.6,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.1),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child: Center(
                                                  child: Text(
                                                    'Practice\nevaluation\nonly',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            1.5,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: AppDimensions
                                                                .height10(
                                                                    context) *
                                                            0.12,
                                                        color: const Color(
                                                            0xFF437296)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            4.1),
                                                // height: AppDimensions.height10(context) * 1.9,
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
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                              top: AppDimensions.height10(
                                                      context) *
                                                  1.0,
                                              bottom: AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  35.0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  5.1,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    13.9,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    5.1,
                                                child: Center(
                                                    child: RichText(
                                                        text: TextSpan(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'laila',
                                                                fontSize: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    1.45,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: AppDimensions
                                                                        .height10(
                                                                            context) *
                                                                    0.12,
                                                                color: const Color(
                                                                    0xFF437296)),
                                                            children: const [
                                                      TextSpan(
                                                          text:
                                                              'Personalised\ntimeline  ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      TextSpan(
                                                          text:
                                                              'of recorded activities')
                                                    ]))),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            5.7),
                                                // height: AppDimensions.height10(context) * 1.9,
                                                child:
                                                    Center(child: Container()),
                                              ),
                                              Container(
                                                width: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    2.4,
                                                margin: EdgeInsets.only(
                                                    left:
                                                        AppDimensions.height10(
                                                                context) *
                                                            7.4),
                                                // height: AppDimensions.height10(context) * 1.9,
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
                                              AppDimensions.height10(context) *
                                                  35.3,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.075,
                                          margin: EdgeInsets.only(
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.0,
                                          ),
                                          color: const Color(0xFFE0E0E0),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: const Alignment(0.98, 1),
                                      child: Container(
                                        width: AppDimensions.height10(context) *
                                            9.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                58.2,
                                        color: const Color(0xFFFA9934)
                                            .withOpacity(0.1),
                                      ),
                                    )
                                  ]),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 7.4,
                                  height: AppDimensions.height10(context) * 0.2,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          3.5),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFA9934),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              0.5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 34.4,
                      height: AppDimensions.height10(context) * 8.827,
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 34.4,
                            height: AppDimensions.height10(context) * 2.893,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 2.8),
                            child: Center(
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.5,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'laila',
                                          // height: AppDimensions.height10(context) * 0.15,
                                          color: const Color(0xFF437296)),
                                      children: const [
                                    TextSpan(text: 'Read our '),
                                    TextSpan(
                                        text: 'Terms of service',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                        text: 'Privacy policy',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline))
                                  ])),
                            ),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 34.4,
                            height: AppDimensions.height10(context) * 2.893,
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Recurring billing. Cancel anytime. You’re in control.',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  height:
                                      AppDimensions.height10(context) * 0.15,
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
                    top: AppDimensions.height10(context) * 3.235,
                    bottom: AppDimensions.height10(context) * 3.133),
                child: Image.asset(
                  'assets/images/Arrow.webp',
                  height: AppDimensions.height10(context) * 4.811,
                  width: AppDimensions.height10(context) * 4.811,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 38.4,
                height: AppDimensions.height10(context) * 90.4,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 9.4),
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
                        AppDimensions.height10(context) * 2.0),
                    color: const Color(0xFFFBFBFB)),
                child: Column(
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 8.0,
                      height: AppDimensions.height10(context) * 4.834,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.786),
                      child: Text(
                        'FAQ',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 2.8,
                            fontWeight: FontWeight.w700,
                            height: AppDimensions.height10(context) * 0.15,
                            color: const Color(0xFF437296)),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 34.4,
                      // height: AppDimensions.height10(context) * 72.2,
                      child: Column(
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 34.4,
                            height: AppDimensions.height10(context) * 9.4,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  height: AppDimensions.height10(context) * 3.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.12,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 1: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.13,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Is there a free trial on Ownership Plan?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  height: AppDimensions.height10(context) * 5.1,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height: AppDimensions.height10(
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
                                    AppDimensions.height10(context) * 1.5),
                            width: AppDimensions.height10(context) * 7.4,
                            height: AppDimensions.height10(context) * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 34.4,
                            height: AppDimensions.height10(context) * 17.2,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  height: AppDimensions.height10(context) * 5.9,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.13,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 2: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Can I upgrade from monthly to yearly or\ndowngrade from yearly to monthly?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  height:
                                      AppDimensions.height10(context) * 10.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height: AppDimensions.height10(
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
                                    AppDimensions.height10(context) * 1.5),
                            width: AppDimensions.height10(context) * 7.4,
                            height: AppDimensions.height10(context) * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 34.4,
                            height: AppDimensions.height10(context) * 14.1,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  //   height: AppDimensions.height10(context) * 3.6,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.12,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 3: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'Can I cancel my subscription?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  //  height: AppDimensions.height10(context) * 8.5,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height: AppDimensions.height10(
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
                                    AppDimensions.height10(context) * 1.5),
                            width: AppDimensions.height10(context) * 7.4,
                            height: AppDimensions.height10(context) * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: const Color(0xFFFA9934)),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 34.4,
                            height: AppDimensions.height10(context) * 23.9,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 1.052),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  height: AppDimensions.height10(context) * 7.6,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w500,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.13,
                                              color: const Color(0xFF437296)),
                                          children: [
                                        TextSpan(
                                            text: 'Question 4: \n',
                                            style: TextStyle(
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(
                                            text:
                                                'I don’t want to upgrade to Ownership Plan,\nwhat happens to my Empowered Starter\nPlan?')
                                      ])),
                                ),
                                SizedBox(
                                  height: AppDimensions.height10(context) * 1.0,
                                ),
                                SizedBox(
                                  width: AppDimensions.height10(context) * 34.4,
                                  //  height: AppDimensions.height10(context) * 15.3,
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontFamily: 'laila',
                                              fontWeight: FontWeight.w400,
                                              height: AppDimensions.height10(
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
      top: Radius.circular(AppDimensions.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensions.height10(context) * 39.4,
          height: AppDimensions.height10(context) * 57.0,
          margin: EdgeInsets.only(
              left: AppDimensions.height10(context) * 1.0,
              right: AppDimensions.height10(context) * 1.0,
              bottom: AppDimensions.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.height10(context) * 2.0),
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
                // margin: EdgeInsets.only(left: AppDimensions.height10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.9,
                        right: AppDimensions.height10(context) * 1.5),
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
                    top: AppDimensions.height10(context) * 1.5,
                    bottom: AppDimensions.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensions.height10(context) * 8.202,
                  height: AppDimensions.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 30.7,
                height: AppDimensions.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensions.height10(context) * 1.2),
                child: Text(
                  'Your Ownership Plan\nStarts Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensions.height10(context) * 0.15,
                      fontSize: AppDimensions.height10(context) * 2.8,
                      // letterSpacing: AppDimensions.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensions.height10(context) * 33.2,
                  //  height: AppDimensions.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.8,
                              fontFamily: 'laila',
                              height: AppDimensions.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                                text: 'Your first steps & 5 day trial\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'You’re now on a 5-day trial.\n\nPlease check your email (you should\nhave received a confirmation welcome\nemail).\n\nWe look forward to supporting you on\nyour personal development journey!')
                          ]))),
            ],
          )),
    ),
  );
}
