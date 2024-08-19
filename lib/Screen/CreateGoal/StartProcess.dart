import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/Categories.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading2.dart';

class StartProcess extends StatefulWidget {
  const StartProcess({Key? key}) : super(key: key);

  @override
  State<StartProcess> createState() => _StartProcessState();
}

class _StartProcessState extends State<StartProcess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            FadePageRouteReverse(
              page: const HomeScreen(
                login: true,
              ),
            ),
          );

          return Future.value(false);
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                // alignment: Alignment.center,

                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    //width: AppDimensions.width10(context) * 3,
                    height: AppDimensions.height10(context) * 2.8,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadePageRouteReverse(
                        page: const HomeScreen(
                          login: true,
                        ),
                      ),
                    );
                    // Add code for performing close action
                  },
                ),
              ),
              SizedBox(
                width: AppDimensions.width10(context),
              )
            ],
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/CreateGoal.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 5.7),
                        child: GradientText(
                          AppText().goalSetting,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            // color: Colors.white,
                            fontSize: AppDimensions.font10(context) * 3,
                          ),
                          colors: const [
                            Color(0xFFFA9934),
                            Color(0xFFEDD15E),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.4,
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 7.5,
                        child: Center(
                          child: Text(
                            AppText().step2Body2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 1.9,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3,
                      ),
                      Center(
                        child: Image(
                          image: const AssetImage('assets/images/Line.webp'),
                          // height: AppDimensions.height10(context) * 6.5,
                          width: AppDimensions.width10(context) * 6.5,
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3,
                      ),
                      Center(
                        child: Text(
                          AppText().step1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize:
                                AppDimensions.font10(context) * 2.4,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 1.1,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize:
                                AppDimensions.font10(context) * 1.7,
                              ),
                          children: [
                            const TextSpan(
                                text: 'Set'
                            ),
                            TextSpan(
                                text: AppText().step1Head,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                                text: AppText().step1Body
                            ),
                          ]
                      )),
                      SizedBox(
                        height: AppDimensions.height10(context) * 2.1,
                      ),
                      Center(
                        child: Image(
                          image: const AssetImage('assets/images/image1.webp'),
                          height: AppDimensions.height10(context) * 6.5,
                          width: AppDimensions.width10(context) * 6.5,
                        ),
                      ),

                      SizedBox(
                        height: AppDimensions.height10(context) * 3,
                      ),
                      Center(
                        child: Text(
                          AppText().step2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize:
                                AppDimensions.font10(context) * 2.4,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 1.1,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize:
                                AppDimensions.font10(context) * 1.7,
                              ),
                              children: [
                                const TextSpan(
                                    text: 'Add'
                                ),
                                TextSpan(
                                  text: AppText().step2Head,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                    text: AppText().step2Body
                                ),
                              ]
                          )),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3,
                      ),
                      Center(
                        child: Image(
                          image: const AssetImage('assets/images/image2.webp'),
                          height: AppDimensions.height10(context) * 4,
                          width: AppDimensions.width10(context) * 4,
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 4,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize:
                                AppDimensions.font10(context) * 1.5,
                              ),
                              children: [
                                const TextSpan(
                                    text: 'In less than '
                                ),
                                const TextSpan(
                                  text: '20 minutes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                    text: AppText().footerBody
                                ),
                              ]
                          )),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                    child: AnimatedScaleButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            FadePageRoute2(
                              true,
                              enterPage: const Categories(),
                              exitPage: const StartProcess(),
                            ));
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.width10(context) * 25.4,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFCC10D),
                                  Color(0xFFFDA210)
                                ])),
                        child: Center(
                          child: Text(
                            AppText().startJourney,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.font10(context) * 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
