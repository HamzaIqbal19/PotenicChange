
import 'package:flutter/cupertino.dart';
import 'package:potenic_app/utils/app_dimensions.dart';


class GoalLevelComponents {
  Widget goalLevelCircle(BuildContext context, goalLevel) {
    return Container(
      width: AppDimensions.height10(
          context) *
          11.4,
      height: AppDimensions.height10(
          context) *
          11.4,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFDFBE0)),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          SizedBox(
            width:
            AppDimensions.width10(
                context) *
                9.3,
            // height: AppDimensions
            //         .height10(
            //             context) *
            //     3.4,
            child: Text(
              'Goal\nLevel',
              textAlign:
              TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions
                      .height10(
                      context) *
                      1.8,
                  fontWeight:
                  FontWeight.w600,
                  color: const Color(
                      0xFF437296)),
            ),
          ),
          Container(
            width:
            AppDimensions.width10(
                context) *
                6.3,
            // height: AppDimensions
            //         .height10(
            //             context) *
            //     3.3,
            margin: EdgeInsets.only(
                top: AppDimensions
                    .height10(
                    context) *
                    0.5),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              children: [
                Text(
                  goalLevel,
                  textAlign: TextAlign
                      .center,
                  style: TextStyle(
                      fontSize: AppDimensions
                          .font10(
                          context) *
                          2.8,
                      fontWeight:
                      FontWeight
                          .w600,
                      color: const Color(
                          0xFF464646)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppDimensions
                          .height10(
                          context) *
                          1.5),
                  child: Text(
                    '/5',
                    textAlign:
                    TextAlign
                        .center,
                    style: TextStyle(
                        fontSize:
                        AppDimensions.font10(
                            context) *
                            2,
                        fontWeight:
                        FontWeight
                            .w300,
                        color: const Color(
                            0xFF464646)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget activeDays(BuildContext context, activeDays){
    return  Container(
      width: AppDimensions.height10(
          context) *
          11.4,
      height: AppDimensions.height10(
          context) *
          11.4,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFDFBE0)),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          SizedBox(
            width:
            AppDimensions.width10(
                context) *
                9.3,
            // height: AppDimensions
            //         .height10(
            //             context) *
            //     3.55,
            child: Text(
              'No. of\nActive days',
              textAlign:
              TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions
                      .height10(
                      context) *
                      1.8,
                  fontWeight:
                  FontWeight.w600,
                  color: const Color(
                      0xFF437296)),
            ),
          ),
          Container(
            width:
            AppDimensions.width10(
                context) *
                6.3,
            // height: AppDimensions
            //         .height10(
            //             context) *
            //     3.3,
            margin: EdgeInsets.only(
                top: AppDimensions
                    .height10(
                    context) *
                    0.5),
            child: Text(
              activeDays,
              textAlign:
              TextAlign.center,
              style: TextStyle(
                  fontSize: AppDimensions
                      .height10(
                      context) *
                      2.8,
                  fontWeight:
                  FontWeight.w500,
                  color: const Color(
                      0xFF464646)),
            ),
          )
        ],
      ),
    );
  }
}