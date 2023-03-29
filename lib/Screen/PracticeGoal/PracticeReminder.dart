




import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potenic_app/Screen/PracticeGoal/Created%20Practice.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PracticeReminder extends StatefulWidget {
  const PracticeReminder({Key? key}) : super(key: key);

  @override
  State<PracticeReminder> createState() => _PracticeReminderState();
}

class _PracticeReminderState extends State<PracticeReminder> {



  bool radio1=false;
  bool radio2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
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
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeScreen(),
                  //   ),
                  // );
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
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeScreen(),
                    //   ),
                    // );
                    // Add code for performing close action
                  },
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: AppDimensions.height10 * 5.3),
                  child: Center(
                    child: Text(
                      "Practice Creation 3/3",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.5,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Control my anger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 1.7,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: AppDimensions.height10 * 7.9,
                        height: AppDimensions.height10 * 7.9,

                        child: Image.asset(
                          "assets/images/createprac.png",
                          fit: BoxFit.contain,
                        )),
                    Container(
                      child: Center(
                        child: Text(
                          "Meditation ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF156F6D),
                            fontSize: AppDimensions.height10 * 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],

                ),

                SizedBox(
                  height: AppDimensions.height10 * 2.3,
                ),
                Container(
                  height: AppDimensions.height10*3.4,
                  width: AppDimensions.height10*22.3,
                  child: Center(
                    child: Text(
                      "Your Reminders",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 -2,
                ),
                Container(
                  height: AppDimensions.height10*8.6,
                  width: AppDimensions.height10*37.2,
                  child: Center(
                    child: Text(
                      "In order to build consistent behaviour, allow us to gently nudge you to remind you to do your practice.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 3.4,
                ),
                Container(
                  height: AppDimensions.height10 * 17.0,
                  width: AppDimensions.height10*38.2,
                  // padding:  EdgeInsets.only(top: AppDimensions.height10*2, bottom: AppDimensions.height10*4.8, left: AppDimensions.height10*2.0,right: AppDimensions.height10*3.5),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE8776D),Color(0xFFEF939D), Color(0xFFD6C4C6)]),
                      border: Border.all(color: Colors.white, width: 0),
                      borderRadius:  BorderRadius.all(Radius.circular(AppDimensions.height10*2.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: AppDimensions.height10*2.4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            // color: Colors.blue,
                            width: AppDimensions.height10*25.9,
                            height: AppDimensions.height10*3.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                            width: AppDimensions.height10*3.5,
                            height: AppDimensions.height10*3.5,
                            child: Image.asset(
                            "assets/images/notifications.png",
                              fit: BoxFit.contain,
                            )),



                                Container(
                                    width: AppDimensions.height10*20.4,
                                    height: AppDimensions.height10*2.4,
                                    child: Text("Yes, remind me",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF),
                                        fontSize: AppDimensions.height10 * 2.0,
                                      ),
                                    ),

                                ),
                              ],
                            ),


                          ),
                          GestureDetector(
                            onTap: (){


                            if(radio1==true){
                              setState(() {
                                radio1=false;
                              });
                            }
                            else if(radio1==false){

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Container(
                                  width: AppDimensions.height10*27.0,
                                  height: AppDimensions.height10*21.0,
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    actionsPadding: EdgeInsets.zero,
                                    titlePadding: EdgeInsets.zero,
                                    title: Container(
                                      margin: EdgeInsets.only(top: 19, right: 16, left: 16, bottom: 2),
                                      height: AppDimensions.height10*4.4,
                                      width: AppDimensions.height10*23.8,
                                      child: const Text(
                                        "Notification permission is needed",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    content: Container(
                                      margin: EdgeInsets.only(bottom: 19, left: 16, right: 16),
                                      height: 32,
                                      width: 238,
                                      child: const Text(
                                        "Please enable it in iPhone’s setting",
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

                                          Container(
                                            height: 42,
                                            width: double.infinity,
                                            color: Color(0xFF007AFF),
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  radio1=true;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Enable Notification',
                                                style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontSize: 17,
                                                    fontFamily: "Laila",
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            height: 44,
                                            width: double.infinity,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);

                                              },
                                              child:  const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: "Laila",
                                                    fontWeight: FontWeight.w400,
                                                    color:  Color(0xFF007AFF)
                                                ),
                                              ),
                                            ),
                                          ),




                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            }


    },




                            child: Container(
                            // color: Colors.red,
                            width: AppDimensions.height10*3.3,
                            height: AppDimensions.height10*3.3,

                              child:radio1==true?Image.asset("assets/images/uncheckradio.png"):Image.asset("assets/images/circle.png")

                          ),
                          ),

                        ],
                      ),
                      SizedBox(height: AppDimensions.height10*3.0,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: AppDimensions.height10*5.1,
                            width: AppDimensions.height10*34.5,
                            padding: EdgeInsets.only(right: AppDimensions.height10*1.7,left: AppDimensions.height10*2.0),
                            child: Text("We will check in with you to remind you about your practices. You would be able to customise your notifications later in your Account Settings. ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10 * 1.3,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                ),
                SizedBox(
                  height: AppDimensions.height10 * 2.0,
                ),
                Container(
                  height: AppDimensions.height10 * 17.0,
                  width: AppDimensions.height10*38.2,
                  // padding:  EdgeInsets.only(top: AppDimensions.height10*2, bottom: AppDimensions.height10*4.8, left: AppDimensions.height10*2.0,right: AppDimensions.height10*3.5),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE8776D),Color(0xFFEF939D), Color(0xFFD6C4C6)]),
                      border: Border.all(color: Colors.white, width: 0),
                      borderRadius:  BorderRadius.all(Radius.circular(AppDimensions.height10*2.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: AppDimensions.height10*2.4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            // color: Colors.blue,
                            width: AppDimensions.height10*25.9,
                            height: AppDimensions.height10*3.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width: AppDimensions.height10*3.5,
                                    height: AppDimensions.height10*3.5,
                                    child: Image.asset(
                                      "assets/images/notificationsoff.png",
                                      fit: BoxFit.contain,
                                    )),



                                Container(
                                  width: AppDimensions.height10*20.4,
                                  height: AppDimensions.height10*2.4,
                                  child: Text("No, don’t remind me",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: AppDimensions.height10 * 2.0,
                                    ),
                                  ),

                                ),
                              ],
                            ),


                          ),
                          GestureDetector(
                            onTap: (){
                              if(radio2==false){
                                setState(() {
                                  radio2=true;
                                });
                              }
                              else{
                                setState(() {
                                  radio2=false;
                                });
                              }

                           },
                          child:Container(

                            width: AppDimensions.height10*3.3,
                            height: AppDimensions.height10*3.3,
                            child:radio2==true?Image.asset("assets/images/uncheckradio.png"):Image.asset("assets/images/circle.png")
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: AppDimensions.height10*3.0,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: AppDimensions.height10*5.1,
                            width: AppDimensions.height10*34.5,
                            padding: EdgeInsets.only(right: AppDimensions.height10*1.7,left: AppDimensions.height10*2.0),
                            child: Text("You confirm that you don’t want us to send you reminders and notifications to perform your practices. You can always enable and update your notification preferences later in Account Settings. ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF),
                                fontSize: AppDimensions.height10 * 1.3,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                ),


                SizedBox(
                  height: AppDimensions.height10 * 7.0,
                ),





                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // color: Colors.blue,
                        width: AppDimensions.height10 * 5.0,
                        height: AppDimensions.height10 * 5.0,

                        child: Image.asset(
                          "assets/images/Moreactions.png",
                          fit: BoxFit.contain,
                        )),

                    GestureDetector(

                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PracticeFinished(),
                          ),
                        );
                      },

                      child:   Container(
                        height: AppDimensions.height10*5,
                        width: AppDimensions.height10*31.3,
                        decoration:  BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child:  Center(
                          child:  Text(
                            "Finished",
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: AppDimensions.height10 * 2.5,
                ),

                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )

        ],
      ),


    );
  }
}
