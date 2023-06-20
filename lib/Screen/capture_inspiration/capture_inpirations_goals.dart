import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:potenic_app/Screen/capture_inspiration/inpiration_type.dart';
import 'package:potenic_app/Screen/capture_inspiration/inspiration_type/photo_acess.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class inspiraton_goals extends StatefulWidget {
  final bool data_saved;
  const inspiraton_goals({super.key, required this.data_saved});

  @override
  State<inspiraton_goals> createState() => _inspiraton_goalsState();
}

class _inspiraton_goalsState extends State<inspiraton_goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: widget.data_saved
              ? Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          FadePageRoute(
                              page: const photo_info(
                            edit_details: false,
                            image_detals: true,
                            image_save: true,
                            image_create: true,
                          )),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/Back.png',
                        width: AppDimensions.height10(context) * 2.6,
                        height: AppDimensions.height10(context) * 2.6,
                        fit: BoxFit.cover,
                      )),
                )
              : Container(),
          title: widget.data_saved
              ? Container()
              : Container(
                  width: AppDimensions.height10(context) * 18.9,
                  height: AppDimensions.height10(context) * 2.4,
                  margin: EdgeInsets.only(
                      left: AppDimensions.height10(context) * 7.5),
                  child: Row(
                    children: [
                      GradientText(
                        'Inspiration 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w600,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                      GradientText(
                        '/2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.0,
                          fontWeight: FontWeight.w400,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                    ],
                  ),
                ),
          actions: [
            widget.data_saved
                ? Container()
                : Center(
                    child: IconButton(
                        onPressed: () => showAnimatedDialog(
                            animationType: DialogTransitionType.fadeScale,
                            curve: Curves.easeInOut,
                            duration: Duration(seconds: 1),
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                                  width: AppDimensions.height10(context) * 27.0,
                                  height:
                                      AppDimensions.height10(context) * 21.0,
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
                                          AppDimensions.height10(context) * 2.2,
                                      width: AppDimensions.height10(context) *
                                          23.8,
                                      child: const Text(
                                        "Exit Inspiration?",
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
                                      height: 32,
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
                                              onPressed: () {},
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
                                              onPressed: () {},
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
                                )),
                        icon: Image.asset(
                          'assets/images/Close.png',
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
          // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_inpiration_purple.png'),
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                  fit: BoxFit.cover)),
          child: Column(children: [
            Container(
              width: AppDimensions.height10(context) * 36.0,
              height: AppDimensions.height10(context) * 67.9,
              margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 9.3,
                  left: AppDimensions.height10(context) * 3.0,
                  right: AppDimensions.height10(context) * 2.4),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 34.3,
                        height: AppDimensions.height10(context) * 7.3,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 8.7),
                        child: Center(
                          //Text alingment changes
                          child: GradientText(
                            'Which goals is the\ninspiration for?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.2,
                              fontSize: AppDimensions.height10(context) * 2.8,
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
                        width: AppDimensions.height10(context) * 14.1,
                        height: AppDimensions.height10(context) * 14.1,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 2.1,
                            right: AppDimensions.height10(context) * 19.8,
                            top: AppDimensions.height10(context) * 2.9),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white)),
                        padding: EdgeInsets.all(
                            AppDimensions.height10(context) * 0.5),
                        child: Container(
                          height: AppDimensions.height10(context) * 13.1,
                          width: AppDimensions.height10(context) * 13.1,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: AppDimensions.height10(context) * 0.1,
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
                              'All goals',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 12.4,
                        height: AppDimensions.height10(context) * 2.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 21.2,
                            left: AppDimensions.height10(context) * 2.8,
                            top: AppDimensions.height10(context) * 2.0),
                        child: Center(
                          child: Text(
                            'Active Goals',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 2.7,
                            left: AppDimensions.height10(context) * 2.6,
                            top: AppDimensions.height10(context) * 1.0,
                            bottom: AppDimensions.height10(context) * 2.0),
                        child: Row(children: [
                          Container(
                            height: AppDimensions.height10(context) * 13.1,
                            width: AppDimensions.height10(context) * 13.1,
                            margin: EdgeInsets.only(
                              right: AppDimensions.height10(context) * 4.5,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
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
                                'Anger\nmanagement',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 13.1,
                            width: AppDimensions.height10(context) * 13.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
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
                                'Become More\nConfident',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        width: AppDimensions.height10(context) * 13.7,
                        height: AppDimensions.height10(context) * 2.4,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 19.5,
                            left: AppDimensions.height10(context) * 2.8),
                        child: Center(
                          child: Text(
                            'Inactive Goals',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 2.0,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10(context) * 2.7,
                            left: AppDimensions.height10(context) * 2.6,
                            top: AppDimensions.height10(context) * 2.0,
                            bottom: AppDimensions.height10(context) * 0.7),
                        child: Row(children: [
                          Container(
                            height: AppDimensions.height10(context) * 13.1,
                            width: AppDimensions.height10(context) * 13.1,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 4.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
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
                                '[Goal 3]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 13.1,
                            width: AppDimensions.height10(context) * 13.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
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
                                '[Goal 4]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 2.7,
                          left: AppDimensions.height10(context) * 2.6,
                        ),
                        child: Row(children: [
                          Container(
                            height: AppDimensions.height10(context) * 13.1,
                            width: AppDimensions.height10(context) * 13.1,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 4.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
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
                                '[Goal 3]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 13.1,
                            width: AppDimensions.height10(context) * 13.1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
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
                                '[Goal 4]',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
            widget.data_saved
                ? Container(
                    width: AppDimensions.height10(context) * 34.2,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.3,
                        bottom: AppDimensions.height10(context) * 3.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10(context) * 12.8,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color(0xFFFFFFFF).withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Reset',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.5)),
                              )),
                        ),
                        Container(
                          width: AppDimensions.height10(context) * 20.4,
                          height: AppDimensions.height10(context) * 5.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xffFCC10D).withOpacity(0.5),
                                const Color(0xffFDA210).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Save',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 1.6,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.5)),
                              )),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: AppDimensions.height10(context) * 25.4,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.3,
                        bottom: AppDimensions.height10(context) * 2.6),
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
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            FadePageRoute(page: const inspiration_type()),
                          );
                        },
                        child: Text(
                          '(5/5 goals selected) Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  ),
            Container(
              width: AppDimensions.height10(context) * 17.0,
              height: AppDimensions.height10(context) * 0.5,
              // margin: EdgeInsets.only(bottom: AppDimensions.height10(context) * 1.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 2.0),
                  color: const Color(0xFFFFFFFF).withOpacity(0.3)),
            )
          ])),
    );
  }
}
