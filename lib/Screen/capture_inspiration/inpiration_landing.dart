import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/InpirationApi.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_motivation.dart';
import 'package:potenic_app/Screen/capture_inspiration/record_inpiration_type.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class inspiration_landing extends StatefulWidget {
  final bool is_Updated;

  const inspiration_landing({super.key, required this.is_Updated});

  @override
  State<inspiration_landing> createState() => _inspiration_landingState();
}

class _inspiration_landingState extends State<inspiration_landing> {
  var InspirationList;

  bool Loading = true;
  var goals = [];
  List goalName = [];

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchInspiraion() async {
    InspirationApi().getUserInspiration().then((response) {
      if (response.length != 0) {
        setState(() {
          InspirationList = response;
        });
        _fetchUserGoal();

        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("Hello world error");
    });
  }

  void _fetchUserGoal() {
    AdminGoal.getUserGoalByUserId().then((response) {
      setState(() {
        goals = response;
      });
      _newFunction();
    });
  }

  _newFunction() {
    print('FunctionCalled');
    for (int i = 0; i <= goals.length; i++) {
      goalName.add(goals[i]['name']);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchInspiraion();
  }

  @override
  final List<String> _tags = [
    'All ',
    '[Tag 1]',
    '[Tag 2]',
    '[Tag 3]',
    '[Tag 4]',
  ];
  final List<String> _goals = [
    'All ',
    'Goal name 1',
    'Goal name 2 ',
    'Goal name 3 ',
    'Practice name 1 (goal name)',
  ];
  int _selectedTag = 0;
  int _Goal_Index = 0;
  String _selected_activity = 'All';
  String _selected_goal = 'All';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    width: AppDimensions.height10(context) * 2.6,
                    height: AppDimensions.height10(context) * 2.6,
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          // margin: EdgeInsets.only(top: AppDimensions.height10(context) * 6.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_inpiration_purple.webp'),
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                  fit: BoxFit.cover)),
          child: Loading == false
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: AppDimensions.height10(context) * 34.3,
                        height: AppDimensions.height10(context) * 27.0,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 12.0),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // widget.muliple_insp
                                //     ? Navigator.push(
                                //         context,
                                //         FadePageRoute(
                                //             page: const inspiration_motivation(
                                //                 goal_delete: false)),
                                //       )
                                //     :
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const inspiration_landing(
                                    is_Updated: false,
                                  )),
                                );
                              },
                              child: SizedBox(
                                width: AppDimensions.height10(context) * 34.3,
                                height: AppDimensions.height10(context) * 7.3,
                                child: Center(
                                  child: GradientText(
                                    'My current\ninspirations',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize:
                                          AppDimensions.height10(context) * 3.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    colors: const [
                                      Color(0xffFA9934),
                                      Color(0xffEDD15E)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0.525),
                              child: Container(
                                width: AppDimensions.height10(context) * 16.43,
                                height: AppDimensions.height10(context) * 16.43,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  opacity: 0.2,
                                  image: AssetImage('assets/images/Star.webp'),
                                )),
                                child: Center(
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 15.6,
                                    height:
                                        AppDimensions.height10(context) * 15.6,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Inspiration_center 1.webp'))),
                                    child: Center(
                                        child: Container(
                                      width:
                                          AppDimensions.height10(context) * 6.8,
                                      height:
                                          AppDimensions.height10(context) * 6.8,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFFFFFF)),
                                      child: Center(
                                          child: SizedBox(
                                              width: AppDimensions.height10(
                                                      context) *
                                                  3.2,
                                              height: AppDimensions.height10(
                                                      context) *
                                                  3.2,
                                              child: Image.asset(
                                                  'assets/images/plus.webp'))),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.1, 0.85),
                              child: SizedBox(
                                width: AppDimensions.height10(context) * 13.5,
                                height: AppDimensions.height10(context) * 2.2,
                                child: Text(
                                  'New inspiration',
                                  style: TextStyle(
                                      fontSize:
                                          AppDimensions.height10(context) * 1.8,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              bottom: AppDimensions.height10(context) * 8.0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 3.5 / 3, // Two items in each row

                            mainAxisSpacing: 30,
                            crossAxisSpacing: 0,
                          ),
                          itemCount: InspirationList.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              // color: Colors.red,
                              width: AppDimensions.height10(context) * 16.7,
                              height: AppDimensions.height10(context) * 30,
                              child: Column(children: [
                                AnimatedScaleButton(
                                  onTap: () async {
                                    final SharedPreferences prefs =
                                        await _prefs;

                                    var hurdleId = prefs.setInt(
                                        'userInspirationId',
                                        InspirationList[index]['id']);
                                    Navigator.push(
                                        context,
                                        FadePageRoute(
                                            page: record_inspiration()));
                                  },
                                  child: Container(
                                    width:
                                        AppDimensions.height10(context) * 16.7,
                                    height:
                                        AppDimensions.height10(context) * 16.7,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: InspirationList[index]
                                                    ['inspirationId'] ==
                                                1
                                            ? DecorationImage(
                                                image: FileImage(File(
                                                    InspirationList[index]
                                                        ['file'])),
                                                fit: BoxFit.cover)
                                            : DecorationImage(
                                                image: AssetImage(InspirationList[
                                                                index]
                                                            ['inspirationId'] ==
                                                        4
                                                    ? 'assets/images/distraction content.webp'
                                                    : InspirationList[index][
                                                                'inspirationId'] ==
                                                            3
                                                        ? 'assets/images/video_play.webp'
                                                        : 'assets/images/Rectangle 10.webp'),
                                                fit: BoxFit.cover)),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10(context) * 16.7,
                                  //height: AppDimensions.height10(context) * 1.9,
                                  margin: EdgeInsets.only(
                                      top: AppDimensions.height10(context) *
                                          0.2),
                                  child: Center(
                                      child: Text(
                                    InspirationList[index]['title'],
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFFFFFFF)),
                                  )),
                                ),
                                SizedBox(
                                  child: Center(
                                      child: Text(
                                    InspirationList[index]['description'],
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.0,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFFFFFFF)),
                                  )),
                                )
                              ]),
                            );
                          }))
                      // widget.muliple_insp
                      //     ? Container(
                      //         //  color: Colors.red,
                      //         // height: AppDimensions.height10(context) * 47.0,
                      //         margin: EdgeInsets.only(
                      //             top: AppDimensions.height10(context) * 2.4,
                      //             bottom: AppDimensions.height10(context) * 2.5),
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               width: AppDimensions.height10(context) * 16.7,
                      //               //  height: AppDimensions.height10(context) * 71.0,
                      //               margin: EdgeInsets.only(
                      //                   left: AppDimensions.height10(context) * 3.0),

                      //               child: Column(
                      //                 children: [
                      //                   GestureDetector(
                      //                     onTap: () {},
                      //                     child: SizedBox(
                      //                       width:
                      //                           AppDimensions.height10(context) * 16.7,
                      //                       height:
                      //                           AppDimensions.height10(context) * 22,
                      //                       child: Column(children: [
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   16.7,
                      //                           decoration: const BoxDecoration(
                      //                               shape: BoxShape.circle,
                      //                               image: DecorationImage(
                      //                                   image: AssetImage(
                      //                                       'assets/images/Rectangle 10.webp'),
                      //                                   fit: BoxFit.cover)),
                      //                         ),
                      //                         Container(
                      //                           // width: AppDimensions.height10(context) * 16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   1.9,
                      //                           margin: EdgeInsets.only(
                      //                               top: AppDimensions.height10(
                      //                                       context) *
                      //                                   0.5),
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Feelings and thoughts',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.4,
                      //                                 fontWeight: FontWeight.w600,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         ),
                      //                         SizedBox(
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.0,
                      //                                 fontWeight: FontWeight.w400,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       ]),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {},
                      //                     child: Container(
                      //                       width:
                      //                           AppDimensions.height10(context) * 16.7,
                      //                       height:
                      //                           AppDimensions.height10(context) * 22,
                      //                       margin: EdgeInsets.only(
                      //                           top: AppDimensions.height10(context) *
                      //                               3.0,
                      //                           bottom:
                      //                               AppDimensions.height10(context) *
                      //                                   3.0),
                      //                       child: Column(children: [
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   16.7,
                      //                           decoration: const BoxDecoration(
                      //                               color: Color(0xFFD9D9D9),
                      //                               shape: BoxShape.circle,
                      //                               image: DecorationImage(
                      //                                   image: AssetImage(
                      //                                       'assets/images/image 65.webp'))),
                      //                         ),
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   1.9,
                      //                           margin: EdgeInsets.only(
                      //                               top: AppDimensions.height10(
                      //                                       context) *
                      //                                   0.5),
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Quote',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.4,
                      //                                 fontWeight: FontWeight.w600,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         ),
                      //                         SizedBox(
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.0,
                      //                                 fontWeight: FontWeight.w400,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       ]),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Navigator.push(
                      //                         context,
                      //                         FadePageRoute(
                      //                             page: const record_inspiration(
                      //                           type_switch: 2,
                      //                         )),
                      //                       );
                      //                     },
                      //                     child: Container(
                      //                       width:
                      //                           AppDimensions.height10(context) * 16.7,
                      //                       height:
                      //                           AppDimensions.height10(context) * 22,
                      //                       margin: EdgeInsets.only(
                      //                           bottom:
                      //                               AppDimensions.height10(context) *
                      //                                   3.0),
                      //                       child: Column(children: [
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   16.7,
                      //                           decoration: const BoxDecoration(
                      //                             color: Color(0xFFD9D9D9),
                      //                             shape: BoxShape.circle,
                      //                             gradient: RadialGradient(colors: [
                      //                               Color(0xFFE9A594),
                      //                               Color(0xFFEEBEB2)
                      //                             ]),
                      //                           ),
                      //                           child: Center(
                      //                             child: Text(
                      //                               'Lorem ipsum dolor\nsit amet, consectetur\nadipiscing elit. ',
                      //                               textAlign: TextAlign.center,
                      //                               style: TextStyle(
                      //                                   fontSize:
                      //                                       AppDimensions.height10(
                      //                                               context) *
                      //                                           1.4,
                      //                                   fontWeight: FontWeight.w400,
                      //                                   color: const Color(0xFFFFFFFF)),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   1.9,
                      //                           margin: EdgeInsets.only(
                      //                               top: AppDimensions.height10(
                      //                                       context) *
                      //                                   0.5),
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Quote',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.4,
                      //                                 fontWeight: FontWeight.w600,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         ),
                      //                         SizedBox(
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit....',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.0,
                      //                                 fontWeight: FontWeight.w400,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       ]),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: AppDimensions.height10(context) * 3.0,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             Container(
                      //               // color: Colors.amber,
                      //               width: AppDimensions.height10(context) * 16.7,

                      //               //height: AppDimensions.height10(context) * 71.0,
                      //               margin: EdgeInsets.only(
                      //                   left: AppDimensions.height10(context) * 3.0,
                      //                   top: AppDimensions.height10(context) * 7.0),
                      //               child: Column(
                      //                 children: [
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Navigator.push(
                      //                         context,
                      //                         FadePageRoute(
                      //                             page: const record_inspiration(
                      //                           type_switch: 3,
                      //                         )),
                      //                       );
                      //                     },
                      //                     child: SizedBox(
                      //                       width:
                      //                           AppDimensions.height10(context) * 16.7,
                      //                       height:
                      //                           AppDimensions.height10(context) * 21.2,
                      //                       child: Column(children: [
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   16.7,
                      //                           decoration: const BoxDecoration(
                      //                               color: Color(0xFFD9D9D9),
                      //                               shape: BoxShape.circle,
                      //                               image: DecorationImage(
                      //                                   image: AssetImage(
                      //                                       'assets/images/video_play.webp'),
                      //                                   fit: BoxFit.cover)),
                      //                         ),
                      //                         Container(
                      //                           // width: AppDimensions.height10(context) * 16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   1.9,
                      //                           margin: EdgeInsets.only(
                      //                               top: AppDimensions.height10(
                      //                                       context) *
                      //                                   0.5),
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Music Eye Of The Tiger ',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.4,
                      //                                 fontWeight: FontWeight.w600,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         ),
                      //                         SizedBox(
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Survivors',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.0,
                      //                                 fontWeight: FontWeight.w400,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       ]),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Navigator.push(
                      //                         context,
                      //                         FadePageRoute(
                      //                             page: const record_inspiration(
                      //                           type_switch: 1,
                      //                         )),
                      //                       );
                      //                     },
                      //                     child: Container(
                      //                       width:
                      //                           AppDimensions.height10(context) * 16.7,
                      //                       height:
                      //                           AppDimensions.height10(context) * 21.2,
                      //                       margin: EdgeInsets.only(
                      //                           top: AppDimensions.height10(context) *
                      //                               3.0,
                      //                           bottom:
                      //                               AppDimensions.height10(context) *
                      //                                   3.0),
                      //                       child: Column(children: [
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   16.7,
                      //                           decoration: const BoxDecoration(
                      //                               shape: BoxShape.circle,
                      //                               image: DecorationImage(
                      //                                   image: AssetImage(
                      //                                       'assets/images/sir_nyal.webp'))),
                      //                         ),
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   1.9,
                      //                           margin: EdgeInsets.only(
                      //                               top: AppDimensions.height10(
                      //                                       context) *
                      //                                   0.5),
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Influencer',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.4,
                      //                                 fontWeight: FontWeight.w600,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         ),
                      //                         SizedBox(
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Nir Eyal',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.0,
                      //                                 fontWeight: FontWeight.w400,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       ]),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Navigator.push(
                      //                         context,
                      //                         FadePageRoute(
                      //                             page: const record_inspiration(
                      //                           type_switch: 4,
                      //                         )),
                      //                       );
                      //                     },
                      //                     child: Container(
                      //                       width:
                      //                           AppDimensions.height10(context) * 16.7,
                      //                       height:
                      //                           AppDimensions.height10(context) * 22,
                      //                       margin: EdgeInsets.only(
                      //                           bottom:
                      //                               AppDimensions.height10(context) *
                      //                                   3.0),
                      //                       child: Column(children: [
                      //                         Container(
                      //                           width: AppDimensions.height10(context) *
                      //                               16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   16.7,
                      //                           decoration: const BoxDecoration(
                      //                               shape: BoxShape.circle,
                      //                               color: Color(0xFFD9D9D9),
                      //                               image: DecorationImage(
                      //                                   image: AssetImage(
                      //                                       'assets/images/distraction content.webp'))),
                      //                         ),
                      //                         Container(
                      //                           // width: AppDimensions.height10(context) * 16.7,
                      //                           height:
                      //                               AppDimensions.height10(context) *
                      //                                   1.9,
                      //                           margin: EdgeInsets.only(
                      //                               top: AppDimensions.height10(
                      //                                       context) *
                      //                                   0.5),
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Content',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.4,
                      //                                 fontWeight: FontWeight.w600,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         ),
                      //                         SizedBox(
                      //                           child: Center(
                      //                               child: Text(
                      //                             'Learn How To Avoid Distraction In A\nWorld That Is Full Of It.',
                      //                             style: TextStyle(
                      //                                 fontSize: AppDimensions.height10(
                      //                                         context) *
                      //                                     1.0,
                      //                                 fontWeight: FontWeight.w400,
                      //                                 color: const Color(0xFFFFFFFF)),
                      //                           )),
                      //                         )
                      //                       ]),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: AppDimensions.height10(context) * 3.0,
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     : GestureDetector(
                      //         onTap: () {
                      //           widget.is_Updated
                      //               ? NavigatorState()
                      //               : Navigator.push(
                      //                   context,
                      //                   FadePageRoute(
                      //                       page: const record_inspiration(
                      //                     type_switch: 1,
                      //                   )),
                      //                 );
                      //         },
                      //         child: Container(
                      //           width: AppDimensions.height10(context) * 16.7,
                      //           height: AppDimensions.height10(context) * 21.2,
                      //           margin: EdgeInsets.only(
                      //             top: AppDimensions.height10(context) * 5.3,
                      //             right: AppDimensions.height10(context) * 21.7,
                      //             left: AppDimensions.height10(context) * 3.0,
                      //           ),
                      //           child: Column(children: [
                      //             Container(
                      //               width: AppDimensions.height10(context) * 16.7,
                      //               height: AppDimensions.height10(context) * 16.7,
                      //               decoration: const BoxDecoration(
                      //                   shape: BoxShape.circle,
                      //                   color: Color(0xFFD9D9D9),
                      //                   image: DecorationImage(
                      //                       image: AssetImage(
                      //                           'assets/images/sir_nyal.webp'),
                      //                       fit: BoxFit.cover)),
                      //             ),
                      //             Container(
                      //               width: AppDimensions.height10(context) * 16.7,
                      //               height: AppDimensions.height10(context) * 1.9,
                      //               margin: EdgeInsets.only(
                      //                   top: AppDimensions.height10(context) * 0.5),
                      //               child: Center(
                      //                   child: Text(
                      //                 'Influencer',
                      //                 style: TextStyle(
                      //                     fontSize:
                      //                         AppDimensions.height10(context) * 1.4,
                      //                     fontWeight: FontWeight.w600,
                      //                     color: const Color(0xFFFFFFFF)),
                      //               )),
                      //             ),
                      //             SizedBox(
                      //               child: Center(
                      //                   child: Text(
                      //                 'Nir Eyal',
                      //                 style: TextStyle(
                      //                     fontSize:
                      //                         AppDimensions.height10(context) * 1.0,
                      //                     fontWeight: FontWeight.w400,
                      //                     color: const Color(0xFFFFFFFF)),
                      //               )),
                      //             )
                      //           ]),
                      //         ),
                      //       ),
                      ,
                      // widget.muliple_insp
                      //     ? Container()
                      //     :
                      widget.is_Updated
                          ? Container(
                              width: AppDimensions.height10(context) * 38.259,
                              height: AppDimensions.height10(context) * 9.707,
                              margin: EdgeInsets.only(
                                  top: AppDimensions.height10(context) * 12.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimensions.height10(context) * 2.0),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFD4B7B9),
                                        Color(0xFF91698C)
                                      ])),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.261),
                                    width:
                                        AppDimensions.height10(context) * 4.437,
                                    height:
                                        AppDimensions.height10(context) * 4.437,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/circle_tick.webp'))),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 6.9,
                                    height:
                                        AppDimensions.height10(context) * 3.6,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            1.232),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  4.6,
                                          height:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          //   color: Colors.amber,
                                          child: Text(
                                            widget.is_Updated
                                                ? 'Updated'
                                                : 'SAVED',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.3,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              AppDimensions.height10(context) *
                                                  6.9,
                                          height:
                                              AppDimensions.height10(context) *
                                                  2.2,
                                          child: Text(
                                            'Nir Eyal',
                                            style: TextStyle(
                                                fontSize:
                                                    AppDimensions.height10(
                                                            context) *
                                                        1.8,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        AppDimensions.height10(context) * 8.1,
                                    height:
                                        AppDimensions.height10(context) * 6.0,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.height10(context) *
                                            15.1),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFFFFFFF),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.height10(context) *
                                              2.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Veiw',
                                        style: TextStyle(
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.8,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      Container(
                        width: AppDimensions.height10(context) * 17.0,
                        height: AppDimensions.height10(context) * 0.5,
                        margin: EdgeInsets.only(
                            top: AppDimensions.height10(context) * 0.29),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 2.0),
                            color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                      )
                    ],
                  ))
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                ),
        ),
        extendBody: true,
        bottomNavigationBar:
            // widget.muliple_insp
            //     ?
            BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            // color: Colors.blue,
            padding: EdgeInsets.only(
                left: AppDimensions.height10(context) * 2.2,
                right: AppDimensions.height10(context) * 2.2),
            height: AppDimensions.height10(context) * 7.0,
            // width: AppDimensions.height10(context) * 41.4,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: AppDimensions.height10(context) * 2.4,
                          height: AppDimensions.height10(context) * 2.4,
                          // padding: EdgeInsets.only(
                          //     top: AppDimensions.height10(context) * 0.5,
                          //     bottom: AppDimensions.height10(context) * 0.5),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/ic_filter_list.webp',
                              width: AppDimensions.height10(context) * 2.4,
                              height: AppDimensions.height10(context) * 2.4,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 0.5,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 30.3,
                                    color: const Color.fromRGBO(0, 0, 0, 0.001),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  41.4,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          color: const Color(
                                                              0xFF828282)))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          5.0,
                                                      margin: EdgeInsets.only(
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0),
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF2F80ED)),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _selected_goal =
                                                            goalName[
                                                                _Goal_Index];
                                                      });

                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.7,
                                                      child: Text(
                                                        'Done',
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF2F80ED)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: ListWheelScrollView(
                                                itemExtent: 40,
                                                magnification: 1.2,
                                                useMagnifier:
                                                    true, // Set the height of each statement
                                                children: goalName
                                                    .map((statement) =>
                                                        Text(statement,
                                                            style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )))
                                                    .toList(),
                                                onSelectedItemChanged:
                                                    (int index) {
                                                  setState(() {
                                                    _Goal_Index = index;
                                                    //activity_duration = _statements[_selectedIndex];
                                                    // _selected_activity =
                                                    //     _statements[index];
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            // width: AppDimensions.height10(context) * 11.5,
                            height: AppDimensions.height10(context) * 3.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 1.0),
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFFE0E0E0))),
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.3,
                                right: AppDimensions.height10(context) * 1.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.0),
                                  child: Text(
                                    'Goal:',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  //width: AppDimensions.height10(context) * 1.9,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          0.8),
                                  child: Center(
                                    child: Text(
                                      _selected_goal,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffFA9934)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 2.4,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 0.8,
                                      right:
                                          AppDimensions.height10(context) * 1.0,
                                      bottom: AppDimensions.height10(context) *
                                          0.3),
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffFA9934),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 30.3,
                                    color: const Color.fromRGBO(0, 0, 0, 0.001),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: AppDimensions.height10(
                                                      context) *
                                                  4.0,
                                              width: AppDimensions.height10(
                                                      context) *
                                                  41.4,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          width: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              0.1,
                                                          color: const Color(
                                                              0xFF828282)))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          5.0,
                                                      margin: EdgeInsets.only(
                                                          right: AppDimensions
                                                                  .height10(
                                                                      context) *
                                                              2.0),
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF2F80ED)),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _selected_activity =
                                                            _tags[_selectedTag];
                                                      });
                                                      print('asf');
                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      width: AppDimensions
                                                              .height10(
                                                                  context) *
                                                          3.7,
                                                      child: Text(
                                                        'Done',
                                                        style: TextStyle(
                                                            fontSize: AppDimensions
                                                                    .height10(
                                                                        context) *
                                                                1.4,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: const Color(
                                                                0xFF2F80ED)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: ListWheelScrollView(
                                                itemExtent: 40,
                                                magnification: 1.2,
                                                useMagnifier:
                                                    true, // Set the height of each statement
                                                children: _tags
                                                    .map((statement) =>
                                                        Text(statement,
                                                            style: TextStyle(
                                                              fontSize: AppDimensions
                                                                      .height10(
                                                                          context) *
                                                                  2.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )))
                                                    .toList(),
                                                onSelectedItemChanged:
                                                    (int index) {
                                                  setState(() {
                                                    _selectedTag = index;
                                                    //activity_duration = _statements[_selectedIndex];
                                                    // _selected_activity =
                                                    //     _statements[index];
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            //width: AppDimensions.height10(context) * 11.6,
                            height: AppDimensions.height10(context) * 3.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.height10(context) * 1.0),
                                border: Border.all(
                                    width:
                                        AppDimensions.height10(context) * 0.1,
                                    color: const Color(0xFFE0E0E0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          1.0),
                                  child: Text(
                                    'Type:',
                                    style: TextStyle(
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffFA9934)),
                                  ),
                                ),
                                Container(
                                  // width: AppDimensions.height10(context) * 1.9,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.height10(context) *
                                          0.8),
                                  child: Center(
                                    child: Text(
                                      _selected_activity,
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10(context) *
                                                  1.4,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xffFA9934)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: AppDimensions.height10(context) * 2.4,
                                  height: AppDimensions.height10(context) * 2.4,
                                  margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.height10(context) * 0.8,
                                      bottom:
                                          AppDimensions.height10(context) * 0.3,
                                      right: AppDimensions.height10(context) *
                                          1.0),
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffFA9934),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: AppDimensions.height10(context) * 3.9,
                            height: AppDimensions.height10(context) * 3.4,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10(context) * 1.0,
                                right: AppDimensions.height10(context) * 3.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Clec',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xFFFA9934)
                                      .withOpacity(0.30)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: AppDimensions.height10(context) * 4.9,
                    height: AppDimensions.height10(context) * 5.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFFBFBFB)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/Search.webp',
                        width: AppDimensions.height10(context) * 5,
                        height: AppDimensions.height10(context) * 5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                //const Padding(padding: EdgeInsets.all(10))
              ],
            ),
          ),
        )
        //:
        // Container(),
        );
  }
}

