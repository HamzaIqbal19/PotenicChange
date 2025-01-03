import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/Widgets/updateBox.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/tutorialBottomSheet.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';
import 'capture_inpirations_goals.dart';
import 'inpiration_landing.dart';
import 'inpiration_type.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class inspiration_motivation extends StatefulWidget {
  final bool goal_delete;
  final String inspirationName;
  const inspiration_motivation(
      {super.key, required this.goal_delete, required this.inspirationName});

  @override
  State<inspiration_motivation> createState() => _inspiration_motivationState();
}

class _inspiration_motivationState extends State<inspiration_motivation> {
  var Route;

  void getInspirationRoute() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Route = prefs.getString('inspiration_saved_route');
    });
  }

  @override
  void initState() {
    super.initState();
    getInspirationRoute();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final SharedPreferences prefs = await _prefs;
        prefs.remove('inspiration_saved_route');
        return Future.value(true);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Center(
                  child: Buttons().closeButton(
                context,
                () async {
                  Navigator.push(
                      context,
                      FadePageRouteReverse(
                          page: const ViewDashboard(
                        missed: false,
                        name: '',
                        update: false,
                        helpfulTips: false,
                        record: 0,
                      )));
                  final SharedPreferences prefs = await _prefs;
                  prefs.remove('inspiration_saved_route');
                },
              )
                  //  IconButton(
                  //     onPressed: () async {
                  //       Navigator.push(
                  //           context,
                  //           FadePageRouteReverse(
                  //               page: const ViewDashboard(
                  //             missed: false,
                  //             name: '',
                  //             update: false,
                  //             helpfulTips: false,
                  //             record: 0,
                  //           )));
                  //       final SharedPreferences prefs = await _prefs;
                  //       prefs.remove('inspiration_saved_route');
                  //     },
                  //     icon: Image.asset(
                  //       'assets/images/Close.webp',
                  //       // width: AppDimensions.width10(context) * 2.6,
                  //       height: AppDimensions.height10(context) * 2.6,
                  //       fit: BoxFit.contain,
                  //     )),
                  ),
            ]),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/bg_inpiration_purple.webp'),
            fit: BoxFit.cover,
          )),
          child: Stack(children: [
            Align(
              alignment: const Alignment(0, 0.8),
              child: Container(
                width: AppDimensions.width10(context) * 11.1,
                height: AppDimensions.height10(context) * 27.6,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Inspiration_dust 1.webp'))),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.45),
              child: Container(
                //height: AppDimensions.height10(context) * 57.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/Inspiration_Glow 1.webp'),
                        fit: BoxFit.fitWidth)),
                child: Center(
                  child: Container(
                    height: AppDimensions.height10(context) * 35.9,
                    width: AppDimensions.width10(context) * 35.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 2),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Inspiration_center 1.webp'))),
                    child: Center(
                      child: AnimatedScaleButton(
                        onTap: () async {
                          if (Route == null) {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const inspiraton_goals(
                                        update: false,
                                        data_saved: false,
                                        context: false,
                                        note: false,
                                        route: 'landing')));
                          } else if (Route == 'goals_inspiration') {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const inspiraton_goals(
                                        update: false,
                                        data_saved: false,
                                        context: false,
                                        note: false,
                                        route: 'landing')));
                          } else if (Route == "type_inspiration") {
                            Navigator.push(context,
                                FadePageRoute(page: const inspiration_type()));
                          } else {
                            Navigator.push(
                                context,
                                FadePageRoute(
                                    page: const inspiraton_goals(
                                        update: false,
                                        data_saved: false,
                                        context: false,
                                        note: true,
                                        route: 'landing')));
                            final SharedPreferences prefs = await _prefs;
                            await prefs.remove('inspiration_saved_route');
                          }
                        },
                        child: Container(
                          width: AppDimensions.width10(context) * 16.7,
                          height: AppDimensions.height10(context) * 16.8,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                          child: Center(
                            child: GradientText(
                              'Record your\ninspiration',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                              ),
                              colors: const [
                                Color(0xffFA9934),
                                Color(0xffEDD15E)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: AppDimensions.width10(context) * 34.3,
                      height: AppDimensions.height10(context) * 9.1,
                      margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 7.5,
                      ),
                      child: GradientText(
                        'My inspirations ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 3.0,
                          fontWeight: FontWeight.w700,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      )),
                  SizedBox(
                    width: AppDimensions.width10(context) * 34.9,
                    height: AppDimensions.height10(context) * 12.1,
                    //margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 2.0),
                    child: Text(AppText().inspirationBody,
                        textAlign: TextAlign.center,
                        textHeightBehavior: const TextHeightBehavior(
                            leadingDistribution: TextLeadingDistribution.even),
                        style: TextStyle(
                            height: 1.3,
                            fontSize: AppDimensions.font10(context) * 1.8,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF).withOpacity(0.9),
                            fontFamily: 'laila')),
                  ),
                ],
              ),
            ),
            widget.goal_delete
                ? Align(
                    alignment: const Alignment(0, 0.9),
                    child: updateBox(
                      bodyText: widget.inspirationName,
                      functionText: 'Undo',
                      headText: 'Deleted',
                      edit: false,
                      onTap1: () {},
                      FadeFunction: () {},
                    ))
                : Container(),
            // Align(
            //   alignment: const Alignment(0, 1),
            //   child: Container(
            //     width: AppDimensions.width10(context) * 17.0,
            //     height: AppDimensions.height10(context) * 0.5,
            //     margin: EdgeInsets.only(
            //         bottom: AppDimensions.height10(context) * 1.0),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(
            //             AppDimensions.height10(context) * 2.0),
            //         color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
