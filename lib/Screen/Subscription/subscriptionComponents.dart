import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Dashboard%20Behaviour/dashboard_view_goals.dart';
import 'package:potenic_app/Screen/Subscription/Subscription.dart';
import 'package:potenic_app/Screen/Subscription/subscriptionService.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/Widgets/resetDialog.dart';
import 'package:potenic_app/Widgets/webVisit.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:potenic_app/utils/app_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

subscribed(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.5,
                    bottom: AppDimensionsUpdated.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 30.7,
                height: AppDimensionsUpdated.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.2),
                child: Text(
                  'Your Ownership Plan\nStarts Today',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.4,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensionsUpdated.width10(context) * 33.2,
                  //  height: AppDimensionsUpdated.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontFamily: 'laila',
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                                text: 'Your first steps & 5 day trial\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'You’re now on a 5-day trial.\n\nPlease check your email (you should have\nreceived a confirmation welcome email).\n\nWe look forward to supporting you on your\npersonal development journey!')
                          ]))),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 3),
            ],
          )),
    ),
  );
}

planBox(BuildContext context, message) {
  return SizedBox(
    width: AppDimensionsUpdated.width10(context) * 33.5,
    height: AppDimensionsUpdated.height10(context) * 4.9,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: AppDimensionsUpdated.width10(context) * 3,
            height: AppDimensionsUpdated.height10(context) * 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/tick_circle.webp'))),
          ),
        ),
        SizedBox(
          width: AppDimensionsUpdated.width10(context) * 1.4,
        ),
        SizedBox(
          height: AppDimensionsUpdated.height10(context) * 4.9,
          width: AppDimensionsUpdated.width10(context) * 28.5,
          child: Text(
            message,
            style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.6,
                fontWeight: FontWeight.w400,
                // height: AppDimensionsUpdated.height10(context) * 0.15,
                fontFamily: 'Laila',
                color: const Color(0xFF437296)),
          ),
        )
      ],
    ),
  );
}

priceBox(BuildContext context, price, duration, trialPeriod, color) {
  return Container(
    width: AppDimensionsUpdated.width10(context) * 32.1,
    height: AppDimensionsUpdated.height10(context) * 7.6,
    margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.3),
    decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(AppDimensionsUpdated.height10(context) * 1.8),
        color: color),
    child: Column(
      children: [
        Container(
          width: AppDimensionsUpdated.width10(context) * 27.1,
          height: AppDimensionsUpdated.height10(context) * 1.9,
          margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 1.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 18.4,
                height: AppDimensionsUpdated.height10(context) * 1.9,
                child: Text(
                  'Unlock ‘Ownership’ Plan',
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              SizedBox(
                //width: AppDimensionsUpdated.width10(context) * 4.5,
                height: AppDimensionsUpdated.height10(context) * 1.9,
                child: Text(
                  price,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontWeight: FontWeight.w500,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              )
            ],
          ),
        ),
        Container(
          width: AppDimensionsUpdated.width10(context) * 27.1,
          height: AppDimensionsUpdated.height10(context) * 1.9,
          margin: EdgeInsets.only(
              top: AppDimensionsUpdated.height10(context) * 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 7.0,
                //height: AppDimensionsUpdated.height10(context) * 1.7,
                child: Text(
                  trialPeriod,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontWeight: FontWeight.w400,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              ),
              SizedBox(
                width: AppDimensionsUpdated.width10(context) * 6.9,
                // height: AppDimensionsUpdated.height10(context) * 1.7,
                child: Text(
                  duration,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontWeight: FontWeight.w400,
                      // height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontFamily: 'Laila',
                      color: const Color(0xFFFBFBFB)),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

unsubscribed(context) {
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.5,
                    bottom: AppDimensionsUpdated.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 30.7,
                height: AppDimensionsUpdated.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.2),
                child: Text(
                  'Ownership Plan\nis now cancelled',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.4,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensionsUpdated.width10(context) * 33.2,
                  //  height: AppDimensionsUpdated.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontFamily: 'laila',
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                                text:
                                    'We are sad you’ve decided to cancel your\nsubscription\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'You’ve been downgraded to Empowered Starter Plan. We know life circumstances change and evolve, so if you change your mind in the future, you can always upgrade back to\n'),
                            TextSpan(
                                text: 'Ownership Plan\n\n',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(
                                text:
                                    'We always look to improve and provide better service - if you could let us know your feedback by completing a short survey below we would be very grateful. Your experience is important to us.\n'),
                          ]))),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 2),
              GestureDetector(
                onTap: () {
                  webVisit(AppLinks().feedbackForm);
                },
                child: Buttons().linearGradButton(
                    AppDimensionsUpdated.height10(context) * 5,
                    AppDimensionsUpdated.height10(context) * 33.5,
                    'Send Feedback',
                    AppDimensionsUpdated.height10(context) * 2,
                    const Color(0xFF5A4D73),
                    const Color(0xFF5A4D73),
                    false),
              ),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 3),
            ],
          )),
    ),
  );
}

