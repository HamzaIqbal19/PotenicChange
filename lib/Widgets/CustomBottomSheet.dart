import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/bottomScrollView.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class CustomBottomSheet {
  void BottomSheet(context,
      {List<dynamic>? list,
      void Function()? onTap,
      void Function(int)? onSelectedItemChanged}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            height: AppDimensions.height10(context) * 30.3,
            color: const Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: AppDimensions.height10(context) * 4.0,
                          width: AppDimensions.height10(context) * 41.4,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width:
                                          AppDimensions.width10(context) * 0.1,
                                      color: const Color(0xFF828282)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: AppDimensions.height10(context) *
                                          2.0),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        color: const Color(0xFF2F80ED)),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: onTap,
                                child: SizedBox(
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.font10(context) * 1.9,
                                        height:
                                            AppDimensions.height10(context) *
                                                0.1,
                                        color: const Color(0xFF2F80ED)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimensions.width10(context),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: BottomScrollView().scroll(
                            context: context,
                            list: list,
                            onSelectedItemChanged: onSelectedItemChanged,
                            //     (int index) {
                            //   setState(() {
                            //     goalIndex = index;
                            //   });
                            // },
                          ),
                          //     ListWheelScrollView(
                          //   itemExtent: 40,
                          //   magnification: 1.3,
                          //   physics: FixedExtentScrollPhysics(),
                          //   useMagnifier:
                          //       true, // Set the height of each statement
                          //   children: goalName
                          //       .map((statement) =>
                          //           Text(
                          //               statement,
                          //               style:
                          //                   TextStyle(
                          //                 fontSize:
                          //                     AppDimensions.font10(context) *
                          //                         2.0,
                          //                 fontWeight:
                          //                     FontWeight.w400,
                          //               )))
                          //       .toList(),
                          //   onSelectedItemChanged:
                          //       (int index) {
                          //     setState(() {
                          //       goalIndex = index;
                          //     });
                          //   },
                          // ),
                        ),
                      ],
                    ),
                    BottomScrollView().line(context,
                        top: AppDimensions.height10(context) * 13.5),
                    BottomScrollView().line(context,
                        top: AppDimensions.height10(context) * 18.0),
                    // Positioned(
                    //   top: AppDimensions.height10(
                    //           context) *
                    //       13.5,
                    //   right:
                    //       AppDimensions.height10(
                    //               context) *
                    //           2.0,
                    //   left:
                    //       AppDimensions.height10(
                    //               context) *
                    //           2.0,
                    //   child: Align(
                    //     alignment:
                    //         const Alignment(0, 0),
                    //     child: Container(
                    //         width: 400,
                    //         height: 1,
                    //         color: const Color(
                    //                 0xFF828282)
                    //             .withOpacity(
                    //                 0.5)),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: AppDimensions.height10(
                    //           context) *
                    //       18.0,
                    //   right:
                    //       AppDimensions.height10(
                    //               context) *
                    //           2.0,
                    //   left:
                    //       AppDimensions.height10(
                    //               context) *
                    //           2.0,
                    //   child: Align(
                    //     alignment:
                    //         const Alignment(0, 0),
                    //     child: Container(
                    //         width: 400,
                    //         height: 1,
                    //         color: const Color(
                    //                 0xFF828282)
                    //             .withOpacity(
                    //                 0.5)),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customBottomContainer(
    context,
    String text1,
    String text2,
  ) {
    return Container(
      // width: AppDimensions.width10(context) * 11.5,
      height: AppDimensions.height10(context) * 3.4,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.0),
          border: Border.all(
              width: AppDimensions.width10(context) * 0.1,
              color: const Color(0xFFE0E0E0))),
      margin: EdgeInsets.only(
          left: AppDimensions.width10(context) * 1.3,
          right: AppDimensions.width10(context) * 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: AppDimensions.width10(context) * 1.0),
            child: Text(
              text1,
              style: TextStyle(
                  fontSize: AppDimensions.font10(context) * 1.4,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffFA9934)),
            ),
          ),
          Container(
            //width: AppDimensions.width10(context) * 1.9,
            height: AppDimensions.height10(context) * 2.4,
            margin: EdgeInsets.only(left: AppDimensions.width10(context) * 0.8),
            child: Center(
              child: Text(
                text2,
                style: TextStyle(
                    fontSize: AppDimensions.font10(context) * 1.4,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFA9934)),
              ),
            ),
          ),
          Container(
            width: AppDimensions.width10(context) * 2.4,
            height: AppDimensions.height10(context) * 2.4,
            margin: EdgeInsets.only(
                left: AppDimensions.height10(context) * 0.8,
                right: AppDimensions.height10(context) * 1.0,
                bottom: AppDimensions.height10(context) * 0.3),
            child: const Icon(
              Icons.arrow_drop_down,
              color: Color(0xffFA9934),
            ),
          )
        ],
      ),
    );
  }

  Widget customClearWidget(context) {
    return Container(
      //width: AppDimensions.width10(context) * 3.9,
      height: AppDimensions.height10(context) * 3.4,
      margin: EdgeInsets.only(
          left: AppDimensions.width10(context) * 1.0,
          right: AppDimensions.width10(context) * 7.0),
      alignment: Alignment.centerLeft,
      child: Text(
        'Clear all',
        style: TextStyle(
            fontSize: AppDimensions.font10(context) * 1.4,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            color: const Color(0xFFFA9934)),
      ),
    );
  }

  Widget customSearchWidget(context, void Function()? onTap) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: AppDimensions.width10(context) * 4.9,
        height: AppDimensions.height10(context) * 5.0,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xFFFBFBFB)),
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(
            'assets/images/Search.webp',
            width: AppDimensions.width10(context) * 5,
            height: AppDimensions.height10(context) * 5,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget customBottomIcon(context) {
    return SizedBox(
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
    );
  }
}
