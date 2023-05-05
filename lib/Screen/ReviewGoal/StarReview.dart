





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/ReviewGoal/StarReviewWhy.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class StarReview extends StatefulWidget {
  const StarReview({Key? key}) : super(key: key);

  @override
  State<StarReview> createState() => _StarReviewState();
}

class _StarReviewState extends State<StarReview> {
  @override
  Widget build(BuildContext context) {

    // GoalReviewBg.png
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Review",style: TextStyle(color: Color(0xFF5B74A6),fontWeight: FontWeight.w600,fontSize: AppDimensions.height10*2.0),),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: Center(
          // alignment: Alignment.center,
          child: IconButton(
            icon: Image.asset(
              'assets/images/Back.png',
              width: AppDimensions.height10 * 3,
              height: AppDimensions.height10 * 3,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeScreen(),
              //   ),
              // );
              // Add code for performing close action
            },
          ),
        ),


      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/GoalReviewBg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [

                SizedBox(
                  height: AppDimensions.height10 * 9.2,
                ),


                Container(

                    width: AppDimensions.height10 * 10.4,
                    height: AppDimensions.height10 * 7.6,
                    padding: EdgeInsets.only(

                        left: AppDimensions.height10 * 1.5,
                        right: AppDimensions.height10 * 1.5),
                    child: Image.asset(
                      "assets/images/image3.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10*1.6 ,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Star Details",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF437296),
                        fontSize: AppDimensions.height10 * 3.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 0.7,
                ),
                Container(
                  height: AppDimensions.height10 * 2.2,
                  width: AppDimensions.height10 * 23.9,
                  child: Center(
                    child: Text(
                      "Review your summary here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(

                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF5B74A6)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10 * 3.4,
                ),
                Container(
                    width: AppDimensions.height10*38.2,
                    height: AppDimensions.height10*40.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width:  AppDimensions.height10*0.2),
                        borderRadius:  BorderRadius.all(Radius.circular( AppDimensions.height10*1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(

                          height: AppDimensions.height10*39.5,
                            child: Column(


                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: AppDimensions.height10*2.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: AppDimensions.height10*3.7,
                                      width: AppDimensions.height10*30.5,


                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/reviewsearch.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: ),
                                    Container(
                                      height: AppDimensions.height10*2.0,
                                      width: AppDimensions.height10*2.0,

                                      // color: Colors.blue,
                                      margin: EdgeInsets.only(bottom:AppDimensions.height10*1.5, ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/btnedit.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppDimensions.height10*0.5,),
                                Container(
                                  height: AppDimensions.height10 * 2.2,
                                  width: AppDimensions.height10 * 23.9,
                                  child: Center(
                                    child: Text(
                                      "Your Goal Name",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                          fontSize: AppDimensions.height10 * 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),

                                SizedBox(height: AppDimensions.height10*2.3,),

                                inner_text1('Control my anger'),
                                SizedBox(height: AppDimensions.height10*2.0,),

                                Container(
                                  height: AppDimensions.height10 * 2.2,
                                  width: AppDimensions.height10 * 23.9,
                                  child: Center(
                                    child: Text(
                                      "Select colour",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                          fontSize: AppDimensions.height10 * 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),

                                SizedBox(height: AppDimensions.height10*1.6,),
                                Container(
                                  height: AppDimensions.height10*12.6,
                                  width: AppDimensions.height10*20.1,
                                  // color: Colors.blue,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/selectcolor.png"),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),


                              ],
                            ),

                        ),


                      ],
                    )),

                SizedBox(
                  height: AppDimensions.height10 * 2.5,
                ),

                Container(
                    width: AppDimensions.height10*38.2,
                    height: AppDimensions.height10*49.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width:  AppDimensions.height10*0.2),
                        borderRadius:  BorderRadius.all(Radius.circular( AppDimensions.height10*1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(

                          height: AppDimensions.height10*49.5,
                          child: SingleChildScrollView(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: AppDimensions.height10*2.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: AppDimensions.height10*3.7,
                                      width: AppDimensions.height10*30.5,


                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/reviewsearch.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => StarReviewWhy(),
                                          ),
                                        );
                                      },
                                      child:  Container(
                                        height: AppDimensions.height10*2.0,
                                        width: AppDimensions.height10*2.0,

                                        // color: Colors.blue,
                                        margin: EdgeInsets.only(bottom:AppDimensions.height10*1.5, ),
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/btnedit.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: AppDimensions.height10*0.5,),
                                Container(
                                  height: AppDimensions.height10 * 2.2,
                                  width: AppDimensions.height10 * 23.9,
                                  child: Center(
                                    child: Text(
                                      "Your reasons ‘Why’",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                          fontSize: AppDimensions.height10 * 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),

                                SizedBox(height: AppDimensions.height10*2.3,),

                                inner_text('Reason 1'),
                                SizedBox(height: AppDimensions.height10*1.0,),
                                inner_text('Reason 2'),
                                SizedBox(height: AppDimensions.height10*1.0,),
                                inner_text('Reason 3'),


                                SizedBox(height: AppDimensions.height10*1.6,),


                              ],
                            ),
                          ),
                        ),


                      ],
                    )),


                SizedBox(height: AppDimensions.height10*3.1,),

                Container(
                    width: AppDimensions.height10*38.2,
                    height: AppDimensions.height10*24.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width:  AppDimensions.height10*0.2),
                        borderRadius:  BorderRadius.all(Radius.circular( AppDimensions.height10*1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(

                          height: AppDimensions.height10*24,
                          child: SingleChildScrollView(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: AppDimensions.height10*2.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: AppDimensions.height10*3.7,
                                      width: AppDimensions.height10*30.5,


                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/reviewsearch.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: ),
                                    Container(
                                      height: AppDimensions.height10*2.0,
                                      width: AppDimensions.height10*2.0,

                                      // color: Colors.blue,
                                      margin: EdgeInsets.only(bottom:AppDimensions.height10*1.5, ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/btnedit.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppDimensions.height10*0.5,),
                                Container(
                                  height: AppDimensions.height10 * 2.2,
                                  width: AppDimensions.height10 * 30.9,
                                  child: Center(
                                    child: Text(
                                      "Your New identity Statement",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                          fontSize: AppDimensions.height10 * 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),

                                SizedBox(height: AppDimensions.height10*2.3,),

                                inner_text('Statement 1'),
                                SizedBox(height: AppDimensions.height10*1.0,),



                                SizedBox(height: AppDimensions.height10*1.6,),


                              ],
                            ),
                          ),
                        ),


                      ],
                    )),