_showBottomSheet(BuildContext context) {
  String goal = 'Goal Name';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: const Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.height10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

_showTagSheet(BuildContext context) {
  String goal = 'Tag';

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: AppDimensions.height10(context) * 30.3,
          color: const Color.fromRGBO(0, 0, 0, 0.001),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.height10(context) * 41.4,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10(context) * 0.1,
                                color: const Color(0xFF828282)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: AppDimensions.height10(context) * 5.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.height10(context) * 2.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensions.height10(context) * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF2F80ED)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppDimensions.height10(context) * 3.7,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                fontSize: AppDimensions.height10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2F80ED)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppDimensions.height10(context) * 37.5,
                    height: AppDimensions.height10(context) * 24.8,
                    // color: Colors.amber,
                    child: ListWheelScrollView(
                        onSelectedItemChanged: (value) {},
                        diameterRatio: 1.5,
                        // magnification: 1.5,
                        overAndUnderCenterOpacity: 0.5,
                        itemExtent: AppDimensions.height10(context) * 3.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    //when it will be reconstructed bottom decororation will be set, at the moment it is there to show presence.
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 1',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 2',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: AppDimensions.height10(context) *
                                            0.1,
                                        color: const Color(0xFF828282)))),
                            child: Center(
                              child: Text(
                                '$goal 3',
                                style: TextStyle(
                                    fontSize:
                                        AppDimensions.height10(context) * 2.2,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
