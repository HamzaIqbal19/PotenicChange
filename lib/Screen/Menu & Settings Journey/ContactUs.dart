import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Goal%20Creation%20Journey/StartProcess.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/ResetPassword/PasswordReset.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Widgets/fading.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // controllers
  final subjectController = TextEditingController();
  final descriptController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  bool descriptError  = false;
  bool subjectError = false;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  late bool checkBool;
  booleanValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bool', value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subjectController.dispose();
    descriptController.dispose();
    super.dispose();
  }

  loginFunction() {

  }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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

                actions: [
                  Buttons().closeButton(context, () {
                   Navigator.pop(context);
                  }),
                ],
              )),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/loginscreenBackground.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: AppDimensions.height10(context) * 8.2,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Image(
                          image: const AssetImage("assets/images/logo.webp"),
                          height: AppDimensions.height10(context) * 7.75,
                          width: AppDimensions.width10(context) * 7.75,
                        ),
                      ),
                    ),

                    SizedBox(height: AppDimensions.height10(context) * 2.35),
                    SizedBox(
                      child: Text(
                        AppText().contactUsHeading,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 3.0,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10(context) * 1.5),
                    SizedBox(
                      width: UpdatedDimensions.width10(context)*34,
                      child: Text(
                        AppText().contactUsBody,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: AppDimensions.font10(context) * 2.0,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10(context) * 4.2),

                    // SizedBox(height: AppDimensions.height0),
                    SizedBox(
                      width: AppDimensions.width10(context) * 36,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              // height: AppDimensions.height10(context) * 10,
                              width: AppDimensions.width10(context) * 36.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context) *
                                              1.8))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) *
                                            2.0,
                                        bottom:
                                        AppDimensions.height10(context) *
                                            0.5),

                                    child: Text(
                                      "Subject",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF282828),
                                          fontSize:
                                          AppDimensions.font10(context) *
                                              1.4),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          2.0,
                                    ),
                                    width:
                                    AppDimensions.width10(context) * 36.0,

                                    child: TextFormField(
                                      maxLength: 20,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: const Color(0xFF8C648A),
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.none,
                                            fontSize: AppDimensions.font10(
                                                context) *
                                                1.8),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            hintText: "What your enquiry is about?",
                                            hintStyle: TextStyle(
                                              color: const Color(0xFF8C648A),
                                              fontWeight: FontWeight.w600,
                                              fontSize: AppDimensions.font10(
                                                  context) *
                                                  1.8,
                                            ),
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
                                        onChanged: (value) {

                                        },
                                        controller: subjectController,
                                      validator: (val) {
                                        if ((val == null && val == '')) {
                                          setState(() {
                                            descriptError = false;
                                            subjectError = false;
                                          });
                                        }
                                        return null;
                                      },
                                      ),
                                  )
                                ],
                              )),
                          SizedBox(
                              height: AppDimensions.height10(context) * 3),
                          Container(
                            height: AppDimensions.height10(context) * 18.5,
                            width: AppDimensions.width10(context) * 36.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        AppDimensions.height10(context) *
                                            1.8))),
                            child: SizedBox(
                              width:
                              AppDimensions.width10(context) * 32.0,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(
                                            context) *
                                            2.0,
                                        bottom: AppDimensions.height10(
                                            context) *
                                            0.5),

                                    height:
                                    AppDimensions.height10(context) *
                                        1.7,
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF282828),
                                          fontSize: AppDimensions.font10(
                                              context) *
                                              1.4),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: AppDimensions.height10(
                                          context) *
                                          2.0,
                                    ),
                                    width:
                                    AppDimensions.width10(context) *
                                        36.0,
                                    child: TextFormField(
                                      maxLength: 150,
                                      maxLines: 5,
                                      style: TextStyle(
                                          color: const Color(0xFF8C648A),
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                          fontSize: AppDimensions.font10(
                                              context) *
                                              1.8),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          hintText: "Please tell us how we can help you",
                                          hintStyle: TextStyle(
                                            color:
                                            const Color(0xFF8C648A),
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            AppDimensions.font10(
                                                context) *
                                                1.8,
                                          ),
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
                                      onChanged: (value) {

                                      },
                                      controller: descriptController,
                                      validator: (val) {
                                        if ((val == null && val == '')) {
                                          setState(() {
                                            descriptError = false;
                                            subjectError = false;
                                          });
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        loginFunction();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                              height: AppDimensions.height10(context) * 3),


                          //)
                        ],
                      ),
                    ),

                    SizedBox(height: AppDimensions.height10(context) * 7.0),

                    AnimatedScaleButton(
                      onTap: () async {
                        if (subjectController.text !='' && descriptController.text !='' ) {
                          setState(() {
                            loading = true;
                          });
                          Authentication().contactUsRequest(subjectController.text.trim(), descriptController.text.trim()).then((value){
                            if(value == true){
                              setState(() {
                                loading = false;
                              });
                            }
                          });
                        } else {
                          if(subjectController.text == ''){
                            setState(() {
                              subjectError = true;
                              loading = false;
                            });
                          }
                          if(descriptController.text == ''){
                            setState(() {
                              descriptError = true;
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5.0,
                        width: AppDimensions.width10(context) * 26.7,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(
                              AppDimensions.height10(context) * 5.0)),
                        ),
                        child: loading
                            ? SpinKitThreeBounce(
                          color: const Color(0xFF8C648A),
                          // delay: Duration(milliseconds: 0),
                          size: AppDimensions.height10(context) * 3.5,
                        )
                            : Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                              color: const Color(0xFF8C648A),
                              fontSize:
                              AppDimensions.font10(context) * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SizedBox(height: AppDimensions.height120+90),
                  ],
                  // child:  Text("Hello background"),
                ),
              ),
            ],
          )),
    );
    // );
  }
}
