import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeFellingAftr.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';

import '../../utils/app_dimensions.dart';

class endofSession extends StatelessWidget {
  final bool summary;

  const endofSession({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/Back.png',
                  width: AppDimensions.height10(context) * 2.6,
                  height: AppDimensions.height10(context) * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.png',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
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
                width: AppDimensions.height10(context) * 18.6,
                height: AppDimensions.height10(context) * 2.4,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 10.5,
                    top: AppDimensions.height10(context) * 5.0),
                alignment: Alignment.center,
                child: Text(
                  'Meditation Session',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Container(
                width: AppDimensions.height10(context) * 35.9,
                height: AppDimensions.height10(context) * 14.8,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 8.3),
                child: Text(
                  'How did the practice go?',
                  style: TextStyle(
                      fontSize: AppDimensions.height10(context) * 2.8,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 5.2,
                    left: AppDimensions.height10(context) * 1.0),
                height: AppDimensions.height10(context) * 15.4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      height: AppDimensions.height10(context) * 13.4,
                      width: AppDimensions.height10(context) * 13.4,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            // radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2).withOpacity(0.19), // yellow sun
                              Color(0xFFB38FB4).withOpacity(.81), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'laila',
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                      height: AppDimensions.height10(context) * 13.4,
                      width: AppDimensions.height10(context) * 13.4,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            // radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2).withOpacity(0.19), // yellow sun
                              Color(0xFFB38FB4).withOpacity(.81), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'laila',
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                      height: AppDimensions.height10(context) * 13.4,
                      width: AppDimensions.height10(context) * 13.4,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            //radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2).withOpacity(0.19), // yellow sun
                              Color(0xFFB38FB4).withOpacity(.81), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'laila',
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                      height: AppDimensions.height10(context) * 13.4,
                      width: AppDimensions.height10(context) * 13.4,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            // radius: 0.5,
                            colors: <Color>[
                              Color(0xFFBDA7C2).withOpacity(0.19), // yellow sun
                              Color(0xFFB38FB4).withOpacity(.81), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'laila',
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                      height: AppDimensions.height10(context) * 15.4,
                      width: AppDimensions.height10(context) * 15.4,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: AppDimensions.height10(context) * 0.2,
                            color: Colors.white),
                      ),
                      child: Container(
                        height: AppDimensions.height10(context) * 13.4,
                        width: AppDimensions.height10(context) * 13.4,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            vertical: AppDimensions.height10(context) * 0.9,
                            horizontal: AppDimensions.height10(context) * 0.9),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            gradient: RadialGradient(
                              // radius: 0.5,
                              colors: <Color>[
                                Color(0xFFBDA7C2)
                                    .withOpacity(0.19), // yellow sun
                                Color(0xFFB38FB4).withOpacity(.81), // blue sky
                              ],
                            )),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'laila',
                                  fontSize:
                                      AppDimensions.height10(context) * 1.6,
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
                      height: AppDimensions.height10(context) * 13.4,
                      width: AppDimensions.height10(context) * 13.4,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          right: AppDimensions.height10(context) * 1.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                          gradient: RadialGradient(
                            //radius: 0.5,

                            colors: [
                              Color(0xFFBDA7C2).withOpacity(0.19), // yellow sun
                              Color(0xFFB38FB4).withOpacity(.81), // blue sky
                            ],
                          )),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.6,
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
                width: AppDimensions.height10(context) * 7.6,
                height: AppDimensions.height10(context) * 7.6,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10(context) * 10.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppDimensions.height10(context) * 5.0,
                      height: AppDimensions.height10(context) * 5.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: AppDimensions.height10(context) * 0.2,
                              color: Colors.white)),
                      child: Container(
                        height: AppDimensions.height10(context) * 2.7,
                        width: AppDimensions.height10(context) * 2.7,
                        margin: EdgeInsets.only(
                            left: AppDimensions.height10(context) * 0.3),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.edit_note,
                              //size: 27,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      width: AppDimensions.height10(context) * 7.6,
                      height: AppDimensions.height10(context) * 1.9,
                      margin: EdgeInsets.only(
                          top: AppDimensions.height10(context) * 0.6),
                      child: Text(
                        'Add Notes',
                        style: TextStyle(
                            fontSize: AppDimensions.height10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: AppDimensions.height10(context) * 5.0,
                  width: AppDimensions.height10(context) * 25.4,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 6.3),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCC10D),
                          Color(0xffFDA210),
                        ]),
                    borderRadius: BorderRadius.circular(
                        AppDimensions.height10(context) * 5.0),
                  ),
                  child: summary
                      ? TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => practice_summary()));
                          },
                          child: Text(
                            'Update Summary',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => practice_summary()));
                          },
                          child: Text(
                            'Summary',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppDimensions.height10(context) * 1.6,
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
