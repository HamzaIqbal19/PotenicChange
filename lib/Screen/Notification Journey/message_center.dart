import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:potenic_app/MyServices/Notification/notificationApis.dart';
import 'package:potenic_app/Screen/Notification%20Journey/widgets/checkBox.dart';
import 'package:potenic_app/Screen/Notification%20Journey/widgets/messageComponent.dart';
import 'package:potenic_app/Screen/Notification%20Journey/widgets/noMessages.dart';
import 'package:potenic_app/Screen/Notification%20Journey/widgets/notificationSheet.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/buttons.dart';

import '../../utils/app_dimensions.dart';

class MessageCenter extends StatefulWidget {
  const MessageCenter({super.key});

  @override
  State<MessageCenter> createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  bool options = false;
  bool delete = false;
  bool undo = false;

  var notifications;
  var notificationList2;
  List deleteIds = [];
  bool isLoading = true;

  void markAllAsRead() {
    notificationApi.markAllAsRead();
  }

  void addIdsToList() {
    for (int i = 0; i < notifications.length; i++) {
      if (deleteIds.contains(notifications[i]['id']) == false) {
        deleteIds.add(notifications[i]['id']);
      }
    }
  }

  getUserNotifications() {
    notificationApi.getMessageCenter().then((value) {
      setState(() {
        notifications = value;
        notificationList2 = value;
        isLoading = false;
      });

    });
  }

  removeNotifications() {
    for (int i = 0; i < notifications.length; i++) {
      if (deleteIds.contains(notifications[i]['id'])) {
        notifications.remove(i);
      }
    }
    deleteIds.clear();
  }

  undoDelete() {
    setState(() {
      undo = true;
      notifications = notificationList2;
    });
  }

