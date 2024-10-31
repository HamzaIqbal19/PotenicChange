import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class BottomSearch extends StatefulWidget {
  BottomSearch(
      {super.key,
      this.controller,
      required this.onTap,
      required this.CancelTap,
      required this.onChanged});
  final controller;
  void Function(String) onChanged;
  final Function onTap;
  void Function() CancelTap;

  @override
  State<BottomSearch> createState() => _BottomSearchState();
}

class _BottomSearchState extends State<BottomSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: AppDimensions.height10(context) * 3.6,
                width: AppDimensions.width10(context) * 31.3,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: const Color(0xFF767680).withOpacity(0.12),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppDimensions.height10(context)))),
                child: Center(
                  child: TextFormField(
                      controller: widget.controller,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: widget.onChanged,
                      // (value) {
                      //   setState(() {
                      //     searchHurdles(value);
                      //   });
                      // },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            bottom: AppDimensions.height10(context) * 1.9,
                          ),
                          prefixIcon: Image.asset(
                            'assets/images/Light.webp',
                            width: AppDimensions.width10(context) * 1.5,
                            height: AppDimensions.height10(context) * 1.5,
                          ),
                          suffixIcon: AnimatedScaleButton(
                            onTap: widget.onTap,
                            // () {
                            //   _searchController.clear();
                            //   setState(() {
                            //     inspirationList = inspirationAll;
                            //   });
                            // },
                            child: Image.asset(
                              'assets/images/cancel.webp',
                              width: AppDimensions.width10(context) * 2.3,
                              height: AppDimensions.height10(context) * 2.3,
                              // fit: BoxFit.contain,
                            ),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              height: AppDimensions.height10(context) * 0.14),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)))),
                ),
              ),
            ],
          ),

          GestureDetector(
            onTap: widget.CancelTap,
            // () {
            //   setState(() {
            //     _searchController.clear();
            //     inspirationList = inspirationAll;
            //     searchIcon = false;
            //   });
            // },
            child: Text(
              "Cancel",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.7,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF007AFF),
              ),
            ),
          ),

          //const Padding(padding: EdgeInsets.all(10))
        ],
      ),
    );
  }
}
