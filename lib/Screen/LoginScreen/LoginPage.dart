import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/LoginScreen/Loginemailandpassword.dart';
import 'package:potenic_app/Screen/SignUpScreen/SignUpPage.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_assets.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AnimationController _controller;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200), // increased duration
        lowerBound: 0.0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      });
    // TODO: implement initState
    super.initState();
  }

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
        Buttons().closeButton(context, () {
          Navigator.pushReplacement(
            context,
            FadePageRouteReverse(
              page: const HomeScreen(
                login: false,
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/loginscreenBackground.webp"),
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
        _buildVerticalSpacing(context, 8.52),
        Center(
          child: Image(
            image: const AssetImage("assets/images/logo.webp"),
            height: AppDimensions.height10(context) * 7.75,
            width: AppDimensions.width10(context) * 7.75,
          ),
        ),
        _buildVerticalSpacing(context, 2.32),
        _buildText(context, "Log in", 3.0, FontWeight.w700),
        _buildVerticalSpacing(context, 1),
        _buildText(
            context,
            'How did you access your Potenic account\n last time?',
            1.8,
            FontWeight.w600),
        _buildVerticalSpacing(context, 4.8),
        _buildButtonSection(context),
        _buildVerticalSpacing(context, 23.0),
        _buildBottomButton(context),
      ],
    );
  }

  Widget _buildText(BuildContext context, String text, double fontSize,
      FontWeight fontWeight) {
    return SizedBox(
      //height: AppDimensions.height10(context) * 4.4,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: fontWeight,
          color: Colors.white,
          height: AppDimensions.height10(context) * 0.16,
          fontSize: AppDimensions.font10(context) * fontSize,
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
    return SizedBox(
      height: AppDimensions.height10(context) * 24.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedScaleButton(
            onTap: () {
              Navigator.push(
                context,
                FadePageRoute2(true,
                    enterPage: const Loginemailandpassword(),
                    exitPage: const LoginPage()),
              );
            },
            child: buildOutlinedButtonWithImage(
                context,
                AppAssets.mailLogo,
                AppText().logInEmail,
                true,
                const Color(0xFF5A4D73),
                Colors.white),
          ),
          SizedBox(
            height: AppDimensions.height10(context) * 2,
          ),
          buildOutlinedButtonWithImage(context, AppAssets.googleLogo,
              AppText().logInGoogle, false, Colors.white, Colors.black45),
          SizedBox(
            height: AppDimensions.height10(context) * 2,
          ),
          buildOutlinedButtonWithImage(
              context,
              AppAssets.fbLogo,
              AppText().logInFacebook,
              false,
              const Color(0xFF1877F2),
              Colors.white),
        ],
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, IconData icon, String label,
      Color backgroundColor, Color textColor) {
    return SizedBox(
      height: AppDimensions.height10(context) * 5.5,
      width: AppDimensions.width10(context) * 34.1,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1.0, color: Colors.white),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        onPressed: () {},
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
                  fontSize: AppDimensions.font10(context) * 1.8,
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
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _controller.forward();
      },
      onTap: () async {
        _controller.forward();

        await Future.delayed(const Duration(milliseconds: 200));

        _controller.reverse();

        await Future.delayed(const Duration(milliseconds: 200));
        Navigator.push(
          context,
          FadePageRoute2(
            true,
            enterPage: const SignUpPage(),
            exitPage: const LoginPage(),
          ),
        );
      },
      child: Transform.scale(
        scale: 1 - _controller.value,
        child: Container(
          height: AppDimensions.height10(context) * 5.2,
          width: AppDimensions.width10(context) * 29.3,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(
                Radius.circular(AppDimensions.height10(context) * 5.0)),
          ),
          child: Center(
            child: Text(
              AppText().newAccount,
              style: TextStyle(
                color: const Color(0xFF8C648A),
                fontSize: AppDimensions.font10(context) * 2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

buildOutlinedButtonWithImage(BuildContext context, String imageAsset,
    String label, bool border, Color backgroundColor, Color textColor) {
  return Container(
      height: AppDimensions.height10(context) * 5.6,
      width: AppDimensions.width10(context) * 34.1,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: border ? Colors.white : Colors.transparent),
          borderRadius: BorderRadius.circular(40),
          color: backgroundColor),
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            width: AppDimensions.width10(context) * 2.4,
            height: AppDimensions.height10(context) * 2.4,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$label',
            style: TextStyle(
              color: textColor,
              fontSize: AppDimensions.font10(context) * 2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ));
}
