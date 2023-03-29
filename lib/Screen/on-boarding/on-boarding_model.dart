// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class OnboardingModel {
  String mainTitle;
  String logo;
  bool backbutton;
  String title;
  String description;
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
    required this.backbutton,
    required this.title,
    required this.description,
    required this.image1,
    required this.description2,
    required this.image2,
    required this.imagePath,
    required this.titleColor,
    required this.descripColor,
    required this.buttonText,
  });
}
