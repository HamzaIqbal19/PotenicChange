import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/ResetPassword/Verification.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';

class EmailSent extends StatefulWidget {
  final String email;
  const EmailSent({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
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
                    "Password reset email\nsent",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      height: AppDimensions.height10(context) * 0.15,
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
                      'The email is on its way. ',
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
                    child: Text(
                      'Please check your inbox including Promotions & Spam folders to reset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.4,
                      ),
                    )),
                SizedBox(height: AppDimensions.height10(context) * 4.2),
                AnimatedScaleButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      FadePageRoute(
                        page: Verification(
                          email: widget.email,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: AppDimensions.height10(context) * 4.4,
                    width: AppDimensions.height10(context) * 26.7,
                    // padding: EdgeInsets.only(left:AppDimensions.height10(context) *0.8,top:AppDimensions.height10(context) *1.6,right: AppDimensions.height10(context) *0.8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                    ),
                    child: Center(
                        child: Text(
                      'Go to Verification page',
                      style: TextStyle(
                        color: const Color(0xFF8C648A),
                        fontSize: AppDimensions.height10(context) * 1.6,
                        fontWeight: FontWeight.w600,
                      ),
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
