import 'package:flutter/material.dart';

class FadePageRoute3<T> extends PageRouteBuilder<T> {
  final Widget enterPage;
  final Widget exitPage;

  FadePageRoute3({required this.enterPage, required this.exitPage})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    enterPage,
    transitionDuration: Duration(
        milliseconds: 500), // specify the transition duration here
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      return Stack(
        children: <Widget>[
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: const Offset(1.0, 0.0),
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: exitPage,
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: enterPage,
          ),
        ],
      );
    },
  );
}
