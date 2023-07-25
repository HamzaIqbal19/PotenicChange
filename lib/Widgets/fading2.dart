// import 'package:flutter/material.dart';

// class FadePageRoute2<T> extends PageRouteBuilder<T> {
//   final Widget enterPage;
//   final Widget exitPage;
//   final bool slow_animate;

//   FadePageRoute2(this.slow_animate,
//       {required this.enterPage, required this.exitPage})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               enterPage,
//           transitionDuration: Duration(
//               milliseconds: slow_animate
//                   ? 500
//                   : 100), // specify the transition duration here
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) {
//             return Stack(
//               children: <Widget>[
//                 SlideTransition(
//                   position: Tween<Offset>(
//                     begin: const Offset(0.0, 0.0),
//                     end: const Offset(-1.0, 0.0),
//                   ).animate(
//                     CurvedAnimation(
//                       parent: animation,
//                       curve: Curves.linear,
//                     ),
//                   ),
//                   child: exitPage,
//                 ),
//                 SlideTransition(
//                   position: Tween<Offset>(
//                     begin: const Offset(1.0, 0.0),
//                     end: Offset.zero,
//                   ).animate(
//                     CurvedAnimation(
//                       parent: animation,
//                       curve: Curves.linear,
//                     ),
//                   ),
//                   child: enterPage,
//                 ),
//               ],
//             );
//           },
//         );
// }

import 'package:flutter/material.dart';

class FadePageRoute2<T> extends PageRouteBuilder<T> {
  final Widget enterPage;
  final Widget exitPage;
  final bool slowAnimate;
  bool _canNavigate = true;

  FadePageRoute2(this.slowAnimate,
      {required this.enterPage, required this.exitPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionDuration: Duration(
              milliseconds: slowAnimate
                  ? 500
                  : 100), // specify the transition duration here
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
                    end: const Offset(-1.0, 0.0),
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
                    begin: const Offset(1.0, 0.0),
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

  @override
  bool didPop(T? result) {
    // Enable navigation after a delay of 10 seconds
    Future.delayed(Duration(seconds: 10), () {
      _canNavigate = true;
    });
    return super.didPop(result);
  }

  @override
  TickerFuture didPush() {
    _canNavigate = false;
    return super.didPush();
  }

  @override
  bool canTransition() {
    // Only allow the transition if _canNavigate is true
    return _canNavigate;
  }
}
