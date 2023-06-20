import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Circle of Checkmark Containers'),
        ),
        body: Center(
          child: CircleOfCheckmarkContainers(),
        ),
      ),
    );
  }
}

class CircleOfCheckmarkContainers extends StatefulWidget {
  @override
  _CircleOfCheckmarkContainersState createState() =>
      _CircleOfCheckmarkContainersState();
}

class _CircleOfCheckmarkContainersState
    extends State<CircleOfCheckmarkContainers> {
  int _containerCount = 20;

  List<bool> _isCheckedList = [];

  _CircleOfCheckmarkContainersState() {
    _isCheckedList = List<bool>.filled(_containerCount, false);
  }

  void _toggleCheckmark(int index) {
    setState(() {
      _isCheckedList[index] = !_isCheckedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final double containerRadius = 11.4;
    final double circleRadius = 124;

    List<Widget> containers = [];

    for (int i = 0; i < _containerCount; i++) {
      double angle = 2 * i * 3.14159265 / _containerCount - 3.14159265 / 2;
      double x = circleRadius * (1 + cos(angle));
      double y = circleRadius * (1 + sin(angle));

      containers.add(
        Positioned(
          left: x,
          top: y,
          child: GestureDetector(
            onTap: () => _toggleCheckmark(i),
            child: Container(
              width: containerRadius * 2,
              height: containerRadius * 2,
              decoration: BoxDecoration(
                color: _isCheckedList[i] ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(containerRadius),
              ),
              child: Center(
                child: _isCheckedList[i]
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12.5,
                      )
                    : null,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: circleRadius * 3,
      height: circleRadius * 3,
      child: Stack(
        children: containers,
      ),
    );
  }
}
