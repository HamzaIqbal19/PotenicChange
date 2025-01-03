import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdle_statement.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_landing_screen.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/capture_hurdles_summary.dart';
import 'package:potenic_app/Screen/Hurdle%20Creation%20Journey/splash_hurdles.dart';
import 'package:potenic_app/Widgets/alertbox.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class felling_hurdles extends StatefulWidget {
  final bool update;
  const felling_hurdles({super.key, required this.update});

  @override
  State<felling_hurdles> createState() => _felling_hurdlesState();
}

class _felling_hurdlesState extends State<felling_hurdles> {
  List<String> statements = [];
  String? hurdleName;
  List selectedGoals = [];
  String? hurdleStatement;
  List updatedSummary = [];
  bool loader = true;
  int? hurdleId;
  var hurdleDetails;
  var trigger;
  List<TextEditingController> control = [TextEditingController(text: 'I feel')];

  int char = 0;

  int getMaxCharacters() {
    return 100;
  }

  void _getHurdleDetail() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      hurdleName = prefs.getString('NameHurdle');
      hurdleStatement = prefs.getString('hurdleStatement');
      hurdleId = prefs.getInt('hurdleId');
    });

    final encodedGoals = prefs.getString('selected_goals');
    if (encodedGoals != null) {
      List decodedGoals = List.from(json.decode(encodedGoals));
      setState(() {
        selectedGoals = decodedGoals;
      });
    }
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      loader = false;
    });
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdleDetails = response;
          trigger = response['hurdle']['thoughtsAndFeelings'];
        });

        for (int i = 0;
            i <= response['hurdle']['thoughtsAndFeelings'].length;
            i++) {
          i != trigger.length ? statements.add('${trigger[i]}') : print('full');
        }
        for (int i = 0;
            i <= response['hurdle']['thoughtsAndFeelings'].length;
            i++) {
          i != trigger.length
              ? control.add(TextEditingController(text: '${trigger[i]}'))
              : control.add(TextEditingController(text: 'I feel'));
        }
        setState(() {
          scroll = false;
          circleState = response['hurdle']['thoughtsAndFeelings'].length;
        });
        loadData();

        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {});
  }

  void saveListToSharedPreferences(List<String> myList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('feelingsList', myList);
  }

  getListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> myList = prefs.getStringList('feelingsList') ?? [];

    if (myList.isNotEmpty) {
      for (int i = 0; i <= myList.length; i++) {
        i != myList.length ? statements.add(myList[i]) : print('full');
      }
      for (int i = 0; i <= myList.length; i++) {
        i != myList.length
            ? control.insert(i, TextEditingController(text: myList[i]))
            : control.add(TextEditingController(text: 'I feel'));
      }
      setState(() {
        scroll = false;

        circleState = myList.length - 1;
      });
    } else if (myList.isEmpty) {
      statements.add('I feel');
      control.add(TextEditingController(text: 'I feel'));
    }
  }

  // Future<void> _loadList() async {
  //   List<String> tempList = await getListFromSharedPreferences();
  // }

  void controllersUpdate() {
    for (int i = 0;
        i >= hurdleDetails['hurdle']['thoughtsAndFeelings'].length;
        i++) {
      control.add(TextEditingController(
          text: hurdleDetails['hurdle']['thoughtsAndFeelings'][i]));
    }
  }

  void controllersUpdateText() {
    for (int i = 0; i >= control.length; i++) {
      //control.add(TextEditingController(text: 'I feel'));
      control.add(TextEditingController(text: 'I feel'));
    }
  }

  // TextEditingController controller = TextEditingController();
  bool scroll = true;

  @override
  void initState() {
    super.initState();
    if (widget.update == true) {
      _fetchHurdleSummary();
    } else {
      setState(() {
        loader = false;
      });

      getListFromSharedPreferences();
      _getHurdleDetail();
    }
  }

  void checkHurdle() async {
    Hurdles().checkUserHurdles().then((response) {
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
    }).catchError((error) {});
  }

  int circleState = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.update
            ? Navigator.pop(context)
            : Navigator.pushReplacement(
                context,
                FadePageRouteReverse(
                    page: const hurdle_statement(
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
                      child: Buttons().backButton(context, () {
                        Navigator.pushReplacement(
                            context,
                            FadePageRouteReverse(
                                page: const hurdle_statement(
                              update: false,
                            )));
                      }),
                      //  IconButton(
                      //     onPressed: () {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           FadePageRouteReverse(
                      //               page: const hurdle_statement(
                      //             update: false,
                      //           )));
                      //     },
                      //     icon: Image.asset(
                      //       'assets/images/Back.webp',
                      //       // width: AppDimensions.width10(context) * 3.0,
                      //       height: AppDimensions.height10(context) * 3.0,
                      //       fit: BoxFit.contain,
                      //     )),
                    ),
              centerTitle: true,
              title: SizedBox(
                width: AppDimensions.width10(context) * 19.0,
                height: AppDimensions.height10(context) * 2.8,
                child: Row(
                  children: [
                    GradientText(
                      AppText().captureHurdle5,
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
                  child: Buttons().closeButton(context, () {
                    widget.update
                        ? Navigator.pop(context)
                        : AlertBox().alertDialog(context, "hurdle?", () async {
                            checkHurdle();
                            final SharedPreferences prefs = await _prefs;
                            await prefs.remove('HurdleRoute');
                            await prefs.remove('hurdleName');
                            await prefs.remove('NameHurdle');
                            await prefs.remove('hurdleStatement');
                            await prefs.remove('hurdleId');
                            await prefs.remove('selected_goals');
                            await prefs.remove('feelingsList');
                            await prefs.remove("hurdle_selected");
                          });
                  }),

                  // IconButton(
                  //     onPressed: () {
                  //       widget.update
                  //           ? Navigator.pop(context)
                  //           : AlertBox().alertDialog(context, "hurdle?",
                  //               () async {
                  //               checkHurdle();
                  //               final SharedPreferences prefs = await _prefs;
                  //               await prefs.remove('HurdleRoute');
                  //               await prefs.remove('hurdleName');
                  //               await prefs.remove('NameHurdle');
                  //               await prefs.remove('hurdleStatement');
                  //               await prefs.remove('hurdleId');
                  //               await prefs.remove('selected_goals');
                  //               await prefs.remove('feelingsList');
                  //               await prefs.remove("hurdle_selected");
                  //             });
                  //       // showAnimatedDialog(
                  //       //     animationType: DialogTransitionType.fadeScale,
                  //       //     curve: Curves.easeInOut,
                  //       //     duration: const Duration(seconds: 1),
                  //       //     context: context,
                  //       //     builder: (BuildContext context) => SizedBox(
                  //       //           width:
                  //       //               AppDimensions.width10(context) * 27.0,
                  //       //           height: AppDimensions.height10(context) *
                  //       //               24.0,
                  //       //           child: AlertDialog(
                  //       //             shape: RoundedRectangleBorder(
                  //       //                 borderRadius: BorderRadius.circular(
                  //       //                     AppDimensions.height10(
                  //       //                             context) *
                  //       //                         1.4)),
                  //       //             contentPadding: EdgeInsets.zero,
                  //       //             actionsPadding: EdgeInsets.zero,
                  //       //             titlePadding: EdgeInsets.zero,
                  //       //             title: Container(
                  //       //               margin: const EdgeInsets.only(
                  //       //                   top: 19,
                  //       //                   right: 16,
                  //       //                   left: 16,
                  //       //                   bottom: 2),
                  //       //               height:
                  //       //                   AppDimensions.height10(context) *
                  //       //                       2.2,
                  //       //               width:
                  //       //                   AppDimensions.width10(context) *
                  //       //                       23.8,
                  //       //               child: const Text(
                  //       //                 "Exit hurdle?",
                  //       //                 textAlign: TextAlign.center,
                  //       //                 style: TextStyle(
                  //       //                   fontSize: 17,
                  //       //                   fontWeight: FontWeight.w400,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //             content: Container(
                  //       //               margin: const EdgeInsets.only(
                  //       //                   bottom: 19, left: 16, right: 16),
                  //       //               height:
                  //       //                   AppDimensions.height10(context) *
                  //       //                       1.6,
                  //       //               width: 238,
                  //       //               child: const Text(
                  //       //                 "Please select from the options below",
                  //       //                 textAlign: TextAlign.center,
                  //       //                 style: TextStyle(
                  //       //                   fontSize: 13,
                  //       //                   fontWeight: FontWeight.w400,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //             actions: <Widget>[
                  //       //               Column(
                  //       //                 children: [
                  //       //                   // SizedBox(
                  //       //                   //   height: AppDimensions.height10(
                  //       //                   //           context) *
                  //       //                   //       0.1,
                  //       //                   //   child: Divider(
                  //       //                   //     color: const Color(0XFF3C3C43)
                  //       //                   //         .withOpacity(0.29),
                  //       //                   //   ),
                  //       //                   // ),
                  //       //                   // SizedBox(
                  //       //                   //   height: 42,
                  //       //                   //   width: double.infinity,
                  //       //                   //   // color: Colors.white,
                  //       //                   //   child: TextButton(
                  //       //                   //     onPressed: () async {
                  //       //                   //       checkHurdle();
                  //       //                   //       final SharedPreferences
                  //       //                   //           prefs = await _prefs;
                  //       //                   //       await prefs.setString(
                  //       //                   //           'HurdleRoute',
                  //       //                   //           'Feelings');
                  //       //                   //       saveListToSharedPreferences(
                  //       //                   //           statements);
                  //       //                   //     },
                  //       //                   //     child: const Text(
                  //       //                   //       'Exit & save progress',
                  //       //                   //       style: TextStyle(
                  //       //                   //           color:
                  //       //                   //               Color(0xFF007AFF),
                  //       //                   //           fontSize: 17,
                  //       //                   //           fontFamily: "Laila",
                  //       //                   //           fontWeight:
                  //       //                   //               FontWeight.w400),
                  //       //                   //     ),
                  //       //                   //   ),
                  //       //                   // ),
                  //       //                   SizedBox(
                  //       //                     height: AppDimensions.height10(
                  //       //                             context) *
                  //       //                         0.1,
                  //       //                     child: Divider(
                  //       //                       color: const Color(0XFF3C3C43)
                  //       //                           .withOpacity(0.29),
                  //       //                     ),
                  //       //                   ),
                  //       //                   SizedBox(
                  //       //                     height: 44,
                  //       //                     width: double.infinity,
                  //       //                     child: TextButton(
                  //       //                       onPressed: () async {
                  //       //                         checkHurdle();
                  //       //                         final SharedPreferences
                  //       //                             prefs = await _prefs;
                  //       //                         await prefs
                  //       //                             .remove('HurdleRoute');
                  //       //                         await prefs
                  //       //                             .remove('hurdleName');
                  //       //                         await prefs
                  //       //                             .remove('NameHurdle');
                  //       //                         await prefs.remove(
                  //       //                             'hurdleStatement');
                  //       //                         await prefs
                  //       //                             .remove('hurdleId');
                  //       //                         await prefs.remove(
                  //       //                             'selected_goals');
                  //       //                         await prefs
                  //       //                             .remove('feelingsList');
                  //       //                         await prefs.remove(
                  //       //                             "hurdle_selected");
                  //       //                       },
                  //       //                       child: const Text(
                  //       //                         'Exit & delete progress',
                  //       //                         style: TextStyle(
                  //       //                             fontSize: 17,
                  //       //                             fontFamily: "Laila",
                  //       //                             fontWeight:
                  //       //                                 FontWeight.w400,
                  //       //                             color:
                  //       //                                 Color(0xFF007AFF)),
                  //       //                       ),
                  //       //                     ),
                  //       //                   ),
                  //       //                   SizedBox(
                  //       //                     height: AppDimensions.height10(
                  //       //                             context) *
                  //       //                         0.1,
                  //       //                     child: Divider(
                  //       //                       color: const Color(0XFF3C3C43)
                  //       //                           .withOpacity(0.29),
                  //       //                     ),
                  //       //                   ),
                  //       //                   Container(
                  //       //                     height: 42,
                  //       //                     width: double.infinity,
                  //       //                     margin: EdgeInsets.only(
                  //       //                         bottom:
                  //       //                             AppDimensions.height10(
                  //       //                                     context) *
                  //       //                                 1.0),
                  //       //                     // color: Colors.white,
                  //       //                     child: TextButton(
                  //       //                       onPressed: () {
                  //       //                         Navigator.pop(context);
                  //       //                       },
                  //       //                       child: const Text(
                  //       //                         'Cancel exit',
                  //       //                         style: TextStyle(
                  //       //                             color:
                  //       //                                 Color(0xFF007AFF),
                  //       //                             fontSize: 17,
                  //       //                             fontFamily: "Laila",
                  //       //                             fontWeight:
                  //       //                                 FontWeight.w400),
                  //       //                       ),
                  //       //                     ),
                  //       //                   ),
                  //       //                 ],
                  //       //               ),
                  //       //             ],
                  //       //           ),
                  //       //         ));
                  //     },
                  //     icon: Image.asset(
                  //       'assets/images/Close.webp',
                  //       //  width: AppDimensions.width10(context) * 2.6,
                  //       height: AppDimensions.height10(context) * 2.6,
                  //       fit: BoxFit.contain,
                  //     )),
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
              child: loader == false
                  ? SingleChildScrollView(
                      reverse: scroll,
                      physics: const ClampingScrollPhysics(),
                      child: Column(children: [
                        Container(
                          width: AppDimensions.width10(context) * 34.3,
                          height: AppDimensions.height10(context) * 7.75,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10(context) * 18.0),
                          child: GradientText(
                            AppText().captureHurdle5Body,
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
                              for (int i = widget.update ? 1 : 0;
                                  widget.update
                                      ? i <= circleState
                                      : i <= circleState;
                                  i++) ...[
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        statements.length > 1
                                            ? Container(
                                                width: AppDimensions.width10(
                                                        context) *
                                                    20.1,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: AnimatedScaleButton(
                                                    onTap: () {
                                                      if (widget.update ==
                                                          true) {
                                                        control.removeAt(i - 1);
                                                        statements
                                                            .removeAt(i - 1);
                                                      } else {
                                                        control.removeAt(i);
                                                        statements.removeAt(i);
                                                      }
                                                      setState(() {
                                                        circleState--;
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )))
                                            : Container(),
                                        Container(
                                            width: AppDimensions.width10(context) *
                                                18.1,
                                            height:
                                                AppDimensions.width10(context) *
                                                    18.1,
                                            padding: EdgeInsets.all(
                                                AppDimensions.height10(context) *
                                                    1),
                                            margin: EdgeInsets.only(
                                                bottom: AppDimensions.height10(
                                                        context) *
                                                    0.8),
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
                                              width: AppDimensions.width10(
                                                      context) *
                                                  16.813,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  6.83,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: TextFormField(
                                                  maxLength: getMaxCharacters(),
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .sentences,
                                                  enableInteractiveSelection:
                                                      true,
                                                  controller: control[i],
                                                  expands: true,
                                                  maxLines: null,
                                                  minLines: null,
                                                  onChanged: (newText) {
                                                    if (widget.update ==
                                                        false) {
                                                      setState(() {
                                                        statements[i] = newText;
                                                        scroll = true;
                                                      });
                                                      if (!newText.startsWith(
                                                          "I feel ")) {
                                                        control[i].text =
                                                            "I feel ";

                                                        control[i].selection =
                                                            TextSelection
                                                                .fromPosition(
                                                          TextPosition(
                                                              offset: control[i]
                                                                  .text
                                                                  .length),
                                                        );
                                                      }
                                                    } else {
                                                      setState(() {
                                                        statements[i - 1] =
                                                            newText;
                                                        scroll = true;
                                                      });
                                                      if (!newText.startsWith(
                                                          "I feel ")) {
                                                        control[i].text =
                                                            "I feel ";

                                                        control[i].selection =
                                                            TextSelection
                                                                .fromPosition(
                                                          TextPosition(
                                                              offset: control[i]
                                                                  .text
                                                                  .length),
                                                        );
                                                      }
                                                    }
                                                  },
                                                  onFieldSubmitted:
                                                      (submittedText) {
                                                    // Check if the submitted text is empty
                                                    if (widget.update ==
                                                        false) {
                                                      if (submittedText
                                                          .isEmpty) {
                                                        // Replace it with "I feel " and move the cursor to the end
                                                        control[i].text =
                                                            "I feel ";
                                                        control[i].selection =
                                                            TextSelection
                                                                .fromPosition(
                                                          TextPosition(
                                                              offset: control[i]
                                                                  .text
                                                                  .length),
                                                        );
                                                      }
                                                    } else {
                                                      if (submittedText
                                                          .isEmpty) {
                                                        // Replace it with "I feel " and move the cursor to the end
                                                        control[i].text =
                                                            "I feel ";
                                                        control[i].selection =
                                                            TextSelection
                                                                .fromPosition(
                                                          TextPosition(
                                                              offset: control[i]
                                                                  .text
                                                                  .length),
                                                        );
                                                      }
                                                    }
                                                  },
                                                  scrollPhysics:
                                                      const ClampingScrollPhysics(),
                                                  decoration: InputDecoration(
                                                      counterText: "",
                                                      counterStyle:
                                                          const TextStyle(
                                                        height:
                                                            double.minPositive,
                                                      ),
                                                      hintText: 'I feel...',
                                                      hintStyle: TextStyle(
                                                          fontSize: AppDimensions
                                                                  .font10(
                                                                      context) *
                                                              2,
                                                          fontFamily: 'laila',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.white),
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
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'laila',
                                                      decorationThickness: 0,
                                                      fontSize:
                                                          AppDimensions.font10(
                                                                  context) *
                                                              2,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      // width: AppDimensions.width10(context) * 12.2,
                                      height:
                                          AppDimensions.height10(context) * 2.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Character count: ',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.3,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '${control[i].text.length}/100',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font10(
                                                        context) *
                                                    1.3,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MediaQuery.of(context).viewInsets.bottom ==
                                            0
                                        ? SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                3.7,
                                          )
                                        : SizedBox(
                                            height: AppDimensions.height10(
                                                    context) *
                                                1.5,
                                          ),
                                  ],
                                ),
                              ],
                              GestureDetector(
                                onTap: () {
                                  control.add(
                                      TextEditingController(text: 'I feel'));
                                  statements.add('I feel');
                                  setState(() {
                                    circleState = circleState + 1;
                                  });
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 4.7,
                                  height: AppDimensions.height10(context) * 4.7,
                                  margin: EdgeInsets.only(
                                      bottom: AppDimensions.height10(context) *
                                          1.1),
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
                                width: AppDimensions.width10(context) * 21.7,
                                height: AppDimensions.height10(context) * 1.9,
                                child: Text(
                                  AppText().captureHurdle5Foot,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.font10(context) * 1.6,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedScaleButton(
                          onTap: () async {
                            if (widget.update == true) {
                              // Navigator.push(
                              //     context,
                              //     FadePageRoute(
                              //         page: const summary_hurdles(
                              //       delete_hurdle: false,
                              //     )));
                              Hurdles()
                                  .updateHurdle(
                                      "thoughtsAndFeelings", statements)
                                  .then((response) {
                                if (response == true) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const summary_hurdles(
                                        delete_hurdle: false,
                                      )));
                                } else {
                                  // Navigator.push(
                                  //     context,
                                  //     FadePageRoute(
                                  //         page: const summary_hurdles(
                                  //       delete_hurdle: false,
                                  //     )));
                                }
                              });
                            } else {
                              Hurdles()
                                  .addHurdle(hurdleName!, hurdleStatement!,
                                      statements, hurdleId!, selectedGoals)
                                  .then((response) async {
                                if (response.length != 0) {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          page: const summary_hurdles(
                                        delete_hurdle: false,
                                      )));
                                  final SharedPreferences prefs = await _prefs;
                                  await prefs.remove('HurdleRoute');
                                  await prefs.remove('hurdleName');
                                  await prefs.remove('NameHurdle');
                                  await prefs.remove('hurdleStatement');
                                  await prefs.remove('hurdleId');
                                  await prefs.remove('selected_goals');
                                  await prefs.remove('feelingsList');
                                  await prefs.remove("hurdle_selected");
                                }
                                final SharedPreferences prefs = await _prefs;
                                await prefs.setInt(
                                    'userHurdleId', response['result']['id']);
                              });
                            }
                          },
                          child: Container(
                              width: AppDimensions.width10(context) * 31.3,
                              height: AppDimensions.height10(context) * 5.2,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom ==
                                          0
                                      ? AppDimensions.height10(context) * 14.0
                                      : AppDimensions.height10(context) * 1,
                                  bottom:
                                      AppDimensions.height10(context) * 2.6),
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
                                widget.update
                                    ? AppText().updateSumm
                                    : AppText().nextButton,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        UpdatedDimensions.font10(context) * 2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Laila'),
                              ))),
                        ),
                        // MediaQuery.of(context).viewInsets.bottom == 0
                        //     ? Container(
                        //         width: AppDimensions.width10(context) * 17.0,
                        //         height: AppDimensions.height10(context) * 0.5,
                        //         margin: EdgeInsets.only(
                        //             bottom:
                        //                 AppDimensions.height10(context) * 1.0),
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(
                        //                 AppDimensions.height10(context) * 2.0),
                        //             color: const Color(0xFFFFFFFF)
                        //                 .withOpacity(0.3)),
                        //       )
                        //     : SizedBox(
                        //         height: AppDimensions.height10(context) * 0,
                        //       ),
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
            ),
          ]),
        ),
      ),
    );
  }
}
