import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpSuccessful.dart';
import 'package:potenic_app/utils/app_colors.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpWithEmail extends StatefulWidget {
  @override
  _SignUpWithEmailState createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  var errorMsg, jsonResponse;
  bool rememberMe = true;
  bool boolean = true;
  var token;
  var accountFlag;
  var sessionRoute;

  late SharedPreferences _prefs;
  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
    print("SetEmail: $email");
  }

  @override
  void initState() {
    super.initState();
  }

  // final contractAddress = "0xaBE2ec3a68A15a382BcDC93499Ab751D3d954BB2";

  bool isLoadWallet = true;
  bool isLoadLogin = true;
  late bool checkBool;
  booleanValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bool', value);
  }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //     onWillPop: () async => false,
    // =>
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppDimensions.height10 * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Back.png',
                    width: AppDimensions.height10 * 3,
                    height: AppDimensions.height10 * 3,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Add code for performing close action
                  },
                ),
              ),
              actions: [
                Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Close.png',
                      width: AppDimensions.height10 * 3.0,
                      height: AppDimensions.height10 * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
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
                  image: AssetImage("assets/images/loginscreenBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: AppDimensions.height10 * 8.02,
                ),
                Center(
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/logo.png"),
                    height: AppDimensions.height10 * 7.75,
                    width: AppDimensions.width10 * 7.75,
                  ),
                ),

                SizedBox(height: AppDimensions.height10),
                Container(
                  height: AppDimensions.height30 + 10,
                  child: Text(
                    "Sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.font26 + 2.9384698,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height20),
                Container(
                    height: AppDimensions.height10 * 7 + 4,
                    width: AppDimensions.screenWidth - 100,
                    child: Text(
                      'Your Personalised Journey To Better Self Starts Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.font16 + 3.05,
                      ),
                    )),
                // SizedBox(height: AppDimensions.height0),
                Container(
                  height: AppDimensions.height10 * 35 + 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: AppDimensions.height10 * 6,
                          width: AppDimensions.height10 * 36.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10 * 1.8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 2.0,
                                    bottom: AppDimensions.height10 * 0.5),
                                width: AppDimensions.height10 * 3.7,
                                height: AppDimensions.height10 * 1.7,
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF282828),
                                      fontSize: AppDimensions.height10 * 1.4),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 2.0,
                                ),
                                width: AppDimensions.height10 * 36.0,
                                height: AppDimensions.height10 * 2.2,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        hintText: "John Smith",
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF8C648A),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                          AppDimensions.height10 * 1.8,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)))),
                              )
                            ],
                          )),
                      Container(
                        child: Text(
                          "Full name is required",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.font16 - 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Container(
                          height: AppDimensions.height10 * 6,
                          width: AppDimensions.height10 * 36.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  AppDimensions.height10 * 1.8))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10 * 2.0,
                                    bottom: AppDimensions.height10 * 0.5),
                                width: AppDimensions.height10 * 3.7,
                                height: AppDimensions.height10 * 1.7,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF282828),
                                      fontSize: AppDimensions.height10 * 1.4),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 2.0,
                                ),
                                width: AppDimensions.height10 * 36.0,
                                height: AppDimensions.height10 * 2.2,
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        hintText: "JohnSmith@yahoo.com",
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF8C648A),
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                          AppDimensions.height10 * 1.8,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)))),
                              )
                            ],
                          )),
                      Container(
                        child: Text(
                          "Ooops! Needs to be an email format",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.font16 - 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10 * 6,
                        width: AppDimensions.height10 * 36.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppDimensions.height10 * 1.8))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10 * 2.0,
                                  bottom: AppDimensions.height10 * 0.5),
                              width: AppDimensions.height10 * 6.3,
                              height: AppDimensions.height10 * 1.7,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF282828),
                                    fontSize: AppDimensions.height10 * 1.4),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 2.0,
                              ),
                              width: AppDimensions.height10 * 36.0,
                              height: AppDimensions.height10 * 2.2,
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      hintText: "*******",
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF8C648A),
                                        fontWeight: FontWeight.w600,
                                        fontSize: AppDimensions.height10 * 1.8,
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)))),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          "Minimum 8 characters",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.font16 - 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Container(
                          height: AppDimensions.height10 * 6.2,
                          width: AppDimensions.screenWidth - 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                side: BorderSide(color: Color(0xffffffff)),


                                value: rememberMe,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                },
                              ),
                              Container(

                                child:  Text.rich(
                                  TextSpan(
                                    text: 'By signing up, you agree to Potenic’s \n ',
                                    style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: AppDimensions.height10 *1.4,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    children: <TextSpan>[
                                       TextSpan(
                                          text: 'User Agreement',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: AppDimensions.height10 *1.4,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      // can add more TextSpans here...


                                     TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: AppDimensions.height10 *1.4,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    // can add more TextSpans here...

                                     TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: AppDimensions.height10 *1.4,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    // can add more TextSpans here...
                                  ],
                                  ),


                                )


                                // Text(
                                //   "By signing up, you agree to Potenic’s \n User Agreement and Privacy Policy.",
                                //   style: TextStyle(
                                //     color: const Color(0xFFFFFFFF),
                                //     fontSize: AppDimensions.font16 - 4,
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                              ),
                            ],
                          ))

                      //)
                    ],
                  ),
                ),

                SizedBox(height: AppDimensions.height45),

                SizedBox(
                  height: AppDimensions.height10 * 5,
                  width: AppDimensions.screenWidth - 100,
                  child: OutlinedButton.icon(
                    // <-- OutlinedButton
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      //<-- SEE HERE
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSuccessful(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "assets/images/fb.png",
                      width: 0.0,
                      height: 0.0,
                    ),
                    label: Center(
                        child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: const Color(0xFF8C648A),
                        fontSize: AppDimensions.height10 *1.8,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                  ),
                ),
                // SizedBox(height: AppDimensions.height120+90),
              ],
              // child:  Text("Hello background"),
            ),
          ],
        )


        );
  }
}
