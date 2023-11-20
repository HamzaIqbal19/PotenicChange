import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Menu&settings/success.dart';

import '../../Widgets/fading.dart';
import '../../utils/app_dimensions.dart';

class edit_credentials extends StatefulWidget {
  final bool email;
  final bool password_edit;
  const edit_credentials(
      {super.key, required this.email, required this.password_edit});

  @override
  State<edit_credentials> createState() => _edit_credentialsState();
}

class _edit_credentialsState extends State<edit_credentials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/images/Back.webp',
                width: AppDimensions.width10(context) * 2.6,
                height: AppDimensions.height10(context) * 2.6,
                fit: BoxFit.contain,
              )),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.webp'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: AppDimensions.width10(context) * 28.5,
                height: AppDimensions.height10(context) * 3.6,
                margin: EdgeInsets.only(
                  top: AppDimensions.height10(context) * 18.0,
                ),
                child: Center(
                  child: Text(
                    widget.email
                        ? 'Edit email address'
                        : widget.password_edit
                            ? 'Change password'
                            : 'Edit name',
                    style: TextStyle(
                        fontSize: AppDimensions.font10(context) * 3.0,
                        height: AppDimensions.height10(context) * 0.12,
                        wordSpacing: AppDimensions.height10(context) * 0.5,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFBFBFB)),
                  ),
                ),
              ),
              widget.password_edit
                  ? Container(
                      width: AppDimensions.width10(context) * 35.7,
                      height: AppDimensions.height10(context) * 1.9,
                      margin: EdgeInsets.only(
<<<<<<< Updated upstream
                        left: AppDimensions.height10(context) * 2.4,
=======
                        left: AppDimensions.width10(context) * 2.4,
>>>>>>> Stashed changes
                        right: AppDimensions.width10(context) * 3.6,
                        top: AppDimensions.height10(context) * 6.5,
                      ),
                      child: Text(
                        'We will email you a link to reset your password',
                        style: TextStyle(
                            fontSize: AppDimensions.font10(context) * 1.6,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFBFBFB)),
                      ),
                    )
                  : Container(),
              Container(
                height: widget.email
                    ? AppDimensions.height10(context) * 22.4
                    : widget.password_edit
                        ? AppDimensions.height10(context) * 6.0
                        : AppDimensions.height10(context) * 8.6,
                width: AppDimensions.width10(context) * 36.0,
                margin: EdgeInsets.only(
<<<<<<< Updated upstream
                    left: AppDimensions.height10(context) * 1.8,
=======
                    left: AppDimensions.width10(context) * 1.8,
>>>>>>> Stashed changes
                    right: AppDimensions.width10(context) * 3.6,
                    top: widget.email
                        ? AppDimensions.height10(context) * 4.1
                        : widget.password_edit
                            ? AppDimensions.height10(context) * 1.2
                            : AppDimensions.height10(context) * 6.8),
                child: widget.email
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: AppDimensions.height10(context) * 3.8,
                              width: AppDimensions.width10(context) * 22.2,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  bottom: AppDimensions.height10(context) * 1.3,
                                  left: AppDimensions.width10(context) * 0.6),
                              child: Text(
                                'Your current email address is\njane.smith@gmail.com',
                                style: TextStyle(
                                  color: const Color(0xFFFBFBFB),
                                  height:
                                      AppDimensions.height10(context) * 0.15,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppDimensions.font10(context) * 1.6,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 6,
                            width: AppDimensions.width10(context) * 36.0,
                            padding: EdgeInsetsDirectional.only(
                              top: AppDimensions.height10(context) + 2,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.50,
                                        left: 10.0,
                                        right: 10.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "john.smith@yahoo.com",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                    ),
                                    labelText: "New Email",
                                    labelStyle: TextStyle(
                                      color: const Color(0xFF282828),
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.1,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)))),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 1.0,
                                bottom: AppDimensions.height10(context) * 1.3),
                            child: Text(
                              "Ooops! Needs to be an email format",
                              style: TextStyle(
                                color: const Color(0xFFFE6624),
                                fontSize: AppDimensions.font10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            height: AppDimensions.height10(context) * 6,
                            width: AppDimensions.width10(context) * 36.0,
                            padding: EdgeInsetsDirectional.only(
                              top: AppDimensions.height10(context) + 2,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.50,
                                        left: 10.0,
                                        right: 10.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "john.smith@yahoo.com",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                    ),
                                    labelText: "Confirm Email",
                                    labelStyle: TextStyle(
                                      color: const Color(0xFF282828),
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.1,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)))),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: AppDimensions.width10(context) * 1.0),
                            child: Text(
                              "Ooops! Does not match the top email",
                              style: TextStyle(
                                color: const Color(0xFFFE6624),
                                fontSize: AppDimensions.font10(context) * 1.4,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: AppDimensions.height10(context) * 6,
                            width: AppDimensions.width10(context) * 36.0,
                            padding: EdgeInsetsDirectional.only(
                              top: AppDimensions.height10(context) + 2,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppDimensions.height10(context) * 1.8))),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.50,
                                        left: 10.0,
                                        right: 10.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: widget.password_edit
                                        ? "john.smith@yahoo.com"
                                        : "Jane",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AppDimensions.font10(context) * 1.8,
                                    ),
                                    labelText: widget.password_edit
                                        ? "Confirm Email"
                                        : "Name",
                                    labelStyle: TextStyle(
                                      color: const Color(0xFF282828),
                                      fontFamily: 'laila',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.1,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)))),
                          ),
                          widget.password_edit
                              ? Container()
                              : widget.email
                                  ? Container()
                                  : SizedBox(
                                      height:
                                          AppDimensions.height10(context) * 0.9,
                                    ),
                          widget.password_edit
                              ? Container()
                              : Container(
                                  height: AppDimensions.height10(context) * 1.7,
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      left: AppDimensions.width10(context) *
                                          1.0),
                                  child: Text(
                                    "First name is required",
                                    style: TextStyle(
                                      color: const Color(0xFFFBFBFB),
                                      fontSize:
                                          AppDimensions.font10(context) * 1.4,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                        ],
                      ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.password_edit == true) {
                    Navigator.push(
                      context,
                      FadePageRoute(page: const Success()),
                    );
                  }
                },
                child: Container(
                  height: AppDimensions.height10(context) * 5.0,
                  width: AppDimensions.width10(context) * 36.0,
                  margin: EdgeInsets.only(
                      top: widget.email
                          ? AppDimensions.height10(context) * 4.4
                          : widget.password_edit
                              ? AppDimensions.height10(context) * 15.3
                              : AppDimensions.height10(context) * 15.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.height10(context) * 3.6),
                      color: const Color(0xFF282828).withOpacity(0.5)),
                  child: Center(
                    child: Text(
                      widget.password_edit ? 'Send' : 'Save updates',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF).withOpacity(0.9),
                        fontSize: AppDimensions.font10(context) * 1.6,
                        height: AppDimensions.height10(context) * 0.12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }
}
