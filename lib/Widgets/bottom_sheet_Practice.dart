import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Practice%20Creation%20Journey/PracticeName.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/Practice Creation Journey/Create Practice.dart';
import 'fading2.dart';
// import 'package:flutter_ui/utilities/app_contants.dart';

List<String> categories = [
  'Fulfil Potential',
  'Happiness & Wellbeing',
  'Self Control',
  'Relationship'
];
int getMaxCharacters() {
  return 80;
}

int getCurrentCharacters() {
  return goalName.text.length;
}

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

final goalName = TextEditingController();
bool enable = false;

void bottom_sheet(context, String goal) {
  String? name = goal;
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
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              // color:Colors.lightGreen,
              height: AppDimensions.height10(context) * 45.0,
              width: AppDimensions.width10(context) * 41.4,

              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        //height: AppDimensions.height10(context) * 6.3,
                        width: AppDimensions.width10(context) * 35.5,
                        child: Text(
                          'Create a new practice \n for ‘$name’ goal ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF464646),
                            fontSize: AppDimensions.font10(context) * 2.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10(context) * 3.9,
                      ),
                      SizedBox(
                        width: AppDimensions.width10(context) * 36.0,
                        child: TextField(
                          controller: goalName,
                          // maxLength: 80,
                          maxLength: getMaxCharacters(),

                          onChanged: (value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                enable = true;
                              } else {
                                enable = false;
                              }
                            });
                          },
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AppDimensions.font10(context) * 2.4,
                            color: const Color.fromARGB(209, 250, 154, 52),
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(0, 0, 0, 0.1),
                              hintText: "Enter practice name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.font10(context) * 2.4,
                                  color: const Color(0xFF828282)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.transparent))),
                        ),
                      ),
                      // SizedBox(
                      //   height: AppDimensions.height10(context) * 1,
                      // ),
                      Container(
                        height: AppDimensions.height10(context) * 2,
                        padding: EdgeInsets.only(
                            left: AppDimensions.width10(context) * 4.0),
                        child: Row(
                          children: [
                            const Center(
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
                                "${getCurrentCharacters()}/80",
                                style: const TextStyle(
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
                        width: AppDimensions.width10(context) * 25.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10(context) * 5.0),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: enable
                                  ? [
                                      const Color(0xFFFCC10D),
                                      const Color(0xFFFDA210)
                                    ]
                                  : [
                                      const Color(0xFFFCC10D).withOpacity(0.5),
                                      const Color(0xFFFDA210).withOpacity(0.5)
                                    ]),
                        ),
                        child: TextButton(
                            onPressed: () async {
                              if (goalName.text.toString().isNotEmpty) {
                                final SharedPreferences prefs = await _prefs;
                                await prefs.setString(
                                    'pracName', goalName.text.toString());
                                await prefs.remove(
                                  'pracId',
                                );
                                Navigator.push(
                                    context,
                                    FadePageRoute2(true,
                                        exitPage: const CreatePractice(),
                                        enterPage: const PracticeName(
                                          comingFromEditScreen: false,
                                        )));
                                goalName.clear();
                              }
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: goalName.text.toString().isNotEmpty
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                fontSize: 16,
                              ),
                            )),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 24),
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  width: 2,
                                  color:
                                      const Color.fromARGB(209, 250, 154, 52))),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color.fromARGB(209, 250, 154, 52),
                                  fontSize: 16,
                                ),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
    },
  );
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = categories.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.width10(context) * 36,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.8),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 1),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Category:',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              iconSize: 40,
              iconEnabledColor: const Color.fromARGB(209, 250, 154, 52),
              underline: Container(),
              elevation: 16,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color.fromARGB(209, 250, 154, 52)),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
