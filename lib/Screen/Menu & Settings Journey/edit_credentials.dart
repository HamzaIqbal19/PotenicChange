import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/API/Authentication.dart';
import 'package:potenic_app/Screen/Menu%20&%20Settings%20Journey/settings.dart';
import 'package:potenic_app/Screen/ResetPassword/EmailSent.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';
import 'package:potenic_app/Widgets/resetDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class _edit_credentialsState extends State<edit_credentials> {
  String userName = 'Jane';
  String userEmail = 'jane.Smith@email.com';
  bool update = false;
  String emailMsg = '';
  bool errorEmail = false;
  bool loader = false;
  bool colorChange = false;
  String newEmailMsg = '';
  bool newErrorEmail = false;
  String cnfrmEmailMsg = '';
  bool cnfrmErrorEmail = false;
  String passEmail = '';
  bool passErrorEmail = false;

  final _editFormkey = GlobalKey<FormState>();

  TextEditingController feildController = TextEditingController();
  TextEditingController feildController2 = TextEditingController();

  getUser() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      userName = prefs.getString('userName') ?? 'Jane';
      userEmail = prefs.getString('userEmail') ?? 'jane.Smith@email.com';
    });
    if (widget.password_edit) {
      setState(() {
        feildController.text = userEmail;
        colorChange = true;
      });
    } else if (widget.email == false) {
      feildController.text = userName;
      colorChange = true;
    }
  }

  updateUser() {
    if (widget.email) {
      // if (feildController.text.isEmpty || feildController2.text.isEmpty) {
      //   setState(() {
      //     newErrorEmail = false;
      //     newEmailMsg = "";
      //   });
      //   // setState(() {
      //   //   errorEmail = true;
      //   //   emailMsg = "Ooops! Needs to be an email format";
      //   // });
      // }
      {
        if ((EmailValidator.validate(feildController.text) &&
            EmailValidator.validate(feildController2.text))) {
          if (feildController.text == feildController2.text) {
            setState(() {
              loader = true;
              errorEmail = false;
              emailMsg = "";
            });
            Authentication()
                .userUpdate(
                    feildController.text, feildController2.text, widget.email)
                .then((value) async {
              if (value == true) {
                setState(() {
                  loader = false;
                });
                final SharedPreferences prefs = await _prefs;
                prefs.setString('userEmail', feildController2.text);
                Navigator.pushReplacement(
                    context, FadePageRoute(page: const Settings()));
              } else {
                dialog(context, value['message'], () {
                  Navigator.pop(context);
                }, false);
              }
            });
          } else {
            setState(() {
              // newErrorEmail = true;
              /// newEmailMsg = "Email doesnot match";
              cnfrmErrorEmail = true;
              cnfrmEmailMsg = "Email does not match";
            });
          }
        }
      }
    } else {
      if (feildController.text.isEmpty) {
      } else {
        setState(() {
          loader = true;
        });
        Authentication()
            .userUpdate(
                feildController.text, feildController2.text, widget.email)
            .then((value) async {
          if (value == true) {
            setState(() {
              loader = false;
            });
            final SharedPreferences prefs = await _prefs;
            prefs.setString('userName', feildController.text);
            Navigator.pushReplacement(
                context, FadePageRoute(page: const Settings()));
          } else {
            dialog(context, value['message'], () {
              Navigator.pop(context);
            }, false);
          }
        });
      }
    }
  }

  // updateUser() {
  //   if (widget.email == true) {
  //     if (feildController.text.isNotEmpty &&
  //         feildController2.text.isNotEmpty &&
  //         EmailValidator.validate(feildController.text) &&
  //         EmailValidator.validate(feildController2.text)) {
  //       if (feildController.text == feildController2.text) {
  //         setState(() {
  //           newErrorEmail = false;
  //           newEmailMsg = "";
  //         });
  //         Authentication()
  //             .userUpdate(
  //                 feildController.text, feildController2.text, widget.email)
  //             .then((value) async {
  //           print("User update value $value");
  //           if (value == true) {
  //             final SharedPreferences prefs = await _prefs;
  //             prefs.setString('userEmail', feildController2.text);
  //             Navigator.pushReplacement(
  //                 context, FadePageRoute(page: const Settings()));
  //             //    Navigator.pop(context);
  //           } else {
  //             dialog(context, value['message'], () {
  //               Navigator.pop(context);
  //             }, false);
  //           }
  //         });
  //       } else {
  //         setState(() {
  //           // newErrorEmail = true;
  //           /// newEmailMsg = "Email doesnot match";
  //           cnfrmErrorEmail = true;
  //           cnfrmEmailMsg = "Email doesnot match";
  //         });
  //       }
  //     }
  //   } else if (widget.email == false) {
  //     if (feildController.text.isNotEmpty) {
  //       print("name");
  //       Authentication()
  //           .userUpdate(
  //               feildController.text, feildController2.text, widget.email)
  //           .then((value) async {
  //         print("User update value $value");
  //         if (value == true) {
  //           final SharedPreferences prefs = await _prefs;
  //           prefs.setString('userName', feildController.text);
  //           // Navigator.pop(context);
  //           Navigator.pushReplacement(
  //               context, FadePageRoute(page: const Settings()));
  //         } else {
  //           dialog(context, value['message'], () {
  //             Navigator.pop(context);
  //           }, false);
  //         }
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Buttons().backButton(context, () {
          Navigator.pop(context);
        }),
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
          child: Form(
            key: _editFormkey,
            child: Column(
              children: [
                Container(
                  width: AppDimensions.width10(context) * 28.5,
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
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: AppDimensions.width10(context) * 35.7,
                          margin: EdgeInsets.only(
                            left: AppDimensions.width10(context) * 3.9,
                            // right: AppDimensions.width10(context) * 3.6,
                            top: AppDimensions.height10(context) * 6.5,
                          ),
                          child: Text(
                            'We will email you a link to reset your password',
                            style: TextStyle(
                                fontSize: AppDimensions.font10(context) * 1.8,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFFBFBFB)),
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  // height: widget.email
                  //     ? AppDimensions.height10(context) * 22.4
                  //     : widget.password_edit
                  //         ? AppDimensions.height10(context) * 6.0
                  //         : AppDimensions.height10(context) * 8.6,
                  width: AppDimensions.width10(context) * 36.0,
                  margin: EdgeInsets.only(
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
                                //height: AppDimensions.height10(context) * 3.8,
                                width: AppDimensions.width10(context) * 22.2,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom:
                                        AppDimensions.height10(context) * 1.3,
                                    left: AppDimensions.width10(context) * 0.6),
                                child: Text(
                                  'Your current email address is\n$userEmail',
                                  style: TextStyle(
                                    color: const Color(0xFFFBFBFB),
                                    height:
                                        AppDimensions.height10(context) * 0.15,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        AppDimensions.font10(context) * 1.8,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: AppDimensions.height10(context) * 6,
                              width: AppDimensions.width10(context) * 36.0,
                              padding: EdgeInsets.only(
                                top: AppDimensions.height10(context) + 2,
                                //left: AppDimensions.height10(context) * 1.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context) *
                                              1.8))),
                              child: TextFormField(
                                  controller: feildController,
                                  keyboardType: TextInputType.emailAddress,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  style: TextStyle(
                                    color: const Color(0xFF8C648A),
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        AppDimensions.font10(context) * 2.4,
                                  ),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom:
                                              AppDimensions.height10(context) *
                                                  1.50,
                                          left: 20.0,
                                          right: 10.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: "john.smith@yahoo.com",
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF8C648A),
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            AppDimensions.font10(context) * 2.4,
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
                                              color: Colors.transparent))),
                                  validator: (val) {
                                    if (val != null && val.isNotEmpty) {
                                      val = val.trim();
                                    }

                                    if (val == null || val.isEmpty) {
                                      setState(() {
                                        newErrorEmail = true;
                                        newEmailMsg = 'Email is required';
                                      });
                                    } else if (!EmailValidator.validate(val)) {
                                      setState(() {
                                        newErrorEmail = true;
                                        newEmailMsg =
                                            ' Ooops! Needs to be an email format';
                                      });
                                    } else {
                                      setState(() {
                                        newErrorEmail = false;
                                        newEmailMsg = '';
                                      });
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(
                                height: newErrorEmail == false
                                    ? AppDimensions.height10(context) * 3.18
                                    : 0),
                            newErrorEmail
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) *
                                            1.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.3),
                                    child: Text(
                                      newEmailMsg,
                                      style: TextStyle(
                                        color: const Color(0xFFFE6624),
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : Container(),
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context) *
                                              1.8))),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: feildController2,
                                style: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.font10(context) * 2.4,
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.50,
                                        left: 20.0,
                                        right: 10.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "john.smith@yahoo.com",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.4,
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
                                            color: Colors.transparent))),
                                validator: (val) {
                                  if (val != null && val.isNotEmpty) {
                                    val = val.trim();
                                  }

                                  if (val == null || val.isEmpty) {
                                    setState(() {
                                      cnfrmErrorEmail = true;
                                      cnfrmEmailMsg = 'Email is required';
                                    });
                                  } else if (!EmailValidator.validate(val)) {
                                    setState(() {
                                      cnfrmErrorEmail = true;
                                      cnfrmEmailMsg =
                                          ' Ooops! Needs to be an email format';
                                    });
                                  } else {
                                    setState(() {
                                      cnfrmErrorEmail = false;
                                      cnfrmEmailMsg = '';
                                    });
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      colorChange = true;
                                    } else {
                                      colorChange = false;
                                    }
                                  });
                                },
                              ),
                            ),
                            cnfrmErrorEmail
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.width10(context) *
                                            1.0),
                                    child: Text(
                                      cnfrmEmailMsg,
                                      style: TextStyle(
                                        color: const Color(0xFFFE6624),
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : Container(),
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppDimensions.height10(context) *
                                              1.8))),
                              child: TextFormField(
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    value.trim();
                                  }
                                  if (widget.password_edit == true) {
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        passErrorEmail = true;
                                        passEmail = "Email is required";
                                      });
                                    } else if (!EmailValidator.validate(
                                        value)) {
                                      setState(() {
                                        passErrorEmail = true;
                                        passEmail =
                                            ' Ooops! Needs to be an email format';
                                      });
                                    }
                                  }
                                },
                                keyboardType: widget.password_edit
                                    ? TextInputType.emailAddress
                                    : TextInputType.text,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: feildController,
                                style: TextStyle(
                                  color: const Color(0xFF8C648A),
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.font10(context) * 2.4,
                                ),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom:
                                            AppDimensions.height10(context) *
                                                1.50,
                                        left: 20.0,
                                        right: 10.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: widget.password_edit
                                        ? userEmail
                                        : userName,
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF8C648A),
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AppDimensions.font10(context) * 2.4,
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
                                            color: Colors.transparent))),
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      colorChange = true;
                                    } else {
                                      colorChange = false;
                                    }
                                  });
                                },
                              ),
                            ),
                            passErrorEmail
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(
                                      left:
                                          AppDimensions.width10(context) * 1.0,
                                    ),
                                    child: Text(
                                      passEmail,
                                      style: TextStyle(
                                        color: const Color(0xFFFE6624),
                                        fontSize:
                                            AppDimensions.font10(context) * 1.4,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : Container(),
                            widget.password_edit
                                ? Container()
                                : widget.email
                                    ? Container()
                                    : SizedBox(
                                        height:
                                            AppDimensions.height10(context) *
                                                0.9,
                                      ),
                            widget.password_edit
                                ? Container()
                                : Container(
                                    height:
                                        AppDimensions.height10(context) * 1.7,
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
                AnimatedScaleButton(
                  onTap: () {
                    if (_editFormkey.currentState!.validate()) {
                      if (widget.password_edit == true) {
                        if (feildController.text.isEmpty) {
                        } else {
                          setState(() {
                            loader = true;
                          });
                          Authentication()
                              .passReset(
                            feildController.text.toString(),
                          )
                              .then((response) {
                            if (response == true) {
                              setState(() {
                                loader = false;
                              });
                              Navigator.pushReplacement(
                                context,
                                FadePageRoute(
                                  page: EmailSent(
                                    email: feildController.text.toString(),
                                  ),
                                ),
                              );
                            } else if (response == 404) {
                              // setState(() {
                              //   loading = false;
                              //   noEmail = true;
                              // });
                            } else {
                              // setState(() {
                              //   loading = false;
                              //   noEmail = false;
                              // });
                            }
                          }).catchError((error) {
                            setState(() {
                              // loading = false;
                            });
                          });
                        }
                      } else {
                        updateUser();
                      }
                    } else {
                      setState(() {
                        loader = false;
                      });
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
                        color: colorChange == false
                            ? const Color(0xFF282828).withOpacity(0.5)
                            : const Color(0xFFFBFBFB)),
                    child: Center(
                      child: loader
                          ? SpinKitThreeBounce(
                              color: const Color(0xFF8C648A),
                              // delay: Duration(milliseconds: 0),
                              size: AppDimensions.height10(context) * 3.5,
                            )
                          : Text(
                              widget.password_edit ? 'Send' : 'Save updates',
                              style: TextStyle(
                                color: colorChange == false
                                    ? const Color(0xFFFFFFFF).withOpacity(0.9)
                                    : const Color(0xFF8C648A),
                                fontSize: AppDimensions.font10(context) * 2,
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
      ),
    );
  }
}