subscribedUser(context, bool yearly, String subId) {
  String planId = !yearly
      ? 'price_1OlQz5RkeqntfFwk39D9nntN'
      : "price_1OlQz5RkeqntfFwkHoelDUgz";
  print('Yearly: $yearly');
  //bool cancel = canceled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(AppDimensionsUpdated.height10(context) * 2.0),
    )),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: AppDimensionsUpdated.width10(context) * 39.4,
          margin: EdgeInsets.only(
              left: AppDimensionsUpdated.width10(context) * 1.0,
              right: AppDimensionsUpdated.width10(context) * 1.0,
              bottom: AppDimensionsUpdated.height10(context) * 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8F7F9), Color(0xFFE1D7D8)])),
          child: Column(
            // alignment: AlignmentDirectional.topCenter,
            //  mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //color: Colors.amber,
                // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.5),
                alignment: const Alignment(1, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 2.6,
                    height: AppDimensionsUpdated.height10(context) * 2.6,
                    margin: EdgeInsets.only(
                        top: AppDimensionsUpdated.height10(context) * 1.9,
                        right: AppDimensionsUpdated.width10(context) * 1.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Close_blue.webp'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: AppDimensionsUpdated.height10(context) * 1.5,
                    bottom: AppDimensionsUpdated.height10(context) * 1.9),
                child: Image.asset(
                  'assets/images/potenic__icon.webp',
                  width: AppDimensionsUpdated.width10(context) * 8.202,
                  height: AppDimensionsUpdated.height10(context) * 11.2,
                ),
              ),
              Container(
                width: AppDimensionsUpdated.width10(context) * 30.7,
                height: AppDimensionsUpdated.height10(context) * 6.8,
                // color: Colors.amber,
                alignment: Alignment.center,
                //  margin: EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.2),
                child: Text(
                  'Your Membership',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: AppDimensionsUpdated.height10(context) * 0.15,
                      fontSize: AppDimensions.font10(context) * 2.4,
                      // letterSpacing: AppDimensionsUpdated.height10(context) * 0.2,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF437296)),
                ),
              ),
              Container(
                  width: AppDimensionsUpdated.width10(context) * 33.2,
                  //  height: AppDimensionsUpdated.height10(context) * 10.8,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: AppDimensionsUpdated.height10(context) * 1.9),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontFamily: 'laila',
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF437296)),
                          children: const [
                            TextSpan(
                              text:
                                  "We wanted to take a moment to express our gratitude for being part of of the Potenic family. Your commitment to enhancing your experience means the world to us.\n\nWe’re thrilled to have you on board, and look forward to continuing this journey together.\n\nIf you have any questions or need assistance, feel free to reach out to our support team. Thank you for choosing Potenic.",
                            ),
                          ]))),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 2),
              AnimatedScaleButton(
                onTap: () {
                  dialog(context,
                      'Are you sure you want to change your membership plan? You can update your existing plan frequency after the current duration ends',
                      () {
                    SubscriptionService().makePayment(planId).then((value) => {
                          print('Response Stripe Value: ${value['status']}'),
                          print('Response Stripe Value: $value'),
                          if (value['status'] == 'active' ||
                              value['status'] == 'trialing')
                            {
                              Navigator.push(
                                  context,
                                  FadePageRoute(
                                      page: const view_goals(
                                    missed: false,
                                    name: '',
                                    update: false,
                                    helpfulTips: false,
                                    record: 0,
                                  ))),
                              subscribed(context),
                              updateStatus()
                            }
                        });
                  }, true);
                },
                child: Buttons().linearGradButton(
                    AppDimensionsUpdated.height10(context) * 5,
                    AppDimensionsUpdated.height10(context) * 33.5,
                    yearly
                        ? 'Renew as Monthly Membership'
                        : 'Renew as Yearly Membership',
                    AppDimensionsUpdated.height10(context) * 2,
                    const Color(0xFF5A4D73),
                    const Color(0xFF5A4D73),
                    false),
              ),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 2),
              AnimatedScaleButton(
                onTap: () {
                  dialog(context,
                      'Are you sure you want to cancel your subscription?', () {
                    SubscriptionService()
                        .cancelSubscription(subId, true)
                        .then((value) async {
                      if (value == 200) {
                        Navigator.push(
                            context,
                            FadePageRoute(
                                page: const view_goals(
                              missed: false,
                              name: '',
                              update: false,
                              helpfulTips: false,
                              record: 0,
                            )));
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        prefs.setString('subscriptionStatus', 'inactive');
                        unsubscribed(context);
                      }
                    });
                  }, true);
                },
                child: Buttons().linearGradButton(
                    AppDimensionsUpdated.height10(context) * 5,
                    AppDimensionsUpdated.height10(context) * 33.5,
                    'Cancel Membership',
                    AppDimensionsUpdated.height10(context) * 2,
                    const Color(0xFF5A4D73).withOpacity(0.5),
                    const Color(0xFF5A4D73).withOpacity(0.5),
                    false),
              ),
              SizedBox(height: AppDimensionsUpdated.height10(context) * 3),
            ],
          )),
    ),
  );
}

