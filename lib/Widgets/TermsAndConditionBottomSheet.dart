import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Widgets/PopupAlert.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class cards extends StatelessWidget {
  cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('termsSheet'),
            onPressed: () {
              termsSheet(context);
            },
          ),
        ],
      ),
    );
  }
}

void termsSheet(context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: false,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
    backgroundColor: Colors.blue,
    builder: (context) => Container(
      height: AppDimensions.height10(context) * 33.3,
      width: AppDimensions.height10(context) * 39.4,
      decoration: BoxDecoration(
          color: const Color(0xFF646464),
          borderRadius:
              BorderRadius.circular(AppDimensions.height10(context) * 1.4)),
      child: Stack(children: [
        Align(
          alignment: Alignment(0, -0.3),
          child: Image.asset(
            'assets/images/potenic__icon.png',
            width: AppDimensions.height10(context) * 8.202,
            height: AppDimensions.height10(context) * 11.2,
          ),
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(width: AppDimensions.height10(context)*1.0,),
            Container(
              width: AppDimensions.height10(context) * 2.4,
              height: AppDimensions.height10(context) * 2.4,
              margin: EdgeInsets.only(
                  left: AppDimensions.height10(context) * 38.7,
                  top: AppDimensions.height10(context) * 1.9),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/Close.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              //width: AppDimensions.height10(context) * 23.4,
              alignment: Alignment.centerLeft,
              height: AppDimensions.height10(context) * 2.3,
              margin: EdgeInsets.only(
                left: AppDimensions.height10(context) * 4.5,
              ),
              child: Text(
                'Please read before continuing',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: AppDimensions.height10(context) * 1.6,
                ),
              ),
            ),

            Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 2.0,
                    left: AppDimensions.height10(context) * 1.8,
                    right: AppDimensions.height10(context) * 1.8),
                height: AppDimensions.height10(context) * 6.0,
                width: AppDimensions.height10(context) * 36.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 1.99),
                      // color: Colors.amberAccent,
                      width: AppDimensions.height10(context) * 12.8,
                      height: AppDimensions.height10(context) * 2.3,
                      child: Text(
                        'Terms of use',
                        style: TextStyle(
                          color: const Color(0xFF646464),
                          fontSize: AppDimensions.height10(context) * 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 2.4,
                      height: AppDimensions.height10(context) * 1.3,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 2.3),
                      child: Image.asset(
                        'assets/images/backbtn.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(
                    top: AppDimensions.height10(context) * 1.0,
                    left: AppDimensions.height10(context) * 1.8,
                    right: AppDimensions.height10(context) * 1.8),
                height: AppDimensions.height10(context) * 6.0,
                width: AppDimensions.height10(context) * 36.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10(context) * 1.99),
                      // color: Colors.amberAccent,
                      width: AppDimensions.height10(context) * 12.8,
                      height: AppDimensions.height10(context) * 2.3,
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: const Color(0xFF646464),
                          fontSize: AppDimensions.height10(context) * 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 2.4,
                      height: AppDimensions.height10(context) * 1.3,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 2.3),
                      child: Image.asset(
                        'assets/images/backbtn.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: AppDimensions.height10(context) * 3.1,
            ),
            Center(
              child: Container(
                height: AppDimensions.height10(context) * 6.0,
                width: AppDimensions.height10(context) * 28.0,
                child: Row(
                  children: [
                    Container(
                      height: AppDimensions.height10(context) * 5.0,
                      width: AppDimensions.height10(context) * 13.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: Color.fromRGBO(140, 100, 138, 1)),
                          )),
                    ),
                    SizedBox(
                      width: AppDimensions.height10(context) * 2.0,
                    ),
                    Container(
                        height: AppDimensions.height10(context) * 5.0,
                        width: AppDimensions.height10(context) * 13.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white),
                            color: Color.fromRGBO(250, 153, 52, 1)),
                        child: TextButton(
                          onPressed: () {
                            showAnimatedDialog(
                              animationType: DialogTransitionType.fadeScale,
                              curve: Curves.easeInOut,
                              duration: Duration(seconds: 1),
                              context: context,
                              builder: (BuildContext context) => Container(
                                width: AppDimensions.height10(context) * 27.0,
                                height: AppDimensions.height10(context) * 20.4,
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              1.4)),
                                  actionsPadding: const EdgeInsets.all(0.0),
                                  contentPadding: const EdgeInsets.all(0.0),
                                  titlePadding: const EdgeInsets.all(0.0),
                                  title: Container(
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            1.9,
                                        right: AppDimensions.height10(context) *
                                            1.6,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                0),
                                    height:
                                        AppDimensions.height10(context) * 4.9,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Text(
                                      "Potenic wants to use your \n Google account to sign in",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Laila",
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.7,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  content: Container(
                                    // color:Colors.red,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.9,
                                        left: AppDimensions.height10(context) *
                                            1.6,
                                        right: AppDimensions.height10(context) *
                                            1.6),
                                    height:
                                        AppDimensions.height10(context) * 3.2,
                                    width:
                                        AppDimensions.height10(context) * 23.8,
                                    child: Text(
                                      "This allows the app and website to \n share information about you.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                        fontFamily: "Laila",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Column(
                                      children: [
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.4,
                                          width: double.infinity,
                                          color: const Color.fromRGBO(
                                              0, 122, 255, 1),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Continue',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      AppDimensions.height10(
                                                              context) *
                                                          1.7,
                                                  fontFamily: "Laila",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height:
                                              AppDimensions.height10(context) *
                                                  4.4,
                                          width:
                                              AppDimensions.height10(context) *
                                                  27.0,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.7,
                                                fontFamily: "Laila",
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    0, 122, 255, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: const Text('Agree',
                              style: TextStyle(color: Colors.white)),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    ),
  );
}
