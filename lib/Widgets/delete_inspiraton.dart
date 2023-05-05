import 'package:flutter/material.dart';

import '../utils/app_dimensions.dart';

class delete_insp extends StatelessWidget {
  const delete_insp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => Container(
                width: AppDimensions.height10 * 27.0,
                height: AppDimensions.height10 * 18.2,
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  actionsPadding: EdgeInsets.zero,
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10 * 1.9,
                          right: AppDimensions.height10 * 1.6,
                          left: AppDimensions.height10 * 1.6,
                          bottom: AppDimensions.height10 * 0.2),
                      height: AppDimensions.height10 * 2.2,
                      width: AppDimensions.height10 * 23.8,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 1.7,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF000000)),
                              children: [
                            TextSpan(text: 'Are you sure you want to'),
                            TextSpan(
                              text: ' delete ',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: 'this inspiration?')
                          ]))),
                  content: Container(
                    margin: EdgeInsets.only(
                        bottom: AppDimensions.height10 * 1.5,
                        left: AppDimensions.height10 * 1.6,
                        right: AppDimensions.height10 * 1.6),
                    height: AppDimensions.height10 * 3.4,
                    width: AppDimensions.height10 * 23.8,
                    child: Text(
                      "By clicking 'Yes' you confirm that this\ninspiration will be deleted permanently. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: AppDimensions.height10 * 0.1,
                          child: Divider(
                            color: const Color(0XFF3C3C43).withOpacity(0.29),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 4.2,
                          width: double.infinity,
                          color: const Color(0xFF007AFF),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: AppDimensions.height10 * 1.7,
                                  fontFamily: "Laila",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.1,
                          child: Divider(
                            color: const Color(0XFF3C3C43).withOpacity(0.29),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 4.4,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.7,
                                  fontFamily: "Laila",
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF007AFF)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimensions.height10 * 0.1,
                          child: Divider(
                            color: const Color(0XFF3C3C43).withOpacity(0.29),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
