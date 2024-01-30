import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class hurdle_statement extends StatefulWidget {
  final bool update;
  const hurdle_statement({super.key, required this.update});

  @override
  State<hurdle_statement> createState() => _hurdle_statementState();
}

class _hurdle_statementState extends State<hurdle_statement> {
  String? hurdleName;

  TextEditingController controller = TextEditingController();
  void _getHurdleName() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      hurdleName = prefs.getString('NameHurdle');
    });
  }

  bool loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loading = false;
    });
  }

  void checkHurdle() async {
    Hurdles()
        .checkUserHurdles()
        .then((response) {
          if (response == true) {
            Navigator.push(
              context,
              FadePageRouteReverse(page: const landing_hurdles()),
            );

            return response;
          } else if (response == false) {
            Navigator.push(
                context, FadePageRouteReverse(page: const hurdles_splash()));
          }
        })
        .catchError((error) {})
        .whenComplete(() => null);
  }

  void _getStatement() async {
    final SharedPreferences prefs = await _prefs;
    var name;
    setState(() {
      name = prefs.getString('hurdleStatement').toString().isEmpty
          ? ''
          : prefs.getString('hurdleStatement');
    });
    if (name != '' && name != null) {
      controller.text = name;
    }
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          controller.text = response['hurdle']['triggerStatment'];
          hurdleName = response['hurdle']['hurdleName'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  @override
  void initState() {
    super.initState();
    _getStatement();
    if (widget.update == false) {
      setState(() {
        loading = false;
      });
      _getHurdleName();
    } else {
      _fetchHurdleSummary();
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
                FadePageRouteReverse(
                    page: const hurdle_name(
                  update: false,
                )));
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                                FadePageRouteReverse(
                                    page: const hurdle_name(
                                  update: false,
                                )));
                          },
                          icon: Image.asset(
                            'assets/images/Back.webp',
                            //width: AppDimensions.width10(context) * 3.0,
                            height: AppDimensions.height10(context) * 3.0,
                            fit: BoxFit.contain,
                          )),
                    ),
              centerTitle: true,
              title: SizedBox(
                width: AppDimensions.width10(context) * 19.0,
                height: AppDimensions.height10(context) * 2.8,
                child: Row(
                  children: [
                    GradientText(
                      AppText().captureHurdle4,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 2.2,
                        fontWeight: FontWeight.w600,
                      ),
                      colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                    ),
                    GradientText(
                      '/5',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 2.2,
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
                                          AppDimensions.width10(context) * 27.0,
                                      height: AppDimensions.height10(context) *
                                          24.0,
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions.height10(
                                                        context) *
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
                                          width:
                                              AppDimensions.width10(context) *
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
                                              SizedBox(
                                                height: 42,
                                                width: double.infinity,
                                                // color: Colors.white,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    checkHurdle();

                                                    final SharedPreferences
                                                        prefs = await _prefs;
                                                    await prefs.setString(
                                                        'HurdleRoute',
                                                        'Statements');
                                                    await prefs.setString(
                                                        'hurdleStatement',
                                                        controller.text
                                                            .toString());
                                                  },
                                                  child: const Text(
                                                    'Exit & save progress',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF007AFF),
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
                                                    await prefs
                                                        .remove('HurdleRoute');
                                                    await prefs
                                                        .remove('hurdleName');
                                                    await prefs
                                                        .remove('NameHurdle');
                                                    await prefs.remove(
                                                        'hurdleStatement');
                                                    await prefs
                                                        .remove('hurdleId');
                                                    await prefs.remove(
                                                        'selected_goals');
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
                                                        color:
                                                            Color(0xFF007AFF)),
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
                                                // color: Colors.white,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Cancel exit',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF007AFF),
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
                        // width: AppDimensions.width10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        fit: BoxFit.contain,
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
                      image:
                          AssetImage('assets/images/practicebackground.webp'),
                      fit: BoxFit.cover)),
              child: loading == false
                  ? SingleChildScrollView(
                      reverse: true,
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: AppDimensions.width10(context) * 34.3,
                              height: AppDimensions.height10(context) * 7.75,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 18.0),
                              child: GradientText(
                                AppText().captureHurdle4Body,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 2.8,
                                  fontWeight: FontWeight.w700,
                                ),
                                colors: const [
                                  Color(0xffFA9934),
                                  Color(0xffEDD15E)
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimensions.width10(context) * 13.9,
                              height: AppDimensions.height10(context) * 13.9,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 3.177),
                              padding: EdgeInsets.all(
                                  AppDimensions.width10(context) * 0.6),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/black_hole.webp'))),
                              child: Center(
                                child: Text(
                                  hurdleName.toString(),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.4,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                6.608,
                                      )
                                    : SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                4.1,
                                      ),
                                Container(
                                    width:
                                        AppDimensions.width10(context) * 36.0,
                                    // height: AppDimensions.height10(context) * 8.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //                  mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.width10(context) *
                                                  17.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.0,
                                          margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                        .size
                                                        .height <
                                                    690
                                                ? 0
                                                : AppDimensions.width10(
                                                        context) *
                                                    0.6,
                                            top: AppDimensions.height10(
                                                    context) *
                                                1.3,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Action / Trigger statement',
                                              style: TextStyle(
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          1.3,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff646464)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: AppDimensions.height10(
                                                    context) *
                                                2.1,
                                          ),
                                          // height:
                                          //     AppDimensions.height10(context) * 4.4,
                                          // width: AppDimensions.width10(context) *
                                          //     30.5,
                                          child: Center(
                                            child: TextFormField(
                                              maxLength: 150,
                                              controller: controller,
                                              maxLines: null,
                                              onChanged: (value) {},
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  decorationThickness: 0,
                                                  fontSize:
                                                      AppDimensions.font10(
                                                              context) *
                                                          2.4,
                                                  height:
                                                      AppDimensions.height10(
                                                              context) *
                                                          0.15,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      const Color(0xffB353C9)),
                                              decoration: InputDecoration(
                                                  isCollapsed: true,
                                                  contentPadding: EdgeInsets.only(
                                                      right: AppDimensions.height10(
                                                          context)),
                                                  hintText:
                                                      'Makes simple mistakes',
                                                  hintStyle: TextStyle(
                                                      fontSize: AppDimensions.font10(context) *
                                                          2.4,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xffB353C9)),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.transparent))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  width: AppDimensions.width10(context) * 12.3,
                                  height: AppDimensions.height10(context) * 2.0,
                                  margin: EdgeInsets.only(
                                      top:
                                          AppDimensions.height10(context) * 1.0,
                                      left:
                                          AppDimensions.width10(context) * 3.1,
                                      right: AppDimensions.width10(context) *
                                          26.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Character count: ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
                                                    1.3,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '150',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.font10(context) *
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
                                        AppDimensions.height10(context) * 22.5,
                                  )
                                : SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 3.0,
                                  ),
                            ValueListenableBuilder<TextEditingValue>(
                                valueListenable: controller,
                                builder: (context, value, child) {
                                  return AnimatedScaleButton(
                                    onTap: () async {
                                      if (widget.update == true &&
                                          controller.text.isNotEmpty) {
                                        Hurdles()
                                            .updateHurdle("triggerStatment",
                                                controller.text.toString())
                                            .then((response) {
                                          if (response == true) {
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: const summary_hurdles(
                                                        delete_hurdle: false)));
                                          }
                                        });
                                      } else {
                                        if (controller.text.isNotEmpty) {
                                          Navigator.push(
                                              context,
                                              FadePageRoute(
                                                  page: const felling_hurdles(
                                                update: false,
                                              )));
                                          final SharedPreferences prefs =
                                              await _prefs;
                                          await prefs.setString(
                                              'hurdleStatement',
                                              controller.text.toString());
                                        }
                                      }
                                    },
                                    child: Container(
                                        height:
                                            AppDimensions.height10(context) *
                                                5.0,
                                        width: AppDimensions.width10(context) *
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
                                              ? AppText().updateSumm
                                              : AppText().nextButton,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.font10(
                                                      context) *
                                                  1.6,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Laila'),
                                        ))),
                                  );
                                }),
                            // MediaQuery.of(context).viewInsets.bottom == 0
                            //     ? Container(
                            //         width:
                            //             AppDimensions.width10(context) * 17.0,
                            //         height:
                            //             AppDimensions.height10(context) * 0.5,
                            //         margin: EdgeInsets.only(
                            //             bottom:
                            //                 AppDimensions.height10(context) *
                            //                     1.0),
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(
                            //                 AppDimensions.height10(context) *
                            //                     2.0),
                            //             color: const Color(0xFFFFFFFF)
                            //                 .withOpacity(0.3)),
                            //       )
                            //     : SizedBox(
                            //         height: AppDimensions.height10(context) * 0,
                            //       ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom))
                          ]),
                    )
                  : const Center(
                      child: SpinKitFadingCircle(
                        color: Color(0xFFB1B8FF),
                        size: 80,
                      ),
                    ),
            ),
          ]),
        ),
      ),
    );
  }
}
