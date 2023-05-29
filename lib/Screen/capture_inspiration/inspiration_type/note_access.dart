import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/capture_inspiration/inpiration_landing.dart';

import '../../../utils/app_dimensions.dart';

class note_info extends StatefulWidget {
  final int type_switch;
  final bool note_saved;

  const note_info(
      {super.key, required this.note_saved, required this.type_switch});

  @override
  State<note_info> createState() => _note_infoState();
}

class _note_infoState extends State<note_info> {
  @override
  Widget build(BuildContext context) {
    bool link_state = false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffC4C4C4),
      ),
      bottomNavigationBar: BottomAppBar(
          color: const Color(0xffC4C4C4),
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: AppDimensions.height10 * 84.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Container(
                  // width: AppDimensions.height10 * 41.1,
                  height: AppDimensions.height10 * 5.1,
                  // margin: EdgeInsets.only(top: AppDimensions.height10 * 5.4),
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5).withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(AppDimensions.height10 * 1.0),
                          topRight:
                              Radius.circular(AppDimensions.height10 * 1.0))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: AppDimensions.height10 * 2.2,
                          width: AppDimensions.height10 * 3.3,
                          margin: EdgeInsets.only(
                              right: AppDimensions.height10 * 4.9),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff007AFF)),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: AppDimensions.height10 * 2.2,
                            width: AppDimensions.height10 * 23.1,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create',
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.7,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff282828)),
                                  ),
                                  if (widget.type_switch == 1) ...[
                                    Text(
                                      ' note inspiration',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    ),
                                  ] else if (widget.type_switch == 2) ...[
                                    Text(
                                      ' inspiration content link',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    )
                                  ] else if (widget.type_switch == 3) ...[
                                    Text(
                                      ' inspiration video link',
                                      style: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.7,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff282828)),
                                    )
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 2.2,
                          width: AppDimensions.height10 * 4.3,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 4.9),
                          child: Text(
                            'Create',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.5,
                                fontWeight: FontWeight.w400,
                                color: widget.note_saved
                                    ? const Color(0xff007AFF)
                                    : const Color(0xff007AFF).withOpacity(0.4)),
                          ),
                        )
                      ]),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: AppDimensions.height10 * 79.7,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.height10 * 2.1,
                          width: AppDimensions.height10 * 30.5,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 2.0,
                              right: AppDimensions.height10 * 8.9,
                              top: AppDimensions.height10 * 3.2),
                          child: Column(children: [
                            if (widget.type_switch == 3) ...[
                              Text(
                                'Video Destination Link',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff828282)),
                              ),
                            ] else if (widget.type_switch == 2) ...[
                              Text(
                                'Content Destination Link',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff828282)),
                              ),
                            ] else ...[
                              Text(
                                'Title',
                                style: TextStyle(
                                    fontSize: AppDimensions.height10 * 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff828282)),
                              ),
                            ],
                          ]),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: widget.note_saved
                              ? AppDimensions.height10 * 4.8
                              : AppDimensions.height10 * 2.4,
                          width: widget.note_saved
                              ? AppDimensions.height10 * 37.5
                              : AppDimensions.height10 * 30.5,
                          //color: Colors.amber,
                          margin: EdgeInsets.only(
                            left: widget.note_saved
                                ? AppDimensions.height10 * 2.0
                                : AppDimensions.height10 * 0,
                            right: widget.note_saved
                                ? AppDimensions.height10 * 1.9
                                : AppDimensions.height10 * 10.0,
                            // top: widget.note_saved
                            //     ? AppDimensions.height10 * 0
                            //     : AppDimensions.height10 * 1.0
                          ),
                          child: widget.note_saved
                              ? Column(
                                  children: [
                                    if (widget.type_switch == 1) ...[
                                      Text(
                                        'Lorem ipsum dolor\nsit amet, consectetur adipiscing elit. ',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF464646)),
                                      ),
                                    ] else if (widget.type_switch == 2) ...[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'https://www.nirandfar.com/\ndistractions/',
                                            style: TextStyle(
                                                height: 1.5,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.7,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF464646)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppDimensions.height10 *
                                                    0.45),
                                            child: Container(
                                              width:
                                                  AppDimensions.height10 * 2.5,
                                              height:
                                                  AppDimensions.height10 * 2.5,
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10 *
                                                      1.0),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size:
                                                    AppDimensions.height10 * 2,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ] else if (widget.type_switch == 3) ...[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'https://www.youtube.com/watch?\nv=btPJPFnesV4',
                                            style: TextStyle(
                                                height: 1.5,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize:
                                                    AppDimensions.height10 *
                                                        1.7,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF464646)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: AppDimensions.height10 *
                                                    0.45),
                                            child: Container(
                                              width:
                                                  AppDimensions.height10 * 2.5,
                                              height:
                                                  AppDimensions.height10 * 2.5,
                                              margin: EdgeInsets.only(
                                                  left: AppDimensions.height10 *
                                                      1.0),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size:
                                                    AppDimensions.height10 * 2,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ]
                                  ],
                                )
                              : TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.7,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10 * 1.5,
                                          AppDimensions.height10 * 0.4,
                                          AppDimensions.height10 * 0.2,
                                          0),
                                      hintText: 'Give your inspiration a title',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.7,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828282)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 2.1,
                          width: AppDimensions.height10 * 30.5,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 2.0,
                              right: AppDimensions.height10 * 8.9,
                              top: AppDimensions.height10 * 3.9),
                          child: Column(
                            children: [
                              if (widget.type_switch == 1) ...[
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ] else if (widget.type_switch == 2) ...[
                                Text(
                                  'Why is it inspirational to you',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ] else if (widget.type_switch == 3) ...[
                                Text(
                                  'What it means to me',
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff828282)),
                                ),
                              ]
                            ],
                          ),
                        ),
                        Container(
                          // height: widget.note_saved
                          //     ? AppDimensions.height10 * 39.0
                          //     : AppDimensions.height10 * 2.4,
                          width: AppDimensions.height10 * 30.5,
                          // color: Colors.amber,
                          margin: EdgeInsets.only(
                            left: widget.note_saved
                                ? AppDimensions.height10 * 2.0
                                : AppDimensions.height10 * 0,
                            right: widget.note_saved
                                ? AppDimensions.height10 * 8.9
                                : AppDimensions.height10 * 10.0,
                            // top: widget.note_saved
                            //     ? AppDimensions.height10 * 0
                            //     : AppDimensions.height10 * 1.0
                          ),
                          child: widget.note_saved
                              ? Column(
                                  children: [
                                    if (widget.type_switch == 1) ...[
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu vestibulum est, ut rhoncus ligula. Aen`qean quis ultrices odio. Nullam eleifend eu lectus non tincidunt. Phasellus sed nibh pulvinar, ultrices augue viverra, varius neque. Mauris sollicitudin hendrerit libero, eu tempus leo ultricies quis. Proin hendrerit leo leo, eget hendrerit ipsum accumsan at. Mauris id ipsum feugiat, vestibulum nibh sit amet, scelerisque ex. Cras congue sagittis condimentum. Pellentesque non pellentesque diam. Nulla interdum condimentum lorem ac interdum. Quisque tristique lacinia malesuada. Sed sed mattis orci, id pulvinar elit. Donec semper libero quis mauris rutrum, sit amet posuere lacus sodales. Donec a suscipit dolor. Vivamus ut tempus neque. ',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF464646)),
                                      ),
                                    ] else if (widget.type_switch == 2) ...[
                                      Text(
                                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nulla eu\nvestibulum est, ut rhoncus ligula.\nAenean quis ultrices odio. Nullam\neleifend eu lectus non tincidunt.\nPhasellus sed nibh pulvinar, ultrices\naugue viverra, varius neque.Mauris sollicitudin hendrerit libero, eu\ntempus leo ultricies quis. Proin\nhendrerit leo leo, eget hendrerit\nipsum accumsan at. Mauris id ipsum\nfeugiat, vestibulum nibh sit amet,\nscelerisque ex. Cras congue sagittis\ncondimentum. ',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF464646)),
                                      ),
                                    ] else if (widget.type_switch == 3) ...[
                                      Text(
                                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nulla eu\nvestibulum est, ut rhoncus ligula.\nAenean quis ultrices odio. Nullam\neleifend eu lectus non tincidunt.\nPhasellus sed nibh pulvinar, ultrices\naugue viverra, varius neque.Mauris sollicitudin hendrerit libero, eu\ntempus leo ultricies quis. Proin\nhendrerit leo leo, eget hendrerit\nipsum accumsan at. Mauris id ipsum\nfeugiat, vestibulum nibh sit amet,\nscelerisque ex. Cras congue sagittis\ncondimentum. ',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF464646)),
                                      ),
                                    ]
                                  ],
                                )
                              : Container(
                                  height: widget.note_saved
                                      ? AppDimensions.height10 * 39.0
                                      : AppDimensions.height10 * 2.4,
                                  width: AppDimensions.height10 * 37.5,
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height10 * 1.6,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff282828)),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            AppDimensions.height10 * 1.5,
                                            AppDimensions.height10 * 0.4,
                                            0,
                                            0),
                                        hintText:
                                            'Say more about this inspiration ',
                                        hintStyle: TextStyle(
                                            fontSize:
                                                AppDimensions.height10 * 1.7,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff828282)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.transparent))),
                                  ),
                                ),
                        ),
                        if (widget.type_switch == 2) ...[
                          Container(
                            height: AppDimensions.height10 * 2.1,
                            width: AppDimensions.height10 * 30.5,
                            margin: EdgeInsets.only(
                                left: AppDimensions.height10 * 2.0,
                                right: AppDimensions.height10 * 8.9,
                                top: AppDimensions.height10 * 3.0),
                            child: Text(
                              'Content Author',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff828282)),
                            ),
                          )
                        ] else ...[
                          Container()
                        ],
                        if (widget.type_switch == 2) ...[
                          Container(
                            height: AppDimensions.height10 * 2.4,
                            width: AppDimensions.height10 * 30.5,
                            //  color: Colors.grey,
                            margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 2.0,
                              right: AppDimensions.height10 * 8.9,
                            ),
                            child: Text(
                              'Author name',
                              style: TextStyle(
                                  color: const Color(0xFF282828),
                                  fontSize: AppDimensions.height10 * 1.7,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                        Container(
                          height: AppDimensions.height10 * 2.1,
                          width: AppDimensions.height10 * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 2.0,
                              right: AppDimensions.height10 * 8.9,
                              top: AppDimensions.height10 * 3.9),
                          child: Text(
                            'Tags',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 2.4,
                          width: AppDimensions.height10 * 30.5,
                          margin: EdgeInsets.only(
                              left: widget.note_saved
                                  ? AppDimensions.height10 * 2.0
                                  : AppDimensions.height10 * 0,
                              right: widget.note_saved
                                  ? AppDimensions.height10 * 8.9
                                  : AppDimensions.height10 * 10.0,
                              top: widget.note_saved
                                  ? AppDimensions.height10 * 0
                                  : AppDimensions.height10 * 1.0),
                          child: widget.note_saved
                              ? Text(
                                  'Add #hashtag',
                                  style: TextStyle(
                                      color: const Color(0xFF282828),
                                      fontSize: AppDimensions.height10 * 1.7,
                                      fontWeight: FontWeight.w500),
                                )
                              : TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize: AppDimensions.height10 * 1.6,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff282828)),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          AppDimensions.height10 * 1.6,
                                          AppDimensions.height10 * 0.4,
                                          0,
                                          0),
                                      hintText: 'Add #hashtag',
                                      hintStyle: TextStyle(
                                          fontSize:
                                              AppDimensions.height10 * 1.7,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff828282)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                        ),
                        Container(
                          height: AppDimensions.height10 * 2.1,
                          width: AppDimensions.height10 * 30.5,
                          margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 2.0,
                              right: AppDimensions.height10 * 8.9,
                              top: AppDimensions.height10 * 3.9),
                          child: Text(
                            'Attached goals',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.5,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff828282)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.note_saved
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const inspiration_landing(
                                              muliple_insp: true,
                                              is_Updated: false,
                                            )))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const note_info(
                                              note_saved: true,
                                              type_switch: 1,
                                            )));
                          },
                          child: Container(
                            height: AppDimensions.height10 * 6.0,
                            width: AppDimensions.height10 * 37.5,
                            margin: EdgeInsets.only(
                              left: AppDimensions.height10 * 2.0,
                              right: AppDimensions.height10 * 1.9,
                            ),
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
                                          fontSize:
                                              AppDimensions.height10 * 1.8,
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
                )
              ]),
            ),
          )),
    );
  }
}
