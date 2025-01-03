import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potenic_app/API/Goal.dart';
import 'package:potenic_app/API/Practice.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/MyServices/Notification/notificationController.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:intl/intl.dart';
import 'package:potenic_app/Widgets/redaMessage.dart';
import 'package:potenic_app/utils/formattedTime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/bottom_navigation.dart';
import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';
