import 'package:potenic_app/utils/app_link.dart';
import 'package:url_launcher/url_launcher.dart';

class laucherForNotifications {
  void emailLauncher() async {
    String email = Uri.encodeComponent("potenicbiz@gmail.com");

    var url = Uri.parse("mailto:$email/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void urlLauncher(String toLaunch) async {
    var url = Uri.parse(toLaunch);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void contactUsLauncher() async {
    var url = Uri.parse(AppLinks().contactUs);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
