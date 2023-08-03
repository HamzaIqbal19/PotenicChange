import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/captureHurdles/splash_hurdles.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class felling_hurdles extends StatefulWidget {
  const felling_hurdles({super.key});

  @override
  State<felling_hurdles> createState() => _felling_hurdlesState();
}

class _felling_hurdlesState extends State<felling_hurdles> {
  List<String> statements = [];
  String? hurdleName;
  List selectedGoals = [];
  String? hurdleStatement;
  int? hurdleId;

  int getMaxCharacters() {
    return 100;
  }

  int getCurrentCharacters() {
    return controller.text.length;
  }

  void _getHurdleDetail() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      hurdleName = prefs.getString('hurdleName');
      hurdleStatement = prefs.getString('hurdleStatement');
      hurdleId = prefs.getInt('hurdleId');
    });

    final encodedGoals = prefs.getString('selected_goals');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      setState(() {
        selectedGoals = decodedGoals;
      });
      print('SelectedGoals==============================$selectedGoals');
    }
  }

  TextEditingController controller = TextEditingController();
  bool scroll = true;

  @override
  void initState() {
    super.initState();
    statements.add('text');
    _getHurdleDetail();
    print(hurdleId);
    print(hurdleName);
    print(hurdleStatement);
    controller.text = 'I feel ';
  }

  int circle_state = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
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
                  ' 5',
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
                    showAnimatedDialog(
                        animationType: DialogTransitionType.fadeScale,
                        curve: Curves.easeInOut,
                        duration: Duration(seconds: 1),
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              width: AppDimensions.height10(context) * 27.0,
                              height: AppDimensions.height10(context) * 24.0,
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10(context) * 1.4)),
                                contentPadding: EdgeInsets.zero,
                                actionsPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                title: Container(
                                  margin: const EdgeInsets.only(
                                      top: 19, right: 16, left: 16, bottom: 2),
                                  height: AppDimensions.height10(context) * 2.2,
                                  width: AppDimensions.height10(context) * 23.8,
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
                                  height: AppDimensions.height10(context) * 1.6,
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
                                        height:
                                            AppDimensions.height10(context) *
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
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            var hurdleRoute = prefs.setString(
                                                'HurdleRoute', 'Feelings');
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: hurdles_splash()));
                                          },
                                          child: const Text(
                                            'Exit & save progress',
                                            style: TextStyle(
                                                color: Color(0xFF007AFF),
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
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
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            var hurdleRoute =
                                                prefs.remove('HurdleRoute');
                                            Navigator.push(
                                                context,
                                                FadePageRoute(
                                                    page: hurdles_splash()));
                                          },
                                          child: const Text(
                                            'Exit & delete progress',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF007AFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
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
                                            bottom: AppDimensions.height10(
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
                                                fontWeight: FontWeight.w400),
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
            child: SingleChildScrollView(
              reverse: scroll,
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                Container(
                  width: AppDimensions.height10(context) * 34.3,
                  height: AppDimensions.height10(context) * 7.3,
                  margin: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 18.0),
                  child: GradientText(
                    'How do you feel when\nthis hurdle happens?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                    ),
                    colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                  ),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 8.5,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 6.5,
                      ),
                SizedBox(
                  // height: MediaQuery.of(context).viewInsets.bottom == 0
                  //     ? AppDimensions.height10(context) * 46.5
                  //     : AppDimensions.height10(context) * 30.7,
                  child: Column(
                    children: [
                      for (int i = 1; i <= circle_state; i++) ...[
                        Column(
                          children: [
                            Container(
                                width: AppDimensions.height10(context) * 18.1,
                                height: AppDimensions.height10(context) * 18.1,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 0.8),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff546096),
                                          Color(0xff54A7BC)
                                        ])),
                                child: Container(
                                  width:
                                      AppDimensions.height10(context) * 16.813,
                                  height:
                                      AppDimensions.height10(context) * 6.83,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: TextFormField(
                                      maxLength: getMaxCharacters(),
                                      controller: controller,
                                      expands: true,
                                      maxLines: null,
                                      minLines: null,
                                      onChanged: (newText) {
                                        setState(() {
                                          statements[circle_state - 1] =
                                              newText;
                                          scroll = true;
                                        });
                                        if (!newText.startsWith("I feel ")) {
                                          controller.text = "I feel ";
                                          controller.selection =
                                              TextSelection.fromPosition(
                                            TextPosition(
                                                offset: controller.text.length),
                                          );
                                        }

                                        print(newText);
                                      },
                                      onFieldSubmitted: (submittedText) {
                                        // Check if the submitted text is empty
                                        if (submittedText.isEmpty) {
                                          // Replace it with "I feel " and move the cursor to the end
                                          controller.text = "I feel ";
                                          controller.selection =
                                              TextSelection.fromPosition(
                                            TextPosition(
                                                offset: controller.text.length),
                                          );
                                        }
                                      },
                                      scrollPhysics:
                                          const ClampingScrollPhysics(),
                                      decoration: InputDecoration(
                                          counterText: "",
                                          counterStyle: const TextStyle(
                                            height: double.minPositive,
                                          ),
                                          hintText: 'I feel...',
                                          hintStyle: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  1.4,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent)),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent))),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          decorationThickness: 0,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              // width: AppDimensions.height10(context) * 12.2,
                              height: AppDimensions.height10(context) * 2.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    '${getCurrentCharacters()}/100',
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
                            MediaQuery.of(context).viewInsets.bottom == 0
                                ? SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 3.7,
                                  )
                                : SizedBox(
                                    height:
                                        AppDimensions.height10(context) * 1.5,
                                  ),
                          ],
                        ),
                      ],
                      GestureDetector(
                        onTap: () {
                          statements.add('text');
                          setState(() {
                            circle_state = circle_state + 1;
                          });
                        },
                        child: Container(
                          width: AppDimensions.height10(context) * 4.7,
                          height: AppDimensions.height10(context) * 4.7,
                          margin: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 1.1),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //     width:   AppDimensions.height10(context)(context)* 0.3,
                              //     color: Colors.white)
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Addgoal.webp'))),
                        ),
                      ),
                      SizedBox(
                        width: AppDimensions.height10(context) * 21.7,
                        height: AppDimensions.height10(context) * 1.9,
                        child: Text(
                          'Add another thought/feeling',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedScaleButton(
                  onTap: () async {
                    print(statements);
                    print(hurdleId);
                    print(hurdleName);

                    print('Selected goals $selectedGoals');
                    print(hurdleStatement);
                    Hurdles()
                        .addHurdle(hurdleName!, hurdleStatement!, statements,
                            hurdleId!, selectedGoals)
                        .then((response) async {
                      final SharedPreferences prefs = await _prefs;
                      var userHurdleId = prefs.setInt(
                          'userHurdleId', response['result']['id']);
                      print(response['result']['id']);

                      if (response.length != 0) {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const summary_hurdles(
                              delete_hurdle: false,
                            )));
                      }
                    });
                    ;
                  },
                  child: Container(
                      height: AppDimensions.height10(context) * 5.0,
                      width: AppDimensions.height10(context) * 16.7,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.bottom == 0
                              ? AppDimensions.height10(context) * 14.0
                              : AppDimensions.height10(context) * 1,
                          bottom: AppDimensions.height10(context) * 1.0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFCC10D),
                            Color(0xffFDA210),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 5.0),
                      ),
                      child: Center(
                          child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ))),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? Container(
                        width: AppDimensions.height10(context) * 17.0,
                        height: AppDimensions.height10(context) * 0.5,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 0,
                      ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ]),
            )),
      ]),
    );
  }
}