                SizedBox(height: AppDimensions.height10*3.1,),

                Container(
                    width: AppDimensions.height10*38.2,
                    height: AppDimensions.height10*24.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width:  AppDimensions.height10*0.2),
                        borderRadius:  BorderRadius.all(Radius.circular( AppDimensions.height10*1.8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(

                          height: AppDimensions.height10*24,
                          child: SingleChildScrollView(

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: AppDimensions.height10*2.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: AppDimensions.height10*3.7,
                                      width: AppDimensions.height10*30.5,


                                      // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/reviewsearch.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: ),
                                    Container(
                                      height: AppDimensions.height10*2.0,
                                      width: AppDimensions.height10*2.0,

                                      // color: Colors.blue,
                                      margin: EdgeInsets.only(bottom:AppDimensions.height10*1.5, ),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/btnedit.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppDimensions.height10*0.5,),
                                Container(
                                  height: AppDimensions.height10 * 2.2,
                                  width: AppDimensions.height10 * 30.9,
                                  child: Center(
                                    child: Text(
                                      "Your ‘New self’",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                          fontSize: AppDimensions.height10 * 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF5B74A6)),
                                    ),
                                  ),
                                ),

                                SizedBox(height: AppDimensions.height10*2.3,),

                                inner_text('Statement 1'),
                                SizedBox(height: AppDimensions.height10*1.0,),



                                SizedBox(height: AppDimensions.height10*1.6,),


                              ],
                            ),
                          ),
                        ),


                      ],
                    )),



                MediaQuery.of(context).viewInsets.bottom==0?  SizedBox(
                  height: AppDimensions.height10 * 7.2,
                ):SizedBox(
                  height: AppDimensions.height10 * 5.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // color: Colors.blue,
                        width: AppDimensions.height10 * 5.0,
                        height: AppDimensions.height10 * 5.0,

                        child: Image.asset(
                          "assets/images/Moreactions.png",
                          fit: BoxFit.contain,
                        )),

                    GestureDetector(

                      onTap: ()=>
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Container(
                            width: AppDimensions.height10*27.0,
                            height:AppDimensions.height10*24.6,
                            child: AlertDialog(
                              actionsPadding: const EdgeInsets.all(0.0),
                              contentPadding: const EdgeInsets.all(0.0),
                              titlePadding: const EdgeInsets.all(0.0),
                              title: Container(


                                margin: EdgeInsets.only(top: AppDimensions.height10*1.9, right:AppDimensions.height10* 1.6, left: AppDimensions.height10*1.6, bottom: AppDimensions.height10*0),
                                height: AppDimensions.height10*4.4,
                                width: AppDimensions.height10*23.8,
                                child: Text(
                                  "Are you sure you want\nto delete this goal?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Laila",
                                    fontSize:  AppDimensions.height10*1.7,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              content: Container(
                                // color:Colors.red,
                                margin: EdgeInsets.only(bottom: AppDimensions.height10*1.9, left:AppDimensions.height10* 1.6, right: AppDimensions.height10*1.6,top:AppDimensions.height10*0.5),
                                height: AppDimensions.height10*6.8,
                                width: AppDimensions.height10*23.8,
                                child: Text(
                                  "By clicking 'Yes' you confirm that this\ngoal will be deleted and all your data\nthat relates to this goal won't be\nrecoverable. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: AppDimensions.height10*1.3,
                                    fontFamily: "Laila",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    Container(
                                      height: AppDimensions.height10*4.4,
                                      width: double.infinity,
                                      color:const Color.fromRGBO(0, 122, 255, 1),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child:  Text(
                                          'No',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppDimensions.height10*1.7,
                                              fontFamily: "Laila",
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: AppDimensions.height10*4.4,
                                      width: AppDimensions.height10*27.0,
                                      child: TextButton(
                                        onPressed: () {

                                        },
                                        child:  Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontSize: AppDimensions.height10*1.7,
                                            fontFamily: "Laila",
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(0, 122, 255, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),


                      child:   Container(
                        height: AppDimensions.height10*5,
                        width: AppDimensions.height10*31.3,
                        decoration:  BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF464646), Color(0xFF464646)]),
                          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child:  Center(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                              Image.asset(
                                              "assets/images/bin.png",
                                              height: AppDimensions.height10*1.8,
                                              width: AppDimensions.height10*1.8,

                                              ),
                                                                        SizedBox(width: AppDimensions.height10*0.8,),
                                                                        Text(
                                "Delete Goal",
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: AppDimensions.height10 * 2.5,
                ),

                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )

        ],
      ),
    );
  }
}



class inner_text1 extends StatefulWidget {
  final String circle_text;


  inner_text1(this.circle_text, {super.key});

  @override
  State<inner_text1> createState() => _inner_text1State();
}

class _inner_text1State extends State<inner_text1> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;




  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState((){});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10*8.9,
      width: AppDimensions.height10*36.0,
      padding:  EdgeInsets.only(top: AppDimensions.height10*2, bottom: 1, left:AppDimensions.height10, right: AppDimensions.height10*6.0),
      decoration: BoxDecoration(
          gradient:_focusNode.hasFocus? const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)]

          ):const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius:  BorderRadius.all(Radius.circular(AppDimensions.height10*1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

              height: AppDimensions.height10*3.6,
              width:AppDimensions.height10* 26.9,
              child: Text("Control my anger",style: TextStyle(
                fontWeight: FontWeight.w500,
                color: _focusNode.hasFocus? const Color(0xFFFFFFFF):const Color(0xFFFFFFFF),
                fontSize: AppDimensions.height10*2.2,
              ))),


        ],
      ),
    );
  }
}



