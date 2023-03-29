
import 'package:flutter/material.dart';
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
  bool rememberMe=true;
  bool boolean = true;
  var token;
  var accountFlag;
  var sessionRoute;


  late SharedPreferences _prefs;
  setEmail(email)async{
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
       return  Scaffold(
            resizeToAvoidBottomInset: false,
            body:

            Stack(

              children: <Widget>[
                Container(

                  decoration: const BoxDecoration(
                    image:  DecorationImage(image:  AssetImage("assets/images/loginscreenBackground.png"), fit: BoxFit.cover,),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    SizedBox(height:AppDimensions.height10 * 5,),
                    Center(
                      child: Image(
                        // color: Colors.orange,
                        image:  const AssetImage("assets/images/logo.png"),
                        height: AppDimensions.height10 * 13,
                        width: AppDimensions.width10 * 16,
                      ),
                    ),

                    SizedBox(height: AppDimensions.height10),
                    Container(
                      height: AppDimensions.height30+10,

                      child: Text(
                        "Welcome to Potenic",
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
                        height:AppDimensions.height10*7+4,
                        width: AppDimensions.screenWidth-100,
                        child:Text(
                          'Your Personalised Journey To Better Self Starts Here',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: AppDimensions.font16+3.05,
                          ),
                        )
                    ),
                    // SizedBox(height: AppDimensions.height0),
                    Container(

                      height: AppDimensions.height10*35+6,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                          height: AppDimensions.height10 * 6,
                          width: AppDimensions.screenWidth-100,
                            padding: EdgeInsetsDirectional.only(
                              top:AppDimensions.height10+2 ,

                            ),
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white, width: 2), borderRadius: const BorderRadius.all(Radius.circular(15))),
                        child: TextFormField(decoration: const InputDecoration(contentPadding:  EdgeInsets.only(
                            top: 5.0, bottom: 15.0, left: 10.0, right: 10.0),floatingLabelBehavior: FloatingLabelBehavior.always,hintText:"John",labelText: "Name",focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)))),
                        ),
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
                            width: AppDimensions.screenWidth-100,
                            padding: EdgeInsetsDirectional.only(
                              top:AppDimensions.height10+2 ,

                            ),
                            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white, width: 2), borderRadius: const BorderRadius.all(Radius.circular(15))),
                            child: TextFormField(decoration: const InputDecoration(contentPadding:  EdgeInsets.only(
                                top: 5.0, bottom: 15.0, left: 10.0, right: 10.0),floatingLabelBehavior: FloatingLabelBehavior.always,hintText:"abc@gmail.com",labelText: "Email",focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)))),
                          ),
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
                            width: AppDimensions.screenWidth-100,
                            padding: EdgeInsetsDirectional.only(
                              top:AppDimensions.height10+2 ,

                            ),
                            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white, width:0), borderRadius: const BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                                obscureText:true,
                                textAlign: TextAlign.justify,
                                decoration: const InputDecoration(
                                    contentPadding:  EdgeInsets.only(
                                        top: 5.0, bottom: 15.0, left: 10.0, right: 10.0),
                                    alignLabelWithHint: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.always,hintText:"********",labelText: "Password",
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)))),

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
                          width: AppDimensions.screenWidth-100,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(

                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            value: rememberMe,
                            onChanged: (bool ? value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          Container(
                            child: Text(
                              "By signing up, you agree to Potenic’s \n User Agreement and Privacy Policy.",
                              style: TextStyle(
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.font16 - 4,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )
                      )

    //)


                        ],
                      ),
                    ),

                    SizedBox(height: AppDimensions.height45),

                    SizedBox(
                      height: AppDimensions.height10 * 5,
                      width: AppDimensions.screenWidth-100,

                      child:OutlinedButton.icon( // <-- OutlinedButton
                        style: OutlinedButton.styleFrom(
                          backgroundColor:const Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          //<-- SEE HERE
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpSuccessful()
                              ,
                            ),
                          );
                        },
                        icon: Image.asset("assets/images/fb.png", width: 0.0,height: 0.0,),
                        label: Center(
                            child:Text('Sign up',style: TextStyle(
                              color:  Colors.black45,
                              fontSize:  AppDimensions.font16 - 2,
                              fontWeight: FontWeight.w700,
                            ),)),
                      ),
                    ),
                    // SizedBox(height: AppDimensions.height120+90),

                  ],
                  // child:  Text("Hello background"),

                ),

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


        );
    // );

  }




}
