import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeEndosSession.dart';
import 'package:potenic_app/Screen/Recording%20Practice%20Session/recordPracticeSummary.dart';

import '../../utils/app_dimensions.dart';

bool note_check = false;

class feelingsAfter extends StatelessWidget {
  final bool summary;

  const feelingsAfter({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.png',
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
                  fit: BoxFit.cover,
                )),
          ),
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
          //   physics: const ClampingScrollPhysics(),
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
                // alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 8.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          'after',
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
                margin: EdgeInsets.only(bottom: AppDimensions.height10 * 6.3),
                height: AppDimensions.height10 * 13.7,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
                      height: AppDimensions.height10 * 12.7,
                      width: AppDimensions.height10 * 12.5,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.white),
                        color: Color(0xff546096),
                      ),
                      child: Text(
                        'I feel very low\n& irritated',
                        textAlign: TextAlign.center,
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
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: AppDimensions.height10 * 0.2,
                            color: Colors.white),
                        color: Color(0xff7291A0),
                      ),
                      child: Text(
                        'I feel alright,\n but slightly\ndown',
                        textAlign: TextAlign.center,
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
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.5),
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
                    Container(
                      height: AppDimensions.height10 * 12.7,
                      width: AppDimensions.height10 * 12.5,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: AppDimensions.height10 * 0.2,
                            color: Colors.white),
                        color: Color(0xffFA9458),
                      ),
                      child: Text(
                        ' I feel focused\nand motivated',
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
                      margin:
                          EdgeInsets.only(right: AppDimensions.height10 * 1.5),
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
                          color: Color(0xffFF7C42),
                        ),
                        child: Text(
                          'I feel excited\nand good in\nmyself',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              addNotes(
                state_: summary,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }
}

class addNotes extends StatefulWidget {
  final bool state_;
  const addNotes({
    super.key,
    required this.state_,
  });

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  int icon_color = 0xffffffff;
  int back_color = 0x000000ff;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppDimensions.height10 * 7.6,
          height: AppDimensions.height10 * 7.6,
          //margin: EdgeInsets.only(bottom: 113),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppDimensions.height10 * 5.0,
                height: AppDimensions.height10 * 5.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(back_color),
                    border: Border.all(
                        width: AppDimensions.height10 * 0.2,
                        color: Color(icon_color))),
                child: Container(
                  height: AppDimensions.height10 * 2.7,
                  width: AppDimensions.height10 * 2.7,
                  margin: EdgeInsets.only(left: 3),
                  child: IconButton(
                      onPressed: () {
                        note_check
                            ? setState(() {
                                back_color = 0x000000ff;
                                icon_color = 0xffffffff;
                                note_check = false;
                              })
                            : setState(() {
                                back_color = 0xffffffff;
                                icon_color = 0xffFA9934;
                                note_check = true;
                                // icon_color = 0xffFA9934,
                              });
                      },
                      icon: Icon(
                        Icons.edit_note,
                        //size: 27,
                        color: Color(icon_color),
                      )),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 7.6,
                height: AppDimensions.height10 * 1.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.6),
                child: Text(
                  'Add Notes',
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.6,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
            child: note_check
                ? Container(
                    margin: EdgeInsets.only(top: AppDimensions.height10 * 1.0),
                    child: notes(
                      state: widget.state_,
                    ))
                : Container(
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10 * 10.1,
                        bottom: AppDimensions.height10 * 4.4),
                    child: next_botton(state: widget.state_),
                  ))
        // Container(margin: EdgeInsets.only(top: 10), child: notes()),

        // //next button
        // next_botton()
      ],
    );
  }
}

class notes extends StatelessWidget {
  final bool state;
  const notes({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppDimensions.height10 * 36.0,
          height: AppDimensions.height10 * 11.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.height10 * 1.8)),
              color: Colors.white),
          child: Column(
            children: [
              Container(
                child: TextField(
                  // maxLines: 4,
                  decoration: InputDecoration(
                      hintText: 'Add notes here',
                      hintStyle: TextStyle(
                        fontSize: AppDimensions.height10 * 1.6,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff646464),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              SizedBox(
                height: AppDimensions.height10 * 1.4,
              ),
              Container(
                //alignment: Alignment(0, 0),
                margin: EdgeInsets.only(right: AppDimensions.height10 * 21.2),
                width: AppDimensions.height10 * 13.1,
                height: AppDimensions.height10 * 2.0,
                child: Row(
                  children: [
                    Text(
                      'Character count: ',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.3,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff464646)),
                    ),
                    Text(
                      '200',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.3,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff464646)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                top: AppDimensions.height10 * 4.6,
                bottom: AppDimensions.height10 * 2.6),
            child: next_botton(
              state: state,
            )),
        note_check
            ? SizedBox(
                // height: AppDimensions.height10 * 2.6,
                child: Container(
                  color: Colors.amber,
                ),
              )
            : Container()
      ],
    );
  }
}

class next_botton extends StatelessWidget {
  final bool state;
  const next_botton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppDimensions.height10 * 5.0,
        width: AppDimensions.height10 * 25.4,
        // margin: EdgeInsets.only(bottom: 62, top: 46),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFCC10D),
                Color(0xffFDA210),
              ]),
          borderRadius: BorderRadius.circular(AppDimensions.height10 * 5.0),
        ),
        child: state
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
                      fontSize: AppDimensions.height10 * 1.6,
                      fontWeight: FontWeight.w600),
                ),
              )
            : TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => endofSession(
                                summary: false,
                              )));
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimensions.height10 * 1.6,
                      fontWeight: FontWeight.w600),
                ),
              ));
  }
}