class inner_text extends StatefulWidget {
  final String circle_text;


  inner_text(this.circle_text, {super.key});

  @override
  State<inner_text> createState() => _inner_textState();
}

class _inner_textState extends State<inner_text> {
  final TextEditingController body_text = TextEditingController();

  final TextEditingController heading_text = TextEditingController();

  late FocusNode _focusNode;




  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_onFocus);
  }

  void _onFocus() {
    setState((){});
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10*11.0,
      width: AppDimensions.height10*36.0,
      padding:  EdgeInsets.only(top: AppDimensions.height10*2, bottom: 1, left:AppDimensions.height10, right: AppDimensions.height10*6.0),
      decoration: BoxDecoration(
          gradient:_focusNode.hasFocus? const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)]

          ):const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEECDC5), Color(0xFFF6E0DB)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius:  BorderRadius.all(Radius.circular(AppDimensions.height10*1.8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

              height: AppDimensions.height10*3.6,
              width:AppDimensions.height10* 26.9,
              child: Text("${widget.circle_text}",style: TextStyle(
                fontWeight: FontWeight.w500,
                color: _focusNode.hasFocus? const Color(0xFFFFFFFF):const Color(0xFFFFFFFF),
                fontSize: AppDimensions.height10*2.2,
              ))),
          SizedBox(height: AppDimensions.height10*0.9,),
          Container(

              height: AppDimensions.height10*2.6,
              width:AppDimensions.height10* 26.9,
              child: CupertinoTextField(
                placeholder: "I want to achieve this goal because...",
                placeholderStyle:TextStyle(
                    fontSize: AppDimensions.height10*1.6,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFFFFF)),
                controller: body_text,
                focusNode: _focusNode,
                maxLines: 4,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color:  Color(0xFFFFFFFF)

                ),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )),
        ],
      ),
    );
  }
}