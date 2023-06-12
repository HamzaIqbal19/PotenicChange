import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_statement.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class hurdle_name extends StatefulWidget {
  const hurdle_name({super.key});

  @override
  State<hurdle_name> createState() => _hurdle_nameState();
}

class _hurdle_nameState extends State<hurdle_name> {
  bool button_state = false;

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
                  'assets/images/Back.png',
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
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
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
                    image: AssetImage('assets/images/practicebackground.png'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? SizedBox(
                            height: AppDimensions.height10(context) * 18.0,
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 11.0,
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
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                    ),
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? SizedBox(
                            height: AppDimensions.height10(context) * 3.877,
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 3.177,
                          ),
                    Container(
                      width: AppDimensions.height10(context) * 13.9,
                      height: AppDimensions.height10(context) * 13.9,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/black_hole.png'))),
                      child: Center(
                        child: Text(
                          'People',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.6,
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
                            height: AppDimensions.height10(context) * 8.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 2.0),
                                color: Colors.white),
                            child: Column(
                              //                  mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: AppDimensions.height10(context) * 8.0,
                                  height: AppDimensions.height10(context) * 2.0,
                                  margin: EdgeInsets.only(
                                      // left:   AppDimensions.height10(context)(context)* 2.0,
                                      right: AppDimensions.height10(context) *
                                          25.0,
                                      top: AppDimensions.height10(context) *
                                          1.3),
                                  child: Center(
                                    child: Text(
                                      'Enter Name',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 2.1,
                                    //  right:   AppDimensions.height10(context)(context)* 10.0,
                                    // top:   AppDimensions.height10(context)(context)* 0.6
                                  ),
                                  height: AppDimensions.height10(context) * 2.4,
                                  //width:   AppDimensions.height10(context)(context)* 30.5,
                                  child: Center(
                                    child: TextFormField(
                                      maxLength: 80,
                                      onTap: () {
                                        // setState(() {
                                        //   margin_state = false;
                                        // });
                                      },
                                      onChanged: (Value) {
                                        setState(() {
                                          button_state = true;
                                        });
                                      },
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          decorationThickness: 0,
                                          height:
                                              AppDimensions.height10(context) *
                                                  0.15,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffB353C9)),
                                      decoration: InputDecoration(
                                          counterText: "",
                                          counterStyle: TextStyle(
                                            height: double.minPositive,
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(
                                              fontSize: AppDimensions.height10(
                                                      context) *
                                                  2.4,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xff828282)),
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
                              left: AppDimensions.height10(context) * 3.1,
                              right: AppDimensions.height10(context) * 26.0,
                              top: AppDimensions.height10(context) * 1.0),
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
                                '80',
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
                            height: AppDimensions.height10(context) * 20.5,
                          )
                        : SizedBox(
                            height: AppDimensions.height10(context) * 3.0,
                          ),
                    Container(
                        height: AppDimensions.height10(context) * 5.0,
                        width: AppDimensions.height10(context) * 25.4,
                        margin: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom == 0
                                    ? AppDimensions.height10(context) * 2.6
                                    : AppDimensions.height10(context) * 1.0),
                        decoration: BoxDecoration(
                          gradient: button_state
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
                                    const Color(0xff282828).withOpacity(0.5),
                                    const Color(0xff282828).withOpacity(0.5),
                                  ],
                                ),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (button_state == true) {
                                Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const hurdle_statement()));
                              }
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: button_state
                                      ? Color(0xFFFFFFFF)
                                      : Color(0xFFFFFFFF).withOpacity(0.7),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins'),
                            ))),
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
