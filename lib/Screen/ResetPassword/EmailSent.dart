


import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class EmailSent extends StatefulWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppDimensions.height10 * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              // leading: Center(
              //   // alignment: Alignment.center,
              //   child: IconButton(
              //     icon: Image.asset(
              //       'assets/images/Back.png',
              //       width: AppDimensions.height10 * 3,
              //       height: AppDimensions.height10 * 3,
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
                      'assets/images/Close.png',
                      width: AppDimensions.height10 * 3.0,
                      height: AppDimensions.height10 * 3.0,
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
        body:  Stack(
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
                SizedBox(height:AppDimensions.height10 * 8.0,),
                Center(
                  child: Image(
                    // color: Colors.orange,
                    image:  const AssetImage("assets/images/logo.png"),
                    height: AppDimensions.height10 * 7.75,
                    width: AppDimensions.width10 * 7.75,
                  ),
                ),

                SizedBox(height: AppDimensions.height10*2.32),
                Container(
                  height: AppDimensions.height10*6.8,
                  width: AppDimensions.height10*32.0,
                  child: Text(
                    "Password reset email sent",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 *2.8,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10*2.2),
                // SizedBox(height: AppDimensions.height2),
                Container(
                    height:AppDimensions.height10*2.4,
                    width: AppDimensions.screenWidth-100,
                    child:Text(
                      'The email is on its way. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10*2,
                      ),
                    )
                ),
                SizedBox(height: AppDimensions.height10*0.92),
                Container(
                    height:AppDimensions.height10*7+4,
                    width: AppDimensions.height10*31.6,
                    child:Text(
                      'Please check your inbox including Promotions & Spam folders to reset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: AppDimensions.height10*1.4,
                      ),
                    )
                ),
                SizedBox(height: AppDimensions.height10*4.2),
                Container(
                  height: AppDimensions.height10 * 4.4,
                  width: AppDimensions.height10*26.7,
                  // padding: EdgeInsets.only(left:AppDimensions.height10*0.8,top:AppDimensions.height10*1.6,right: AppDimensions.height10*0.8),


                  child:OutlinedButton.icon( // <-- OutlinedButton
                    style: OutlinedButton.styleFrom(
                      backgroundColor:const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimensions.height10*5.0),
                      ),
                      //<-- SEE HERE
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(login:false),
                        ),
                      );
                    },
                    icon: Image.asset("assets/images/fb.png", width: 0.0,height: 0.0,),
                    label: Center(
                        child:Text('Go to Home page',style: TextStyle(
                          color:  const Color(0xFF8C648A),
                          fontSize:  AppDimensions.height10 *1.6,
                          fontWeight: FontWeight.w600,
                        ),)),
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
