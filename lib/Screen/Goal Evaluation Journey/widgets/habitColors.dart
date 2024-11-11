import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Timeline%20Journey/timeline.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/circle_container.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'circlesRow.dart';


final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

AfterSessionText( option){
  if(option == 1){
    return '“Not great, haven’t\nenjoyed it”';
  }else if(option == 2){
    return '“I got distracted, it\nwas hard to focus”';
  }else if(option == 3){
    return '“It was ok”';
  }else if(option == 4){
    return '“Good, I quite\nliked it”';
  }else if(option == 5){
    return '“Great, I enjoyed the\nexperience”';
  }
}


habitComponent(BuildContext context, options, outerColor,subscription,report){
  return Container(
    width: AppDimensions.width10(context) * 38.2,
    //height: AppDimensions.height10(context) * 147.8,
    margin: EdgeInsets.only(
        top: AppDimensions.height10(context) * 4.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            AppDimensions.height10(context) * 2.0),
        color: const Color(0xFFFFFFFF)),
    child: Column(
      children: [
        Container(
          width: AppDimensions.width10(context) * 38.2,
          //height: AppDimensions.height10(context) * 55.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    AppDimensions.height10(context) * 2.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: options == null?[
                    const Color(0xFF546096)
                      .withOpacity(0.01),
                    const Color(0xFF546096)
                        .withOpacity(0.20)]
                      :options![0].containsKey('option5')
                      ? [
                    const Color(0xFFFFFBF9),
                    const Color(0xFFBBE5CD)
                  ]
                      : options![0].containsKey('option4')
                      ? [
                    const Color(0xFFFFFFFF),
                    const Color(0xFFFA9458)
                        .withOpacity(0.31)
                  ]
                      : options![0].containsKey('option3')
                      ? [
                    const Color(0xFFFFFFFF),
                    const Color(0xFFE1C44F)
                        .withOpacity(0.10)
                  ]
                      : options![0]
                      .containsKey('option2')
                      ? [
                    const Color(0xFFF4FCFF),
                    const Color(0xFF7291A0)
                        .withOpacity(0.20)
                  ]
                      : [
                    const Color(0xFF546096)
                        .withOpacity(0.01),
                    const Color(0xFF546096)
                        .withOpacity(0.20)
                  ])),
          child: Column(
            children: [
             report? Container(
                  width:
                  AppDimensions.width10(context) * 17.0,
                  height:
                  AppDimensions.height10(context) * 17.0,
                  margin: EdgeInsets.only(
                      bottom:
                      AppDimensions.height10(context) *
                          6.0,
                      top: AppDimensions.height10(context) *
                          8.0),
                  child: CircularFormation(
                      size: 150,
                      circleColor: Colors.transparent,
                      selection: options == null?1: options![0]
                          .containsKey('option5')
                          ? 5
                          : options![0].containsKey('option4')
                          ? 4
                          : options![0]
                          .containsKey('option3')
                          ? 3
                          : options![0].containsKey(
                          'option2')
                          ? 2
                          : 1,
                      outerCircleColors: outerColor)):
             Container(
               margin: EdgeInsets.only(
                   top: AppDimensions.height10(context) *
                       4.0),
               child: Center(
                 child: Text(
                   'How did you feel after\nfinishing your practice?',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       color: const Color(0xFF437296),
                       height: 1.2,
                       fontSize: UpdatedDimensions.font10(
                           context) *
                           2.0,
                       fontWeight: FontWeight.w600),
                 ),
               ),
             ),
              Container(
                width: AppDimensions.width10(context) * 8.4,
                height: AppDimensions.height10(context) * 0.2,
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) *
                        0.9),
                color: const Color(0xFFF5F5F5),
              ),
              Container(
                width: AppDimensions.width10(context) * 30.9,

                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) *
                        3.0),
                child: Center(
                  child: Text(
                    'Majority of the time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize:
                        UpdatedDimensions.font10(context) *
                            1.8,
                        fontWeight: FontWeight.w600,
                        color:options == null? const Color(
                            0xFF546096):options![0]
                            .containsKey('option5')
                            ? const Color(0xFFFF6C2C)
                            : options![0]
                            .containsKey('option4')
                            ? const Color(0xFFFA9458)
                            : options![0].containsKey(
                            'option3')
                            ? const Color(0xFFE1C44F)
                            : options![0].containsKey(
                            'option2')
                            ? const Color(
                            0xFF7291A0)
                            : const Color(
                            0xFF546096)),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 30.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            1.0),
                    child: Center(
                      child: Text(
                        options == null?'“I feel very low\n& irritated”': options![0].containsKey('option5')
                            ? '“I feel excited and\ngood in myself”'
                            : options![0]
                            .containsKey('option4')
                            ? '“I feel focused and\nmotivated”'
                            : options![0].containsKey(
                            'option3')
                            ? '“I feel ok”'
                            : options![0].containsKey(
                            'option2')
                            ? '“I feel alright, but\nslightly down”'
                            : '“I feel very low\n& irritated”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: AppDimensions.height10(
                                context) *
                                0.15,
                            fontSize: UpdatedDimensions.font10(
                                context) *
                                2.8,
                            fontWeight: FontWeight.w700,
                            color:options == null?const Color(
                                0xFF546096): options![0]
                                .containsKey('option5')
                                ? const Color(0xFF219653)
                                : options![0].containsKey(
                                'option4')
                                ? const Color(0xFFFF7C42)
                                : options![0].containsKey(
                                'option3')
                                ? const Color(
                                0xFFE1C44F)
                                : options![0]
                                .containsKey(
                                'option2')
                                ? const Color(
                                0xFF7291A0)
                                : const Color(
                                0xFF546096)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            1.2),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: UpdatedDimensions
                                    .font10(context) *
                                    4.5,
                                fontFamily: 'laila',
                                height: 1.2,
                                fontWeight: FontWeight.w400,
                                color: options==null? const Color(0xFF546096):options![0]
                                    .containsKey(
                                    'option5')
                                    ? const Color(0xFF219653)
                                    : options![0].containsKey(
                                    'option4')
                                    ? const Color(0xFFFF7C42)
                                    : options![0]
                                    .containsKey(
                                    'option3')
                                    ? const Color(
                                    0xFFE1C44F)
                                    : options![0]
                                    .containsKey(
                                    'option2')
                                    ? const Color(
                                    0xFF7291A0)
                                    : const Color(
                                    0xFF546096)),
                            children: [
                              TextSpan(
                                  text: options == null?'0': options!
                                      .elementAt(0)
                                      .values
                                      .toString()
                                      .replaceAll('(', '')
                                      .replaceAll(')', '')),
                              TextSpan(
                                  text: 'x',
                                  style: TextStyle(
                                      fontSize:
                                      UpdatedDimensions.font10(
                                          context) *
                                          2.0))
                            ])),
                  ),
                  circlesInRowColored(
                      context,
                      options == null?0: int.parse(options!
                          .elementAt(0)
                          .values
                          .toString()
                          .replaceAll('(', '')
                          .replaceAll(')', '')),
                          options ==null? const Color(0xFF546096)
                          :options![0].containsKey('option5')
                          ? const Color(0xFF219653)
                          : options![0].containsKey('option4')
                          ? const Color(0xFFFF7C42)
                          : options![0]
                          .containsKey('option3')
                          ? const Color(0xFFE1C44F)
                          : options![0].containsKey(
                          'option2')
                          ? const Color(0xFF7291A0)
                          : const Color(0xFF546096)),
                  SizedBox(
                    height:
                    AppDimensions.height10(context) * 2,
                  )
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options == null?4: options!.length - 1,
            itemBuilder: (((context, index) {
              return Column(
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 30.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            4.0),
                    child: Center(
                      child: Text(
                        options == null?index==0?'“I feel alright, but\nslightly down”':index==1?'“I feel ok”':index==2?'“I feel focused and\nmotivated”': '“I feel excited and\ngood in myself”' :options![index + 1]
                            .containsKey('option5')
                            ? '“I feel excited and\ngood in myself”'
                            : options![index + 1]
                            .containsKey('option4')
                            ? '“I feel focused and\nmotivated”'
                            : options![index + 1]
                            .containsKey(
                            'option3')
                            ? '“I feel ok”'
                            : options![index + 1]
                            .containsKey(
                            'option2')
                            ? '“I feel alright, but\nslightly down”'
                            : '“I feel very low\n& irritated”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: AppDimensions.height10(
                                context) *
                                0.15,
                            fontSize: UpdatedDimensions.font10(
                                context) *
                                2.8,
                            fontWeight: FontWeight.w700,
                            color:options==null? const Color(0xFF546096):options![index + 1]
                                .containsKey('option5')
                                ? const Color(0xFF219653)
                                : options![index + 1]
                                .containsKey(
                                'option4')
                                ? const Color(0xFFFF7C42)
                                : options![index + 1]
                                .containsKey(
                                'option3')
                                ? const Color(
                                0xFFE1C44F)
                                : options![index + 1]
                                .containsKey(
                                'option2')
                                ? const Color(
                                0xFF7291A0)
                                : const Color(0xFF546096)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            1.2),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize:
                                UpdatedDimensions.font10(
                                    context) *
                                    4.5,
                                fontFamily: 'laila',
                                height: 1.2,
                                fontWeight: FontWeight.w400,
                                color: options==null?const Color(0xFF546096): options![index + 1]
                                    .containsKey(
                                    'option5')
                                    ? const Color(0xFF219653)
                                    : options![index + 1]
                                    .containsKey(
                                    'option4')
                                    ? const Color(0xFFFF7C42)
                                    : options![index + 1]
                                    .containsKey(
                                    'option3')
                                    ? const Color(
                                    0xFFE1C44F)
                                    : options![index +
                                    1]
                                    .containsKey(
                                    'option2')
                                    ? const Color(
                                    0xFF7291A0)
                                    : const Color(0xFF546096)),
                            children: [
                              TextSpan(
                                  text: options==null?'0': options!
                                      .elementAt(index + 1)
                                      .values
                                      .toString()
                                      .replaceAll('(', '')
                                      .replaceAll(')', '')),
                              TextSpan(
                                  text: 'x',
                                  style: TextStyle(
                                      fontSize:
                                      UpdatedDimensions.font10(
                                          context) *
                                          2.0))
                            ])),
                  ),
                  circlesInRowColored(
                      context,
                      options==null?0: int.parse(options!
                          .elementAt(index + 1)
                          .values
                          .toString()
                          .replaceAll('(', '')
                          .replaceAll(')', '')),
                      options==null?const Color(0xFF546096): options![index + 1]
                          .containsKey('option5')
                          ? const Color(0xFF219653)
                          : options![index + 1]
                          .containsKey('option4')
                          ? const Color(0xFFFF7C42)
                          : options![index + 1]
                          .containsKey('option3')
                          ? const Color(0xFFE1C44F)
                          : options![index + 1]
                          .containsKey(
                          'option2')
                          ? const Color(
                          0xFF7291A0)
                          : const Color(0xFF546096)),
                  index != 3
                      ? Container(
                    width:
                    AppDimensions.width10(context) *
                        8.4,
                    height: AppDimensions.height10(
                        context) *
                        0.2,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(
                            context) *
                            4.0),
                    color: const Color(0xFFBDBDBD),
                  )
                      : Container(),
                ],
              );
            }))),
        report? Container():SizedBox(
          height: AppDimensions.height10(context) * 3,
        ),
        report? Container():AnimatedScaleButton(
          onTap: () async {
            final SharedPreferences prefs = await _prefs;
            if (subscription == 'active') {
              Navigator.push(
                  context,
                  FadePageRoute(
                      page: timeline(
                        goalId: null,
                        pracId:
                        prefs.getInt("prac_num"),
                      )));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                  content: Text(
                      "This feature is only available for premium members")));
            }
          },
          child: Container(
              height:
              AppDimensions.height10(context) *
                  6.0,
              width:
              AppDimensions.width10(context) *
                  34.2,
              margin: EdgeInsets.only(
                top: AppDimensions.height10(
                    context) *
                    2.7,
                // left: AppDimensions.width10(context) * 2.0,
                //right: AppDimensions.width10(context) * 1.9,
              ),
              decoration: BoxDecoration(
                  color: subscription == 'active'
                      ? Color(0xFF5F5F5)
                      : Colors.black
                      .withOpacity(0.1),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFB695B7),
                  ),
                  borderRadius:
                  BorderRadius.circular(
                      AppDimensions.height10(
                          context) *
                          2.0)),
              child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppDimensions
                              .height10(
                              context) *
                              1.99),
                      child: Text(
                        'View timeline',
                        style: TextStyle(
                          color: const Color(
                              0xFF828282),
                          fontSize:
                          UpdatedDimensions.font10(
                              context) *
                              2,
                          fontWeight:
                          FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                        width:
                        AppDimensions.width10(
                            context) *
                            2.4,
                        height:
                        AppDimensions.height10(
                            context) *
                            1.39,
                        margin: EdgeInsets.only(
                            right: AppDimensions
                                .height10(
                                context) *
                                2.391),
                        child: Image.asset(
                          'assets/images/BTN Back.webp',
                          //width: AppDimensions.width10(context) * 2.6,
                          //height: AppDimensions.height10(context) * 2.6,
                          color: const Color(
                              0xFF828282),
                          fit: BoxFit.cover,
                        ))
                  ])),
        ),
        SizedBox(
          height: AppDimensions.height10(context) * 4,
        )
      ],
    ),
  );
}


