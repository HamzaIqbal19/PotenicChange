import 'dart:convert';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/GoalModel.dart';
import 'package:potenic_app/MyServices/API.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_ui/utilities/app_contants.dart';
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

List<String> categories = [
  'Self Control',
  'Overcome Insecurities',
  'Selfcare',
  'Lifestyle',
  'Spirituality and Mindfulness',
  'Family and Friends',
  'Personal Growth',
  'Love and Relationship'
];
String dropdownValue = categories.first;

Future getUserId(
  int categoryid,
  goalname,
) async {
  final SharedPreferences prefs = await _prefs;
  var userId = prefs.getInt("userid");

  saveGoalToPrefs(userId!, categoryid, goalname);
}

Future<void> saveGoalToPrefs(
  var userId,
  var categoryId,
  var goalName,
) async {
  final SharedPreferences prefs = await _prefs;
  var GoalName = prefs.setString('goalName', goalName);
  //var GoalCategory = prefs.setString("GoalCategory", widget.Circletitle);

  Goal goal = Goal(
    name: goalName,
    reason: [
      {"key": "reason1", "text": "This is reason 1"},
    ],
    identityStatement: [
      {"key": "reason1", "text": "This is reason 1"},
    ],
    visualizingYourSelf: [
      {"key": "reason1", "text": "This is reason 1"},
    ],
    userId: userId,
    goalCategoryId: categoryId,
  );
  String jsonString =
      jsonEncode(goal.toJson()); // converting object to json string
  prefs.setString('goal', jsonString);

  getGoal();
}

Future<Goal> getGoal() async {
  final prefs = await SharedPreferences.getInstance();

  String? jsonString = prefs.getString('goal');

  if (jsonString != null) {
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    print("Goal===============>$jsonString");
    // Navigator.push(
    //   context,
    //   FadePageRoute(
    //     page: GoalName(),
    //   ),
    // );
    return Goal.fromJson(jsonMap);
  }

  throw Exception('No goal found in local storage');
}

int index = 0;
int catId = 1;
//late int goalId;

void bottom_sheet(context) {
  final goalName = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool enable = false;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10(context) * 5.0),
    )),
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            // color:Colors.lightGreen,
            height: AppDimensions.height10(context) * 45.0,
            width: AppDimensions.height10(context) * 41.4,

            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: AppDimensions.height10(context) * 3.4,
                    width: AppDimensions.height10(context) * 35.5,

                    // padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Text(
                      'Create a new goal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF464646),
                        fontSize: AppDimensions.height10(context) * 2.8,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Laila",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 2.5,
                  ),
                  SizedBox(
                      child: Container(
                    width: AppDimensions.height10(context) * 36,
                    height: AppDimensions.height10(context) * 9.0,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.1),
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.8),
                        border:
                            Border.all(width: 3, color: Colors.transparent)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5,
                                left: AppDimensions.height10(context) * 1.6),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Category:',
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        AppDimensions.height10(context) * 1.4,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ),
                          Container(
                            //  height: AppDimensions.height10(context) * 9.0,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                hint: Text(
                                  "Select a category ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          AppDimensions.height10(context) * 2.4,
                                      fontFamily: "Laila",
                                      color: const Color.fromARGB(
                                          209, 250, 154, 52)),
                                ),
                                value: dropdownValue,

                                isExpanded: true,
                                iconStyleData: IconStyleData(
                                    iconSize:
                                        AppDimensions.height10(context) * 4.0,
                                    iconEnabledColor: Color(0xFFFA9934)),

                                // elevation: 16,

                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  print('-------------------------');
                                  print(index);
                                  setState(() {
                                    dropdownValue = value!;
                                    index = categories.indexOf(value);
                                  });
                                },

                                dropdownStyleData: DropdownStyleData(
                                    maxHeight:
                                        AppDimensions.height10(context) * 25.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDimensions.height10(context) *
                                                2.0))),
                                items: categories.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  // setState(() {
                                  //   index =
                                  // });
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  2.4,
                                          fontFamily: "Laila",
                                          color: const Color.fromARGB(
                                              209, 250, 154, 52)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    height: AppDimensions.height10(context),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 36.0,
                    height: AppDimensions.height10(context) * 8.0,
                    child: Form(
                      key: _formkey,
                      child: TextFormField(
                        maxLength: 50,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimensions.height10(context) * 2.4,
                          height: AppDimensions.height10(context) * 0.15,
                          color: const Color.fromARGB(209, 250, 154, 52),
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 3.0,
                                right: AppDimensions.height10(context) * 3.0),
                            filled: true,
                            fillColor: const Color.fromRGBO(0, 0, 0, 0.1),
                            hintText: "Enter your goal name ",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimensions.height10(context) * 2.4,
                              color: const Color(0xFF828282),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(
                                    width: 3, color: Colors.transparent))),
                        onChanged: (value) {
                          setState(() {
                            enable = true;
                          });
                        },
                        controller: goalName,
                        validator: (val) {
                          if (val == null || val == "") {
                            return "PLease Enter a value";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 4.0),
                    child: Row(
                      children: const [
                        Center(
                          child: Text(
                            "Character count:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(209, 250, 154, 52),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "50",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(209, 250, 154, 52),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.height10(context) * 3.0,
                  ),
                  Container(
                    height: AppDimensions.height10(context) * 5,
                    width: AppDimensions.height10(context) * 25.4,
                    decoration: enable
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 5.0),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFFCC10D).withOpacity(0.3),
                                  Color(0xFFFDA210).withOpacity(0.3)
                                ]),
                          ),
                    child: TextButton(
                        onPressed: () async {
                          setState(() {
                            catId = index + 1;
                          });
                          print('Category');
                          print(catId);
                          if (_formkey.currentState!.validate()) {
                            // final SharedPreferences prefs = await _prefs;
                            // var goal_Name = prefs.setString(
                            //     'goalName', '${goalName.text.toString()}');
                            // print('${goalName.text.toString()}');
                            getUserId(catId, goalName.text.toString());
                            print(goalName.text.toString());
                            print(index);
                            goalName.clear();

                            final SharedPreferences prefs = await _prefs;
                            var goal_Name = prefs.setString(
                                'goalName', '${goalName.text.toString()}');

                            Navigator.push(
                              context,
                              FadePageRoute(
                                page: GoalName(catId),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: "Laila",
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: AppDimensions.height10(context) * 1.6,
                          ),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 24),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(209, 250, 154, 52))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: "Laila",
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(209, 250, 154, 52),
                              fontSize: AppDimensions.height10(context) * 1.6,
                            ),
                          )))
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}

