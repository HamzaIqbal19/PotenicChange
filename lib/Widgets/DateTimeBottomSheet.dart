import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class MyListWheelForm extends StatefulWidget {
  final Function(
          String day, String hour, String minute, String period, bool Done)
      onSelectionChanged;

  MyListWheelForm({Key? key, required this.onSelectionChanged})
      : super(key: key);

  @override
  _MyListWheelFormState createState() => _MyListWheelFormState();
}

class _MyListWheelFormState extends State<MyListWheelForm> {
  String day = "Monday";
  String hour = "12";
  String minute = "00";
  String period = "am";
  bool Done = false;

  List<String> _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<String> _hours = List<String>.generate(12, (i) => (i + 1).toString());
  List<String> _minutes =
      List<String>.generate(60, (i) => i.toString().padLeft(2, '0'));
  List<String> _periods = [' AM', ' PM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 30.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: AppDimensions.height10(context) * 1.0,
                right: AppDimensions.height10(context) * 1.9,
                top: AppDimensions.height10(context) * 1.2),
            width: AppDimensions.height10(context) * 41.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedScaleButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensions.height10(context) * 5.0,
                    height: AppDimensions.height10(context) * 3.1,
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.8,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFF2F80ED)),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    AnimatedScaleButton(
                      onTap: () {
                        setState(() {
                          Done = true;
                        });
                        widget.onSelectionChanged(
                            day, hour, minute, period, Done);

                        // Navigator.pop(context);
                      },
                      child: Container(
                        width: AppDimensions.height10(context) * 2.9,
                        height: AppDimensions.height10(context) * 3.1,
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                height: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFF2F80ED)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimensions.height10(context) * 3.1,
                    ),
                    AnimatedScaleButton(
                      onTap: () {
                        print("hell");
                        setState(() {
                          Done = true;
                        });
                        widget.onSelectionChanged(
                            day, hour, minute, period, Done);
                        //Navigator.pop(context);
                      },
                      child: Container(
                        // width: AppDimensions.height10(context) * 3.7,
                        height: AppDimensions.height10(context) * 3.1,
                        child: Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.8,
                                height: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFF2F80ED)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
              height: AppDimensions.height10(context) * 0.1,
              color: Color(0xFF828282)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppDimensions.height10(context) * 13.5,
                  child: listWheelScrollViewBuilder(_days, "Day"),
                ),
                SizedBox(width: AppDimensions.height10(context) * 6.0),
                Container(
                  width: AppDimensions.height10(context) * 3.0,
                  child: listWheelScrollViewBuilder(_hours, "Hour"),
                ),
                SizedBox(width: AppDimensions.height10(context) * 4.6),
                Container(
                  width: AppDimensions.height10(context) * 3.0,
                  child: listWheelScrollViewBuilder(_minutes, "Minute"),
                ),
                SizedBox(width: AppDimensions.height10(context) * 4.6),
                Container(
                  width: AppDimensions.height10(context) * 3.8,
                  child: listWheelScrollViewBuilder(_periods, "Period"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listWheelScrollViewBuilder(List<String> items, String key) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 5,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 30,
        useMagnifier: false,
        // magnification: 1.2,
        diameterRatio: 1.5,
        squeeze: 0.8,
        onSelectedItemChanged: (index) {
          setState(() {
            if (key == "Day") {
              day = items[index];
            } else if (key == "Hour") {
              hour = items[index];
            } else if (key == "Minute") {
              minute = items[index];
            } else {
              period = items[index];
            }
          });

          print('$key Selected: ${items[index]}');
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            if (index < 0 || index >= items.length) {
              return null;
            }
            return Center(
                child: Text(
              items[index],
              style: TextStyle(
                  fontSize: AppDimensions.height10(context) * 2.2,
                  fontWeight: FontWeight.w400),
            ));
          },
        ),
      ),
    );
  }
}
