import 'dart:async';
import 'package:flutter/material.dart';
import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

String start_time = '11:11 am';
String end_time = '07:00 pm';
String? minutes;
String? hours;

class routinecommitment extends StatefulWidget {
  @override
  State<routinecommitment> createState() => _routinecommitmentState();
}

class _routinecommitmentState extends State<routinecommitment> {
  var pracDetails;
  var schedule;
  bool Loading = true;

  @override
  void initState() {
    super.initState();
    _fetchPracticeDetails();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 1), onDoneLoading);
  }

  void onDoneLoading() {
    setState(() {
      Loading = false;
    });
  }

  void _fetchPracticeDetails() async {
    PracticeGoalApi.getUserPractice().then((response) {
      if (response.length != 0) {
        print("---------------------------------");
        setState(() {
          pracDetails = response;
          schedule = response['schedule'];
        });
        mapItems(schedule, updates);
        print(updates);
        updates.sort((a, b) {
          final daysOrder = [
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
            "Sunday"
          ];
          return daysOrder
              .indexOf(a['day'])
              .compareTo(daysOrder.indexOf(b['day']));
        });
        print(updates);
        loadData();

        print('$pracDetails');
      } else {
        print("response:$response");
      }
    }).catchError((error) {
      print("hell");
    });
  }

  List<Map<String, dynamic>> updates = [];
  void mapItems(list1, list2) {
    for (var item in list1) {
      list2.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 5, bottom: 5),
      child: Loading == true
          ? const Center(
              child: SpinKitFadingCircle(
                color: Color(0xFFB1B8FF),
                size: 80,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: updates != null ? updates.length : 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: AppDimensions.height10(context) * 1.0,
                        ),
                        child: schedule_card(
                          days: updates[index]['day'],
                          // endTime: updates[index]['time2'],
                          startTime: updates
                              .where((element) =>
                                  element['day'] == updates[index]['day'])
                              .toList(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppDimensions.height10(context) * 0.5),
                ],
              ),
            ),
    );
  }
}

class schedule_card extends StatefulWidget {
  final String days;
  final List<Map<String, dynamic>> startTime;
  // final String endTime;

  const schedule_card({
    Key? key,
    required this.days,
    required this.startTime,
    // required this.endTime
  }) : super(key: key);

  @override
  State<schedule_card> createState() => _schedule_cardState();
}

class _schedule_cardState extends State<schedule_card> {
  final GlobalKey<AdvanceExpansionTileState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: AdvanceExpansionTile(
                key: _globalKey,
                initiallyExpanded: true,
                disabled: true,
                hideIcon: true,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                title: Text(
                  widget.days,
                  style: const TextStyle(
                      color: Color.fromRGBO(67, 114, 150, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
                children: <Widget>[
                  for (int i = 0;
                      i < widget.startTime[0].keys.length - 1;
                      i++) ...[
                    Container(
                      // color:Colors.orange,
                      width: AppDimensions.height10(context) * 36.2,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          startTimerState(
                            key: Key("${widget.key}"),
                            text: ' ${i + 1}) Time: ',
                            startTime: widget.startTime[0].values
                                .elementAt(i + 1)
                                // .firstWhere(
                                //     (element) => element['day'] == widget.days)
                                // .containsKey('time${i + 1}')
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                  ]

                  // Container(
                  //   // color:Colors.orange,
                  //   width: AppDimensions.height10(context) * 36.2,
                  //   padding: const EdgeInsets.only(left: 0.0, bottom: 10),
                  //   child: Row(
                  //     children: [
                  //       endTimerState(
                  //         key: Key("${widget.key}"),
                  //         text: '1) Time: ',
                  //         endTime: widget.endTime,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // add more data that you want like this
                ],
              ),
            ),
          ],
        ));
  }
}

class startTimerState extends StatefulWidget {
  final String text;
  final String startTime;

  const startTimerState({
    Key? key,
    required this.text,
    required this.startTime,
  }) : super(key: key);

  @override
  State<startTimerState> createState() => _startTimerStateState(text);
}

class _startTimerStateState extends State<startTimerState> {
  String text_state;

  _startTimerStateState(this.text_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10(context) * 31.6,
      height: AppDimensions.height10(context) * 3.7,
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                text_state,
                //textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: 16,
                  fontFamily: "Laila",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: 162,
                child: Text(
                  widget.startTime,
                  style: const TextStyle(
                    color: Color.fromRGBO(250, 153, 52, 1),
                    fontSize: 16,
                    fontFamily: "Laila",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class endTimerState extends StatefulWidget {
  final String text;
  final String endTime;

  const endTimerState({Key? key, required this.text, required this.endTime})
      : super(key: key);

  @override
  State<endTimerState> createState() => _endTimerStateState(text);
}

class _endTimerStateState extends State<endTimerState> {
  String text_state;

  _endTimerStateState(this.text_state);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.height10(context) * 31.6,
      height: AppDimensions.height10(context) * 3.7,
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3, color: Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                text_state,
                //textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: 16,
                  fontFamily: "Laila",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                width: 162,
                child: Text(
                  widget.endTime,
                  style: const TextStyle(
                    color: Color.fromRGBO(250, 153, 52, 1),
                    fontSize: 16,
                    fontFamily: "Laila",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
