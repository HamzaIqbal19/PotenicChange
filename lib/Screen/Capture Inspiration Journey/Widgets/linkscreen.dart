import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/link_access.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/video_access.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiratoinEdit/photoEdit.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiratoinEdit/videoEdit.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class link_set extends StatefulWidget {
  final String route;
  final String link;
  const link_set({super.key, required this.route, required this.link});

  @override
  State<link_set> createState() => _link_setState();
}

class _link_setState extends State<link_set> {
  final linkController = TextEditingController();

  bool linkbt = false;
  bool showKeyboardOverlay = false;
  List allgoalsSelected = [];

  final FocusNode _textFocusNode = FocusNode();
  String linkUrl = '';
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );

  @override
  void initState() {
    super.initState();
    linkController.text = widget.link;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (showKeyboardOverlay) {
          FocusScope.of(context).unfocus();
          setState(() {
            showKeyboardOverlay = false;
          });
        }
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFFC4C4C4),
              child: linkUrl == ''
                  ? Container()
                  : WebViewWidget(controller: _controller),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFFC4C4C4),
              toolbarHeight: AppDimensions.height10(context) * 5.1,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5).withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            AppDimensions.height10(context) * 1.0),
                        topRight: Radius.circular(
                            AppDimensions.height10(context) * 1.0))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  linkController.text.isNotEmpty
                      ? AnimatedScaleButton(
                          onTap: () {
                            setState(() {
                              linkbt = false;
                            });
                            Navigator.pop(context);
                            linkController.clear();
                          },
                          child: Container(
                            width: AppDimensions.width10(context) * 3.0,
                            height: AppDimensions.height10(context) * 3.0,
                            margin: EdgeInsets.only(
                                right: AppDimensions.width10(context) * 0.8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    const Color(0xFF828282).withOpacity(0.85),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Close.webp'))),
                          ),
                        )
                      : Container(),
                  Container(
                    width: linkController.text.isNotEmpty
                        ? AppDimensions.height10(context) * 29.2
                        : AppDimensions.height10(context) * 33.7,
                    height: AppDimensions.height10(context) * 3.4,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.height10(context) * 1.0),
                        color: const Color(0xff767680).withOpacity(0.12)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: AppDimensions.width10(context) * 1.4,
                          height: AppDimensions.height10(context) * 1.413,
                          margin: EdgeInsets.only(
                              left: AppDimensions.width10(context) * 0.8),
                          decoration: const BoxDecoration(
                              //shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Light.webp'),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: linkController.text.isNotEmpty
                              ? AppDimensions.height10(context) * 23.8
                              : AppDimensions.height10(context) * 28.3,
                          height: AppDimensions.height10(context) * 2.2,
                          //color: Colors.amber,
                          // margin: EdgeInsets.only(
                          //     top: AppDimensions.height10(context) * 1.5),
                          child: TextFormField(
                            controller: linkController,
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: _textFocusNode,
                            onChanged: (value) {
                              setState(() {
                                linkbt = true;
                              });
                            },
                            onTap: () {
                              _textFocusNode
                                  .requestFocus(); // Keep the focus on tap
                            },
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationThickness: 0,
                                fontSize: AppDimensions.font10(context) * 1.5,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xff3C3C43).withOpacity(0.6)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(
                                    AppDimensions.height10(context) * 0.6,
                                    AppDimensions.height10(context) * 0.4,
                                    0,
                                    0),
                                hintText: 'Enter website address',
                                hintStyle: TextStyle(
                                    fontSize:
                                        AppDimensions.font10(context) * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff3C3C43)
                                        .withOpacity(0.6)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent))),
                            onFieldSubmitted: (value) async {
                              String url = linkController.text;
                              if (!url.startsWith("https://")) {
                                url = "https://$url";
                              }

                              _controller.loadRequest(Uri.parse(url));

                              setState(() {
                                linkUrl = linkController.text.toString();
                              });
                            },
                          ),
                        ),
                        linkController.text.isNotEmpty
                            ? AnimatedScaleButton(
                                onTap: () {
                                  setState(() {});
                                  linkController.clear();
                                  linkUrl = '';
                                  _controller.clearCache();
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 2.3,
                                  height: AppDimensions.height10(context) * 2.3,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/ic_refresh.webp'))
                                      // color: Color(0xff282828),
                                      ),
                                  // child: Image.asset(
                                  //   'assets/images/ic_refresh.webp',
                                  //  // width: AppDimensions.width10(context) * 0.941,
                                  //   //height: AppDimensions.height10(context) * 1.4,
                                  //   color: Color(0xff282828),
                                  // ),
                                ),
                              )
                            : AnimatedScaleButton(
                                onTap: () {
                                  Navigator.pop(context);
                                  linkController.clear();
                                },
                                child: Container(
                                  width: AppDimensions.width10(context) * 2.3,
                                  height: AppDimensions.height10(context) * 2.3,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/close_dark.webp'))),
                                ),
                              )
                      ],
                    ),
                  ),
                  AnimatedScaleButton(
                    onTap: () async {
                      Navigator.pop(context, linkController.text);
                      // final SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // await prefs.setString(
                      //     'ImageLink', linkController.text.toString());
                      // if (widget.route == 'image') {

                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: photo_info(
                      //   //             // edit_details: false,
                      //   //             // image_detals: true,
                      //   //             // image_save: true,
                      //   //             // image_create: true,
                      //   //             )));
                      // } else if (widget.route == 'link') {
                      //   Navigator.pop(context, linkController.text);
                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: const link_info(
                      //   //       link_state: true,
                      //   //     )));
                      // } else if (widget.route == 'video') {
                      //   Navigator.pop(context, linkController.text);
                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: const video_info(
                      //   //       link_state: true,
                      //   //     )));
                      // } else if (widget.route == 'edit_image') {
                      //   Navigator.pop(context, linkController.text);
                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: const photoScreen(
                      //   //             image_detals: true,
                      //   //             image_save: true,
                      //   //             edit_details: true,
                      //   //             image_create: true,
                      //   //             updateData: true)));
                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: const photo_Edit(
                      //   //       updateData: true,
                      //   //     )));
                      // } else if (widget.route == 'video_edit') {
                      //   Navigator.pop(context, linkController.text);
                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: const videoEdit(
                      //   //       updateData: true,
                      //   //       context: false,
                      //   //       note: false,
                      //   //     )));
                      // } else if (widget.route == 'content_edit') {
                      //   Navigator.pop(context, linkController.text);
                      //   // Navigator.push(
                      //   //     context,
                      //   //     FadePageRoute(
                      //   //         page: const videoEdit(
                      //   //       updateData: true,
                      //   //       context: true,
                      //   //       note: false,
                      //   //     )));
                      // }
                      _controller.clearCache();
                      linkController.clear();
                    },
                    child: Container(
                      height: AppDimensions.height10(context) * 4.2,
                      width: AppDimensions.width10(context) * 6.2,
                      margin: EdgeInsets.only(
                          left: AppDimensions.width10(context) * 0.9),
                      child: Center(
                        child: Text(
                          'Add link',
                          style: TextStyle(
                              fontSize: AppDimensions.font10(context) * 1.6,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff007AFF)),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              automaticallyImplyLeading: false,
            ),
          ),
        ),
      ),
    );
  }
}
