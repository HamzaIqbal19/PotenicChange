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
    return Scaffold(
      key: _globalKey,
      body: OnboardingPage(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          print(value);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        getStartedClicked: (value) {
          print(value);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Get Started clicked"),
          ));
        },
      ),
    );
  }

  final pages = [
    //page 1
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'What is Potenic and \n who is it for?',
      description:
          'Potenic is a self-growth \n transformational app for personal\n development enthusiasts, who: \n \n -  are on the journey already \n using self-development tools \n - need clarity on progress \n - struggle to stay focused \n - desire to reach a \n consistent level of self- \n fulfilment. ',
      image1:"",
      backbutton: false,
      description2:"",
      image2:"",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background.png',
      buttonText: "Next",
    ),
    //page 2
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'Define your why',
      description:
          'Set your vision for better-self. True \n fulfilment comes from being clear \n and honest on your whys, what is \n truly important to you and your \n dreams.',
      image1:"",
        backbutton: true,
      description2:"",
      image2:"",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background2.png',
        buttonText: "Next"
    ),
    //page 3
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'Evaluate the tools \n you’re already using',
      description:
          'Assess the tools and practices you’re \n using, discover the ones that are \n working for you, and eliminate the \n others that don’t serve you.',
      image1:"",
        backbutton: true,
      description2:"",
      image2:"",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Next"
    ),
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'Prepare for hurdles',
      description:
      'Whenever you feel stuck, we’ll help \n to prepare you to face your \n obstacles. Use our framework to \n overcome challenges, develop self- \n reliance and stay focused on your \n growth.',
      image1:"",
      description2:"",
      image2:"",
        backbutton: true,
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Next"
    ),
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'Designed through science',
        backbutton: true,
      description:
      'Backed by a PhD neuroscientist and \n psychologist, our framework is built \n to help you implement meaningful \n changes in your life, consistently.',
      image1:"",
      description2:"",
      image2:"",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Next"
    ),
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'How it works',
        backbutton: true,
      description:
      'Create your personal development \n goals which will become your own \n stars (e.g. ‘be more confident talking \n to strangers’)',
      image1:"assets/images/image1.png",
      description2:"To support you in reaching your \n goals, you’ll set habit practices,\n which will become your planets (e.g. \n ‘talk to 1 stranger everyday’)",
      image2:"assets/images/image2.png",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Next"
    ),
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo2.png',
      title: 'Hi, I’m Reda',
        backbutton: true,
      description:
      'I’m your personalised digital coach, \n you will see me appear on your \n Dashboard. I’ll check on you during \n your journey with Potenic to keep \n you engaged and focused.',
      image1:"",
      description2:"",
      image2:"",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Next"
    ),
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'Your commitment',
        backbutton: true,
      description:
      'We encourage that you commit to \n implementing practices consistently \n to support your personal \n development goals in order to \n observe any meaningful changes in \n your behaviour and life. With our \n framework and support, we’ll help \n keep you on track.',
      image1:"",
      description2:"",
      image2:"",

      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Next"
    ),
    OnboardingModel(
      mainTitle: "Introduction",
      logo: 'assets/images/logo.png',
      title: 'Your data',
        backbutton: true,
      description:
      'We treat personal information \n seriously. Remember, your data is \n safe with us. You would be able to \n export it and take it away if you ever \n feel the need. ',
      image1:"",
      description2:"",
      image2:"",
      titleColor: Color(0xFFFFFFFF),
      descripColor: const Color(0xFFFFFFFF),
      imagePath: 'assets/images/Onboarding-background3.png',
        buttonText: "Start your journey"
    ),

  ];
}
