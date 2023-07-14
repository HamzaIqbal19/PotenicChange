import 'dart:convert';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal%20Finished.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal_Identity.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/SignupBottomSheet.dart';
import '../../Widgets/fading2.dart';

class GoalWhy extends StatefulWidget {
  GoalWhy({
    Key? key,
  }) : super(key: key);

  @override
  _goalwhyState createState() => _goalwhyState();
}

class _goalwhyState extends State<GoalWhy> {
  List<Map<String, String>> myTextFields = [];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //closing the focus
  final FocusNode blankNode = FocusNode();
  String goalName = "";
  @override
  void initState() {
    super.initState();
    getGoalName();
    // Add one element to the list when the screen is initialized.
    myTextFields.add({
      'key': 'Reason ${myTextFields.length}',
      'text': '',
    });
  }

  getGoalName() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      goalName = prefs.getString("goalName")!;
    });
    print("goalName:$goalName");
  }

  int item = 1;

  void handleTextChanged(int index, String newValue) {
    setState(() {
      myTextFields[index]['text'] = newValue;
    });
    print(myTextFields);
  }

  void decrement() {
    item = item - 1;
  }

  void handleDelete(int index) {
    print('=========>dELETED');
    setState(() {
      // myTextFields[index]['text'].remove(index);

      myTextFields.removeAt(index);

      for (int i = index + 1; i < myTextFields.length; i++) {
        myTextFields[i]['key'] = i.toString();

        // Assuming 'key' is the identifier you want to update.
      }
      //index--;
    });
    decrement();
    //closing the focus
    blankNode.requestFocus();
    //closing the focus
    print(myTextFields);
    print('dELETED');
  }

  void increment() {
    item = item + 1;
  }

  Future<void> updateGoalReason(List<Map<String, String>> newReason) async {
    final prefs = await SharedPreferences.getInstance();

    // Check if 'goal' is in shared preferences
    if (prefs.containsKey('goal')) {
      // Get stored Goal object from shared preferences
      String? jsonString = prefs.getString('goal');
      Map<String, dynamic> userMap = jsonDecode(jsonString!);
      // print("UserMap:$userMap");
      // print("newReason:$newReason");
      // Create Goal object from map
      Goal goal = Goal.fromJson(userMap);
      // print("UserMap:$goal");
      // print("newReason:$newReason");
      // Update reason field
      goal.reason = newReason;

      // Convert updated Goal object back to JSON string
      jsonString = jsonEncode(goal.toJson());

      // Save updated Goal object back to shared preferences
      await prefs.setString('goal', jsonString);
      getGoal();
    } else {
      print("No goal found in shared preferences");
    }
  }

  Future<Goal> getGoal() async {
    print("hello world");
    final prefs = await SharedPreferences.getInstance();
    goalName = prefs.getString("goalName")!;
    String? jsonString = prefs.getString('goal');
    print(jsonString);

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      print("GoalWhy:$jsonString");
      myTextFields[0]['text'] != ""
          ? Navigator.push(
              context,
              FadePageRoute2(
                true,
                exitPage: GoalWhy(),
                enterPage: const Goal_Identity(),
              ),
            )
          : Container();
      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      extendBody: true,
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
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3,
                  height: AppDimensions.height10(context) * 3,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                  // Add code for performing close action
                },
              ),
            ),
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
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                      width: AppDimensions.height10(context) * 27.0,
                      height: AppDimensions.height10(context) * 22.0,
                      child: AlertDialog(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(
                        //         AppDimensions.height10(context) * 1.4)),
                        contentPadding: EdgeInsets.zero,
                        actionsPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        title: Container(
                          margin: const EdgeInsets.only(
                              top: 19, right: 16, left: 16, bottom: 2),
                          height: AppDimensions.height10(context) * 2.2,
                          width: AppDimensions.height10(context) * 23.8,
                          child: const Text(
                            "Exit onboarding?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        content: Container(
                          margin: const EdgeInsets.only(
                              bottom: 19, left: 16, right: 16),
                          height: 32,
                          width: 238,
                          child: const Text(
                            "Please select from the options below",
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
                              FDottedLine(
                                color:
                                    const Color(0xFF3C3C43).withOpacity(0.29),
                                width: double.infinity,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 0.7,
                              ),
                              Container(
                                height: 42,
                                width: double.infinity,
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () async {
                                    updateGoalReason(myTextFields);
                                    final SharedPreferences prefs =
                                        await _prefs;
                                    var goalwhy =
                                        prefs.setString('route', "goalWhy");
                                    Navigator.push(
                                      context,
                                      FadePageRoute2(
                                        true,
                                        exitPage: GoalWhy(),
                                        enterPage:
                                            const HomeScreenProgressSaved(
                                          login: true,
                                          route: "goalWhy",
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Exit & save progress',
                                    style: TextStyle(
                                        color: Color(0xFF007AFF),
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              FDottedLine(
                                color:
                                    const Color(0xFF3C3C43).withOpacity(0.29),
                                width: double.infinity,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 0.7,
                              ),
                              Container(
                                height: 44,
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () async {
                                    final SharedPreferences prefs =
                                        await _prefs;
                                    var goalwhy = prefs.remove('route');
                                    Navigator.push(
                                      context,
                                      FadePageRoute2(
                                        true,
                                        exitPage: GoalWhy(),
                                        enterPage:
                                            const HomeScreen(login: true),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Exit & delete progress',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF007AFF)),
                                  ),
                                ),
                              ),
                              FDottedLine(
                                color:
                                    const Color(0xFF3C3C43).withOpacity(0.29),
                                width: double.infinity,
                                strokeWidth: 2.0,
                                dottedLength: 10.0,
                                space: 0.7,
                              ),
                              Container(
                                height: 42,
                                width: double.infinity,
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel exit',
                                    style: TextStyle(
                                        color: Color(0xFF007AFF),
                                        fontSize: 17,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Add code for performing close action
                ),
              ),
            ],
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.webp"),
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
                      "Star Creation 3/5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  width: AppDimensions.height10(context) * 30,
                  child: Center(
                    child: Text(
                      goalName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                    width: AppDimensions.height10(context) * 10.4,
                    height: AppDimensions.height10(context) * 7.6,
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.height10(context) * 1.5),
                    child: Image.asset(
                      "assets/images/image3.webp",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "The Why",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  // height: AppDimensions.height10(context) * 4.9,
                  width: AppDimensions.height10(context) * 37.2,
                  child: Center(
                    child: Text(
                      "Why pursuing this goal is important\nto you?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  width: AppDimensions.height10(context) * 38.2,
                  height: item == 1
                      ? AppDimensions.height10(context) * 22.0
                      : AppDimensions.height10(context) * 36.0,
                  // color: Colors.amber,
                  child: Stack(children: [
                    ClipPath(
                      //clipper: OvalBottomBorderClipper(57),
                      child: Container(
                        // width: AppDimensions.height10(context) * 38.2,
                        //height: AppDimensions.height10(context) * 33.0,
                        margin: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 2.3),
                        padding: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 1.1,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white,
                                width: AppDimensions.height10(context) * 0.2),
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppDimensions.height10(context) * 1.8))),
                        child: ListView.builder(
                          itemCount: myTextFields.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, index) {
                            return Column(children: [
                              inner_text(
                                key: Key(myTextFields[index]['key']!),
                                delete: true,
                                head_text: "Reason ${index + 1}",
                                body_text: myTextFields[index]['text']!,
                                length: 200,
                                onChanged: (newText) {
                                  setState(() {
                                    myTextFields[index]['text'] = newText;
                                  });
                                  handleTextChanged(index, newText);
                                },
                                onDelete: () => handleDelete(index),
                                index: index,
                                placeHolder:
                                    'I want to achieve this goal because...',
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: AppDimensions.height10(context) * 1.5,
                                    bottom:
                                        AppDimensions.height10(context) * 1.3),
                                child: Row(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Character count: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF464646),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "200",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xFF464646),
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.3,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          AppDimensions.height10(context) * 0.3,
                                      width:
                                          AppDimensions.height10(context) * 4.0,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10(context) *
                                              0.5,
                                          left:
                                              AppDimensions.height10(context) *
                                                  4.0),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF282828)
                                              .withOpacity(0.2)),
                                    )
                                  ],
                                ),
                              )
                            ]);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        // alignment: item == 1
                        //     ? const Alignment(0.01, 1.35)
                        //     : const Alignment(0.01, 1.25),
                        //heightFactor: 0.5,
                        child: AnimatedScaleButton(
                          onTap: () {
                            increment();
                            setState(() {
                              myTextFields.add({
                                'key':
                                    'Reason ${myTextFields.length.toString()}',
                                'text': '',
                              });
                            });
                            print("=============>Pressed");
                          },
                          child: Container(
                            height: AppDimensions.height10(context) * 4.7,
                            width: AppDimensions.height10(context) * 4.7,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.orange,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFB1B8FF),
                                    Color(0xFFC5CAFF)
                                  ]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, left: 4, right: 4, bottom: 4),
                              child: Container(
                                color: Colors.transparent,
                                child: Image.asset(
                                  'assets/images/Addgoal.webp',
                                  height: AppDimensions.height10(context) * 4.7,
                                  width: AppDimensions.height10(context) * 4.7,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 26.7,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 5.0,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: AnimatedScaleButton(
                          onTap: () {
                            //   signupSheet(context, "Sign up / login", "login");
                          },
                          child: Image.asset(
                            "assets/images/Moreactions.webp",
                            fit: BoxFit.contain,
                          ),
                        )),
                    SizedBox(
                      width: AppDimensions.height10(context) * 2.0,
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        print('===================>${myTextFields[0]['text']}');
                        updateGoalReason(myTextFields);
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: myTextFields[0]['text'] != ""
                            ? BoxDecoration(
                                // color: Color(0xFFFF7D50),
                                border: Border.all(color: Colors.transparent),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFFCC10D),
                                      Color(0xFFFDA210)
                                    ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              )
                            : BoxDecoration(
                                // color: Color(0xFFFF7D50),
                                border: Border.all(color: Colors.transparent),
                                color: const Color(0xFF282828).withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                              ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: myTextFields[0]['text'] != ""
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.5,
                ),
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

// class OvalBottomBorderClipper extends CustomClipper<Path> {
//   final double clipHeight;

//   OvalBottomBorderClipper(this.clipHeight);

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final height = size.height;
//     final width = size.width;

//     // Define the oval shape path
//     path.moveTo(0, height);
//     path.lineTo(0, height - clipHeight);
//     path.quadraticBezierTo(
//         width * 0.5, height - (clipHeight / 2), width, height - clipHeight);
//     path.lineTo(width, height);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

class ClipPainter extends CustomPainter {
  final CustomClipper<Path> clipper;

  ClipPainter(this.clipper);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // paint.color = Colors.blue[800];
    paint.style = PaintingStyle.fill;
    canvas.drawPath(clipper.getClip(size), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ArcClipper extends CustomClipper<Path> {
  ArcClipper(this.height);

  ///The height of the arc
  final double height;

  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.2, size.width, size.height - height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    ArcClipper oldie = oldClipper as ArcClipper;
    return height != oldie.height;
  }
}

class Arc extends StatelessWidget {
  final double height;
  final Widget child;
  const Arc({
    required this.height,
    required this.child,
  });

  /// The widget which one of [edge]s is going to be clippddddded as arc

  @override
  Widget build(BuildContext context) {
    var clipper = ArcClipper(height);
    return CustomPaint(
      painter: ClipPainter(clipper),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
