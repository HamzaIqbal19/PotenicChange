import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/capture_inspiration/capture_inpirations_goals.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_dimensions.dart';
import 'inpiration_landing.dart';

class inspiration_motivation extends StatefulWidget {
  const inspiration_motivation({super.key});

  @override
  State<inspiration_motivation> createState() => _inspiration_motivationState();
}

class _inspiration_motivationState extends State<inspiration_motivation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10 * 2.6,
                    height: AppDimensions.height10 * 2.6,
                    fit: BoxFit.cover,
                  )),
            ),
          ]),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg_inpiration_purple.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          Align(
            alignment: Alignment(0, 0.995),
            child: Container(
              width: AppDimensions.height10 * 11.1,
              height: AppDimensions.height10 * 27.6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/Inspiration_dust 1.png'))),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.45),
            child: Container(
              height: AppDimensions.height10 * 57.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/Inspiration_Glow 1.png'))),
              child: Center(
                child: Container(
                  height: AppDimensions.height10 * 35.9,
                  width: AppDimensions.height10 * 35.9,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Inspiration_center 1.png'))),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inspiraton_goals(
                                    data_saved: false,
                                  )),
                        );
                      },
                      child: Container(
                        width: AppDimensions.height10 * 16.7,
                        height: AppDimensions.height10 * 16.8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
                        child: Center(
                          child: GradientText(
                            'Record your\ninspiration',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppDimensions.height10 * 2.0,
                              fontWeight: FontWeight.w600,
                            ),
                            colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              inspiration_landing(muliple_insp: true)),
                    );
                  },
                  child: Container(
                    width: AppDimensions.height10 * 34.3,
                    height: AppDimensions.height10 * 7.9,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 10.3,
                        bottom: AppDimensions.height10 * 1.7),
                    child: GradientText(
                      'My current\ninspirations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 3.0,
                          fontWeight: FontWeight.w700,
                          height: 1.3),
                      colors: [Color(0xffFA9934), Color(0xffEDD15E)],
                    ),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 34.9,
                  height: AppDimensions.height10 * 12.1,
                  //margin: EdgeInsets.only(bottom: AppDimensions.height10 * 2.0),
                  child: Text(
                      'Use this space to capture\ninspirational material that motivates and\npushes you forward towards achieving\nyour personal growth goals. ',
                      textAlign: TextAlign.center,
                      textHeightBehavior: TextHeightBehavior(
                          leadingDistribution: TextLeadingDistribution.even),
                      style: TextStyle(
                          height: 1.3,
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF).withOpacity(0.9),
                          fontFamily: 'laila')),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              width: AppDimensions.height10 * 17.0,
              height: AppDimensions.height10 * 0.5,
              margin: EdgeInsets.only(bottom: AppDimensions.height10 * 1.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  color: Color(0xFFFFFFFF).withOpacity(0.3)),
            ),
          )
        ]),
      ),
    );
  }
}