habitAfterSessionComponent(BuildContext context, practiceData,){
  return Container(
    width: AppDimensions.width10(context) * 38.2,
    //height: AppDimensions.height10(context) * 147.8,
    margin: EdgeInsets.only(
        top: AppDimensions.height10(context) * 4.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            AppDimensions.height10(context) * 2.0),
        color: const Color(0xFFFFFFFF)),
    child: Column(
      children: [
        Container(
          width: AppDimensions.width10(context) * 38.2,
          //height: AppDimensions.height10(context) * 55.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    AppDimensions.height10(context) * 2.0),
              ),
              gradient:  LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFEADCEB),
                    const Color(0xFFF3E8F3).withOpacity(0.3)
                  ])),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) *
                        4.0),
                child: Center(
                  child: Text(
                    'How has your practice\nbeen going?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xFF437296),
                        height: 1.2,
                        fontSize: UpdatedDimensions.font10(
                            context) *
                            2.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.width10(context) * 30.9,

                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) *
                        3.0),
                child: Center(
                  child: Text(
                    'Majority of the time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize:
                        UpdatedDimensions.font10(context) *
                            1.8,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFB695B7)),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 30.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            1.0),
                    child: Center(
                      child: Text(
                       practiceData==null?AfterSessionText(1): AfterSessionText(practiceData[0]['feelingsAfterSession']),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: AppDimensions.height10(
                                context) *
                                0.15,
                            fontSize: UpdatedDimensions.font10(
                                context) *
                                2.8,
                            fontFamily: 'Laila',
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFB695B7)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            1.2),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: UpdatedDimensions
                                    .font10(context) *
                                    4.5,
                                fontFamily: 'laila',
                                height: 1.2,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFB695B7)),
                            children: [
                              TextSpan(
                                  text: practiceData==null?'0': practiceData[0]['AfterTotal'].toString()),
                              TextSpan(
                                  text: 'x',
                                  style: TextStyle(
                                      fontSize:
                                      UpdatedDimensions.font10(
                                          context) *
                                          2.0))
                            ])),
                  ),
                  circlesInRowColored(
                      context,
                      practiceData==null?0: int.parse(practiceData[0]['AfterTotal']
                          .toString()),
                      const Color(0xFFB695B7)),
                  SizedBox(
                    height:
                    AppDimensions.height10(context) * 2,
                  )
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: practiceData==null?4: practiceData!.length - 1,
            itemBuilder: (((context, index) {
              return Column(
                children: [
                  Container(
                    width: AppDimensions.width10(context) * 30.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            4.0),
                    child: Center(
                      child: Text(
                        practiceData ==null? AfterSessionText(index+2):AfterSessionText(practiceData[index+1]['feelingsAfterSession']),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: AppDimensions.height10(
                                context) *
                                0.15,
                            fontSize: UpdatedDimensions.font10(
                                context) *
                                2.8,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFB695B7)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) *
                            1.2),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize:
                                UpdatedDimensions.font10(
                                    context) *
                                    4.5,
                                fontFamily: 'laila',
                                height: 1.2,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFB695B7)),
                            children: [
                              TextSpan(
                                  text: practiceData==null?'0': practiceData[index+1]['AfterTotal'].toString()),
                              TextSpan(
                                  text: 'x',
                                  style: TextStyle(
                                      fontSize:
                                      UpdatedDimensions.font10(
                                          context) *
                                          2.0))
                            ])),
                  ),
                  circlesInRowColored(
                      context,
                      practiceData==null?0: int.parse(practiceData[index+1]['AfterTotal']),
                      const Color(0xFFB695B7)),
                ],
              );
            }))),
        SizedBox(
          height: AppDimensions.height10(context) * 4,
        )
      ],
    ),
  );
}