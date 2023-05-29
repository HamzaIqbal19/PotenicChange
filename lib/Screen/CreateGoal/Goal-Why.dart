
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal_Identity.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class GoalWhy extends StatefulWidget {
  String goalName;
  String category;

  GoalWhy({required this.goalName, required this.category});

  @override
  State<GoalWhy> createState() => _GoalWhyState(goalName: goalName,category: category);
}

class _GoalWhyState extends State<GoalWhy> {

  TextEditingController reasonWhy = TextEditingController();
  String goalName;
  String category;

  _GoalWhyState({required this.goalName, required this.category});
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
                  Navigator.pop(context);
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
                  padding: EdgeInsets.only(top: AppDimensions.height10 * 5.2),
                  child: Center(
                    child: Text(
                      "Star Creation 3/5",
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
                  height: AppDimensions.height10 * 1.9,
                ),
                Container(

                    width: AppDimensions.height10 * 10.4,
                    height: AppDimensions.height10 * 7.6,
                    padding: EdgeInsets.only(

                        left: AppDimensions.height10 * 1.5,
                        right: AppDimensions.height10 * 1.5),
                    child: Image.asset(
                      "assets/images/image3.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10*3.7 ,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "The Why",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10 * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 1.0,
                ),
                Container(
                  height: AppDimensions.height10 * 4.9,
                  width: AppDimensions.height10 * 37.2,
                  child: Center(
                    child: Text(
                      "Why pursuing this goal is important to \n you? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 3.4,
                ),
                backbox(
                  category: category,
                  goalName: goalName,
                  reason: reasonWhy,
                ),









                MediaQuery.of(context).viewInsets.bottom==0?  SizedBox(
                  height: AppDimensions.height10 * 7.2,
                ):SizedBox(
                  height: AppDimensions.height10 * 5.0,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Goal_Identity(
                              reasonWhy: reasonWhy,
                              goalName: goalName,
                              category: category,
                            ),
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
                            "Next",
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.6,
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
