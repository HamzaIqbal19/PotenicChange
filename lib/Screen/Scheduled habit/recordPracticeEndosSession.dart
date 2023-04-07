import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeFellingAftr.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeSummary.dart';
import 'package:flutter_ui/utilities/app_contants.dart';
import 'package:flutter_ui/utilities/backDecor.dart';

class endofSession extends StatelessWidget {
  const endofSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/BTN Back.png',
                  width: 26,
                  height: 26,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
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
                margin: EdgeInsets.only(bottom: 105, top: 43),
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
                margin: EdgeInsets.only(bottom: 83),
                child: Text(
                  'How did the practice go?',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 52),
                height: 154,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      height: 134,
                      width: 134,
                      margin: EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2), // yellow sun
                              Color(0xFFB38FB4), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Hated',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' it')
                              ])),
                    ),
                    Container(
                      height: 134,
                      width: 134,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2), // yellow sun
                              Color(0xFFB38FB4), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Found it\n',
                                ),
                                TextSpan(
                                  text: 'difficult',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ])),
                    ),
                    Container(
                      height: 134,
                      width: 134,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2), // yellow sun
                              Color(0xFFB38FB4), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(text: 'Had\n'),
                                TextSpan(
                                  text: ' distractions',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ',\nit was hard to\nfocus')
                              ])),
                    ),
                    Container(
                      height: 134,
                      width: 134,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2), // yellow sun
                              Color(0xFFB38FB4), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'It was ',
                                ),
                                TextSpan(
                                    text: 'ok',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ])),
                    ),
                    Container(
                      height: 154,
                      width: 154,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: Container(
                        height: 134,
                        width: 134,
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(vertical: 9, horizontal: 9),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            gradient: RadialGradient(
                              radius: 0.5,
                              colors: <Color>[
                                Color(0xFFBDA7C2), // yellow sun
                                Color(0xFFB38FB4), // blue sky
                              ],
                            )),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Good',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: ', I liked\nit')
                                ])),
                      ),
                    ),
                    Container(
                      height: 134,
                      width: 134,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2), // yellow sun
                              Color(0xFFB38FB4), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Great',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ', in the \nzone')
                              ])),
                    ),
                  ]),
                ),
              ),
              Container(
                width: 76,
                height: 76,
                margin: EdgeInsets.only(bottom: 101),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => feelingsAfter()));
                            },
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
                  height: 50,
                  width: 254,
                  margin: EdgeInsets.only(bottom: 63),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCC10D),
                          Color(0xffFDA210),
                        ]),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => summary()));
                    },
                    child: Text(
                      'Summary',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
