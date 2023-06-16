
import 'package:flutter/material.dart';
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  FadePageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(milliseconds: 650),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 0.65);
      var end = Offset.zero;
      var curve = Curves.easeInOut;
      var slideAnim =
      Tween(begin: begin, end: end).animate(CurvedAnimation(
        parent: animation,
        curve: curve,
      ));
      return SlideTransition(
        position: slideAnim,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}