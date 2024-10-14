// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class OnboardingModel {
  String mainTitle;
  String logo;
  int index;
  bool backbutton;
  String title;
  String description;
  String subDescription;
  String image1;
  String description2;
  String image2;
  Color titleColor;
  Color descripColor;
  String imagePath;
  String buttonText;

  OnboardingModel({
    required this.mainTitle,
    required this.logo,
    required this.index,
    required this.backbutton,
    required this.title,
    required this.description,
    required this.subDescription,
    required this.image1,
    required this.description2,
    required this.image2,
    required this.imagePath,
    required this.titleColor,
    required this.descripColor,
    required this.buttonText,
  });
}
