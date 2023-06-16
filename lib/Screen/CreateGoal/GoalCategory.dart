import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/Circle.dart';
import 'package:potenic_app/Widgets/bottom_sheet.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../API/Goal.dart';

class GoalCategory extends StatefulWidget {
  final String title;
  final String Circletitle;
  final int id;
  // final String message;

  GoalCategory(this.title, this.Circletitle, this.id);

  @override
  State<GoalCategory> createState() => _GoalCategoryState();
}

class _GoalCategoryState extends State<GoalCategory> {
  bool SearchIcon = false;
  bool Loading = true;
  String searchText = ''; // Add this line

  List<Map<String, dynamic>>? Allgoal;

  @override
  void initState() {
    super.initState();
    _fetchgetAllGoal();
  }

  void _fetchgetAllGoal() {
    AdminGoal.getAllGoal(widget.id).then((response) {
      if (response.length != 0) {
        setState(() {
          Loading = false;
          Allgoal = response;
        });
      } else {
        setState(() {
          Loading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        Loading = false;
      });
      print("error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppDimensions.height10 * 5.0),
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
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
                    // Add code for performing close action
                  },
                ),
              ),
              actions: [
                Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Close.png',
                      width: AppDimensions.height10 * 3.0,
                      height: AppDimensions.height10 * 3.0,
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
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
              ],
            )),
        body: Stack(
          children: [
            Loading == false
                ? Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Categories.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    color: Colors.white,
                  ),

            // SingleChildScrollView(
            //   child: ,
            // )
            Loading == false
                ? Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: AppDimensions.height10 * 4.2),
                        child: Center(
                          child: Text(
                            "Star Creation 2/5",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: AppDimensions.height10 * 1.8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10 * 2.7,
                      ),
                      circles(
                          circle_text: widget.Circletitle,
                          circle_color1: 0xFFFC854F,
                          circle_color2: 0xFFFAA960,
                          circle_border: 3,
                          circle_bordercolor: 0xFFFFFFFF,
                          circle_height: AppDimensions.height10 * 13.4,
                          circle_width: AppDimensions.height10 * 13.4,
                          textfont: AppDimensions.height10 * 1.6,
                          textcolor: 0XFFFFFFFF),
                      SizedBox(
                        height: AppDimensions.height10 * 1.6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: AppDimensions.height10 * 1.5,
                          ),
                          Container(
                            height: AppDimensions.height10 * 8.9,
                            child: Text(
                              "Select your goal for \n ‘${widget.Circletitle}’ ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: AppDimensions.height10 * 2.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimensions.height10 * 48.9,
                        width: AppDimensions.height10 * 38,
                        child: GridView.builder(
                            shrinkWrap: false,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  4.2 / 3, // Two items in each row

                              mainAxisSpacing: 1.0,
                              crossAxisSpacing: 0.1,
                            ),
                            itemCount: Allgoal![0]["goals"].length,
                            itemBuilder: (context, index1) {
                              final goalName = Allgoal![0]["goals"][index1]
                                      ["goalName"]
                                  .toString();

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          bottom_sheet(
                                              context,
                                              Allgoal![0]["goals"][index1]
                                                  ["id"]);
                                        },
                                        child: circles(
                                            circle_text: Allgoal![0]["goals"]
                                                [index1]["goalName"],
                                            circle_color1: 0xFFFFFFFF,
                                            circle_color2: 0xFFFFFFFF,
                                            circle_border: 3.0,
                                            circle_bordercolor: 0xFFEE8E6F,
                                            circle_height:
                                                AppDimensions.height10 * 13.4,
                                            circle_width:
                                                AppDimensions.height10 * 13.4,
                                            textfont:
                                                AppDimensions.height10 * 1.6,
                                            textcolor: 0xFFFA9934),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }),
                      ),
                    ],
                  )
                : const Center(
                    child: SpinKitFadingCircle(
                      color: Color(0xFFB1B8FF),
                      size: 80,
                    ),
                  ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            // color: Colors.blue,
            padding: EdgeInsets.only(
                left: AppDimensions.height10 * 2.2,
                right: AppDimensions.height10 * 2.2),
            height: AppDimensions.height10 * 7.0,
            width: AppDimensions.height10 * 41.4,
            child: SearchIcon == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: AppDimensions.height10 * 3.6,
                            width: AppDimensions.height10 * 31.3,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xFF767680).withOpacity(0.12),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppDimensions.height10))),
                            child: Center(
                              child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchText = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0.0),
                                      prefixIcon: Image.asset(
                                        'assets/images/Light.png',
                                        width: AppDimensions.height10 * 1.5,
                                        height: AppDimensions.height10 * 1.5,
                                      ),
                                      suffixIcon: Image.asset(
                                        'assets/images/cancel.png',
                                        width: AppDimensions.height10 * 2.3,
                                        height: AppDimensions.height10 * 2.3,
                                        // fit: BoxFit.contain,
                                      ),
                                      hintText: "Search",
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)))),
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            SearchIcon = false;
                          });
                        },
                        child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppDimensions.height10 * 1.7,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF007AFF),
                          ),
                        ),
                      ),

                      //const Padding(padding: EdgeInsets.all(10))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: AppDimensions.height10 * 4.7,
                            height: AppDimensions.height10 * 4.7,
                            padding: EdgeInsets.only(
                                top: AppDimensions.height10 * 0.5,
                                bottom: AppDimensions.height10 * 0.5),
                            child: GestureDetector(
                              onTap: () {
                                bottom_sheet(context, widget.id);
                              },
                              child: Image.asset(
                                'assets/images/Add.png',
                                width: AppDimensions.height10 * 4.7,
                                height: AppDimensions.height10 * 4.7,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppDimensions.height10 * 0.5,
                          ),
                          Text(
                            'Create a new goal! ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFFA9934),
                              // fontFamily: ,
                              fontSize: AppDimensions.height10 * 1.6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        width: AppDimensions.height10 * 4.7,
                        height: AppDimensions.height10 * 4.7,
                        padding: EdgeInsets.only(
                            top: AppDimensions.height10 * 0.5,
                            bottom: AppDimensions.height10 * 0.5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              SearchIcon = true;
                            });
                          },
                          child: Image.asset(
                            'assets/images/Search.png',
                            width: AppDimensions.height10 * 5,
                            height: AppDimensions.height10 * 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      //const Padding(padding: EdgeInsets.all(10))
                    ],
                  ),
          ),
        ));
  }
}
