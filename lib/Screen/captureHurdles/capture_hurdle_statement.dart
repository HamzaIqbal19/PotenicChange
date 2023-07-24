import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_fellings.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
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
      hurdleName = prefs.getString('hurdleName');
    });
    print(hurdleName);
  }

  @override
  void initState() {
    super.initState();

    _getHurdleName();
  }

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
          title: Container(
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
                  '4',
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
                  onPressed: () {},
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
              reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 34.3,
                      height: AppDimensions.height10(context) * 7.3,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 18.0),
                      child: GradientText(
                        'How this hurdle is\nimpacting you?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.8,
                          fontWeight: FontWeight.w700,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 13.9,
                      height: AppDimensions.height10(context) * 13.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 3.177),
                      padding:
                          EdgeInsets.all(AppDimensions.height10(context) * 0.6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/black_hole.webp'))),
                      child: Center(
                        child: Text(
                          hurdleName!,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.4,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        MediaQuery.of(context).viewInsets.bottom == 0
                            ? SizedBox(
                                height: AppDimensions.height10(context) * 6.608,
                              )
                            : SizedBox(
                                height: AppDimensions.height10(context) * 4.1,
                              ),
                        Container(
                            width: AppDimensions.height10(context) * 36.0,
                            height: AppDimensions.height10(context) * 8.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: Colors.white),
                            child: Column(
                              //                  mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 17.4,
                                  height: AppDimensions.height10(context) * 2.0,
                                  margin: EdgeInsets.only(
                                      //left: AppDimensions.height10(context) * 2.0,
                                      top:
                                          AppDimensions.height10(context) * 1.3,
                                      right: AppDimensions.height10(context) *
                                          16.9),
                                  child: Center(
                                    child: Text(
                                      'Action / Trigger statement',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff646464)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    // left: AppDimensions.height10(context) * 2.1,
                                    right:
                                        AppDimensions.height10(context) * 0.7,
                                    // top: AppDimensions.height10(context) * 0.6
                                  ),
                                  height: AppDimensions.height10(context) * 2.9,
                                  width: AppDimensions.height10(context) * 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      maxLength: 150,
                                      controller: controller,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          decorationThickness: 0,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffB353C9)),
                                      decoration: InputDecoration(
                                          counterText: "",
                                          counterStyle: TextStyle(
                                            height: double.minPositive,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          hintText: 'Makes simple mistakes',
                                          hintStyle: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xffB353C9)),
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
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          width: AppDimensions.height10(context) * 12.3,
                          height: AppDimensions.height10(context) * 2.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 1.0,
                              left: AppDimensions.height10(context) * 3.1,
                              right: AppDimensions.height10(context) * 26.0),
                          child: Row(
                            children: [
                              Text(
                                'Character count: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.3,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Text(
                                '150',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.3,
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
                            height: AppDimensions.height10(context) * 22.5,
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 3.0,
                          ),
                    AnimatedScaleButton(
                      onTap: () async {
                        if (widget.update == true) {
                          Hurdles()
                              .updateHurdle(
                                  "triggerStatment", controller.text.toString())
                              .then((response) {
                            if (response == true) {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: summary_hurdles(
                                          delete_hurdle: false)));
                            }
                          });
                        } else {
                          final SharedPreferences prefs = await _prefs;
                          var statement = prefs.setString(
                              'hurdleStatement', controller.text.toString());

                          Navigator.push(context,
                              FadePageRoute(page: const felling_hurdles()));
                        }
                      },
                      child: Container(
                          height: AppDimensions.height10(context) * 5.0,
                          width: AppDimensions.height10(context) * 25.4,
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom == 0
                                      ? AppDimensions.height10(context) * 2.6
                                      : AppDimensions.height10(context) * 1.0),
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
                            widget.update ? 'Update Summary' : 'Next',
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
                                color:
                                    const Color(0xFFFFFFFF).withOpacity(0.3)),
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
