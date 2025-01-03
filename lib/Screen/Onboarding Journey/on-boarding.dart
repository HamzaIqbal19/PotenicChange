// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'on-boardings_page.dart';
import 'on-boarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<StatefulWidget> createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _globalKey,
        body: OnboardingPage(
          bgColor: Colors.white,
          themeColor: const Color(0xFFf74269),
          pages: pages,
          skipClicked: (value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Skip clicked"),
            ));
          },
          getStartedClicked: (value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Get Started clicked"),
            ));
          },
        ),
      ),
    );
  }

  final pages = [
    //page 1
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.webp',
      title: 'What is Potenic?',
      index: 1,
      description:
          'Potenic is a ritual building app for\nworking parents, who:',
      subDescription:
          '- crave more time for personal growth \n- struggle to stay on track \n - want to see real progress \n - desire a meaningful, balanced life\nthey can sustain',
      image1: "",
      backbutton: false,
      description2: "",
      image2: "",
      titleColor: Color(0xFFFBFBFB),
      descripColor: const Color(0xFFFBFBFB),
      imagePath: 'assets/images/Onboarding-background.webp',
      buttonText: "Next",
    ),
    //page 2
    OnboardingModel(
        mainTitle: "Introduction",
        logo: 'assets/images/logo.webp',
        title: 'Define your why',
        index: 2,
        description:
            'Your ‘why’ is the foundation of your\nnew identity. By getting clear on\nyour vision - what’s truly important\nto you, you open the door to lasting\nfulfillment. ',
        subDescription: '',
        image1: "",
        backbutton: true,
        description2: "",
        image2: "",
        titleColor: Color(0xFFFBFBFB),
        descripColor: const Color(0xFFFBFBFB),
        imagePath: 'assets/images/Onboarding-background2.webp',
        buttonText: "Next"),
    //page 3
    OnboardingModel(
        mainTitle: "Introduction",
        logo: 'assets/images/logo.webp',
        index: 3,
        title: 'Assess the behaviours',
        description:
            'Discover the practices that work for\nyou, and ditch the ones that don’t\nserve you.',
        subDescription: '',
        image1: "",
        backbutton: true,
        description2: "",
        image2: "",
        titleColor: Color(0xFFFBFBFB),
        descripColor: const Color(0xFFFBFBFB),
        imagePath: 'assets/images/Onboarding-background3.webp',
        buttonText: "Next"),
    // OnboardingModel(
    //     mainTitle: "Introduction",
    //     logo: 'assets/images/logo.webp',
    //     title: 'Prepare for hurdles',
    //     index: 4,
    //     description:
    //         'Whenever you feel stuck, we’ll help \n to prepare you to face your \n obstacles. Use our framework to \n overcome challenges, develop self- \n reliance and stay focused on your \n growth.',
    //     subDescription: '',
    //     image1: "",
    //     description2: "",
    //     image2: "",
    //     backbutton: true,
    //     titleColor: Color(0xFFFBFBFB),
    //     descripColor: const Color(0xFFFBFBFB),
    //     imagePath: 'assets/images/Onboarding-background3.webp',
    //     buttonText: "Next"),
    // OnboardingModel(
    //     mainTitle: "Introduction",
    //     logo: 'assets/images/logo.webp',
    //     title: 'Designed through science',
    //     index: 5,
    //     backbutton: true,
    //     description:
    //         'Backed by a PhD neuroscientist and \n psychologist, our framework is built \n to help you implement meaningful \n changes in your life, consistently.',
    //     subDescription: '',
    //     image1: "",
    //     description2: "",
    //     image2: "",
    //     titleColor: Color(0xFFFBFBFB),
    //     descripColor: const Color(0xFFFBFBFB),
    //     imagePath: 'assets/images/Onboarding-background3.webp',
    //     buttonText: "Next"),
    OnboardingModel(
        mainTitle: "Introduction",
        logo: 'assets/images/logo.webp',
        title: 'How it works',
        index: 6,
        backbutton: true,
        description:
            'Create a personal development goal\nthat will become your own star (e.g.\n‘set personal boundaries’)',
        subDescription: '',
        image1: "assets/images/image1.webp",
        description2:
            "To support your goal, you’ll set a\npractice that will become your planet\n(e.g. ‘practice saying NO’)",
        image2: "assets/images/image2.webp",
        titleColor: Color(0xFFFBFBFB),
        descripColor: const Color(0xFFFBFBFB),
        imagePath: 'assets/images/Onboarding-background3.webp',
        buttonText: "Next"),
    // OnboardingModel(
    //     mainTitle: "Introduction",
    //     logo: 'assets/images/logo2.webp',
    //     index: 7,
    //     title: 'Hi, I’m Reda',
    //     backbutton: true,
    //     description:
    //         'I’m your personalised digital coach, \n you will see me appear on your \n Dashboard. I’ll check on you during \n your journey with Potenic to keep \n you engaged and focused.',
    //     subDescription: '',
    //     image1: "",
    //     description2: "",
    //     image2: "",
    //     titleColor: Color(0xFFFBFBFB),
    //     descripColor: const Color(0xFFFBFBFB),
    //     imagePath: 'assets/images/Onboarding-background3.webp',
    //     buttonText: "Next"),
    // OnboardingModel(
    //     mainTitle: "Introduction",
    //     logo: 'assets/images/logo.webp',
    //     title: 'Your commitment',
    //     index: 8,
    //     backbutton: true,
    //     description:
    //         'We encourage that you commit to \n implementing practices consistently \n to support your personal \n development goals in order to \n observe any meaningful changes in \n your behaviour and life. With our \n framework and support, we’ll help \n keep you on track.',
    //     subDescription: '',
    //     image1: "",
    //     description2: "",
    //     image2: "",
    //     titleColor: Color(0xFFFBFBFB),
    //     descripColor: const Color(0xFFFBFBFB),
    //     imagePath: 'assets/images/Onboarding-background3.webp',
    //     buttonText: "Next"),
    OnboardingModel(
        mainTitle: "Introduction",
        logo: 'assets/images/logo.webp',
        title: 'Your data',
        index: 9,
        backbutton: true,
        description:
            'We treat personal information \n seriously. Remember, your data is \n safe with us. You would be able to \n export it and take it away if you ever\nfeel the need. ',
        subDescription: '',
        image1: "",
        description2: "",
        image2: "",
        titleColor: Color(0xFFFBFBFB),
        descripColor: const Color(0xFFFBFBFB),
        imagePath: 'assets/images/Onboarding-background3.webp',
        buttonText: "Start your journey"),
  ];
}
