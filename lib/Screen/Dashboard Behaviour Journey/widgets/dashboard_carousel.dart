import 'package:carousel_slider/carousel_slider.dart' ;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour%20Journey/widgets/tooltips.dart';
import 'package:potenic_app/Widgets/TimeWidget.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/formattedTime.dart';
import 'package:potenic_app/utils/utils.dart';
import 'package:super_tooltip/super_tooltip.dart';

dashboardCarousel(
  BuildContext context, CarouselSliderController controller, SuperTooltipController superTooltipController,skipFunc,nextFunc,
  dashboardData,
  int currentIndex,
  final ValueChanged<TwoValues<String, int>> onCountChanged,
) {
  DateTime currentDate = DateTime.now();
  bool currentItem = false;
  bool isCenterItem = false;
  String currentFocused = currentDate.toString();

  return SizedBox(
    child: Stack(
     // crossAxisAlignment: CrossAxisAlignment.center,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: AppDimensions.height10(context) * 3),
          alignment: Alignment.topCenter,
          child: CarouselSlider.builder(
            carouselController: controller,
            itemCount: 15,
            itemBuilder: (context, index, realIndex) {
              DateTime dayDate = currentDate.add(Duration(days: index -7));
              var currentPractices = dashboardData == null ? "0/0" : "${dashboardData[formatDates(dayDate.toString())]['dashBoardData']['completePractice']}/${dashboardData[formatDates(dayDate.toString())]['dashBoardData']['totalPractice']}";
              var currentData = dashboardData == null ? false : dashboardData[formatDates(dayDate.toString())]['dashBoardData']['totalPractice'] == 0;
              var currentCompleted = dashboardData == null ? "0/0" : dashboardData[formatDates(dayDate.toString())]['dashBoardData']['completePractice'] / dashboardData[formatDates(dayDate.toString())]['dashBoardData']['totalPractice'] == 1;

              currentItem = realIndex == currentIndex;
              if (currentDate == dayDate) {
                isCenterItem = true;
              } else {
                isCenterItem = false;
              }
              return AnimatedScaleButton(
                onTap: (){
                  controller.animateToPage(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: isCenterItem && currentIndex ==realIndex
                      ? UpdatedDimensions.height10(context) * 22.2
                      : UpdatedDimensions.height10(context) * 9.2,
                  width: isCenterItem && currentIndex ==realIndex
                      ? UpdatedDimensions.width10(context) * 20.8
                      : UpdatedDimensions.width10(context) * 8.8,
                  transform: Matrix4.translationValues(0, currentItem ? -30 : 30, 0),
                  decoration: isCenterItem && currentIndex ==realIndex
                      ? const BoxDecoration()
                      : currentItem
                          ? (currentDate.isAfter(dayDate) && currentData)
                              ? BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 0.5),
                                  shape: BoxShape.circle)
                              : (currentDate.isBefore(dayDate) && currentData)
                                  ? BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: Colors.white, width: 0.5),
                                    )
                                  : const BoxDecoration()
                          : const BoxDecoration(),
                  padding: currentItem
                      ? (currentDate.isAfter(dayDate) && currentData)
                          ? const EdgeInsets.all(4)
                          : (currentDate.isBefore(dayDate) && currentData)
                              ? const EdgeInsets.all(4)
                              : const EdgeInsets.all(4)
                      : const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      image: isCenterItem && currentIndex ==realIndex
                          ? DecorationImage(
                              image: dashboardData == null || currentData
                                  ? const AssetImage('assets/images/currentbg2.webp')
                                  : const AssetImage('assets/images/Asset 10 2.webp'),
                              fit: BoxFit.contain)
                          : null,
                      shape: BoxShape.circle,
                      gradient: dashboardData == null
                          ? futureGradient(true)
                          : currentDate.isAfter(dayDate)
                              ? previousGradient(currentData)
                              : currentDate.isBefore(dayDate)
                                  ? futureGradient(currentData)
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                          isCenterItem && currentIndex ==realIndex
                                              ? Colors.transparent
                                              : const Color(0xffF5F1E0),
                                          isCenterItem && currentIndex ==realIndex
                                              ? Colors.transparent
                                              : const Color(0xffEDDC97)
                                        ]),
                      border: isCenterItem && currentIndex ==realIndex
                          ? null
                          : Border.all(color: Colors.white, width: 3),
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: UpdatedDimensions.font10(context) * 1.4,
                              fontFamily: 'Laila',
                              fontWeight: FontWeight.w400,
                              color: dashboardData == null
                                  ? noDataColors(true)
                                  : currentDate.isAfter(dayDate)
                                      ? noDataColors(currentData)
                                      : currentDate.isBefore(dayDate)
                                          ? noDataColors(currentData)
                                          : noDataColors(currentData)),
                          children: [
                            WidgetSpan(
                                child: SizedBox(
                              height: UpdatedDimensions.height10(context) * 2,
                            )),
                            TextSpan(
                              text: DateFormat('EEE\n').format(dayDate).toUpperCase(),
                              style: TextStyle(
                                  fontSize: UpdatedDimensions.font10(context) * 1.2,
                                  fontFamily: 'Laila',
                                  fontWeight: FontWeight.w600,
                                  color: dashboardData == null
                                      ? noDataColors(true)
                                      : currentDate.isAfter(dayDate)
                                          ? noDataColors(currentData)
                                          : currentDate.isBefore(dayDate)
                                              ? noDataColors(currentData)
                                              : noDataColors(currentData)), // Day
                            ),
                            WidgetSpan(
                                child: SizedBox(
                              height: UpdatedDimensions.height10(context) * 2,
                            )),
                            TextSpan(
                              text: DateFormat('dd.MM\n').format(dayDate),
                              style: TextStyle(
                                  fontSize: UpdatedDimensions.font10(context) * 1.4,
                                  fontFamily: 'Laila',
                                  fontWeight: FontWeight.w400,
                                  color: dashboardData == null
                                      ? noDataColors(true)
                                      : currentDate.isAfter(dayDate)
                                          ? noDataColors(currentData)
                                          : currentDate.isBefore(dayDate)
                                              ? noDataColors(currentData)
                                              : noDataColors(currentData)), // Date
                            ),
                            WidgetSpan(
                                child: SizedBox(
                              height: UpdatedDimensions.height10(context) * 2.5,
                            )),
                            WidgetSpan(
                              child: SizedBox(
                                height: UpdatedDimensions.height10(context) * 2.1,
                                width: UpdatedDimensions.width10(context) * 2.1,
                                child: decoratedBox(
                                    context,
                                    dashboardData == null
                                        ? circleColors(true, false)
                                        : currentDate.isAfter(dayDate)
                                            ? circleColors(
                                                currentData, currentCompleted)
                                            : currentDate.isBefore(dayDate)
                                                ? circleColors(
                                                    currentData, currentCompleted)
                                                : circleColors(
                                                    currentData, currentCompleted),
                                    currentDate.isAfter(dayDate)
                                        ? currentPractices
                                        : currentDate.isBefore(dayDate)
                                            ? currentPractices
                                            : currentPractices,
                                    dashboardData == null
                                        ? circleTextColors(true, false)
                                        : currentDate.isAfter(dayDate)
                                            ? circleTextColors(
                                                currentData, currentCompleted)
                                            : currentDate.isBefore(dayDate)
                                                ? circleTextColors(
                                                    currentData, currentCompleted)
                                                : circleTextColors(
                                                    currentData, currentCompleted),
                                    currentDate.isAfter(dayDate),
                                    currentDate.isBefore(dayDate)
                                        ? currentData
                                        : currentData),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.456,
              enlargeFactor: 0.4,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              scrollPhysics: const BouncingScrollPhysics(),
              initialPage: 7,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                currentFocused =
                    currentDate.add(Duration(days: index - 7)).toString();
                TwoValues<String, int> values =
                    TwoValues<String, int>(currentFocused, index);
                onCountChanged(values);
              },
            ),
          ),
        ),
         Positioned(
          bottom: 100,
          child: dashboardTooltip(superTooltipController, context, 4, 'down',skipFunc, nextFunc,Container(height: 0,width: 0,),
           ),
        )

      ],
    ),
  );
}

