import 'package:in_app_review/in_app_review.dart';

import 'dart:io';

import 'package:flutter/material.dart';

enum Availability { loading, available, unavailable }

class InAppReviewExampleApp extends StatefulWidget {
  const InAppReviewExampleApp({Key? key}) : super(key: key);

  @override
  InAppReviewExampleAppState createState() => InAppReviewExampleAppState();
}

class InAppReviewExampleAppState extends State<InAppReviewExampleApp> {
  final InAppReview _inAppReview = InAppReview.instance;

  Availability _availability = Availability.loading;

  @override
  void initState() {
    super.initState();

    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        setState(() {
          // This plugin cannot be tested on Android by installing your app
          // locally. See https://github.com/britannio/in_app_review#testing for
          // more information.
          _availability = isAvailable && !Platform.isAndroid
              ? Availability.available
              : Availability.unavailable;
        });
      } catch (_) {
        setState(() => _availability = Availability.unavailable);
      }
    });
  }

  Future<void> _requestReview() => _inAppReview.requestReview();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In App Review Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('In App Review Example')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('In App Review status: ${_availability.name}'),
            ElevatedButton(
              onPressed: _requestReview,
              child: const Text('Request Review'),
            ),
          ],
        ),
      ),
    );
  }
}
