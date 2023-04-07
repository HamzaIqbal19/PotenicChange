import 'package:flutter/material.dart';

import '../../utilities/app_contants.dart';

class summary extends StatelessWidget {
  const summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Appconstants.bg_image_dashboard),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: 334,
                height: 34,
                // color: Colors.amber,
                margin: const EdgeInsets.only(top: 60),
                child: const Center(
                  child: Text(
                    'Your Practice Summary',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: 232,
                height: 38,
                //  color: Colors.red,
                margin: const EdgeInsets.only(top: 5),
                child: const Center(
                  child: Text(
                    'Well done for recording\nyour practice!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: 268,
                height: 268,
                //color: Colors.amber,
                margin: const EdgeInsets.only(top: 24),
                decoration: const BoxDecoration(
                    // color: const Color(0xff7c94b6),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/oraange_sun.png'),
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0.5), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Stack(children: [
                  Align(
                      alignment: Alignment(0, -0.5),
                      child: Text(
                        'Control my anger',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff5B74A6)),
                      )),
                  Align(
                    alignment: Alignment(0, -0.2),
                    child: Text(
                        '“I am someone who is in\n control of my anger”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5B74A6))),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.8),
                    child: Container(
                      height: 138,
                      width: 138,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 5, color: Colors.white),
                          gradient: const RadialGradient(
                            // radius: 0.5,
                            colors: <Color>[
                              Color(0xFFDFF8EB), // yellow sun
                              Color(0xFFA3B6A4), // blue sky
                            ],
                          )),
                      child: Stack(children: [
                        const Center(
                            child: Text(
                          'Meditation',
                          style: TextStyle(
                              color: Color(0xff1A481C),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Laila'),
                        )),
                        Align(
                            alignment: const Alignment(0, 1.3),
                            child: Container(
                                height: 29,
                                width: 29,
                                padding: EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: ImageIcon(
                                  AssetImage('assets/images/tick_icon.png'),
                                  color: Color(0xff1A481C),
                                )))
                      ]),
                    ),
                  ),
                ]),
              ),
              Container(
                width: 268,
                height: 50,
                margin: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(width: 1, color: Colors.white),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 92, right: 66),
                        height: 26,
                        width: 51,
                        child: Text(
                          'Now',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Laila',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Container(
                width: 326,
                height: 48,
                margin: const EdgeInsets.only(top: 40),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'How did you feel',
                          ),
                          TextSpan(
                              text: '\nbefore',
                              style: TextStyle(color: Color(0xff8C648A))),
                          TextSpan(
                            text: ' your practice?',
                          ),
                        ])),
              ),
              Container(
                width: 134,
                height: 134,
                margin: const EdgeInsets.only(top: 33),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFA8552),
                          Color(0xffFAA960),
                        ])),
                child: Stack(children: [
                  Center(
                    child: Text(
                      'I felt good',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Laila'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: Container(
                        height: 20,
                        width: 20,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(width: 1, color: Colors.white)),
                        child: ImageIcon(
                          AssetImage('assets/images/edit_icon.png'),
                          color: Colors.white,
                        )),
                  )
                ]),
              ),
              Container(
                width: 326,
                height: 48,
//color: Colors.amber,
                margin: const EdgeInsets.only(top: 30),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'How do you feel',
                          ),
                          TextSpan(
                              text: '\nafter',
                              style: TextStyle(color: Color(0xff8C648A))),
                          TextSpan(
                            text: ' your practice?',
                          ),
                        ])),
              ),
              Container(
                width: 134,
                height: 134,
                margin: const EdgeInsets.only(top: 37),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFA8552),
                          Color(0xffFAA960),
                        ])),
                child: Stack(children: [
                  Center(
                    child: Text(
                      '“I feel focused\n& good”',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Laila'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: Container(
                        height: 20,
                        width: 20,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(width: 1, color: Colors.white)),
                        child: ImageIcon(
                          AssetImage('assets/images/edit_icon.png'),
                          color: Colors.white,
                        )),
                  )
                ]),
              ),
              Container(
                width: 360,
                height: 73,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 38,
                    width: 320,
                    child: Text(
                      'This session works for me, it clears my head and makes me feel positive :)',
                      style: TextStyle(
                          color: Color(0xff646464),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Laila'),
                    ),
                  ),
                ),
              ),
              Container(
                width: 326,
                height: 24,
                margin: const EdgeInsets.only(top: 30),
                child: const Center(
                  child: Text(
                    'How did the practice go?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Laila'),
                  ),
                ),
              ),
              Container(
                width: 134,
                height: 132,
                margin: const EdgeInsets.only(top: 26),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                    gradient: const RadialGradient(
                      radius: 0.5,
                      colors: <Color>[
                        Color(0xFFBDA7C2), // yellow sun
                        Color(0xFFB38FB4), // blue sky
                      ],
                    )),
                child: Stack(children: [
                  Center(
                    child: Text(
                      'Good, I liked it',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: Container(
                      height: 20,
                      width: 20,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: Colors.white)),
                      child: ImageIcon(
                        AssetImage('assets/images/edit_icon.png'),
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                width: 383,
                height: 50,
//color: Colors.red,
                margin: const EdgeInsets.only(top: 64),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 50,
                      width: 157,
                      margin: const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xff464646),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Arial'),
                                ),
                              ),
                            ],
                          ))),
                  Container(
                      height: 50,
                      width: 212,
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
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Save Practice',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          )))
                ]),
              ),
              Container(
                width: 170,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                margin: const EdgeInsets.only(top: 37, bottom: 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
