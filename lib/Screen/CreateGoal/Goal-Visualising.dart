import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/CreateGoal/Goal%20Finished.dart';
import 'package:potenic_app/Widgets/back_cont.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

import '../../Widgets/fading.dart';

class Visualising extends StatefulWidget {
  const Visualising({Key? key}) : super(key: key);

  @override
  State<Visualising> createState() => _VisualisingState();
}

class _VisualisingState extends State<Visualising> {
  List<Map<String, dynamic>> goalVisualising = [];
  //closing the focus
  final FocusNode blankNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Add one element to the list when the screen is initialized.
    goalVisualising.add({
      'key': 'Reason ${goalVisualising.length}',
      'text': '',
    });
  }

  int item = 1;

  void handleTextChanged(int index, String newValue) {
    setState(() {
      goalVisualising[index]['text'] = newValue;
    });
    print(goalVisualising);
  }

  void decrement() {
    item = item - 1;
  }

  void handleDelete(int index) {
    print('=========>dELETED');
    setState(() {
      // myTextFields[index]['text'].remove(index);

      goalVisualising.removeAt(index);

      for (int i = index + 1; i < goalVisualising.length; i++) {
        goalVisualising[i]['key'] = i.toString();

        // Assuming 'key' is the identifier you want to update.
      }
      //index--;
    });
    decrement();
    //closing the focus
    blankNode.requestFocus();
    //closing the focus
    print(goalVisualising);
    print('dELETED');
  }

  void increment() {
    item = item + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppDimensions.height10(context) * 5.0),
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
                  width: AppDimensions.height10(context) * 3,
                  height: AppDimensions.height10(context) * 3,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
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
                    width: AppDimensions.height10(context) * 3.0,
                    height: AppDimensions.height10(context) * 3.0,
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Categories.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: AppDimensions.height10(context) * 5.2),
                  child: Center(
                    child: Text(
                      "Star Creation 5/5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 1.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 0.5,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Control my anger",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                    // color: Colors.blue,
                    width: AppDimensions.height10(context) * 10.4,
                    height: AppDimensions.height10(context) * 7.6,
                    padding: EdgeInsets.only(
                        left: AppDimensions.height10(context) * 1.5,
                        right: AppDimensions.height10(context) * 1.5),
                    child: Image.asset(
                      "assets/images/image3.png",
                      fit: BoxFit.contain,
                    )),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Visualising Your New Self",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimensions.height10(context) * 2.8,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 1.0,
                ),
                Container(
                  // height: AppDimensions.height10(context) * 4.9,
                  width: AppDimensions.height10(context) * 37.2,
                  child: Center(
                    child: Text(
                      "What does it look like? What are you \n  doing? What emotions do you have and \n how does it feel?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.height10(context) * 1.8,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 3.4,
                ),
                Container(
                  width: AppDimensions.height10(context) * 38.2,
                  height: item == 1
                      ? AppDimensions.height10(context) * 21.0
                      : AppDimensions.height10(context) * 34.0,
                  child: Stack(children: [
                    Container(
                      // width: AppDimensions.height10(context) * 38.2,
                      //height: AppDimensions.height10(context) * 33.0,
                      padding: EdgeInsets.only(
                        top: AppDimensions.height10(context) * 1.1,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.white,
                              width: AppDimensions.height10(context) * 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(
                              AppDimensions.height10(context) * 1.8))),
                      child: ListView.builder(
                        itemCount: goalVisualising.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, index) {
                          return Column(children: [
                            inner_text(
                              key: Key(goalVisualising[index]['key']),
                              delete: true,
                              head_text: "${index + 1}. I picture myself.... ",
                              body_text: goalVisualising[index]['text'],
                              length: 200,
                              onChanged: (newText) {
                                setState(() {
                                  goalVisualising[index]['text'] = newText;
                                });
                                handleTextChanged(index, newText);
                              },
                              onDelete: () => handleDelete(index),
                              index: index,
                              placeHolder: '',
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.height10(context) * 1.5,
                                  bottom:
                                      AppDimensions.height10(context) * 1.3),
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      "Character count: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF464646),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "200",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF464646),
                                        fontSize:
                                            AppDimensions.height10(context) *
                                                1.3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        AppDimensions.height10(context) * 0.3,
                                    width:
                                        AppDimensions.height10(context) * 4.0,
                                    margin: EdgeInsets.only(
                                        top: AppDimensions.height10(context) *
                                            0.5,
                                        left: AppDimensions.height10(context) *
                                            4.0),
                                    decoration: BoxDecoration(
                                        color:
                                            Color(0xFF282828).withOpacity(0.2)),
                                  )
                                ],
                              ),
                            )
                          ]);
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        //alignment: Alignment.bottomCenter,
                        alignment: item == 1
                            ? Alignment(0.01, 1.3)
                            : Alignment(0.01, 1.17),
                        //heightFactor: 0.5,
                        child: Container(
                          height: AppDimensions.height10(context) * 4.7,
                          width: AppDimensions.height10(context) * 4.7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFB1B8FF), Color(0xFFC5CAFF)]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4, left: 4, right: 4, bottom: 4),
                            child: GestureDetector(
                                onTap: () {
                                  increment();
                                  setState(() {
                                    goalVisualising.add({
                                      'key':
                                          'Identity ${goalVisualising.length.toString()}',
                                      'text': '',
                                    });
                                  });
                                  print("=============>Pressed");
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'assets/images/Addgoal.png',
                                    height:
                                        AppDimensions.height10(context) * 4.7,
                                    width:
                                        AppDimensions.height10(context) * 4.7,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        height: AppDimensions.height10(context) * 12.2,
                      )
                    : SizedBox(
                        height: AppDimensions.height10(context) * 5.0,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        // color: Colors.blue,
                        width: AppDimensions.height10(context) * 5.0,
                        height: AppDimensions.height10(context) * 5.0,
                        child: Image.asset(
                          "assets/images/Moreactions.png",
                          fit: BoxFit.contain,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          FadePageRoute(
                            page: const GoalFinished(),
                          ),
                        );
                      },
                      child: Container(
                        height: AppDimensions.height10(context) * 5,
                        width: AppDimensions.height10(context) * 31.3,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFF7D50),
                          border: Border.all(color: Colors.transparent),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFFCC10D), Color(0xFFFDA210)]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height10(context) * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimensions.height10(context) * 2.5,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          )
        ],
      ),
    );
  }
}
