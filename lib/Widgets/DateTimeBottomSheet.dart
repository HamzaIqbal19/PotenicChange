import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class MyListWheelForm extends StatefulWidget {
  final Function(
          String day, String hour, String minute, String period, bool Done)
      onSelectionChanged;
  final String initialHour;
  final String initialMinute;
  final String initialPeriod;

  const MyListWheelForm(
      {Key? key,
      required this.onSelectionChanged,
      required this.initialHour,
      required this.initialMinute,
      required this.initialPeriod})
      : super(key: key);

  @override
  _MyListWheelFormState createState() => _MyListWheelFormState();
}

class _MyListWheelFormState extends State<MyListWheelForm> {
  String day = "Monday";
  String hour = "1";
  String minute = "00";
  String period = "am";
  bool done = false;

  List<String> _hours = List<String>.generate(12, (i) => (i + 1).toString());
  List<String> _minutes =
      List<String>.generate(60, (i) => i.toString().padLeft(2, '0'));
  List<String> _periods = ['AM', 'PM'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('StartTime = ${widget.initialHour}, ${widget.initialMinute}, ${widget.initialPeriod}');

    if (widget.initialPeriod.toUpperCase() == 'PM') {
      setState(() {
        _periods = ['PM', 'AM'];
        period = 'pm';
      });
    }
    if (widget.initialHour.isNotEmpty) {
      setState(() {
        int initialHourIndex = _hours.indexOf(widget.initialHour);
        _hours = _hours.sublist(initialHourIndex)
          ..addAll(_hours.sublist(0, initialHourIndex));
        hour = widget.initialHour;
      });
    }
    if (widget.initialMinute != "00" && widget.initialMinute.isNotEmpty) {
      setState(() {
        print("initial minute ${widget.initialMinute}");
        int initialMinuteIndex = _minutes.indexOf(widget.initialMinute);
        print("initial minute index ${initialMinuteIndex}");
        _minutes = _minutes.sublist(initialMinuteIndex)
          ..addAll(_minutes.sublist(0, initialMinuteIndex));
        print("  ___minutes${_minutes}");
        minute = widget.initialMinute;
        print("  minutes${minute}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height10(context) * 33.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: AppDimensions.width10(context) * 1.0,
                right: AppDimensions.width10(context) * 1.9,
                top: AppDimensions.height10(context) * 1.2),
            width: AppDimensions.width10(context) * 41.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedScaleButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    // width: AppDimensions.width10(context) * 5.0,
                    height: AppDimensions.width10(context) * 3.1,
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.9,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFF2F80ED)),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                AnimatedScaleButton(
                  onTap: () {
                    setState(() {
                      done = true;
                    });
                    widget.onSelectionChanged(day, hour, minute, period, done);

                    // Navigator.pop(context);
                  },
                  child: SizedBox(
                    //width: AppDimensions.width10(context) * 2.9,
                    height: AppDimensions.width10(context) * 3.1,
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.9,
                            height: AppDimensions.height10(context) * 0.1,
                            color: const Color(0xFF2F80ED)),
                      ),
                    ),
                  ),
                ),
                //   SizedBox(
                //     width: AppDimensions.width10(context) * 3.1,
                //   ),
                //   // AnimatedScaleButton(
                //   //   onTap: () {
                //   //     setState(() {
                //   //       done = true;
                //   //     });
                //   //     widget.onSelectionChanged(
                //   //         day, hour, minute, period, done);
                //   //     //Navigator.pop(context);
                //   //   },
                //   //   child: SizedBox(
                //   //     // width: AppDimensions.width10(context) * 3.7,
                //   //     height: AppDimensions.height10(context) * 3.2,
                //   //     child: Center(
                //   //       child: Text(
                //   //         "Done",
                //   //         style: TextStyle(
                //   //             fontSize: AppDimensions.font10(context) * 1.9,
                //   //             height: AppDimensions.height10(context) * 0.1,
                //   //             color: const Color(0xFF2F80ED)),
                //   //       ),
                //   //     ),
                //   //   ),
                //   // ),
                // ],
                //  ),
              ],
            ),
          ),
          Divider(
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFF828282)),
          Center(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   width: AppDimensions.width10(context) * 13.5,
                    //   child: listWheelScrollViewBuilder(_days, "Day"),
                    // ),
                    SizedBox(width: AppDimensions.width10(context) * 6.0),
                    SizedBox(
                      width: AppDimensions.width10(context) * 3.0,
                      child: listWheelScrollViewBuilder(_hours, "Hour"),
                    ),
                    SizedBox(width: AppDimensions.width10(context) * 4.6),
                    SizedBox(
                      width: AppDimensions.width10(context) * 3.0,
                      child: listWheelScrollViewBuilder(_minutes, "Minute"),
                    ),
                    SizedBox(width: AppDimensions.width10(context) * 4.6),
                    SizedBox(
                      width: AppDimensions.width10(context) * 3.8,
                      child: listWheelScrollViewBuilder(_periods, "Period"),
                    ),
                  ],
                ),
                Positioned(
                  top: 80,
                  right: 20,
                  left: 20,
                  child: Align(
                    alignment: const Alignment(0, 0),
                    child: Container(
                        width: 400,
                        height: 1,
                        color: const Color(0xFF828282).withOpacity(0.5)),
                  ),
                ),
                Positioned(
                  top: 120,
                  right: 20,
                  left: 20,
                  child: Align(
                    alignment: const Alignment(0, 0),
                    child: Container(
                        width: 400,
                        height: 1,
                        color: const Color(0xFF828282).withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listWheelScrollViewBuilder(List<String> items, String key) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width / 5,
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(),
        itemExtent: 50,
        useMagnifier: true,
        magnification: 1.5,
        diameterRatio: 2,
        squeeze: 0.8,
        physics: FixedExtentScrollPhysics(),
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
                  fontSize: AppDimensions.font10(context) * 1.9,
                  fontWeight: FontWeight.w400),
            ));
          },
        ),
      ),
    );
  }
}
