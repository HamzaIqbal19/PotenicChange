import 'package:flutter/material.dart';
import 'package:advance_expansion_tile/advance_expansion_tile.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

String start_time = '00:00';
String end_time = '07:00';
String? minutes;
String? hours;

class routinecommitment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 13, right: 5, bottom: 5),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            schedule_card(
              days: 'Monday',
            ),
            SizedBox(
              height: AppDimensions.height10(context) * 1.0,
            ),
            schedule_card(
              days: 'Tuesday',
            ),
            SizedBox(
              height: 10,
            ),
            schedule_card(
              days: 'Wednesday',
            ),
            SizedBox(
              height: 10,
            ),
            schedule_card(
              days: 'Thursday',
            ),
            SizedBox(
              height: 10,
            ),
            schedule_card(
              days: 'Friday',
            ),
            SizedBox(
              height: 10,
            ),
            schedule_card(
              days: 'Saturday',
            ),
            SizedBox(
              height: 10,
            ),
            schedule_card(
              days: 'Sunday',
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class schedule_card extends StatefulWidget {
  final String days;

  const schedule_card({super.key, required this.days});

  @override
  State<schedule_card> createState() => _schedule_cardState(days);
}

class _schedule_cardState extends State<schedule_card> {
  final String days_name;
  final GlobalKey<AdvanceExpansionTileState> _globalKey = GlobalKey();

  _schedule_cardState(this.days_name);

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
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                title: Text(
                  days_name,
                  style: const TextStyle(
                      color: Color.fromRGBO(67, 114, 150, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
                children: <Widget>[
                  Container(
                    // color:Colors.orange,
                    width: AppDimensions.height10(context) * 36.2,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        startTimerState(
                          text: ' 1) Time: ',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color:Colors.orange,
                    width: AppDimensions.height10(context) * 36.2,
                    padding: const EdgeInsets.only(left: 0.0, bottom: 10),
                    child: Row(
                      children: [
                        const endTimerState(
                          text: '1) Time: ',
                        ),
                      ],
                    ),
                  ),

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

  const startTimerState({
    super.key,
    required this.text,
  });

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
          color: Color(0xFFF6F6F6),
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
                  start_time,
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
          Container(
            width: AppDimensions.height10(context) * 2.4,
            child: Center(
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onChanged: (date) {
                      hours = date.hour.toString();
                      minutes = date.minute.toString();
                    }, onConfirm: (date) {
                      setState(() {
                        start_time = '${hours} : ${minutes}';
                      });
                      ;
                    }, currentTime: DateTime.now());
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromRGBO(250, 153, 52, 1),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class endTimerState extends StatefulWidget {
  final String text;

  const endTimerState({super.key, required this.text});

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
          color: Color(0xFFF6F6F6),
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
                  end_time,
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
          Container(
            width: AppDimensions.height10(context) * 2.4,
            child: Center(
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onChanged: (date) {
                      hours = date.hour.toString();
                      minutes = date.minute.toString();
                    }, onConfirm: (date) {
                      setState(() {
                        start_time = '${hours} : ${minutes}';
                      });
                      ;
                    }, currentTime: DateTime.now());
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromRGBO(250, 153, 52, 1),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
