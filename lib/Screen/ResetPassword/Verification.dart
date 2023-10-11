import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/ResetPassword/reset.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';

class Verification extends StatefulWidget {
  final String email;
  const Verification({Key? key, required this.email}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  String combinedValue = '';
  bool Loading = false;
  final _keyForm = GlobalKey<FormState>();

  // final ForgotPasswordController verifyController =
  //     Get.put(ForgotPasswordController());
  late Timer _timer;
  int _seconds = 120; // 5 minutes in seconds
  bool _timerActive = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
          _timerActive = true;
        }
      });
    });
  }

  
  void resetControllers(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.text =
          ''; // Set the value to an empty string or any other initial value you want
    }
  }

  void resetTimer() {
    if (!_timer.isActive) {
      setState(() {
        _seconds = 120; // Reset timer to 5 minutes
        _timerActive = false;
      });
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(AppDimensions.height10(context) * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              // leading: Center(
              //   // alignment: Alignment.center,
              //   child: IconButton(
              //     icon: Image.asset(
              //       'assets/images/Back.webp',
              //       width: AppDimensions.height10(context) * 3,
              //       height: AppDimensions.height10(context) * 3,
              //       fit: BoxFit.contain,
              //     ),
              //     onPressed: () {
              //       Navigator.pop(context);
              //       // Add code for performing close action
              //     },
              //   ),
              // ),
              actions: [
                Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Close.webp',
                      width: AppDimensions.height10(context) * 3.0,
                      height: AppDimensions.height10(context) * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Add code for performing close action
                    },
                  ),
                ),
              ],
            )),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/loginscreenBackground.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: AppDimensions.height10(context) * 8.0,
                ),
                Center(
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/logo.webp"),
                    height: AppDimensions.height10(context) * 7.75,
                    width: AppDimensions.width10(context) * 7.75,
                  ),
                ),

                SizedBox(height: AppDimensions.height10(context) * 2.32),
                Container(
                  height: AppDimensions.height10(context) * 6.8,
                  width: AppDimensions.height10(context) * 32.0,
                  child: Text(
                    "Verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10(context) * 2.8,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10(context) * 2.2),
                // SizedBox(height: AppDimensions.height2),
                Container(
                    height: AppDimensions.height10(context) * 2.4,
                    width: AppDimensions.screenWidth(context) - 100,
                    child: Text(
                      'Enter OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 0.92),
                Container(
                    height: AppDimensions.height10(context) * 7 + 4,
                    width: AppDimensions.height10(context) * 31.6,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.4,
                                height: AppDimensions.height10(context) * 0.16,
                                fontFamily: 'laila'),
                            children: [
                              const TextSpan(
                                  text:
                                      "We've sent a 4 digit confirmation code to\n"),
                              TextSpan(
                                text: widget.email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(
                                  text: '. Make sure you enter correct code')
                            ]))),
                SizedBox(height: AppDimensions.height10(context) * 2.2),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: AppDimensions.height10(context) * 8),
                        child: Row(
                          children: List.generate(4, (index) {
                            return Expanded(
                              child: Container(
                                height: AppDimensions.height10(context) * 10,
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        AppDimensions.height10(context) * 0.8),
                                child: SizedBox(
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 2.4,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFBFBFB),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1 && index < 3) {
                                        FocusScope.of(context).nextFocus();
                                      } else if (value.isEmpty && index > 0) {
                                        controllers[index].text = '';

                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return null;
                                      }
                                    },
                                    controller: controllers[index],
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      counterText: ' ',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFBFBFB)),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFFBFBFB)),
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      _timerActive == true
                          ? const Center(
                              child: Text(
                                "The password reset OTP has expired.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFFFE6624),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You can request a new OTP after ",
                            style: TextStyle(
                                color: Color(0xFFFBFBFB),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${_seconds ~/ 60}:${_seconds % 60 < 10 ? '0' : ''}${_seconds % 60}",
                            style: const TextStyle(
                                color: Color(0xFFFE6624),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                     
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),

                AnimatedScaleButton(
                  onTap: () {
                    combinedValue =
                        controllers.map((controller) => controller.text).join();
                    print(combinedValue);

                    if (_timerActive == false) {
                      setState(() {
                        Loading = true;
                      });

                      print(combinedValue);
                      if (combinedValue != '') {
                        Authentication()
                            .verifyOtp(int.parse(combinedValue))
                            .then((response) {
                          if (response == true) {
                            setState(() {
                              Loading = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              FadePageRoute(
                                page: const reset(),
                              ),
                            );
                            resetControllers(controllers);
                            FocusScope.of(context).unfocus();
                          } else if (response == 400) {
                            setState(() {
                              Loading = false;
                            });
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "OTP can't be empty.",
                              style: TextStyle(color: Colors.red),
                            )));
                          } else {
                            setState(() {
                              Loading = false;
                            });
                            resetControllers(controllers);
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              "Invalid OTP.",
                              style: TextStyle(color: Colors.red),
                            )));
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          "Empty OTP.",
                          style: TextStyle(color: Colors.red),
                        )));
                      }
                    } else {
                      setState(() {
                        Loading = true;
                      });
                      Authentication()
                          .passReset(
                        widget.email,
                      )
                          .then((response) {
                        if (response == true) {
                          resetTimer();
                          resetControllers(controllers);
                          FocusScope.of(context).unfocus();
                          setState(() {
                            _timerActive = false;
                            Loading = false;
                          });
                        } else {}
                      }).catchError((error) {
                        print("error");
                      }).whenComplete(() => null);
                    }
                  },
                  child: Container(
                    height: AppDimensions.height10(context) * 4.4,
                    width: AppDimensions.height10(context) * 26.7,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                    ),
                    // padding: EdgeInsets.only(left:AppDimensions.height10(context) *0.8,top:AppDimensions.height10(context) *1.6,right: AppDimensions.height10(context) *0.8),

                    child: Center(
                        child: Loading == false
                            ? Text(
                                _timerActive == true ? 'Resend OTP' : 'Verify',
                                style: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : const SpinKitThreeBounce(
                                color: Color(0xFF8C648A),
                                size: 30,
                              )),
                  ),
                ),

                // SizedBox(height: AppDimensions.height120+90),
              ],
              // child:  Text("Hello background"),
            ),
          ],
        ));
  }
}
