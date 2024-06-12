import 'package:url_launcher/url_launcher.dart';


class laucherForNotifications{
  void emailLauncher() async {
    print("Email launched");
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
}
