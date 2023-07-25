import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Hurdles.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdle_name.dart';
import 'package:potenic_app/Screen/captureHurdles/capture_hurdles_summary.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class select_hurdle extends StatefulWidget {
  final bool update;
  const select_hurdle({super.key, required this.update});

  @override
  State<select_hurdle> createState() => _select_hurdleState();
}

class _select_hurdleState extends State<select_hurdle> {
  var hurdlesList;
  int selectBox = -1;
  bool Loading = true;

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchHurdle() async {
    Hurdles().getAllHurdles().then((response) {
      if (response.length != 0) {
        setState(() {
          hurdlesList = response['hurdle'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  void _fetchHurdleSummary() async {
    Hurdles().getHurdleById().then((response) {
      if (response.length != 0) {
        setState(() {
          selectBox = response['hurdle']['hurdleId'];
        });
        loadData();
        return response;
      } else {
        return response.statusCode;
      }
    }).catchError((error) {
      print("error");
    });
  }

  @override
  void initState() {
    super.initState();
    print(
        "---------------------------------------------------------------------");
    _fetchHurdle();
    if (widget.update == true) {
      _fetchHurdleSummary();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.webp',
                  width: AppDimensions.height10(context) * 3.0,
                  height: AppDimensions.height10(context) * 3.0,
                  fit: BoxFit.cover,
                )),
          ),
          centerTitle: true,
          title: SizedBox(
            width: AppDimensions.height10(context) * 19.0,
            height: AppDimensions.height10(context) * 2.4,
            child: Row(
              children: [
                GradientText(
                  'Capture Hurdle ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  ' 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
                GradientText(
                  '/5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDimensions.height10(context) * 2.2,
                    fontWeight: FontWeight.w400,
                  ),
                  colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                ),
              ],
            ),
          ),
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
          ]),
      extendBodyBehindAppBar: true,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          // margin: EdgeInsets.only(top:   AppDimensions.height10(context)(context)* 6.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/practicebackground.webp'),
                  fit: BoxFit.cover)),
          child: Loading == false
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: AppDimensions.height10(context) * 33.7,
                    height: AppDimensions.height10(context) * 7.3,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 18.0),
                    child: Center(
                      //slight width issue
                      child: GradientText(
                        'What or who has\ntriggered your hurdle?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 2.8,
                          fontWeight: FontWeight.w700,
                        ),
                        colors: const [Color(0xffFA9934), Color(0xffEDD15E)],
                      ),
                    ),
                  ),
                  Container(
                    height: AppDimensions.height10(context) * 45.6,
                    //width: AppDimensions.height10(context) * 30.6,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.9),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.height10(context) * 4),
                    child: SingleChildScrollView(
                      child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3.5 / 3, // Two items in each row

                            mainAxisSpacing: 6.5,
                            crossAxisSpacing: 3,
                          ),
                          itemCount: hurdlesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: AppDimensions.height10(context) * 41.9,
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: AppDimensions.height10(context) * 5),
                              child: AnimatedScaleButton(
                                onTap: () async {
                                  final SharedPreferences prefs = await _prefs;
                                  var hurdleName = prefs.setString('hurdleName',
                                      hurdlesList[index]['hurdleName']);
                                  var hurdleId = prefs.setInt(
                                      'hurdleId', hurdlesList[index]['id']);
                                  setState(() {
                                    selectBox = index;
                                  });
                                  if (widget.update == true) {
                                    Hurdles().updateHurdle(
                                        'hurdleId', hurdlesList[index]['id']);
                                  }
                                },
                                child: Container(
                                  height: selectBox == index
                                      ? AppDimensions.height10(context) * 14.1
                                      : AppDimensions.height10(context) * 13.1,
                                  width: selectBox == index
                                      ? AppDimensions.height10(context) * 14.1
                                      : AppDimensions.height10(context) * 13.1,
                                  padding: EdgeInsets.all(
                                      AppDimensions.height10(context)),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: selectBox == index
                                            ? AppDimensions.height10(context) *
                                                0.2
                                            : 0,
                                        color: selectBox == index
                                            ? Colors.white
                                            : Colors.transparent),
                                  ),
                                  child: Container(
                                    height:
                                        AppDimensions.height10(context) * 13.1,
                                    width:
                                        AppDimensions.height10(context) * 13.1,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: AppDimensions.height10(
                                                    context) *
                                                0.1,
                                            color: Colors.white),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffBE3FC6),
                                              Color(0xff642445)
                                            ])),
                                    child: Center(
                                      child: Text(
                                        hurdlesList[index]['hurdleName'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: AppDimensions.height10(
                                                    context) *
                                                1.6,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 25.4,
                    height: AppDimensions.height10(context) * 5.0,
                    margin: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 3.2,
                        bottom: AppDimensions.height10(context) * 2.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: selectBox != -1
                            ? [
                                const Color(0xffFCC10D),
                                const Color(0xffFDA210),
                              ]
                            : [
                                const Color(0xffFCC10D).withOpacity(0.5),
                                const Color(0xffFDA210).withOpacity(0.5),
                              ],
                      ),
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 5.0),
                    ),
                    child: TextButton(
                        onPressed: () {
                          if (selectBox != -1) {
                            widget.update == false
                                ? Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: hurdle_name(
                                      update: false,
                                    )))
                                : Navigator.push(
                                    context,
                                    FadePageRoute(
                                        page: const summary_hurdles(
                                      delete_hurdle: true,
                                    )),
                                  );
                          }
                        },
                        child: Text(
                          widget.update ? 'Update summary' : 'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                              color: selectBox != -1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5)),
                        )),
                  ),
                  Container(
                    width: AppDimensions.height10(context) * 17.0,
                    height: AppDimensions.height10(context) * 0.5,
                    // margin:
                    //     EdgeInsets.only(bottom: AppDimensions.height10(context) * 0.8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 2.0),
                        color: const Color(0xFFFFFFFF).withOpacity(0.3)),
                  )
                ])
              : const Center(
                  child: SpinKitFadingCircle(
                    color: Color(0xFFB1B8FF),
                    size: 80,
                  ),
                )),
    );
  }
}
