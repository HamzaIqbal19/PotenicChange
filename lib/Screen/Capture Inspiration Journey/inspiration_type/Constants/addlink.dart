import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/inspiration_type/photo_acess.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/Widgets/fading.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

class Addlink extends StatefulWidget {
  const Addlink({super.key, required this.link, this.onpress});

  final TextEditingController link;
  final Function? onpress;
  @override
  State<Addlink> createState() => _AddlinkState();
}

class _AddlinkState extends State<Addlink> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.link.text.isEmpty
            ? AnimatedScaleButton(
                onTap: widget.onpress!,
                child: Container(
                  width: AppDimensions.width10(context) * 2.5,
                  height: AppDimensions.height10(context) * 2.5,
                  // margin: EdgeInsets.only(
                  //     right: AppDimensions.width10(context) * 0.8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: AppDimensions.height10(context) * 2,
                  ),
                ))
            : AnimatedScaleButton(
                onTap: () {
                  setState(() {
                    widget.link.clear();
                  });
                },
                child: Container(
                  width: AppDimensions.width10(context) * 2.5,
                  height: AppDimensions.height10(context) * 2.5,
                  // margin: EdgeInsets.only(
                  //     left: AppDimensions.height10(context) * 0.85
                  //     ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: AppDimensions.height10(context) * 1.8,
                    // size: AppDimensions.height10(context) * 1,
                  ),
                ),
              )
      ],
    );
  }
}



// class Addlink {
//   Widget videoLink(context, TextEditingController link, {Function? onpress}) {
  
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         link.text.isEmpty
//             ? AnimatedScaleButton(
//                 onTap: onpress!,
//                 child: Container(
//                   width: AppDimensions.width10(context) * 2.5,
//                   height: AppDimensions.height10(context) * 2.5,
//                   // margin: EdgeInsets.only(
//                   //     right: AppDimensions.width10(context) * 0.8),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.black,
//                   ),
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.white,
//                     size: AppDimensions.height10(context) * 2,
//                   ),
//                 ))
//             : AnimatedScaleButton(
//                 onTap: () async {
//                   link.clear();
//                 },
//                 child: Container(
//                   width: AppDimensions.width10(context) * 2.5,
//                   height: AppDimensions.height10(context) * 2.5,
//                   // margin: EdgeInsets.only(
//                   //     left: AppDimensions.height10(context) * 0.85
//                   //     ),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.black,
//                   ),
//                   child: Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                     size: AppDimensions.height10(context) * 1.8,
//                     // size: AppDimensions.height10(context) * 1,
//                   ),
//                 ),
//               )
//       ],
//     );
  
  
//   }
// }