// class DropdownButtonExample extends StatefulWidget {
//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: AppDimensions.height10(context) * 36,
//       height: AppDimensions.height10(context) * 9.0,
//       decoration: BoxDecoration(
//           color: const Color.fromRGBO(0, 0, 0, 0.1),
//           borderRadius:
//               BorderRadius.circular(AppDimensions.height10(context) * 1.8),
//           border: Border.all(width: 3, color: Colors.transparent)),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 8, right: 8),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                   top: 5, left: AppDimensions.height10(context) * 1.6),
//               child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     'Category:',
//                     //textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: AppDimensions.height10(context) * 1.4,
//                       fontFamily: "Laila",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   )),
//             ),
//             Container(
//               //  height: AppDimensions.height10(context) * 9.0,
//               child: DropdownButton2<String>(
//                 disabledHint: Text(
//                   'Select Category',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: AppDimensions.height10(context) * 2.4,
//                       fontFamily: "Laila",
//                       color: const Color.fromARGB(209, 250, 154, 52)),
//                 ),
//                 hint: Text(
//                   "Select a category ",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: AppDimensions.height10(context) * 2.4,
//                       fontFamily: "Laila",
//                       color: const Color.fromARGB(209, 250, 154, 52)),
//                 ),
//                 value: dropdownValue,

//                 isExpanded: true,
//                 iconStyleData: IconStyleData(
//                     iconSize: AppDimensions.height10(context) * 4.0,
//                     iconEnabledColor: Color(0xFFFA9934)),
//                 underline: Container(),
//                 // elevation: 16,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: AppDimensions.height10(context) * 2.4,
//                     fontFamily: "Laila",
//                     color: const Color.fromARGB(209, 250, 154, 52)),
//                 onChanged: (String? value) {
//                   // This is called when the user selects an item.

//                   setState(() {
//                     dropdownValue = value!;
//                     index = categories.indexOf(value);
//                   });
//                 },

//                 dropdownStyleData: DropdownStyleData(
//                     maxHeight: AppDimensions.height10(context) * 25.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(
//                             AppDimensions.height10(context) * 2.0))),
//                 items: categories.map<DropdownMenuItem<String>>((String value) {
//                   // setState(() {
//                   //   index =
//                   // });
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
