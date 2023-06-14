import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/MyServices/API.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
// import 'package:flutter_ui/utilities/app_contants.dart';

List<String> categories = [
  'Fulfil Potential',
  'Happiness & Wellbeing',
  'Self Control',
  'Relationship'
];
String dropdownValue = categories.first;

final goalName = TextEditingController();

class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('BottomSheet'),
        onPressed: () {
          bottom_sheet(context);
        },
      ),
    );
  }
}

void bottom_sheet(context) {
  final _formkey = GlobalKey<FormState>();
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensions.height10 * 5.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        // color:Colors.lightGreen,
        height: AppDimensions.height10 * 45.0,
        width: AppDimensions.height10 * 41.4,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: AppDimensions.height10 * 3.4,
                width: AppDimensions.height10 * 35.5,
                // padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  'Create a new goal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF464646),
                    fontSize: AppDimensions.height10 * 2.8,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Laila",
                  ),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 2.5,
              ),
              SizedBox(child: DropdownButtonExample()),
              SizedBox(
                height: AppDimensions.height10,
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 8.0,
                child: Form(
                  key: _formkey,
                  child: TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensions.height10 * 2.4,
                      color: const Color.fromARGB(209, 250, 154, 52),
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(0, 0, 0, 0.1),
                        hintText: "  Enter your goal name ",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimensions.height10 * 2.4,
                          color: const Color(0xFF828282),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                                width: 3, color: Colors.transparent))),
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
                height: AppDimensions.height10,
              ),
              Container(
                padding: EdgeInsets.only(left: AppDimensions.height10 * 4.0),
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
                height: AppDimensions.height10 * 3.0,
              ),
              Container(
                height: AppDimensions.height10 * 5,
                width: AppDimensions.height10 * 25.4,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 5.0),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                ),
                child: TextButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        // AdminGoal()
                        //     .userAddGoal('${goalName.text.toString()}', 'sad',
                        //         'sad', 'sad', 'sad', '${dropdownValue}')
                        //     .then((success) async {
                        //   print(
                        //       "response of create goal api call:${success["message"]}");
                        //   if (success["message"] !=
                        //       "Goal was add successfully!") {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text(success["message"])));
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => GoalName(
                        //             category: dropdownValue,
                        //             goalName: goalName.text.toString()),
                        //       ),
                        //     );
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text(success["message"])));
                        //   }
                        // });
                        print(goalName.text.toString());
                        print(dropdownValue);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoalName(
                                category: dropdownValue,
                                goalName: goalName.text.toString()),
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
                        fontSize: AppDimensions.height10 * 1.6,
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
                          width: 2, color: Color.fromARGB(209, 250, 154, 52))),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: "Laila",
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(209, 250, 154, 52),
                          fontSize: AppDimensions.height10 * 1.6,
                        ),
                      )))
            ],
          ),
        ),
      ),
    ),
  );
}

class DropdownButtonExample extends StatefulWidget {
  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10 * 36,
      height: AppDimensions.height10 * 9.0,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(AppDimensions.height10 * 1.8),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 5, left: AppDimensions.height10 * 1.6),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Category:',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppDimensions.height10 * 1.4,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            DropdownButton2<String>(
              value: dropdownValue,
              isExpanded: true,
              iconStyleData: IconStyleData(
                  iconSize: AppDimensions.height10 * 4.0,
                  iconEnabledColor: Color(0xFFFA9934)),
              underline: Container(),
              // elevation: 16,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: AppDimensions.height10 * 2.4,
                  fontFamily: "Laila",
                  color: const Color.fromARGB(209, 250, 154, 52)),
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
