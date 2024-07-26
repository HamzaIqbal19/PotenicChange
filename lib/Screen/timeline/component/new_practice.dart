import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/timeline/component/imageComponent.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class NewPractice extends StatefulWidget {
  final image1;
  final image2;
  String orangeText;
  String greenText;
  String Status;
  NewPractice({
    super.key,
    required this.orangeText,
    required this.greenText,
    required this.image1,
    required this.image2,
    required this.Status,
  });

  @override
  State<NewPractice> createState() => _NewPracticeState();
}

class _NewPracticeState extends State<NewPractice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensionsUpdated.height10(context) * 27.4,
      margin: EdgeInsets.only(
          top: AppDimensionsUpdated.height10(context) * 2.0,
          right: AppDimensionsUpdated.height10(context) * 1.5,
          left: AppDimensionsUpdated.height10(context) * 1.5),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFBFB),
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 2.6),
      ),
      child: Column(
        children: [
          Container(
            width: AppDimensionsUpdated.width10(context) * 30.7,
            height: AppDimensionsUpdated.height10(context) * 3.5,
            margin: EdgeInsets.only(
              right: AppDimensionsUpdated.width10(context) * 4.5,
              top: AppDimensionsUpdated.height10(context) * 1.5,
            ),
            child: Row(
              children: [
                Container(
                  width: AppDimensionsUpdated.width10(context) * 3.5,
                  height: AppDimensionsUpdated.height10(context) * 3.5,
                  margin: EdgeInsets.only(
                      right: AppDimensionsUpdated.height10(context) * 0.7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/menu_goals_b.webp'),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: AppDimensionsUpdated.width10(context) * 23.6,
                  height: AppDimensionsUpdated.height10(context) * 2.2,
                  child: Text(
                    widget.Status == 'deleted'
                        ? 'Practice deleted'
                        : widget.Status == 'inactive'
                            ? 'Practice inactive'
                            : widget.Status == 'update'
                                ? 'Practice information edited'
                                : 'New practice scheduled',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensionsUpdated.font10(context) * 1.8,
                        color: const Color(0xff437296)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: AppDimensionsUpdated.width10(context) * 35.5,
              height: AppDimensionsUpdated.height10(context) * 16.3,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(
                  top: AppDimensionsUpdated.height10(context) * 2.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius:
                          AppDimensionsUpdated.height10(context) * 0.5,
                      blurRadius: AppDimensionsUpdated.height10(context) * 0.7,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(
                      AppDimensionsUpdated.height10(context) * 2.0),
                  gradient: widget.Status == 'deleted'
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff828282), Color(0xff828282)])
                      : widget.Status == 'inactive'
                          ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFD9B4B4), Color(0xFFF5EDED)])
                          : const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFD9B4B4), Color(0xFFF5EDED)])),
              child: Stack(children: [
                Align(
                  alignment: const Alignment(-1.45, 0),
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 18.6,
                    height: AppDimensionsUpdated.height10(context) * 25.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                goalImages(widget.image1.toString())),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: EdgeInsets.all(
                          AppDimensionsUpdated.width10(context) * 4.1),
                      child: Container(
                        width: AppDimensionsUpdated.width10(context) * 15.8,
                        height: AppDimensionsUpdated.height10(context) * 4.8,
                        alignment: const Alignment(0.1, -0.1),
                        child: Text(
                          widget.orangeText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.6,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff5B74A6)),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.100, 0),
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 13.8,
                    height: AppDimensionsUpdated.height10(context) * 13.8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                        image: DecorationImage(
                          image: AssetImage(
                              practiceImages(widget.image2.toString())),
                          fit: BoxFit.contain,
                          opacity: widget.Status == 'deleted'
                              ? 0.5
                              : widget.Status == 'inactive'
                                  ? 0.3
                                  : 1,
                        )),
                    child: Center(
                      child: Text(
                        widget.greenText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                          height: AppDimensionsUpdated.height10(context) * 0.12,
                          fontWeight: FontWeight.w500,
                          color: widget.Status == 'deleted'
                              ? const Color(0xffFBFBFB).withOpacity(0.4)
                              : widget.Status == 'inactive'
                                  ? const Color(0xffFBFBFB).withOpacity(0.4)
                                  : const Color(0xffFBFBFB),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.9, 0),
                  child: SizedBox(
                    width: AppDimensionsUpdated.width10(context) * 8.2,
                    height: AppDimensionsUpdated.height10(context) * 4.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: AppDimensionsUpdated.height10(context) * 8.2,
                          height: AppDimensionsUpdated.height10(context) * 2.0,
                          child: Text(
                            '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.4,
                                height: AppDimensionsUpdated.height10(context) *
                                    0.12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffFA8552)),
                          ),
                        ),
                        Container(
                          width: AppDimensionsUpdated.height10(context) * 6.3,
                          height: AppDimensionsUpdated.height10(context) * 1.9,
                          alignment: Alignment.topCenter,
                          child: Text(
                            '',
                            style: TextStyle(
                                fontSize:
                                    AppDimensionsUpdated.font10(context) * 1.6,
                                height: AppDimensionsUpdated.height10(context) *
                                    0.12,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFBFBFB)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
