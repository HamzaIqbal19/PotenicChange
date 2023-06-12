import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/ReviewPractice/Activateyourstar.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/review_cont.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class StarReviewWhy extends StatefulWidget {
  const StarReviewWhy({Key? key}) : super(key: key);

  @override
  State<StarReviewWhy> createState() => _StarReviewWhyState();
}

class _StarReviewWhyState extends State<StarReviewWhy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10(context) * 5.0),
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
                  width: AppDimensions.height10(context) * 3,
                  height: AppDimensions.height10(context) * 3,
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
            // actions: [
            //   Center(
            //     // alignment: Alignment.center,
            //     child: IconButton(
            //       icon: Image.asset(
            //         'assets/images/Close.png',
            //         width: AppDimensions.height10(context) * 3.0,
            //         height: AppDimensions.height10(context) * 3.0,
            //         fit: BoxFit.contain,
            //       ),
            //       onPressed: () {
            //         // Navigator.pushReplacement(
            //         //   context,
            //         //   MaterialPageRoute(
            //         //     builder: (context) => HomeScreen(),
            //         //   ),
            //         // );
            //         // Add code for performing close action
            //       },
            //     ),
            //   ),
            // ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/GoalReviewBg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      "View and edit mode",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF437296),
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.6,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Control My Anger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF437296),
                        fontSize: AppDimensions.height10(context) * 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 4.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "The Why",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF437296),
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.8,
                ),
                Container(
                  height: AppDimensions.height10(context) * 4.6,
                  width: AppDimensions.height10(context) * 37.2,
                  child: Center(
                    child: Text(
                      "Why pursuing this goal is important to \n you? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.height10(context) * 1.8,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF437296),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                const reviewbox(),
                // MediaQuery.of(context).viewInsets.bottom == 0
                //     ? SizedBox(
                //         height: AppDimensions.height10(context) * 7.2,
                //       )
                //     : SizedBox(
                //         height: AppDimensions.height10(context) * 5.0,
                //       ),
                // SizedBox(
                //   height: AppDimensions.height10(context) * 2.5,
                // ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 2.7,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 2.4,
                      ),
                // SizedBox(
                //   height: AppDimensions.height10(context) * 2.5,
                // ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )
        ],
      ),
    );
  }
}