futureGradient(noData) {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        noData ? Colors.transparent : const Color(0xffF5F1E0),
        noData ? Colors.transparent : const Color(0xffEDDC97)
      ]);
}

previousGradient(noData) {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        noData ? const Color(0xff737372) : const Color(0xffF5F1E0),
        noData ? const Color(0xffC2C2C0) : const Color(0xffEDDC97)
      ]);
}

currentGradient(noData) {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        noData ? const Color(0xff737372) : Colors.transparent,
        noData ? const Color(0xffC2C2C0) : Colors.transparent
      ]);
}

noDataColors(noData) {
  return noData ? const Color(0xFFFBFBFB) : const Color(0xff5B74A6);
}

circleTextColors(noData, completed) {
  return noData || completed
      ? const Color(0xFFFBFBFB)
      : const Color(0xff5B74A6);
}

circleColors(noData, completed) {
  return noData
      ? Colors.transparent
      : completed
          ? const Color(0xFF156F6D)
          : const Color(0xFFFBFBFB);
}

decoratedBox(BuildContext context, Color backgroundColor, data, Color textColor,
    future, noData) {
  if (!future && noData) {
    return DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.white,
      child: Center(
        child: Text(
          data,
          style: TextStyle(
              fontSize: UpdatedDimensions.font10(context) * 1.0,
              fontFamily: 'Laila',
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ),
    );
  } else {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.white),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          data,
          style: TextStyle(
              fontSize: UpdatedDimensions.font10(context),
              fontFamily: 'Laila',
              fontWeight: FontWeight.w400,
              color: textColor),
        ),
      ),
    );
  }
}
