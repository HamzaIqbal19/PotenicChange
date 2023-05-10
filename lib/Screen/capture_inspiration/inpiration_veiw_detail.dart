import 'package:flutter/material.dart';

import '../../utils/app_dimensions.dart';

class veiw_details extends StatefulWidget {
  final int type_switch;
  const veiw_details({super.key, required this.type_switch});

  @override
  State<veiw_details> createState() => _veiw_detailsState();
}

class _veiw_detailsState extends State<veiw_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/images/Back.png',
                  width: AppDimensions.height10 * 2.6,
                  height: AppDimensions.height10 * 2.6,
                  fit: BoxFit.cover,
                )),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: widget.type_switch == 4
                    ? const AssetImage('assets/images/video_image.png')
                    : const AssetImage(
                        'assets/images/bg_inpiration_purple.png'),
                colorFilter: const ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 1), BlendMode.dstATop),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            if (widget.type_switch == 1) ...[
              Container(
                width: double.infinity,
                //color: Colors.amber,
                child: Container(
                  width: AppDimensions.height10 * 34.7,
                  height: AppDimensions.height10 * 36.188,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 12.0,
                    left: AppDimensions.height10 * 3.4,
                    right: AppDimensions.height10 * 3.4,
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/selected_image.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ] else if (widget.type_switch == 2) ...[
              Container(
                width: double.infinity,
                // color: Colors.amber,
                child: Container(
                  width: AppDimensions.height10 * 37.7,
                  height: AppDimensions.height10 * 24.7,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: AppDimensions.height10 * 11.50,
                    left: AppDimensions.height10 * 1.8,
                    right: AppDimensions.height10 * 1.8,
                  ),
                  decoration: const BoxDecoration(
                      //  color: Colors.amber,
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/distraction content.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ] else if (widget.type_switch == 4) ...[
              Container(
                alignment: Alignment.center,
//IT'S HEIGHT IS SET SO BACKGROUND DOES'NT BECOME VISIBLE
                // width: AppDimensions.height10 * 41.4,
                // margin: EdgeInsets.only(bottom: AppDimensions.height10 * 20.0),
                height: AppDimensions.height10 * 44.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/video_image.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: SizedBox(
                    width: AppDimensions.height10 * 8.6,
                    height: AppDimensions.height10 * 8.6,
                    child: Image.asset('assets/images/play_button.png'),
                  ),
                ),
              ),
            ] else if (widget.type_switch == 3) ...[
              Container(
                // width: AppDimensions.height10 * 34.7,
                height: AppDimensions.height10 * 52.5,

                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Color(0xFFE9A594), Color(0xFFEEBEB2)]),
                ),
                child: Center(
                  child: Text(
                    'Lorem ipsum dolor\nsit amet, consectetur\nadipiscing elit. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: AppDimensions.height10 * 2.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          //should change according to screen
          height: widget.type_switch == 1
              ? AppDimensions.height10 * 38.465
              : widget.type_switch == 2
                  ? AppDimensions.height10 * 52.465
                  : AppDimensions.height10 * 48.465,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.height10 * 4.0),
                topRight: Radius.circular(AppDimensions.height10 * 4.0)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            //reverse: true,
            child: Container(
              height: widget.type_switch == 3
                  ? AppDimensions.height10 * 69.2
                  : widget.type_switch == 1
                      ? AppDimensions.height10 * 38.465
                      : AppDimensions.height10 * 60.2,
              child: Column(
                children: [
                  Container(
                    height: AppDimensions.height10 * 2.1,
                    width: AppDimensions.height10 * 30.5,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10 * 3.6,
                        right: AppDimensions.height10 * 8.9,
                        top: AppDimensions.height10 * 3.4),
                    child: Text(
                      'Title',
                      style: TextStyle(
                        fontSize: AppDimensions.height10 * 1.4,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff828282),
                      ),
                    ),
                  ),
                  Container(
                      // height: AppDimensions.height10 * 2.4,
                      // width: AppDimensions.height10 * 30.5,
                      alignment: Alignment.centerLeft,
                      // color: Colors.amber,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 3.6,
                          right: AppDimensions.height10 * 9.0,
                          top: AppDimensions.height10 * 0.3),
                      child: Column(
                        children: [
                          if (widget.type_switch == 1) ...[
                            Text(
                              'Nir Eyal',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else if (widget.type_switch == 2) ...[
                            Text(
                              'Learn How To Avoid Distraction In A World\nThat Is Full Of It',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else if (widget.type_switch == 4) ...[
                            Text(
                              'Survivors:  Music Eye Of The Tiger ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else if (widget.type_switch == 3) ...[
                            Text(
                              'Lorem ipsum dolor\nsit amet, consectetur adipiscing elit. ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]
                        ],
                      )),
                  Column(
                    children: [
                      if (widget.type_switch == 4) ...[
                        Container(
                          height: AppDimensions.height10 * 3.0,
                          width: AppDimensions.height10 * 25.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 10.0,
                              top: AppDimensions.height10 * 1.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xFF282828)),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 2.0)),
                          child: Center(
                            child: Text(
                              'Listen from this website',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF646464)),
                            ),
                          ),
                        ),
                      ] else if (widget.type_switch == 3) ...[
                        Container(),
                      ] else ...[
                        Container(
                          height: AppDimensions.height10 * 3.0,
                          width: AppDimensions.height10 * 15.0,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 21.0,
                              top: AppDimensions.height10 * 1.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xFF282828)),
                              borderRadius: BorderRadius.circular(
                                  AppDimensions.height10 * 2.0)),
                          child: Center(
                            child: Text(
                              'Visit website',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.8,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF646464)),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  Container(
                      // height: AppDimensions.height10 * 2.1,
                      // width: AppDimensions.height10 * 30.5,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 3.6,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 2.0),
                      child: Column(
                        children: [
                          if (widget.type_switch == 1) ...[
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ] else if (widget.type_switch == 2) ...[
                            Text(
                              'Why is it inspirational to you',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ] else if (widget.type_switch == 4) ...[
                            Text(
                              'What it means to me',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ] else if (widget.type_switch == 3) ...[
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.4,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          ]
                        ],
                      )),
                  Container(
                      // height: AppDimensions.height10 * 2.4,
                      // width: AppDimensions.height10 * 30.5,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 3.6,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 0.2),
                      child: Column(
                        children: [
                          if (widget.type_switch == 1) ...[
                            Text(
                              'Behavioural Coach',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else if (widget.type_switch == 2) ...[
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu vestibulum est, ut rhoncus ligula. Aenean quis ultrices odio. Nullam eleifend eu lectus non tincidunt. Phasellus sed nibh pulvinar, ultrices augue viverra, varius neque. Mauris sollicitudin hendrerit libero, eu tempus leo ultricies quis. Proin hendrerit leo leo, eget hendrerit ipsum accumsan at. Mauris id ipsum feugiat, vestibulum nibh sit amet, scelerisque ex. Cras congue sagittis condimentum. ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else if (widget.type_switch == 3) ...[
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu vestibulum est, ut rhoncus ligula. Aenean quis ultrices odio. Nullam eleifend eu lectus non tincidunt. Phasellus sed nibh pulvinar, ultrices augue viverra, varius neque. Mauris sollicitudin hendrerit libero, eu tempus leo ultricies quis. Proin hendrerit leo leo, eget hendrerit ipsum accumsan at. Mauris id ipsum feugiat, vestibulum nibh sit amet, scelerisque ex. Cras congue sagittis condimentum. Pellentesque non pellentesque diam. Nulla interdum condimentum lorem ac interdum. Quisque tristique lacinia malesuada. Sed sed mattis orci, id pulvinar elit. Donec semper libero quis mauris rutrum, sit amet posuere lacus sodales. Donec a suscipit dolor. Vivamus ut tempus neque. ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ] else if (widget.type_switch == 4) ...[
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu vestibulum est, ut rhoncus ligula. Aenean quis ultrices odio. Nullam eleifend eu lectus non tincidunt. Phasellus sed nibh pulvinar, ultrices augue viverra, varius neque. ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1.5,
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]
                        ],
                      )),
                  Container(
                    height: AppDimensions.height10 * 2.1,
                    width: AppDimensions.height10 * 30.5,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10 * 3.6,
                        right: AppDimensions.height10 * 8.9,
                        top: AppDimensions.height10 * 2.0),
                    child: Text(
                      'Tags',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff828282)),
                    ),
                  ),
                  Container(
                      // height: AppDimensions.height10 * 2.4,
                      // width: AppDimensions.height10 * 30.5,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: AppDimensions.height10 * 3.6,
                          right: AppDimensions.height10 * 8.9,
                          top: AppDimensions.height10 * 0.2),
                      child: Text(
                        '#tag1 #tag2',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1.5,
                            color: const Color(0xFF282828),
                            fontSize: AppDimensions.height10 * 1.6,
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                    height: AppDimensions.height10 * 2.1,
                    width: AppDimensions.height10 * 30.5,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        left: AppDimensions.height10 * 3.6,
                        right: AppDimensions.height10 * 8.9,
                        top: AppDimensions.height10 * 2.0),
                    child: Text(
                      'Attached goals',
                      style: TextStyle(
                          fontSize: AppDimensions.height10 * 1.4,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff828282)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: AppDimensions.height10 * 6.0,
                      width: AppDimensions.height10 * 37.5,
                      margin: EdgeInsets.only(
                          // bottom: AppDimensions.height10 * 1.0,
                          left: AppDimensions.height10 * 2.2,
                          right: AppDimensions.height10 * 1.7,
                          top: AppDimensions.height10 * 0.5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFF464646)),
                          borderRadius: BorderRadius.circular(
                              AppDimensions.height10 * 2.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 23.9,
                            height: AppDimensions.height10 * 2.2,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 1.99),
                            child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '00 impacted goals',
                                  style: TextStyle(
                                    color: const Color(0xFF646464),
                                    fontSize: AppDimensions.height10 * 1.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ),
                          Container(
                              width: AppDimensions.height10 * 2.4,
                              height: AppDimensions.height10 * 1.39,
                              margin: EdgeInsets.only(
                                  right: AppDimensions.height10 * 2.391),
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  //width: AppDimensions.height10 * 2.6,
                                  //height: AppDimensions.height10 * 2.6,
                                  color: const Color(0xFF646464),
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
