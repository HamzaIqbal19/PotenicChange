import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potenic_app/Screen/CreateGoal/GoalName.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:potenic_app/Screen/splash/splash_page.dart';


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(primarySwatch: Colors.grey, fontFamily: "Laila"),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.91),
          child: child!,
        );
      },

      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
