
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/SignupBottomSheet.dart';

import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isPasswordNotVisible = true;
  var errorMsg, jsonResponse;
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
    return WillPopScope(
        onWillPop: () async => false,
        // =>
        // SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/HomeScreenBackground.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: AppDimensions.height10 * 7.0,
                ),
                Center(
                  child: Image(
                    // color: Colors.orange,
                    image: const AssetImage("assets/images/homelogo.png"),
                    height: AppDimensions.height10 * 10.0,
                    width: AppDimensions.width10 * 10.0,
                  ),
                ),
                SizedBox(height: AppDimensions.height10*2.32),
                Container(
                  height: AppDimensions.height10 * 8.5,
                  child: Text(
                    "Your Destiny is at \n Your Fingertips",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 3.0,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10*0.5),
                Container(
                    height: AppDimensions.height10*11.5,
                    child: Text(
                      'Time waits for no one. The best time to \n start is TODAY. Begin creating your \n star followed by a plan to help you \n achieve your goal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.8,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10*4.4),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartProcess(),
                        ),
                      );
                    },
                    child: Image(
                      // color: Colors.orange,
                      image: const AssetImage("assets/images/createstar.png"),
                      height: AppDimensions.height10 * 23,
                      width: AppDimensions.width10 * 26,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10*12.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: AppDimensions.height10 * 5,
                        width: AppDimensions.height10 * 13,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.white),
                          borderRadius:
                               BorderRadius.all(Radius.circular(AppDimensions.height10*5.0)),
                        ),
                        child: Center(
                          child: Text(
                            "I’m new here",
                            style: TextStyle(
                              color: const Color(0xFF8C648A),
                              fontSize: AppDimensions.font16 - 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: AppDimensions.height10 * 5,
                        width: AppDimensions.height10 * 13,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5A4D73),
                          border: Border.all(color: const Color(0xFF5A4D73)),
                          borderRadius:
                               BorderRadius.all(Radius.circular(AppDimensions.height10*5.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.font16 - 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        signupSheet(context,"Introduction","OnBoarding");
                      },
                      child: Container(
                        height: AppDimensions.height10 * 5,
                        width: AppDimensions.height10 * 5,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.transparent),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0)),
                        ),
                        child: Center(
                          child: Image(
                            // color: Colors.orange,
                            image: const AssetImage(
                                "assets/images/Moreactions.png"),
                            height: AppDimensions.height10 * 5,
                            width: AppDimensions.width10 * 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
              // child:  Text("Hello background"),
            )
          ],
        )
            //   child:Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //
            //     // children: [
            //     //
            //     //
            //     //
            //     //
            //     // ],
            //   )

            ));
  }
}