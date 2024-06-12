
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenic_app/Widgets/animatedButton.dart';
import 'package:potenic_app/utils/app_dimensions.dart';

messages(BuildContext context,title, body,visible, final VoidCallback onTap){
  return Container(
    height: UpdatedDimensions
        .height10(
        context) *
        16.7,
    width: UpdatedDimensions
        .width10(
        context) *
        35.335,
    margin: EdgeInsets.only(top: UpdatedDimensions.height10(context)*0.5),
    decoration:
    const BoxDecoration(
        image:
        DecorationImage(
          image: AssetImage(
            'assets/images/Component 2.webp',
          ),
          fit: BoxFit.contain,
        )),
    child: Stack(children: [

      Align(
        alignment:
        const Alignment(
            0.97, 0),
        child: Image.asset(
          "assets/images/Vector Smart Object.webp",
          height: UpdatedDimensions
              .height10(
              context) *
              9.296,
          width: UpdatedDimensions
              .width10(
              context) *
              4.16,
        ),
      ),
      Container(
        margin:
        EdgeInsets.only(
          top: UpdatedDimensions
              .height10(
              context) *
              2.7,
       left: UpdatedDimensions.width10(
              context) *
              2.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: UpdatedDimensions
                  .width10(
                  context) *
                  28.0,

              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                TextStyle(
                  fontSize:
                  UpdatedDimensions.font10(context) *
                      2,
                  fontWeight:
                  FontWeight
                      .w600,
                  color: const Color
                      .fromRGBO(
                      91,
                      116,
                      166,
                      1),
                ),
              ),
            ),
            Container(
              width: UpdatedDimensions
                  .width10(
                  context) *
                  5.245,
              height: UpdatedDimensions
                  .width10(
                  context) *
                  1.3,


              child:
              const Divider(
                thickness:
                1,
                color: Color
                    .fromRGBO(
                    91,
                    116,
                    166,
                    1),
              ),
            ),
            Container(
              width: UpdatedDimensions
                  .width10(
                  context) *
                  26.7,
              height: UpdatedDimensions.height10(context) * 5.3,
              margin: EdgeInsets.only(

                  bottom: UpdatedDimensions.height10(
                      context) *
                      1.2),
              child: Text(
                body,
                // textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize:
                    UpdatedDimensions.font10(context) *
                        1.8,
                    fontWeight:
                    FontWeight
                        .w400,
                    color: const Color
                        .fromRGBO(
                        91,
                        116,
                        166,
                        1)),
              ),
            )
          ],
        ),
      ),
    ]),
  );
}
