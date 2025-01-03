import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';

List<String> categories = [
  'Fulfil Potential',
  'Happiness & Wellbeing',
  'Self Control',
  'Relationship'
];

class Time_filter extends StatelessWidget {
  const Time_filter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown Filter'),
        ),
        body: const FilterScreen(),
        bottomNavigationBar: const BottomAppBar(
          child: SizedBox(
            height: 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Filter by: ',
                  style: TextStyle(fontSize: 16.0),
                ),
                FilterDropdown(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({super.key});

  @override
  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  late String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: _selectedOption,
        onChanged: (String? value) {
          setState(() {
            _selectedOption = value!;
          });
        },
        items: categories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Filtered Content',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
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
      height: AppDimensions.height10(context) * 9.0,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.8),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 5, left: AppDimensions.width10(context) * 1.6),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Category:',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppDimensions.font10(context) * 1.4,
                      fontFamily: "Laila",
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            DropdownButton2<String>(
              value: dropdownValue,
              isExpanded: true,
              iconStyleData: IconStyleData(
                  iconSize: AppDimensions.height10(context) * 4.0,
                  iconEnabledColor: const Color(0xFFFA9934)),
              underline: Container(),
              // elevation: 16,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: AppDimensions.font10(context) * 2.4,
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
