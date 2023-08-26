import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_goal_impact.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class select_hurdle extends StatefulWidget {
  final bool update;
  const select_hurdle({super.key, required this.update});

  @override
  State<select_hurdle> createState() => _select_hurdleState();
}

class _select_hurdleState extends State<select_hurdle> {
  var hurdlesList;

  int selectBox = -1;
  bool Loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  var Route;

  void getHurdleRoute() async {
    final SharedPreferences prefs = await _prefs;
    var integer;
    setState(() {
      Route = prefs.getString('HurdleRoute').toString().isEmpty
          ? ''
          : prefs.getString('HurdleRoute');
      integer = prefs.getInt('hurdle_selected').toString().isEmpty
          ? '-1'
          : prefs.getInt('hurdle_selected').toString();
    });
    setState(() {
      selectBox = integer == '-1' ? -1 : int.parse(integer);
    });

    print("Route ${prefs.getString('HurdleRoute')}");
    if (Route == '' || Route == null) {
      setState(() {
        selectBox = -1;
      });
    }
  }

  void _fetchHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesList = response['hurdle'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          selectBox = response['hurdle']['hurdleId'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  @override
  void initState() {
    super.initState();
    getHurdleRoute();
    print(
        "---------------------------------------------------------------------");
    _fetchHurdle();
    if (widget.update == true) {
      _fetchHurdleSummary();
    }
  }

  void checkHurdle() async {
    Hurdles().checkUserHurdles().then((response) {
      if (response == true) {
        Navigator.push(
          context,
          FadePageRoute(page: const landing_hurdles()),
        );

        return response;
      } else if (response == false) {
        Navigator.push(context, FadePageRoute(page: const hurdles_splash()));
      }
    }).catchError((error) {
      print("Hello world error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.update
            ? Navigator.pop(context)
            : Navigator.pushReplacement(
                context,
                FadePageRoute(
                    page: const hurdles_goal_impact(
                  summary: false,
                )));
        return Future.value(false);
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: widget.update
                ? Container()
                : Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              FadePageRoute(
                                  page: const hurdles_goal_impact(
                                summary: false,
                              )));
                        },
                        icon: Image.asset(
                          'assets/images/Back.webp',
                          width: AppDimensions.height10(context) * 3.0,
                          height: AppDimensions.height10(context) * 3.0,
                          fit: BoxFit.cover,
                        )),
                  ),
            centerTitle: true,
            title: SizedBox(
              width: AppDimensions.height10(context) * 19.0,
              height: AppDimensions.height10(context) * 2.4,
              child: Row(
                children: [
                  GradientText(
                    'Capture Hurdle ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.2,
                      fontWeight: FontWeight.w600,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                  GradientText(
                    ' 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.2,
                      fontWeight: FontWeight.w600,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                  GradientText(
                    '/5',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.2,
                      fontWeight: FontWeight.w400,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: IconButton(
                    onPressed: () {
                      widget.update
                          ? Navigator.pop(context)
                          : showAnimatedDialog(
                              animationType: DialogTransitionType.fadeScale,
                              curve: Curves.easeInOut,
                              duration: Duration(seconds: 1),
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                    width:
                                        AppDimensions.height10(context) * 27.0,
                                    height:
                                        AppDimensions.height10(context) * 24.0,
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppDimensions.height10(context) *
                                                  1.4)),
                                      contentPadding: EdgeInsets.zero,
                                      actionsPadding: EdgeInsets.zero,
                                      titlePadding: EdgeInsets.zero,
                                      title: Container(
                                        margin: const EdgeInsets.only(
                                            top: 19,
                                            right: 16,
                                            left: 16,
                                            bottom: 2),
                                        height:
                                            AppDimensions.height10(context) *
                                                2.2,
                                        width: AppDimensions.height10(context) *
                                            23.8,
                                        child: const Text(
                                          "Exit hurdle?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      content: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 19, left: 16, right: 16),
                                        height:
                                            AppDimensions.height10(context) *
                                                1.6,
                                        width: 238,
                                        child: const Text(
                                          "Please select from the options below",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              child: Divider(
                                                color: const Color(0XFF3C3C43)
                                                    .withOpacity(0.29),
                                              ),
                                            ),
                                            Container(
                                              height: 42,
                                              width: double.infinity,
                                              color: Colors.white,
                                              child: TextButton(
                                                onPressed: () async {
                                                  checkHurdle();

                                                  final SharedPreferences
                                                      prefs = await _prefs;
                                                  var hurdleRoute =
                                                      prefs.setString(
                                                          'HurdleRoute',
                                                          'Select');
                                                  await prefs.setInt(
                                                      'hurdle_selected',
                                                      selectBox);
                                                },
                                                child: const Text(
                                                  'Exit & save progress',
                                                  style: TextStyle(
                                                      color: Color(0xFF007AFF),
                                                      fontSize: 17,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              child: Divider(
                                                color: const Color(0XFF3C3C43)
                                                    .withOpacity(0.29),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 44,
                                              width: double.infinity,
                                              child: TextButton(
                                                onPressed: () async {
                                                  checkHurdle();
                                                  setState(() {
                                                    selectBox = -1;
                                                  });
                                                  final SharedPreferences
                                                      prefs = await _prefs;
                                                  var hurdleRoute = prefs
                                                      .remove('HurdleRoute');
                                                  await prefs
                                                      .remove('hurdleName');
                                                  await prefs
                                                      .remove('NameHurdle');
                                                  await prefs.remove(
                                                      'hurdleStatement');
                                                  await prefs
                                                      .remove('hurdleId');
                                                  await prefs
                                                      .remove('selected_goals');
                                                  await prefs.remove(
                                                      'hurdle_selected');
                                                },
                                                child: const Text(
                                                  'Exit & delete progress',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF007AFF)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  0.1,
                                              child: Divider(
                                                color: const Color(0XFF3C3C43)
                                                    .withOpacity(0.29),
                                              ),
                                            ),
                                            Container(
                                              height: 42,
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                  bottom:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.0),
                                              color: Colors.white,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Cancel exit',
                                                  style: TextStyle(
                                                      color: Color(0xFF007AFF),
                                                      fontSize: 17,
                                                      fontFamily: "Laila",
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                    },
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      width: AppDimensions.height10(context) * 2.6,
                      height: AppDimensions.height10(context) * 2.6,
                      fit: BoxFit.cover,
                    )),
              )
            ]),
        extendBodyBehindAppBar: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            // margin: EdgeInsets.only(top:   AppDimensions.height10(context)(context)* 6.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/practicebackground.webp'),
                    fit: BoxFit.cover)),
            child: Loading == false
                ? SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppDimensions.height10(context) * 33.7,
                            height: AppDimensions.height10(context) * 7.3,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 18.0),
                            child: Center(
                              //slight width issue
                              child: GradientText(
                                'What or who has\ntriggered your hurdle?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 2.8,
                                  fontWeight: FontWeight.w700,
                                ),
                                colors: const [
                                  Color(0xffFA9934),
                                  Color(0xffEDD15E)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // height: AppDimensions.height10(context) * 45.6,
                            //width: AppDimensions.height10(context) * 30.6,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.9),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppDimensions.height10(context) * 4),
                            child: GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      3.5 / 3, // Two items in each row

                                  mainAxisSpacing: 6.5,
                                  crossAxisSpacing: 3,
                                ),
                                itemCount: hurdlesList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height:
                                        AppDimensions.height10(context) * 41.9,
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: AppDimensions.height10(context) * 5),
                                    child: AnimatedScaleButton(
                                      onTap: () async {
                                        final SharedPreferences prefs =
                                            await _prefs;
                                        var hurdleName = prefs.setString(
                                            'hurdleName',
                                            hurdlesList[index]['hurdleName']);

                                        var hurdleId = prefs.setInt(
                                            'hurdleId',
                                            index == 0
                                                ? hurdlesList[0]['id']
                                                : hurdlesList[index - 1]['id']);
                                        print(index);
                                        setState(() {
                                          selectBox = index;
                                        });
                                        if (widget.update == true) {
                                          Hurdles().updateHurdle(
                                              'hurdleId',
                                              index == 0
                                                  ? hurdlesList[0]['id']
                                                  : hurdlesList[index - 1]
                                                      ['id']);
                                        }
                                      },
                                      child: Container(
                                        height: selectBox == index
                                            ? AppDimensions.height10(context) *
                                                14.1
                                            : AppDimensions.height10(context) *
                                                13.1,
                                        width: selectBox == index
                                            ? AppDimensions.height10(context) *
                                                14.1
                                            : AppDimensions.height10(context) *
                                                13.1,
                                        padding: EdgeInsets.all(
                                            AppDimensions.height10(context)),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: selectBox == index
                                                  ? AppDimensions.height10(
                                                          context) *
                                                      0.2
                                                  : 0,
                                              color: selectBox == index
                                                  ? Colors.white
                                                  : Colors.transparent),
                                        ),
                                        child: Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  13.1,
                                          width:
                                              AppDimensions.height10(context) *
                                                  13.1,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: AppDimensions.height10(
                                                          context) *
                                                      0.1,
                                                  color: Colors.white),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffBE3FC6),
                                                    Color(0xff642445)
                                                  ])),
                                          child: Center(
                                            child: Text(
                                              hurdlesList[index]['hurdleName'],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.6,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 25.4,
                            height: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                top: AppDimensions.height10(context) * 3.2,
                                bottom: AppDimensions.height10(context) * 2.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: selectBox != -1
                                    ? [
                                        const Color(0xffFCC10D),
                                        const Color(0xffFDA210),
                                      ]
                                    : [
                                        const Color(0xffFCC10D)
                                            .withOpacity(0.5),
                                        const Color(0xffFDA210)
                                            .withOpacity(0.5),
                                      ],
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10(context) * 5.0),
                            ),
                            child: TextButton(
                                onPressed: () async {
                                  if (selectBox != -1) {
                                    if (widget.update == false) {
                                      final SharedPreferences prefs =
                                          await _prefs;

                                      await prefs.setInt(
                                          'hurdle_selected', selectBox);
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: hurdle_name(
                                            update: false,
                                          )));
                                    } else {
                                      Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: const summary_hurdles(
                                          delete_hurdle: true,
                                        )),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  widget.update ? 'Update summary' : 'Next',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.6,
                                      fontWeight: FontWeight.w600,
                                      color: selectBox != -1
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5)),
                                )),
                          ),
                          Container(
                            width: AppDimensions.height10(context) * 17.0,
                            height: AppDimensions.height10(context) * 0.5,
                            // margin:
                            //     EdgeInsets.only(bottom: AppDimensions.height10(context) * 0.8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color:
                                    const Color(0xFFFFFFFF).withOpacity(0.3)),
                          )
                        ]),
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  )),
      ),
    );
  }
}
