import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';

class filter_bottom_sheet extends StatefulWidget {
  final String filter_name;
  const filter_bottom_sheet({super.key, required this.filter_name});

  @override
  State<filter_bottom_sheet> createState() => _filter_bottom_sheetState();
}

class _filter_bottom_sheetState extends State<filter_bottom_sheet> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        // color: Colors.blue,
        padding: EdgeInsets.only(
            left: AppDimensions.height10(context) * 2.2,
            right: AppDimensions.width10(context) * 2.2),
        height: AppDimensions.height10(context) * 7.0,
        width: AppDimensions.width10(context) * 41.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 2.4,
                  height: AppDimensions.height10(context) * 2.4,
                  // padding: EdgeInsets.only(
                  //     top: AppDimensions.height10(context) * 0.5,
                  //     bottom: AppDimensions.height10(context) * 0.5),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/ic_filter_list.webp',
                      width: AppDimensions.width10(context) * 2.4,
                      height: AppDimensions.height10(context) * 2.4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppDimensions.width10(context) * 0.5,
                ),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: Container(
                    width: AppDimensions.width10(context) * 11.5,
                    height: AppDimensions.height10(context) * 3.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.0),
                        border: Border.all(
                            width: AppDimensions.width10(context) * 0.1,
                            color: Color(0xFFE0E0E0))),
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.3,
                        right: AppDimensions.width10(context) * 1.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.0),
                          child: Text(
                            'Goal:',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFA9934)),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 1.9,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 0.8),
                          child: Center(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFA9934)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 0.8,
                              bottom: AppDimensions.height10(context) * 0.3),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffFA9934),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: AppDimensions.width10(context) * 11.6,
                    height: AppDimensions.height10(context) * 3.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.0),
                        border: Border.all(
                            width: AppDimensions.width10(context) * 0.1,
                            color: Color(0xFFE0E0E0))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 1.0),
                          child: Text(
                            'Type:',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFA9934)),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 1.9,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 0.8),
                          child: Center(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFA9934)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10(context) * 0.8,
                              bottom: AppDimensions.height10(context) * 0.3),
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffFA9934),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: AppDimensions.width10(context) * 3.9,
                    height: AppDimensions.height10(context) * 3.4,
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Clec',
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.4,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          color: Color(0xFFFA9934).withOpacity(0.30)),
                    ),
                  ),
                )
              ],
            ),

            Container(
              width: AppDimensions.width10(context) * 4.9,
              height: AppDimensions.height10(context) * 5.0,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/Search.webp',
                  width: AppDimensions.width10(context) * 5,
                  height: AppDimensions.height10(context) * 5,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //const Padding(padding: EdgeInsets.all(10))
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  String goal = 'Goal Name';
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.width10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.width10(context) * 0.1,
                                color: Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: AppDimensions.font10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        Container(
                          width: AppDimensions.width10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.width10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.width10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.width10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.width10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.width10(context) *
                                            0.1,
                                        color: Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
