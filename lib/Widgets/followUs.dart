import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_link.dart';

class dialogs {
  FollowUsDialogs(BuildContext context) {
    return showAnimatedDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
            width: AppDimensions.height10(context) * 27.0,
            height: AppDimensions.height10(context) * 18.2,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppDimensions.height10(context) * 1.4)),
              actionsPadding: EdgeInsets.zero,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              title: const Text(
                "Follow Us",
                textAlign: TextAlign.center,
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.asset(
                        'assets/icons/facebook.png'), // Replace 'assets/facebook_icon.png' with the path to your Facebook icon asset
                    onPressed: () {
                      webVisit(AppLinks().potenicFacebook);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                        'assets/icons/linkedin.png'), // Replace 'assets/instagram_icon.png' with the path to your Instagram icon asset
                    onPressed: () {
                      webVisit(AppLinks().potenicLinkedIn);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                        'assets/icons/youtube.png'), // Replace 'assets/instagram_icon.png' with the path to your Instagram icon asset
                    onPressed: () {
                      webVisit(AppLinks().potenicYoutube);
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                        'assets/icons/instagram.png'), // Replace 'assets/instagram_icon.png' with the path to your Instagram icon asset
                    onPressed: () {
                      webVisit(AppLinks().potenicInstagram);
                    },
                  ),
                ],
              ),
              actions: [
                Container(
                  height: 42,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: AppDimensions.height10(context) * 1.0),
                  // color: Colors.white,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                            color: Color(0xFF007AFF),
                            fontSize: 17,
                            fontFamily: "Laila",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
    );
  }
}
