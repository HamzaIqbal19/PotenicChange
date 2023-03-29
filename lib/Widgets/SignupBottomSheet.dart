import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/LoginScreen/LoginPage.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';

void signupSheet(context,String ButtonName,String Route) {

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: false,
    // backgroundColor: const Color(0xFF000000).withOpacity(0.6),
    builder: (context) => Container(
      height: 160,
      width: 414,
      color:  const Color(0xFF000000).withOpacity(0.6),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 56,
            width: 396,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color.fromRGBO(255, 255, 255, 0.8)),
            child: TextButton(
                onPressed: () {
                  Route =="OnBoarding" ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnBoarding(),
                    ),
                  ):Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginemailandpassword(),
                    ),
                  );
                },
                child: Text(
                    ButtonName,
                  style: const TextStyle(
                    color: Color.fromRGBO(0, 120, 255, 1),
                    fontSize: 16,
                  ),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 8, right: 8),
            height: 56,
            width: 396,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.white),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const  Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 120, 255, 1),
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}