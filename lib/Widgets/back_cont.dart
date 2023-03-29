import 'package:flutter/material.dart';
import 'package:potenic_app/utils/app_constants.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
// import 'package:flutter_ui/pages/goalsetting/bottom_sheet.dart';
// import 'package:potenic_app/utils/backDecor.dart';
// import 'package:potenic_app/utils/icons.dart';


class backbox extends StatelessWidget {

  const backbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: AppDimensions.height10*38.2,
          height: AppDimensions.height10*40.3,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width:  AppDimensions.height10*0.2),
              borderRadius:  BorderRadius.all(Radius.circular( AppDimensions.height10*1.8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(

                height: AppDimensions.height10*36.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      inner_text('Reason 1'),
                      SizedBox(height: AppDimensions.height10*1.1,),
                      inner_text("Reason 2"),
                      SizedBox(height: AppDimensions.height10*1.1,),
                      inner_text("Reason 3"),
                    ],
                  ),
                ),
              ),
              Container(
                    padding:const  EdgeInsets.only(left: 15),
                    child: Row(
                      children: const [
                        Center(
                          child: Text(
                            "Character count:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF464646),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "200",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF464646),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            ],
          )),
      Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Align(
          //alignment: Alignment.bottomCenter,
          alignment: Alignment(0.01, 1.155),
          //heightFactor: 0.5,
          child: Container(
            height: AppDimensions.height10*4.7,
            width:  AppDimensions.height10*4.7,

            decoration: const BoxDecoration(

              shape: BoxShape.circle,
              gradient:  LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:  [Color(0xFFB1B8FF), Color(0xFFC5CAFF)]),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4, left: 4, right: 4, bottom:4),
              child: add_reason,
            ),
          ),
        ),
      )
    ]);
  }
}

class inner_text extends StatelessWidget {
  final TextEditingController body_text = TextEditingController();
  final TextEditingController heading_text = TextEditingController();
  final String circle_text;


  inner_text(this.circle_text, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height10*17.9,
      width: 360,
      padding: const EdgeInsets.only(top: 10, bottom: 1, left: 10, right: 60),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFEFBEB2), Color(0xFFFEAA897)]),
          // color: Colors.white,

          border: Border.all(color: Colors.white, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            height: AppDimensions.height10*2.6,
            width: 261,
            child:  Text(
              circle_text,
              textAlign: TextAlign.start,
              style:  TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: AppDimensions.height10*2.2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextFormField(
              controller: body_text,
              maxLines: 3,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color:  Color(0xFFFFFFFF)

              ),
              decoration: InputDecoration(
                  hintText: "I want to achieve this goal to be in control of my anger and to regain control of my life.I want to achieve this goal to be in control of my anger and to regain control of my life. sgdka bskdva asvduasv dvau vsjhdva avdjhasv adva duascyd davda ",
                  hintStyle: TextStyle(
                      fontSize: AppDimensions.height10*1.6,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF828282)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)))),
        ],
      ),
    );
  }
}

FloatingActionButton add_reason = FloatingActionButton(
  elevation: 0,
  backgroundColor: Colors.transparent,
  onPressed: () {
    // BottomSheetExample();
  },
  child:  Icon(
    Icons.add,
    color: Colors.white,
    size: 35,
  ),
  shape: RoundedRectangleBorder(
      side: BorderSide(width: 3, color: Colors.white),
      borderRadius: BorderRadius.circular(100)),
);
