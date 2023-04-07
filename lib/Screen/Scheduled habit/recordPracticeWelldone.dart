import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeFellingAftr.dart';
import 'package:flutter_ui/utilities/mult_circles.dart';

import '../../utilities/app_contants.dart';

class welldone_splash extends StatefulWidget {
  const welldone_splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return welldone_splashState();
  }
}

class welldone_splashState extends State<welldone_splash> {
  bool data = false;
  int myAmount = 0;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 1), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => feelingsAfter(),
      ),
    );
    // print('==================================');
  }

  @override
  Widget build(BuildContext context) {
    // print("app dimension:${AppDimensions.height10 }");
    // print("app dimension:${AppDimensions.screenHeight }");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Meditation')),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Appconstants.bg_image_dashboard),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 259,
              height: 148,
              margin: EdgeInsets.only(left: 27, right: 27),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Well Done!\n',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text('Now, let’s record your\npractice.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
