import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_select_hurdle.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_statement.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class hurdle_name extends StatefulWidget {
  final bool update;
  const hurdle_name({super.key, required this.update});

  @override
  State<hurdle_name> createState() => _hurdle_nameState();
}

class _hurdle_nameState extends State<hurdle_name> {
  bool button_state = false;
  var hurdleName;
  TextEditingController controller = TextEditingController();
  var hurdlesSummary;
  var hurdlesList;
  int? hurdleCat;
  bool Loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
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

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          controller.text = response['hurdle']['hurdleName'];
          hurdleCat = response['hurdle']['hurdleId'];
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

  void _fetchHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesList = response['hurdle'];
        });
        _fetchHurdleSummary();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  void _getHurdleName() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      hurdleName = prefs.getString('hurdleName').toString().isEmpty
          ? ""
          : prefs.getString('hurdleName');
    });

    print(hurdleName);
  }

  void _getName() async {
    final SharedPreferences prefs = await _prefs;
    var Name;
    setState(() {
      Name = prefs.getString('NameHurdle').toString().isEmpty
          ? ''
          : prefs.getString('NameHurdle');
    });
    if (Name != '' && Name != null) {
      controller.text = Name;
    }
    print(Name);
  }

  @override
  void initState() {
    super.initState();
    _getName();
    if (widget.update == false) {
      _getHurdleName();
      setState(() {
        Loading = false;
      });
    } else {
      _fetchHurdle();
    }
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
                    page: const select_hurdle(
                  update: false,
                )));
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                                  page: const select_hurdle(
                                update: false,
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
                    ' 3',
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
                              duration: const Duration(seconds: 1),
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
                                                          'Name');

                                                  await prefs.setString(
                                                      'NameHurdle',
                                                      controller.text
                                                          .toString());
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
                                                      "hurdle_selected");
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
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/practicebackground.webp'),
                    fit: BoxFit.cover)),
            child: Loading == false
                ? SingleChildScrollView(
                    reverse: true,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 18.0,
                                )
                              : SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 11.0,
                                ),
                          SizedBox(
                            width: AppDimensions.height10(context) * 34.3,
                            height: AppDimensions.height10(context) * 7.3,
                            child: GradientText(
                              'Describe your hurdle',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.8,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: const [
                                Color(0xffFA9934),
                                Color(0xffEDD15E)
                              ],
                            ),
                          ),
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 3.877,
                                )
                              : SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 3.177,
                                ),
                          Container(
                            width: AppDimensions.height10(context) * 13.9,
                            height: AppDimensions.height10(context) * 13.9,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppDimensions.height10(context) * 0.5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/black_hole.webp'))),
                            child: Center(
                              child: Text(
                                widget.update
                                    ? hurdlesList[hurdleCat]['hurdleName']
                                        .toString()
                                    : hurdleName.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? SizedBox(
                                  height: AppDimensions.height10(context) * 5.9,
                                )
                              : SizedBox(
                                  height: AppDimensions.height10(context) * 4.1,
                                ),
                          Column(
                            children: [
                              Container(
                                  width: AppDimensions.height10(context) * 36.0,
                                  //height: AppDimensions.height10(context) * 8.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                      color: Colors.white),
                                  child: Column(
                                    //                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: AppDimensions.height10(context) *
                                            8.0,
                                        height:
                                            AppDimensions.height10(context) *
                                                2.0,
                                        margin: EdgeInsets.only(
                                            // left:   AppDimensions.height10(context)(context)* 2.0,
                                            right: AppDimensions.height10(
                                                    context) *
                                                25.0,
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.3),
                                        child: Center(
                                          child: Text(
                                            'Enter Name',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.3,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left:
                                              AppDimensions.height10(context) *
                                                  2.1,
                                        ),
                                        // height:
                                        //     AppDimensions.height10(context) * 4.4,
                                        //width:   AppDimensions.height10(context)(context)* 30.5,
                                        child: Center(
                                          child: TextFormField(
                                            maxLength: 80,
                                            controller: controller,
                                            textAlignVertical:
                                                TextAlignVertical.top,
                                            onTap: () {
                                              // setState(() {
                                              //   margin_state = false;
                                              // });
                                            },
                                            scrollPadding: EdgeInsets.zero,
                                            onChanged: (value) {
                                              setState(() {
                                                button_state = true;
                                              });
                                            },
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                decorationThickness: 0,
                                                height: AppDimensions.height10(
                                                        context) *
                                                    0.15,
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        2.4,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xffB353C9)),
                                            decoration: InputDecoration(
                                                isCollapsed: true,
                                                // counterText: "",
                                                // counterStyle: TextStyle(
                                                //   height: double.minPositive,
                                                // ),
                                                contentPadding: EdgeInsets.only(
                                                  right: AppDimensions.height10(
                                                      context),
                                                ),
                                                hintText: 'Enter Name',
                                                hintStyle: TextStyle(
                                                    fontSize:
                                                        AppDimensions.height10(
                                                                context) *
                                                            2.4,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xff828282)),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent)),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: AppDimensions.height10(context) * 12.3,
                                height: AppDimensions.height10(context) * 2.0,
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 3.1,
                                    right:
                                        AppDimensions.height10(context) * 26.0,
                                    top: AppDimensions.height10(context) * 1.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Character count: ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '80',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? SizedBox(
                                  height:
                                      AppDimensions.height10(context) * 20.5,
                                )
                              : SizedBox(
                                  height: AppDimensions.height10(context) * 3.0,
                                ),
                          ValueListenableBuilder<TextEditingValue>(
                              valueListenable: controller,
                              builder: (context, value, child) {
                                return AnimatedScaleButton(
                                  onTap: () async {
                                    if (widget.update == true &&
                                        controller.text.isNotEmpty) {
                                      Hurdles().updateHurdle('hurdleName',
                                          controller.text.toString());
                                      Navigator.push(
                                          context,
                                          FadePageRoute(
                                              page: hurdle_statement(
                                            update: widget.update,
                                          )));
                                    } else {
                                      final SharedPreferences prefs =
                                          await _prefs;
                                      var Name = prefs.setString('NameHurdle',
                                          controller.text.toString());
                                      if (controller.text.isNotEmpty) {
                                        Navigator.push(
                                            context,
                                            FadePageRoute(
                                                page: hurdle_statement(
                                              update: widget.update,
                                            )));
                                      }
                                    }
                                  },
                                  child: Container(
                                      height:
                                          AppDimensions.height10(context) * 5.0,
                                      width: AppDimensions.height10(context) *
                                          25.4,
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom ==
                                                  0
                                              ? AppDimensions.height10(
                                                      context) *
                                                  2.6
                                              : AppDimensions.height10(
                                                      context) *
                                                  1.0),
                                      decoration: BoxDecoration(
                                        gradient: controller.text.isNotEmpty
                                            ? const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xffFCC10D),
                                                  Color(0xffFDA210),
                                                ],
                                              )
                                            : LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  const Color(0xff282828)
                                                      .withOpacity(0.5),
                                                  const Color(0xff282828)
                                                      .withOpacity(0.5),
                                                ],
                                              ),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                5.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.update
                                              ? 'Update Summary'
                                              : 'Next',
                                          style: TextStyle(
                                              color: controller.text.isNotEmpty
                                                  ? const Color(0xFFFFFFFF)
                                                  : const Color(0xFFFFFFFF)
                                                      .withOpacity(0.7),
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins'),
                                        ),
                                      )),
                                );
                              }),
                          MediaQuery.of(context).viewInsets.bottom == 0
                              ? Container(
                                  width: AppDimensions.height10(context) * 17.0,
                                  height: AppDimensions.height10(context) * 0.5,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          1.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                      color: const Color(0xFFFFFFFF)
                                          .withOpacity(0.3)),
                                )
                              : SizedBox(
                                  height: AppDimensions.height10(context) * 0,
                                ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom))
                        ]),
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  ),
          )
        ]),
      ),
    );
  }
}