faqsBoxc(context, qNum, question, answer) {
  return Container(
    width: AppDimensionsUpdated.width10(context) * 34.4,
    alignment: Alignment.topCenter,
    margin:
        EdgeInsets.only(top: AppDimensionsUpdated.height10(context) * 1.052),
    child: Column(
      children: [
        SizedBox(
          width: AppDimensionsUpdated.width10(context) * 34.4,
          child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontFamily: 'laila',
                      fontWeight: FontWeight.w500,
                      height: AppDimensionsUpdated.height10(context) * 0.12,
                      color: const Color(0xFF437296)),
                  children: [
                TextSpan(
                    text: 'Question $qNum: \n',
                    style: TextStyle(
                        height: AppDimensionsUpdated.height10(context) * 0.13,
                        fontWeight: FontWeight.w700)),
                TextSpan(text: question)
              ])),
        ),
        SizedBox(
          height: AppDimensionsUpdated.height10(context) * 1.0,
        ),
        SizedBox(
          width: AppDimensionsUpdated.width10(context) * 34.4,
          child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.8,
                      fontFamily: 'laila',
                      fontWeight: FontWeight.w400,
                      height: AppDimensionsUpdated.height10(context) * 0.14,
                      color: const Color(0xFF437296)),
                  children: [
                const TextSpan(
                    text: 'Answer:  \n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                TextSpan(text: answer)
              ])),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: AppDimensionsUpdated.height10(context) * 1.5),
          width: AppDimensionsUpdated.width10(context) * 7.4,
          height: AppDimensionsUpdated.height10(context) * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppDimensionsUpdated.height10(context) * 2.0),
              color: const Color(0xFFFA9934)),
        ),
      ],
    ),
  );
}
