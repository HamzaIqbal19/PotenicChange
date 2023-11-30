// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potenic_app/Screen/HomeScreen/Home%20Screen-Progress%20Saved.dart';
import 'package:potenic_app/Screen/HomeScreen/HomeScreen.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding.dart';
// import 'package:go_eventio/pages/authentication/sign_in_page.dart';
import 'package:potenic_app/Screen/on-boarding/on-boarding_model.dart';
import 'package:potenic_app/Widgets/fading2.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  final List<OnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  const OnboardingPage({
    Key? key,
    required this.pages,
    required this.bgColor,
    required this.themeColor,
    required this.skipClicked,
    required this.getStartedClicked,
  }) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _currentPage = 0;
  var Accestoken;
  var Routes;

  double _value = 0.0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnboardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.length; i++) {
      children.add(_showPageData(widget.pages[i], i));
    }
    return children;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Accestoken = prefs.getString("usertoken");
      Routes = prefs.getString("route").toString().isEmpty
          ? ''
          : prefs.getString("route");
    });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      padding: EdgeInsets.only(
          left: AppDimensions.width10(context),
          right: AppDimensions.width10(context)),
      margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.width10(context) * 0.5),
      height: isActive
          ? AppDimensions.height10(context)
          : AppDimensions.height10(context),
      width: isActive
          ? AppDimensions.height10(context)
          : AppDimensions.height10(context),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFFFFFFF) : Colors.transparent,
        border: Border.all(color: Colors.white),
        borderRadius:
            BorderRadius.all(Radius.circular(AppDimensions.height10(context))),
      ),
    );
  }

  bool boolSet = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: _currentPage != 0
              ? Center(
                  // alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/Back.webp',
                      //width: AppDimensions.width10(context) * 3,
                      height: AppDimensions.width10(context) * 3,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                      // Add code for performing close action
                    },
                  ),
                )
              : Container(),
          title: Center(
            child: Text(
              "Introduction",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: AppDimensions.font10(context) * 2.0,
              ),
            ),
          ),
          actions: [
            Center(
              // alignment: Alignment.center,

              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/Close.webp',
                    //width: AppDimensions.width10(context) * 2.8,
                    height: AppDimensions.height10(context) * 2.8,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () async {
                    if (Accestoken != null && Routes != null) {
                      Navigator.pushReplacement(
                        context,
                        FadePageRoute2(
                          true,
                          enterPage: HomeScreenProgressSaved(
                            login: true,
                            route: Routes.toString(),
                          ),
                          exitPage: OnBoarding(),
                        ),
                      );
                    } else if (Accestoken != null && Routes == null) {
                      Navigator.pushReplacement(
                        context,
                        FadePageRoute2(
                          true,
                          enterPage: HomeScreen(login: true),
                          exitPage: OnBoarding(),
                        ),
                      );
                    } else if (Accestoken == null && Routes == null) {
                      Navigator.pushReplacement(
                        context,
                        FadePageRoute2(
                          true,
                          enterPage: HomeScreen(login: false),
                          exitPage: OnBoarding(),
                        ),
                      );
                    } else if (Accestoken == null && Routes != null) {
                      Navigator.pushReplacement(
                        context,
                        FadePageRoute2(
                          true,
                          enterPage: HomeScreen(login: false),
                          exitPage: OnBoarding(),
                        ),
                      );
                    }
                    // Add code for performing close action
                  },
                ),
              ),
            ),
          ],
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/Onboarding-background3.webp'),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: AppDimensions.height10(context)),
                Expanded(
                  child: Container(
                    //height: AppDimensions.height10(context) * 89.1,

                    // width: AppDimensions.width10(context) * 90,
                    // color: Colors.blue,
                    child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: buildOnboardingPages()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showPageData(OnboardingModel page, int i) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(page.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      padding: page.index == 7
          ? EdgeInsets.only(top: AppDimensions.height10(context) * 9.5)
          : EdgeInsets.only(top: AppDimensions.height10(context) * 11.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // page.index==7?  SizedBox(height: AppDimensions.height10(context) * 2.3):  SizedBox(height: AppDimensions.height10(context) * 3.9),
          Center(
            child: page.index == 7
                ? Image(
                    // color: Colors.orange,
                    image: AssetImage(page.logo),
                    height: AppDimensions.height10(context) * 11.15,
                    width: AppDimensions.width10(context) * 10.0,
                  )
                : Image(
                    // color: Colors.orange,
                    image: AssetImage(page.logo),
                    height: AppDimensions.height10(context) * 7.75,
                    width: AppDimensions.width10(context) * 7.75,
                  ),
          ),
          page.description2 != ""
              ? SizedBox(height: AppDimensions.height10(context) * 5.45)
              : page.subDescription != ""
                  ? SizedBox(
                      height: AppDimensions.height10(context) * 7.64,
                    )
                  : (page.index == 7)
                      ? SizedBox(height: AppDimensions.height10(context) * 10.3)
                      : SizedBox(
                          height: AppDimensions.height10(context) * 12.1),
          Container(
            height: page.description2 != ""
                ? AppDimensions.height10(context) * 3.6
                : (page.index == 3 || page.index == 1)
                    ? AppDimensions.height10(context) * 8.4
                    : AppDimensions.height10(context) * 3.9,
            width: AppDimensions.width10(context) * 35.4,
            child: Text(
              page.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: page.titleColor,
                fontSize: AppDimensions.font10(context) * 3.0,
              ),
            ),
          ), //Title Container
          SizedBox(height: AppDimensions.height10(context) * 2.0),
          Column(
            children: [
              Container(
                // width: double.infinity,
                width: AppDimensions.width10(context) * 35.4,
                height: page.description2 != ""
                    ? AppDimensions.height10(context) * 9.3
                    : page.subDescription != ""
                        ? AppDimensions.height10(context) * 9.3
                        : (page.index == 3 || page.index == 1)
                            ? AppDimensions.height10(context) * 28.5
                            : AppDimensions.height10(context) * 32.5,
                child: Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: AppDimensions.width10(context) * 0.13,
                    fontWeight: FontWeight.w500,
                    color: page.descripColor,
                    fontSize: AppDimensions.font10(context) * 2.0,
                  ),
                ),
              ),
              page.subDescription != ""
                  ? SizedBox(
                      height: AppDimensions.height10(context) * 2.0,
                    )
                  : SizedBox(height: AppDimensions.height10(context) * 0),
              Container(
                // width: double.infinity,

                width: AppDimensions.width10(context) * 28.5,
                height: page.description2 != ""
                    ? AppDimensions.height10(context) * 0
                    : page.subDescription != ""
                        ? AppDimensions.height10(context) * 21.7
                        : AppDimensions.height10(context) * 0,
                child: Text(
                  page.subDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: AppDimensions.width10(context) * 0.15,
                    fontWeight: FontWeight.w400,
                    color: page.descripColor,
                    fontSize: AppDimensions.font10(context) * 2.0,
                  ),
                ),
              ),
            ],
          ),
          page.description2 != ""
              ? SizedBox(height: AppDimensions.height10(context) * 2.2)
              : Container(),
          page.image1 != ""
              ? Center(
                  child: Image(
                    image: AssetImage(page.image1),
                    height: AppDimensions.height10(context) * 6.5,
                    width: AppDimensions.width10(context) * 6.5,
                  ),
                )
              : Container(),
          page.description2 != ""
              ? SizedBox(height: AppDimensions.height10(context) * 4.7)
              : Container(),
          page.description2 != ""
              ? Container(
                  // color: Colors.blue,
                  height: AppDimensions.height10(context) * 9.3,
                  width: AppDimensions.width10(context) * 35.4,
                  child: Text(
                    page.description2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: AppDimensions.width10(context) * 0.13,
                      color: page.descripColor,
                      fontSize: AppDimensions.font10(context) * 2.0,
                    ),
                  ))
              : Container(),
          page.description2 != ""
              ? SizedBox(height: AppDimensions.height10(context) * 2.7)
              : Container(),
          page.image2 != ""
              ? Center(
                  child: Image(
                    image: AssetImage(page.image2),
                    height: AppDimensions.height10(context) * 4.0,
                    width: AppDimensions.width10(context) * 4.0,
                  ),
                )
              : Container(),
          page.description2 != ""
              ? SizedBox(
                  height: AppDimensions.height10(context) * 6.89,
                )
              : SizedBox(
                  height: AppDimensions.height10(context) * 6.139,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // widget.pages[i]== widget.pages.length?
              NextButton(page.buttonText),
              // :NextButton("Start your journey")
            ],
          ),
          SizedBox(height: AppDimensions.height10(context) * 0.1),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  setWalletAddress(balance, account) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble('walletAddress', balance);
    pref.setString('account', account);
    print("setWalletAddress/////////////////////////data: $balance");
    print("setWalletAddress////////////////////account: $account");
  }

  Widget NextButton(String text) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.width10(context) - 2,
        right: AppDimensions.width10(context) - 2,
        top: AppDimensions.height10(context) - 5,
        bottom: AppDimensions.height10(context) * 3,
      ),
      child: GestureDetector(
        onTap: () {
          if (text == "Next") {
            _pageController.nextPage(
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          } else {
            // ignore: use_build_context_synchronously
            if (Accestoken != null && Routes != null) {
              Navigator.pushReplacement(
                context,
                FadePageRoute2(
                  true,
                  enterPage: HomeScreenProgressSaved(
                    login: true,
                    route: Routes.toString(),
                  ),
                  exitPage: OnBoarding(),
                ),
              );
            } else if (Accestoken != null && Routes == null) {
              Navigator.pushReplacement(
                context,
                FadePageRoute2(
                  true,
                  enterPage: HomeScreen(login: true),
                  exitPage: OnBoarding(),
                ),
              );
            } else if (Accestoken == null && Routes == null) {
              Navigator.pushReplacement(
                context,
                FadePageRoute2(
                  true,
                  enterPage: HomeScreen(login: false),
                  exitPage: OnBoarding(),
                ),
              );
            } else if (Accestoken == null && Routes != null) {
              Navigator.pushReplacement(
                context,
                FadePageRoute2(
                  true,
                  enterPage: HomeScreen(login: false),
                  exitPage: OnBoarding(),
                ),
              );
            }
          }
        },
        child: Container(
          height: AppDimensions.height10(context) * 5,
          width: AppDimensions.width10(context) * 25.4,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5A4D73), Color(0xFFA57486)]),
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: AppDimensions.font10(context) * 2.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget SkipButton() {
    final GestureDetector loginButtonWithGesture = new GestureDetector(
      // onTap: () {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(
      //   //     builder: (context) => SignInPage(),
      //   //   ),
      //   );
      // },
      child: new Container(
        height: AppDimensions.height10(context) * 5,
        width: AppDimensions.width10(context) * 15,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFCCCCCC)),
          borderRadius: new BorderRadius.all(
            Radius.circular(AppDimensions.height10(context)),
          ),
        ),
        child: new Center(
          child: new Text(
            'Skip',
            style: new TextStyle(
              color: Color(0xFF000000),
              fontSize: AppDimensions.font10(context) * 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.width10(context) - 2,
        right: AppDimensions.width10(context) - 2,
        top: AppDimensions.height10(context) - 5,
        bottom: AppDimensions.height10(context) * 3,
      ),
      child: loginButtonWithGesture,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
