import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../Widgets/fading.dart';
import '../../../../utils/app_dimensions.dart';

class link_details extends StatelessWidget {
  const link_details({super.key});

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
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: GradientText(
              'Hurdle‘s positive\nalternatives',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.height10 * 2.0,
                fontWeight: FontWeight.w600,
              ),
              colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
            ),
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppDimensions.height10 * 34.3,
                height: AppDimensions.height10 * 3.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 17.0),
                child: GradientText(
                  'Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.8,
                    fontWeight: FontWeight.w700,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 18.5,
                height: AppDimensions.height10 * 2.2,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 0.1),
                child: GradientText(
                  'Enter the description',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 1.8,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 10.6,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.9),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: Colors.white,
                  radius: Radius.circular(AppDimensions.height10 * 1.5),
                  child: Container(
                    width: AppDimensions.height10 * 34.3,
                    height: AppDimensions.height10 * 9.3,
                    margin: EdgeInsets.all(AppDimensions.height10 * 0.6),
                    child: Container(
                      width: AppDimensions.height10 * 34.3,
                      height: AppDimensions.height10 * 9.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/Image_Subtract.png'),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: AppDimensions.height10 * 6.6,
                              height: AppDimensions.height10 * 6.6,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 1.0),
                              decoration: const BoxDecoration(
                                  //  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/link_image.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: AppDimensions.height10 * 25.6,
                              height: AppDimensions.height10 * 6.6,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppDimensions.height10 * 25.3,
                                      height: AppDimensions.height10 * 3.6,
                                      child: Text(
                                        'Finding clarity and peace through the\nstorm ',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.4,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffffffff)),
                                      ),
                                    ),
                                    Container(
                                      width: AppDimensions.height10 * 19.1,
                                      height: AppDimensions.height10 * 1.4,
                                      margin: EdgeInsets.only(
                                          top: AppDimensions.height10 * 1.3,
                                          right: AppDimensions.height10 * 6.3),
                                      child: Text(
                                        'www.angermanagment.com',
                                        style: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.1,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffffffff)),
                                      ),
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 9.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Why is it important to you?',
                      hintStyle: TextStyle(
                          fontSize: AppDimensions.height10 * 1.8,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff828282)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
              ),
              Container(
                width: AppDimensions.height10 * 36.0,
                height: AppDimensions.height10 * 5.0,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 2.0),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 2.0),
                    color: Colors.white),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '#Tags',
                        hintStyle: TextStyle(
                            fontSize: AppDimensions.height10 * 1.4,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff828282)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 25.4,
                  height: AppDimensions.height10 * 5.0,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 24.8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFCC10D),
                        Color(0xffFDA210),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            FadePageRoute(page: const supporting_mat_link()));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class supporting_mat_link extends StatelessWidget {
  const supporting_mat_link({super.key});

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
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.height10 * 17.0,
            height: AppDimensions.height10 * 4.8,
            child: GradientText(
              'Hurdle‘s positive\nalternatives',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.height10 * 2.0,
                fontWeight: FontWeight.w600,
              ),
              colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
            ),
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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/practicebackground.png'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppDimensions.height10 * 34.3,
                height: AppDimensions.height10 * 3.9,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 17.0),
                child: GradientText(
                  'Details Saved',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10 * 2.8,
                    fontWeight: FontWeight.w700,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ),
              Container(
                width: AppDimensions.height10 * 34.3,
                height: AppDimensions.height10 * 9.3,
                margin: EdgeInsets.only(top: AppDimensions.height10 * 5.8),
                child: Container(
                  width: AppDimensions.height10 * 34.3,
                  height: AppDimensions.height10 * 9.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Image_Subtract.png'),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 6.6,
                          height: AppDimensions.height10 * 6.6,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 1.0),
                          decoration: const BoxDecoration(
                              //  shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/link_image.png'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: AppDimensions.height10 * 25.6,
                          height: AppDimensions.height10 * 6.6,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: AppDimensions.height10 * 25.3,
                                  height: AppDimensions.height10 * 3.6,
                                  child: Text(
                                    'Finding clarity and peace through the\nstorm ',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffffffff)),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10 * 19.1,
                                  height: AppDimensions.height10 * 1.4,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10 * 1.3,
                                      right: AppDimensions.height10 * 6.3),
                                  child: Text(
                                    'www.angermanagment.com',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.1,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffffffff)),
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 36.0,
                  height: AppDimensions.height10 * 17.4,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppDimensions.height10 * 36.0,
                        height: AppDimensions.height10 * 14.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 * 2.0),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Container(
                              width: AppDimensions.height10 * 31.5,
                              height: AppDimensions.height10 * 8.4,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 2.2),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis aliquam ligula, sit amet viverra nibh. Quisque finibus volutpat dapibus.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xffB353C9),
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: AppDimensions.height10 * 30.5,
                              height: AppDimensions.height10 * 2.1,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10 * 0.9),
                              child: Text(
                                '#Tag name 1 #Tag name 1',
                                style: TextStyle(
                                    color: const Color(0xff828282),
                                    fontSize: AppDimensions.height10 * 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: AppDimensions.height10 * 2.0,
                          width: AppDimensions.height10 * 2.0,
                          margin: EdgeInsets.only(
                              top: AppDimensions.height10 * 1.0),
                          padding: EdgeInsets.all(AppDimensions.height10 * 0.5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: const ImageIcon(
                            AssetImage('assets/images/edit_icon.png'),
                            color: Colors.white,
                            //size: 10,
                          )),
                    ],
                  )),
              Container(
                width: AppDimensions.height10 * 4.7,
                height: AppDimensions.height10 * 4.7,
                margin: EdgeInsets.only(
                    bottom: AppDimensions.height10 * 1.1,
                    top: AppDimensions.height10 * 3.6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //     width: AppDimensions.height10 * 0.3,
                    //     color: Colors.white)
                    image: DecorationImage(
                        image: AssetImage('assets/images/Addgoal.png'))),
              ),
              SizedBox(
                width: AppDimensions.height10 * 26.0,
                height: AppDimensions.height10 * 1.9,
                child: Text(
                  'Add another motivational material',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.height10 * 1.3,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Container(
                  width: AppDimensions.height10 * 25.4,
                  height: AppDimensions.height10 * 5.0,
                  margin: EdgeInsets.only(top: AppDimensions.height10 * 12.8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFCC10D),
                        Color(0xffFDA210),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10 * 5.0),
                  ),
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => video_details()));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
