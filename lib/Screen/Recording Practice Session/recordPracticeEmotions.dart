import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeStopwatch.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';

import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeWelldone.dart';

import '../../utils/app_dimensions.dart';

class emotions extends StatefulWidget {
  final bool summary;
  const emotions({super.key, required this.summary});

  @override
  State<emotions> createState() => _emotionsState();
}

class _emotionsState extends State<emotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          )
        ],
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: AppDimensions.height10 * 18.6,
                  height: AppDimensions.height10 * 2.4,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10 * 10.5,
                      top: AppDimensions.height10 * 4.6),
                  alignment: Alignment.center,
                  child: Text(
                    'Meditation Session',
                    style: TextStyle(
                        fontSize: AppDimensions.height10 * 2.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 35.9,
                  height: AppDimensions.height10 * 14.8,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: AppDimensions.height10 * 8.6),
                  child: Column(
                    children: [
                      Text(
                        'How do you feel',
                        style: TextStyle(
                            fontSize: AppDimensions.height10 * 2.8,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'before',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 2.8,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff8C648A)),
                          ),
                          Text(
                            ' your practice?',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 2.8,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10 * 5.2,
                      left: AppDimensions.height10 * 1.0),
                  height: AppDimensions.height10 * 13.7,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Container(
                        height: AppDimensions.height10 * 12.7,
                        width: AppDimensions.height10 * 12.5,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10 * 0.2,
                              color: Colors.white),
                          color: Color(0xff546096),
                        ),
                        child: Text(
                          'I feel very \nlow & dis-\nmotivated',
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10 * 12.7,
                        width: AppDimensions.height10 * 12.5,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10 * 0.2,
                              color: Colors.white),
                          color: Color(0xff7291A0),
                        ),
                        child: Text(
                          'I feel slightly \nirritated, not \nfussed really',
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 13.7,
                        height: AppDimensions.height10 * 13.7,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.height10 * 0.2,
                                color: Colors.white)),
                        child: Container(
                          height: AppDimensions.height10 * 12.7,
                          width: AppDimensions.height10 * 12.5,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              vertical: AppDimensions.height10 * 0.4,
                              horizontal: AppDimensions.height10 * 0.3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.height10 * 0.2,
                                color: Colors.white),
                            color: Color(0xffE1C44F),
                          ),
                          child: Text(
                            'I feel ok',
                            style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10 * 12.7,
                        width: AppDimensions.height10 * 12.5,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 1.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10 * 0.2,
                              color: Colors.white),
                          color: Color(0xffFA9458),
                        ),
                        child: Text(
                          'Motivated and \nready to start',
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: AppDimensions.height10 * 12.7,
                        width: AppDimensions.height10 * 12.5,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: AppDimensions.height10 * 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10 * 0.2,
                              color: Colors.white),
                          color: Color(0xffFF7C42),
                        ),
                        child: Text(
                          'Great, cannot \nwait to start!',
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 7.6,
                  height: AppDimensions.height10 * 7.6,
                  margin:
                      EdgeInsets.only(bottom: AppDimensions.height10 * 11.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 5.0,
                        height: AppDimensions.height10 * 5.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: AppDimensions.height10 * 0.2,
                                color: Colors.white)),
                        child: Container(
                          height: AppDimensions.height10 * 2.7,
                          width: AppDimensions.height10 * 2.7,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 0.3),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_note,
                                //size: 27,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Container(
                        width: AppDimensions.height10 * 7.6,
                        height: AppDimensions.height10 * 1.9,
                        margin:
                            EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                        child: Text(
                          'Add Notes',
                          style: TextStyle(
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: AppDimensions.height10 * 32.5,
                  height: AppDimensions.height10 * 6.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: AppDimensions.height10 * 5.0,
                            width: AppDimensions.height10 * 14.3,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10 * 1.2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10 * 5.0),
                                border: Border.all(
                                    width: AppDimensions.height10 * 0.2,
                                    color: Color(0xffFA9934))),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => clocks()));
                                },
                                child: Text(
                                  'Use Timer',
                                  style: TextStyle(
                                      color: Color(0xffFA9934),
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w600),
                                ))),
                        Container(
                            height: AppDimensions.height10 * 5.0,
                            width: AppDimensions.height10 * 17.0,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xffFCC10D),
                                  Color(0xffFDA210),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 5.0),
                            ),
                            child: Container(
                              child: widget.summary
                                  ? TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    practice_summary()));
                                      },
                                      child: Text(
                                        'Update Summary',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w600),
                                      ))
                                  : TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    welldone_splash()));
                                      },
                                      child: Text(
                                        'Finished practice',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                AppDimensions.height10 * 1.6,
                                            fontWeight: FontWeight.w600),
                                      )),
                            ))
                      ]),
                ),
              ],
            ),
          ),
          OfflineBuilder(
              debounceDuration: Duration(milliseconds: 3),
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: AppDimensions.height10 * 3.0,
                        color:
                            connected ? Color(0xFF27AE60) : Color(0xFFFE6624),
                        child: Center(
                          child: Text(
                            connected ? 'Back Online' : 'You’re Offline',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.4,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFBFBFB)),
                          ),
                        ),
                      ),
                    ))
                  ],
                );
              },
              child: Container())
        ]),
      ),
    );
  }
}
