import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Capture%20Inspiration%20Journey/constants/videothumbnail.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

// class CustomCircle extends StatefulWidget {
//   const CustomCircle({super.key, this.gradient, this.image, this.child});
//   final gradient;
//   final image;
//   final child;

//   @override
//   State<CustomCircle> createState() => _CustomCircleState();
// }

// class _CustomCircleState extends State<CustomCircle> {
//   @override
//   Widget build(BuildContext context) {
//     bool smallScreen = MediaQuery.of(context).size.height < 690;
//     return Container(
//       width: !smallScreen
//           ? AppDimensions.width10(context) * 19.313
//           : AppDimensions.width10(context) * 17.6,
//       height: !smallScreen
//           ? AppDimensions.width10(context) * 19.313
//           : AppDimensions.width10(context) * 17.6,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: widget.gradient,
//         image: widget.image,
//       ),
//       child: widget.child,
//     );
//   }
// }
class InspirationCustomCircle {
  Widget customContainer(context,
      {final link, final desc, final id, final img, void Function()? onTap}) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    return GestureDetector(
      onTap: onTap,
      child: id == 2
          ? Container(
              padding: EdgeInsets.all(AppDimensions.height10(context) * 1),
              width: !smallScreen
                  ? AppDimensions.width10(context) * 19.313
                  : AppDimensions.width10(context) * 17.6,
              height: !smallScreen
                  ? AppDimensions.width10(context) * 19.313
                  : AppDimensions.width10(context) * 17.6,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  //  gradient: gradient,
                  image: DecorationImage(
                      image: AssetImage("assets/images/noterecordbg.png"),
                      fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.height10(context) * 1.7),
                height: AppDimensions.height10(context) * 6.3,
                child: Center(
                    child: Text(
                  desc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimensions.font10(context) * 1.6,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFFFFFFF)),
                )),
              ),
            )
          : id == 4
              ? Container(
                  padding: EdgeInsets.all(AppDimensions.height10(context) * 1),
                  width: !smallScreen
                      ? AppDimensions.width10(context) * 19.313
                      : AppDimensions.width10(context) * 17.6,
                  height: !smallScreen
                      ? AppDimensions.width10(context) * 19.313
                      : AppDimensions.width10(context) * 17.6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      //  gradient: gradient,
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/contentrecordbg.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.height10(context) * 1.7),
                    height: AppDimensions.height10(context) * 6.3,
                    child: Center(
                        child: Text(
                      desc,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimensions.font10(context) * 1.6,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFFFFFFF)),
                    )),
                  ),
                )
              : id == 3
                  ? Container(
                      padding:
                          EdgeInsets.all(AppDimensions.height10(context) * 1),
                      width: !smallScreen
                          ? AppDimensions.width10(context) * 19.313
                          : AppDimensions.width10(context) * 17.6,
                      height: !smallScreen
                          ? AppDimensions.width10(context) * 19.313
                          : AppDimensions.width10(context) * 17.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //  gradient: gradient,
                        image: DecorationImage(
                            image:
                                Videothumbnail().extractThumbnailUrl(link) == ''
                                    ? AssetImage('assets/images/video.webp')
                                    : NetworkImage(Videothumbnail()
                                            .extractThumbnailUrl(link))
                                        as ImageProvider<Object>,
                            fit: BoxFit.cover),
                      ))
                  : id == 1
                      ? Container(
                          width: !smallScreen
                              ? AppDimensions.width10(context) * 19.3
                              : AppDimensions.width10(context) * 17.4,
                          height: !smallScreen
                              ? AppDimensions.width10(context) * 19.7
                              : AppDimensions.width10(context) * 17.8,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10(context) * 18),
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                  'assets/images/placeholder-image-gray-3x2.webp'), // Placeholder image
                              image: NetworkImage(img.toString()),
                              fit: BoxFit.cover,
                              placeholderFit: BoxFit.contain,
                            ),
                          ),
                        )
                      : Container(),
    );
  }
}