  deleteUserNotifications() {
    setState(() {
      isLoading = true;
    });
    notificationApi.deleteUserNotification(deleteIds).then((value) {
      getUserNotifications();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserNotifications();
    markAllAsRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        leadingWidth: AppDimensionsUpdated.width10(context) * 13,
        leading: Center(
          child: AnimatedScaleButton(
            onTap: () {
              setState(() {
                addIdsToList();
              });
              alertBox(context, () {
                setState(() {
                  delete = false;
                  options = false;
                });
                deleteUserNotifications();
                //removeNotifications();
                Navigator.pop(context);
              });
            },
            child: SizedBox(
              //width: AppDimensionsUpdated.width10(context) * 9.5,
              height: AppDimensionsUpdated.height10(context) * 2.4,

              // margin: EdgeInsets.only(left: AppDimensionsUpdated.width10(context) * 1.6),
              child: Text(
                !options ? "" : 'Select All',
                style: TextStyle(
                    fontSize: AppDimensionsUpdated.font10(context) * 1.6,
                    height: AppDimensionsUpdated.height10(context) * 0.16,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: const Color(0xFFFBFBFB)),
              ),
            ),
          ),
        ),
        actions: [
          Center(
              child: options
                  ? GestureDetector(
                      onTap: () {
                        if (options == true) {
                          setState(() {
                            options = false;
                            deleteIds.clear();
                          });
                        }
                      },
                      child: SizedBox(
                        width: AppDimensionsUpdated.width10(context) * 5.8,
                        height: AppDimensionsUpdated.height10(context) * 2.4,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.6,
                              height:
                                  AppDimensionsUpdated.height10(context) * 0.16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              // decorationThickness: 3,
                              color: const Color(0xFFFBFBFB)),
                        ),
                      ),
                    )
                  : Buttons().closeButton(context, () {
                      Navigator.pop(context);
                    })),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Mask Group.webp'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: isLoading
            ? const Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFFB1B8FF),
                  size: 80,
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 9.2,
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 7.6,
                      height: AppDimensionsUpdated.height10(context) * 7.6,
                      padding: EdgeInsets.symmetric(
                          vertical:
                              AppDimensionsUpdated.height10(context) * 0.85,
                          horizontal:
                              AppDimensionsUpdated.width10(context) * 1.162),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Image.asset(
                        'assets/images/Vector Smart Object_1.webp',
                        width: AppDimensionsUpdated.width10(context) * 5.275,
                        height: AppDimensionsUpdated.height10(context) * 5.991,
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 32.9,
                      height: AppDimensionsUpdated.height10(context) * 3.6,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 1.9),
                      child: Center(
                        child: Text(
                          'Message centre',
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 2.8,
                              fontFamily: 'laila',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFBFBFB)),
                        ),
                      ),
                    ),
                    Container(
                      width: AppDimensionsUpdated.width10(context) * 28.4,
                      height: AppDimensionsUpdated.height10(context) * 2.2,
                      margin: EdgeInsets.only(
                          top: AppDimensionsUpdated.height10(context) * 1.2),
                      child: Center(
                        child: Text(
                          'All your notifications in one place',
                          style: TextStyle(
                              fontSize:
                                  AppDimensionsUpdated.font10(context) * 1.8,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Laila',
                              color: const Color(0xFFFBFBFB)),
                        ),
                      ),
                    ),
                    notifications.length == 0
                        ? noMessages(context)
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppDimensionsUpdated.width10(context) * 1.5,
                            ),
                            itemCount: notifications.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MulitiSelectionButton(
                                onTap: () {
                                  if (options) {
                                    setState(() {
                                      if (deleteIds.contains(
                                          notifications[index]["id"])) {
                                        deleteIds
                                            .remove(notifications[index]["id"]);
                                        if (deleteIds.isEmpty) {
                                          options = false;
                                        }
                                      } else {
                                        deleteIds
                                            .add(notifications[index]["id"]);
                                      }
                                    });
                                  } else {
                                    print(
                                        "Notification Data ${notifications[index]}");
                                    // notificationApi.markAsRead(
                                    //     notifications['index']["id"]);
                                    seeMoreSheet(context, notifications[index],
                                        () {
                                      notificationApi.deleteUserNotification(
                                          notifications[index]["id"]);

                                      Navigator.of(context).pop();
                                      setState(() {
                                        isLoading = true;
                                      });
                                      Timer(const Duration(seconds: 1), () {
                                        getUserNotifications();
                                      });
                                    });
                                  }
                                },
                                longPress: () {
                                  setState(() {
                                    options = true;
                                    deleteIds.add(notifications[index]["id"]);
                                  });
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    messages(
                                        context,
                                        notifications[index]["title"],
                                        notifications[index]["body"],
                                        false,
                                        () {},
                                        index,
                                        notifications[index]["status"] !=
                                            "read"),
                                    options == true
                                        ? Positioned(
                                            top: 22,
                                            right: 27,
                                            child: checkBox(
                                                context,
                                                deleteIds.contains(
                                                    notifications[index]
                                                        ["id"])),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              );
                            }),
                    SizedBox(
                      height: AppDimensionsUpdated.height10(context) * 6,
                    )
                  ],
                ),
              ),
      ),
      bottomNavigationBar:
          // delete
          //     ? Container(
          //   margin:
          //   EdgeInsets.all(UpdatedDimensions.height10(context) * 1.8),
          //   child: updateBox(
          //       headText: "Deleted",
          //       bodyText: "Alerts",
          //       edit: false,
          //       onTap1: () {
          //         undoDelete();
          //       },
          //       FadeFunction: () {
          //         if(undo){
          //           setState(() {
          //             undo = false;
          //           });
          //         }else{
          //           deleteUserNotifications();
          //         }
          //
          //       },
          //       functionText: "Undo"),
          // )
          //     :
          (isLoading == true || notifications.length == 0)
              ? Container()
              : AnimatedScaleButton(
                  onTap: () {
                    setState(() {
                      options = true;
                    });
                  },
                  child: Container(
                    width: AppDimensionsUpdated.width10(context) * 29.0,
                    height: options
                        ? AppDimensionsUpdated.height10(context) * 7.0
                        : AppDimensionsUpdated.height10(context) * 5.0,
                    margin: options
                        ? const EdgeInsets.all(0)
                        : EdgeInsets.only(
                            top: AppDimensionsUpdated.height10(context) * 0.1,
                            right: AppDimensionsUpdated.width10(context) * 6.2,
                            left: AppDimensionsUpdated.width10(context) * 6.2,
                            bottom:
                                AppDimensionsUpdated.height10(context) * 2.2),
                    decoration: BoxDecoration(
                        boxShadow: [
                          options
                              ? BoxShadow(
                                  color:
                                      const Color(0xFF000000).withOpacity(0.25),
                                  spreadRadius:
                                      AppDimensionsUpdated.height10(context) *
                                          0.5,
                                  blurRadius:
                                      AppDimensionsUpdated.height10(context) *
                                          0.7,
                                  offset: const Offset(2, 3),
                                )
                              : const BoxShadow()
                        ],
                        borderRadius: BorderRadius.circular(options
                            ? AppDimensionsUpdated.height10(context) * 0
                            : AppDimensionsUpdated.height10(context) * 5.0),
                        color: const Color(0xFFF5F5F5)),
                    child: options
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  alertBox(context, () {
                                    setState(() {
                                      delete = true;
                                      options = false;
                                    });
                                    deleteUserNotifications();
                                    //removeNotifications();
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  width: AppDimensionsUpdated.width10(context) *
                                      10.1,
                                  height:
                                      AppDimensionsUpdated.height10(context) *
                                          5.0,
                                  margin: EdgeInsets.only(
                                      left: AppDimensionsUpdated.width10(
                                              context) *
                                          2.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppDimensionsUpdated.height10(
                                                  context) *
                                              5.0),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFFFCC10D),
                                        Color(0xFFFDA210)
                                      ])),
                                  child: Center(
                                    child: Text('Delete ',
                                        style: TextStyle(
                                          fontSize: AppDimensionsUpdated.font10(
                                                  context) *
                                              1.6,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFFFFFFF),
                                        )),
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    AppDimensionsUpdated.width10(context) * 7.7,
                                height: AppDimensionsUpdated.height10(context) *
                                    2.1,
                                margin: EdgeInsets.only(
                                    right:
                                        AppDimensionsUpdated.width10(context) *
                                            2.0),
                                child: Center(
                                  child: Text('${deleteIds.length} selected',
                                      style: TextStyle(
                                        fontSize: AppDimensionsUpdated.font10(
                                                context) *
                                            1.4,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFFA9934),
                                      )),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Text(
                              'Options',
                              style: TextStyle(
                                  fontSize:
                                      AppDimensionsUpdated.font10(context) *
                                          1.6,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFA9934)),
                            ),
                          ),
                  ),
                ),
      extendBody: true,
    );
  }
}
