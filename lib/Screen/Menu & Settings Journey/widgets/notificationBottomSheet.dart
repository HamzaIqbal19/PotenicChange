import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';



class MyBottomSheet extends StatefulWidget {
  List statments;
  int selectedIndex;
  final ValueChanged<int> onCountChanged;
  MyBottomSheet(
      {Key? key,
        required this.statments,
        required this.selectedIndex,
        required this.onCountChanged})
      : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 33.3,
      color: const Color(0xFFFBFBFB), // Set the height of the bottom sheet
      child: Column(
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
                    widget.onCountChanged(_selectedIndex);
                    Navigator.pop(context);
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
              ],
            ),
          ),
          Divider(
              height: AppDimensions.height10(context) * 0.1,
              color: const Color(0xFF828282)),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 26,
              magnification: 1.2,
              useMagnifier: true,
              overAndUnderCenterOpacity:
              0.6, // Set the height of each statement
              children: widget.statments
                  .map((statement) => Text(statement,
                  style: TextStyle(
                    color: const Color(0xFF282828),
                    fontSize: AppDimensions.font10(context) * 2.4,
                    fontWeight: FontWeight.w400,
                  )))
                  .toList(),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: AppDimensions.height10(context) * 0.1),
        ],
      ),
    );
  }
}
