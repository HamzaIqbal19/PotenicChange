import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpWithEmail.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/Widgets/fading3.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late SharedPreferences _prefs;

  setEmail(email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  booleanValue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('bool', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      actions: [
        Center(
          child: IconButton(
            icon: Image.asset(
              'assets/images/Close.png',
              width: AppDimensions.height10(context) * 2.8,
              height: AppDimensions.height10(context) * 2.8,
              fit: BoxFit.cover,
            ),
            onPressed: () => Navigator.pushReplacement(
              context,
              FadePageRoute3(
                enterPage:const HomeScreen(
                  login: false,
                ),
                exitPage:LoginPage(),

              ),

            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/loginscreenBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildVerticalSpacing(context, 8.02),
        Center(
          child: Image(
            image: const AssetImage("assets/images/logo.png"),
            height: AppDimensions.height10(context) * 7.75,
            width: AppDimensions.width10(context) * 7.75,
          ),
        ),
        _buildVerticalSpacing(context, 2.32),
        _buildText(context, "Log in", 3.0, FontWeight.w700),
        _buildVerticalSpacing(context, 1),
        _buildText(context, 'How did you access your Potenic account\n last time?', 1.8, FontWeight.w600),
        _buildVerticalSpacing(context, 5.1),
        _buildButtonSection(context),
        _buildVerticalSpacing(context, 28.4),
        _buildBottomButton(context),
      ],
    );
  }

  Widget _buildText(BuildContext context, String text, double fontSize, FontWeight fontWeight) {
    return Container(
      height: AppDimensions.height10(context) * 3.9,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: fontWeight,
          color: Colors.white,
          fontSize: AppDimensions.height10(context) * fontSize,
        ),
      ),
    );
  }

  Widget _buildVerticalSpacing(BuildContext context, double multiplier) {
    return SizedBox(
      height: AppDimensions.height10(context) * multiplier,
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Container(
      height: AppDimensions.height10(context) * 20 + 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOutlinedButton(context, Icons.mail_outline, 'Email and Password', () {
            Navigator.push(
              context,
              FadePageRoute2(
                  enterPage: Loginemailandpassword(),
                  exitPage: LoginPage()),
            );
          }, Color(0xFF5A4D73), Colors.white),
          _buildOutlinedButtonWithImage(context, 'assets/images/Google.png', 'Sign in with Google', () {}, Colors.white, Colors.black45),
          _buildOutlinedButtonWithImage(context, 'assets/images/fb.png', 'Sign up with Facebook', () {}, Color(0xFF1877F2), Colors.white),
        ],
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, IconData icon, String label, Function onPressed, Color backgroundColor, Color textColor) {
    return Container(
      height: AppDimensions.height10(context) * 5.5,
      width: AppDimensions.height10(context) * 34.1,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: Colors.white),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        onPressed: onPressed as void Function()?,
        icon: Icon(
          icon,
          color: Colors.white,
          size: AppDimensions.height10(context) * 2.4,
        ),
        label: Row(
          children: [
            Expanded(
              child: Text(
                '  $label',
                style: TextStyle(
                  color: textColor,
                  fontSize: AppDimensions.height10(context) * 1.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButtonWithImage(BuildContext context, String imageAsset, String label, Function onPressed, Color backgroundColor, Color textColor) {
    return Container(
      height: AppDimensions.height10(context) * 5.5,
      width: AppDimensions.height10(context) * 34.1,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        onPressed: onPressed as void Function()?,
        icon: Image.asset(
          imageAsset,
          width: AppDimensions.height10(context) * 2.4,
          height: AppDimensions.height10(context) * 2.4,
        ),
        label: Row(
          children: [
            Expanded(
              child: Text(
                '  $label',
                style: TextStyle(
                  color: textColor,
                  fontSize: AppDimensions.height10(context) * 1.8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height10(context) * 5,
      width: AppDimensions.screenWidth(context) - 100,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            FadePageRoute2(
              enterPage:const SignUpPage(),
              exitPage:
              LoginPage(),
            ),
          );
        },
        icon: Image.asset(
          "assets/images/fb.png",
          width: 0.0,
          height: 0.0,
        ),
        label: Center(
          child: Text(
            'New account',
            style: TextStyle(
              color: Color(0xFF8C648A),
              fontSize: AppDimensions.height10(context) * 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
