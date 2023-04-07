import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeStopwatch.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeWelldone.dart';
import 'package:flutter_ui/utilities/app_contants.dart';
import 'package:flutter_ui/utilities/backDecor.dart';

class emotions extends StatelessWidget {
  const emotions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Center(
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/Close.png',
                width: 26,
                height: 26,
                fit: BoxFit.cover,
              )),
        )
      ]),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Appconstants.bg_image_dashboard),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 186,
                height: 24,
                margin: EdgeInsets.only(bottom: 105, top: 46),
                alignment: Alignment.center,
                child: Text(
                  'Meditation Session',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                width: 359,
                height: 148,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 86),
                child: Column(
                  children: [
                    Text(
                      'How do you feel',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'before',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff8C648A)),
                        ),
                        Text(
                          ' your practice?',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 52),
                height: 137,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      height: 127,
                      width: 125,
                      margin: EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Color(0xff546096),
                      ),
                      child: Text(
                        'I feel very \nlow & dis-\nmotivated',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 127,
                      width: 125,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Color(0xff7291A0),
                      ),
                      child: Text(
                        'I feel slightly \nirritated, not \nfussed really',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 137,
                      height: 137,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Container(
                        height: 127,
                        width: 125,
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white),
                          color: Color(0xffE1C44F),
                        ),
                        child: Text(
                          'I feel ok',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 127,
                      width: 125,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Color(0xffFA9458),
                      ),
                      child: Text(
                        'Motivated and \nready to start',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 127,
                      width: 125,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Color(0xffFF7C42),
                      ),
                      child: Text(
                        'Great, cannot \nwait to start!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                width: 76,
                height: 76,
                margin: EdgeInsets.only(bottom: 113),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Container(
                        height: 27,
                        width: 27,
                        margin: EdgeInsets.only(left: 3),
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
                      width: 76,
                      height: 19,
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        'Add Notes',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 325,
                height: 60,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 50,
                      width: 143,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 2, color: Color(0xffFA9934))),
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
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ))),
                  Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffFCC10D),
                              Color(0xffFDA210),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 2, color: Colors.transparent)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => welldone_splash()));
                          },
                          child: Text(
                            'Finished Practice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
