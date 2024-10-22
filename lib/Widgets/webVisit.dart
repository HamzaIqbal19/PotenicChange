import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

void webVisit(String url) {
  FlutterWebBrowser.openWebPage(
    url: url,
    customTabsOptions: const CustomTabsOptions(
      colorScheme: CustomTabsColorScheme.dark,
      shareState: CustomTabsShareState.on,
      instantAppsEnabled: true,
      showTitle: true,
      urlBarHidingEnabled: true,
    ),
    safariVCOptions: const SafariViewControllerOptions(
      barCollapsingEnabled: true,
      preferredBarTintColor: Colors.white,
      preferredControlTintColor: Colors.blue,
      dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      modalPresentationCapturesStatusBarAppearance: true,
    ),
  );
}


// String url = AppLinks().faqs;
// print("Launched Url");
// if (await canLaunchUrlString(url)) {
// await launchUrlString(url,mode: LaunchMode.externalApplication);
// } else {
// throw 'Could not launch $url';
// }
