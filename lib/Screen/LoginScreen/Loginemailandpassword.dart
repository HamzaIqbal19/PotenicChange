import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/StartProcess.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/ResetPassword/PasswordReset.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginemailandpassword extends StatefulWidget {
  @override
  _LoginemailandpasswordState createState() => _LoginemailandpasswordState();
}

class _LoginemailandpasswordState extends State<Loginemailandpassword> {
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
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
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
                  height: AppDimensions.height10 * 8.2,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: const AssetImage("assets/images/logo.png"),
                      height: AppDimensions.height10 * 7.75,
                      width: AppDimensions.width10 * 7.75,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.height10 * 2.35),
                Container(
                  height: AppDimensions.height10 * 3.9,
                  child: Text(
                    "Log in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.font26 + 2.9384698,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10 * 4.2),

                // SizedBox(height: AppDimensions.height0),
                Container(
                  height: AppDimensions.height10 * 26 + 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppDimensions.height10 * 1.7,
                        padding:
                            EdgeInsets.only(left: AppDimensions.height10 * 1.2),
                        child: Text(
                          "Your sign in details are incorrect, please try again",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.height10),
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
                        height: AppDimensions.height10 * 1.7,
                        width: AppDimensions.height10 * 23.3,
                        padding:
                            EdgeInsets.only(left: AppDimensions.height10 * 1.2),
                        child: Text(
                          "Ooops! Needs to be an email format",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.height10),
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
                        padding:
                            EdgeInsets.only(left: AppDimensions.height10 * 1.2),
                        child: Text(
                          "Minimum 8 characters",
                          style: TextStyle(
                            color: const Color(0xFFFE6624),
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimensions.height10 + 1),
                      Container(
                          height: AppDimensions.height10 * 2.2,
                          width: AppDimensions.height10 * 26.1,
                          padding: EdgeInsets.only(
                              left: AppDimensions.height10 * 1.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PasswordReset(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: AppDimensions.font16 - 2,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))

                      //)
                    ],
                  ),
                ),

                SizedBox(height: AppDimensions.height10 * 5.0),

                Container(
                  height: AppDimensions.height10*5,
                  width: AppDimensions.height10*25.4,
                  decoration:const BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(40.0)),

                      gradient:  LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)])),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartProcess(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                    child: Text('Login',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8C648A),
                        fontSize: AppDimensions.height10*1.8,

                      ),

                    ),
                  ),
                ),
                // SizedBox(height: AppDimensions.height120+90),
              ],
              // child:  Text("Hello background"),
            ),
          ],
        ));
    // );
  }
}
