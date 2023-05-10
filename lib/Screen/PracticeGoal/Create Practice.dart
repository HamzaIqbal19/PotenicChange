



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/PracticeGoal/PracticeName.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/Widgets/bottom_sheet_Practice.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class CreatePractice extends StatefulWidget {
  const CreatePractice({Key? key}) : super(key: key);

  @override
  State<CreatePractice> createState() => _CreatePracticeState();
}

class _CreatePracticeState extends State<CreatePractice> {

  bool SearchIcon=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

          // SingleChildScrollView(
          //   child: ,
          // )
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: AppDimensions.height10 * 5.2),
                child: Center(
                  child: Text(
                    "Practice Creation 1/3",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.8,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: AppDimensions.height10 * 0.5),
                child: Center(
                  child: Text(
                    "Control my anger",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10,
              ),
             Container(
               height: AppDimensions.height10*11.2,
               width: AppDimensions.height10*10.4,
               margin: EdgeInsets.only(left:AppDimensions.height10*9.0,right:AppDimensions.height10*17.0),
               // color:Colors.blue,
               child: Image.asset(
                 'assets/images/createprac.png',
                 height: AppDimensions.height10*7.9,
                 width: AppDimensions.height10*7.9,
                 fit: BoxFit.contain,
               ),
             ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    // height: AppDimensions.height10*7.1,
                    child: Text(
                      "Choose your practice",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 2.8,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppDimensions.height10*3.0,
              ),
              // Container(
              //   // color: Colors.blue,
              //   height: AppDimensions.height10 * 50.795,
              //   padding: const EdgeInsets.only(top: 0, bottom: 0),
              //   child: ListView(
              //     shrinkWrap: true,
              //     children: [
              //
              //
              //     ],
              //   ),
              // ),
              Container(
                height: AppDimensions.height10 * 52.9,
                child:
                SingleChildScrollView(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Meditation","Meditation"),
                                ),
                              );
                            },
                            child:   circles(
                              circle_text: "Meditation",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Count temper episodes","Count temper \n episodes"),
                                ),
                              );
                            },
                            child:  circles(
                              circle_text: "Count temper \n episodes",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                        ],
                      ),
                      SizedBox(height: AppDimensions.height10*0.79,),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Take time to understand","Take time to \n understand"),
                                ),
                              );
                            },
                            child: circles(
                              circle_text: "Take time to \n understand",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Laugh it off","Laugh it off"),
                                ),
                              );
                            },
                            child: circles(
                              circle_text: "Laugh it off",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                        ],
                      ),
                      SizedBox(height: AppDimensions.height10*0.79,),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Count  down","Count \n down"),
                                ),
                              );
                            },
                            child:  circles(
                              circle_text: "Count \n down",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Practice gratitude","Practice \n gratitude"),
                                ),
                              );
                            },
                            child:  circles(
                              circle_text: "Practice \n gratitude",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),)
                        ],
                      ),
                      SizedBox(height: AppDimensions.height10*0.79,),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Walk away","Walk away"),
                                ),
                              );
                            },
                            child:  circles(
                              circle_text: "Walk away",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PracticeName("Get it out,express your feelings","Get it out, \n express your \n feelings"),
                                ),
                              );
                            },
                            child:circles(
                              circle_text: "Get it out, \n express your \n feelings",
                              circle_color1: 0xFF83BB9A,
                              circle_color2: 0xFF1E4A22,
                              circle_border: 3.0,
                              circle_bordercolor: 0xFFFFFFFF,
                              circle_height:
                              AppDimensions.height10 * 13.4,
                              circle_width:
                              AppDimensions.height10 * 13.4,
                              textfont: AppDimensions.height10 * 1.6,
                              textcolor: 0xFFFFFFFF),),
                        ],
                      ),
                    ],
                  ),
    )

              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          // color: Colors.blue,
          padding: EdgeInsets.only(
              left: AppDimensions.height10 * 2.2,
              right: AppDimensions.height10 * 2.2),
          height: AppDimensions.height10 * 7.0,
          width: AppDimensions.height10 * 41.4,
          child: SearchIcon == true
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: AppDimensions.height10 * 3.6,
                    width: AppDimensions.height10 * 31.3,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF767680).withOpacity(0.12),
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppDimensions.height10))),
                    child: Center(
                      child: TextFormField(


                          decoration:  InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              prefixIcon:  Image.asset(
                                'assets/images/Light.png',
                                width: AppDimensions.height10 * 1.5,
                                height: AppDimensions.height10 * 1.5,

                                // fit: BoxFit.contain,
                                // fit: BoxFit.contain,
                              ),

                              suffixIcon:  Image.asset(
                                'assets/images/cancel.png',
                                width: AppDimensions.height10 * 2.3,
                                height: AppDimensions.height10 * 2.3,
                                // fit: BoxFit.contain,
                              ),

                              hintText: "Search",
                              focusedBorder:const  OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent)))),
                    ),
                  ),
                ],
              ),


              GestureDetector(
                onTap: (){
                  setState(() {
                    SearchIcon=false;
                  });
                },
                child: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.7,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF007AFF),
                  ),
                ) ,
              ),

              //const Padding(padding: EdgeInsets.all(10))
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [

                  Container(
                    width: AppDimensions.height10 * 4.7,
                    height: AppDimensions.height10 * 4.7,
                    padding: EdgeInsets.only(top:AppDimensions.height10*0.5,bottom: AppDimensions.height10*0.5),
                    child:GestureDetector(
                      onTap: (){
                        bottom_sheet(context);
                      },
                    child: Image.asset(
                      'assets/images/Add.png',
                      width: AppDimensions.height10 * 4.7,
                      height: AppDimensions.height10 * 4.7,
                      fit: BoxFit.contain,
                    ),
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10 * 0.5,
                  ),
                  Text(
                    'Create a new practice! ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFA9934),
                      // fontFamily: ,
                      fontSize: AppDimensions.height10 * 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Container(
                width: AppDimensions.height10 * 4.7,
                height: AppDimensions.height10 * 4.7,
                padding: EdgeInsets.only(top:AppDimensions.height10*0.5,bottom: AppDimensions.height10*0.5),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      SearchIcon=true;
                    });
                  },
                  child: Image.asset(
                    'assets/images/Search.png',
                    width: AppDimensions.height10 * 5,
                    height: AppDimensions.height10 * 5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              //const Padding(padding: EdgeInsets.all(10))
            ],
          ),
        ),
      ),
    );
  }
}
