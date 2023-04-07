import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/dashboard/recordPracticeEndosSession.dart';
import 'package:flutter_ui/utilities/app_contants.dart';
import 'package:flutter_ui/utilities/icons.dart';

class feelingsAfter extends StatelessWidget {
  const feelingsAfter({super.key});

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
          //   physics: const ClampingScrollPhysics(),
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
                margin: EdgeInsets.only(bottom: 87),
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
                          'after',
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
                margin: EdgeInsets.only(bottom: 63),
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
                        'I feel very low\n& irritated',
                        textAlign: TextAlign.center,
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
                        'I feel alright,\n but slightly\ndown',
                        textAlign: TextAlign.center,
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
                        ' I feel focused\nand motivated',
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
                        'I feel excited\nand good in\ntmyself',
                        textAlign: TextAlign.center,
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
              addNotes()
            ],
          ),
        ),
      ),
    );
  }
}

class addNotes extends StatefulWidget {
  const addNotes({
    super.key,
  });

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  bool note_check = false;

  int icon_color = 0xffffffff;
  int back_color = 0x000000ff;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 76,
          height: 76,
          //margin: EdgeInsets.only(bottom: 113),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(back_color),
                    border: Border.all(width: 2, color: Color(icon_color))),
                child: Container(
                  height: 27,
                  width: 27,
                  margin: EdgeInsets.only(left: 3),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
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
              ),
            ],
          ),
        ),
        Container(
            child: note_check
                ? Container(margin: EdgeInsets.only(top: 10), child: notes())
                : Container(
                    margin: EdgeInsets.only(top: 101, bottom: 44),
                    child: next_botton(),
                  ))
        // Container(margin: EdgeInsets.only(top: 10), child: notes()),

        // //next button
        // next_botton()
      ],
    );
  }
}

class notes extends StatelessWidget {
  const notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Colors.white),
          child: Column(
            children: [
              TextFormField(
                // maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Add notes here',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff646464),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                //alignment: Alignment(0, 0),
                margin: EdgeInsets.only(right: 212),
                width: 131,
                height: 20,
                child: Row(
                  children: [
                    Text(
                      'Character count: ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff464646)),
                    ),
                    Text(
                      '200',
                      style: TextStyle(
                          fontSize: 13,
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
            margin: EdgeInsets.only(top: 46, bottom: 26), child: next_botton()),
      ],
    );
  }
}

class next_botton extends StatelessWidget {
  const next_botton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 254,
        // margin: EdgeInsets.only(bottom: 62, top: 46),
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
                MaterialPageRoute(builder: (context) => endofSession()));
          },
          child: Text(
            'Next',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
