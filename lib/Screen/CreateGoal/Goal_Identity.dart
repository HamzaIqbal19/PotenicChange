import 'dart:convert';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal-Visualising.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/fading2.dart';

// ignore: camel_case_types
class Goal_Identity extends StatefulWidget {
  const Goal_Identity({Key? key}) : super(key: key);

  @override
  State<Goal_Identity> createState() => _Goal_IdentityState();
}

// ignore: camel_case_types
class _Goal_IdentityState extends State<Goal_Identity> {
  List<Map<String, String>> myIdentity = [];
  //closing the focus
  final FocusNode blankNode = FocusNode();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    // Add one element to the list when the screen is initialized.
    myIdentity.add({
      'key': 'Reason ${myIdentity.length}',
      'text': '',
    });
  }

  int item = 1;

  void handleTextChanged(int index, String newValue) {
    setState(() {
      myIdentity[index]['text'] = newValue;
    });
    print(myIdentity);
  }

  void decrement() {
    item = item - 1;
  }

  void handleDelete(int index) {
    print('=========>dELETED');
    setState(() {
      // myTextFields[index]['text'].remove(index);

      myIdentity.removeAt(index);

      for (int i = index + 1; i < myIdentity.length; i++) {
        myIdentity[i]['key'] = i.toString();

        // Assuming 'key' is the identifier you want to update.
      }
      //index--;
    });
    decrement();
    //closing the focus
    blankNode.requestFocus();
    //closing the focus
    print(myIdentity);
    print('dELETED');
  }

  void increment() {
    item = item + 1;
  }

  Future<void> updateGoalReason(
      List<Map<String, String>> newidentityStatement) async {
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
      goal.identityStatement = newidentityStatement;

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
    String? jsonString = prefs.getString('goal');
    print(jsonString);

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return Goal.fromJson(jsonMap);
    }

    throw Exception('No goal found in local storage');
  }

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
            actions: [
              Center(
                // alignment: Alignment.center,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10(context) * 3.0,
                    height: AppDimensions.height10(context) * 3.0,
                    fit: BoxFit.contain,
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Container(
                      width: AppDimensions.height10(context) * 27.0,
                      height: AppDimensions.height10(context) * 21.0,
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        actionsPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        title: Container(
                          margin: EdgeInsets.only(
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
                          margin:
                              EdgeInsets.only(bottom: 19, left: 16, right: 16),
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
                                    updateGoalReason(myIdentity);
                                    final SharedPreferences prefs =
                                        await _prefs;
                                    var GoalIdentity = prefs.setString(
                                        'route', "GoalIdentity");
                                    Navigator.push(
                                      context,
                                      FadePageRoute2(
                                        exitPage: Goal_Identity(),
                                        enterPage: HomeScreenProgressSaved(
                                            login: true, route: "GoalIdentity"),
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
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      FadePageRoute2(
                                        exitPage: Goal_Identity(),
                                        enterPage:
                                            const HomeScreen(login: false),
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
                image: AssetImage("assets/images/Categories.png"),
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
                      "Star Creation 4/5",
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
                  child: Center(
                    child: Text(
                      "Control my anger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.9,
                ),
                Container(
                    // color: Colors.blue,
                    width: AppDimensions.height10(context) * 10.4,
                    height: AppDimensions.height10(context) * 7.6,
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.height10(context) * 1.5),
                    child: Image.asset(
                      "assets/images/image3.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "New Identity Statement",
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
                  height: AppDimensions.height10(context) * 7.5,
                  width: AppDimensions.height10(context) * 37.2,
                  child: Center(
                    child: Text(
                      "What positive statements can you think of \n to help you own your goal & your new \n identity?  ",
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
                      ? AppDimensions.height10(context) * 21.0
                      : AppDimensions.height10(context) * 34.0,
                  child: Stack(children: [
                    Container(
                      // width: AppDimensions.height10(context) * 38.2,
                      //height: AppDimensions.height10(context) * 33.0,
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
                        itemCount: myIdentity.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, index) {
                          return Column(children: [
                            inner_text(
                              key: Key(myIdentity[index]['key']!),
                              delete: true,
                              head_text: "${index + 1}. I am someone who ",
                              body_text: myIdentity[index]['text']!,
                              length: 150,
                              onChanged: (newText) {
                                setState(() {
                                  myIdentity[index]['text'] = newText;
                                });
                                handleTextChanged(index, newText);
                              },
                              onDelete: () => handleDelete(index),
                              index: index,
                              placeHolder: 'is in control of my anger....',
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
                                      "150",
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
                                        left: AppDimensions.height10(context) *
                                            4.0),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFF282828).withOpacity(0.2)),
                                  )
                                ],
                              ),
                            )
                          ]);
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        //alignment: Alignment.bottomCenter,
                        alignment: item == 1
                            ? Alignment(0.01, 1.3)
                            : Alignment(0.01, 1.17),
                        //heightFactor: 0.5,
                        child: Container(
                          height: AppDimensions.height10(context) * 4.7,
                          width: AppDimensions.height10(context) * 4.7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFB1B8FF), Color(0xFFC5CAFF)]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4, left: 4, right: 4, bottom: 4),
                            child: GestureDetector(
                                onTap: () {
                                  increment();
                                  setState(() {
                                    myIdentity.add({
                                      'key':
                                          'Identity ${myIdentity.length.toString()}',
                                      'text': '',
                                    });
                                  });
                                  print("=============>Pressed");
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'assets/images/Addgoal.png',
                                    height:
                                        AppDimensions.height10(context) * 4.7,
                                    width:
                                        AppDimensions.height10(context) * 4.7,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 12.2,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 5.0,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: Image.asset(
                          "assets/images/Moreactions.png",
                          fit: BoxFit.contain,
                        )),
                    GestureDetector(
                      onTap: () {
                        updateGoalReason(myIdentity);
                        Navigator.push(
                          context,
                          FadePageRoute2(
                            exitPage: Goal_Identity(),
                            enterPage: Visualising(),
                          ),
                        );
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
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
