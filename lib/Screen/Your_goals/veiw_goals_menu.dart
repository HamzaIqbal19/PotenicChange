import 'package:flutter/material.dart';
import 'package:potenic_app/Screen/Your_goals/veiw_all_goals.dart';

import '../../utils/app_dimensions.dart';

class your_goals_menu extends StatelessWidget {
  const your_goals_menu({super.key});

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
                'assets/images/Back.png',
                width: AppDimensions.height10 * 2.6,
                height: AppDimensions.height10 * 2.6,
                fit: BoxFit.cover,
              )),
        ),
        centerTitle: true,
        title: Container(
          width: AppDimensions.height10 * 17.0,
          height: AppDimensions.height10 * 4.8,
          child: Text(
            'Menu',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppDimensions.height10 * 2.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: AppDimensions.height10 * 37.4,
              height: AppDimensions.height10 * 28.0,
              margin: EdgeInsets.only(top: AppDimensions.height10 * 16.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height10 * 2.0),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => veiw_all_goals_menu()));
                    },
                    child: Container(
                      width: AppDimensions.height10 * 33.4,
                      height: AppDimensions.height10 * 5.0,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: AppDimensions.height10 * 0.1,
                                  color: Color(0xff5B74A6)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimensions.height10 * 20.6,
                            height: AppDimensions.height10 * 1.9,
                            child: Text(
                              'Your goals',
                              style: TextStyle(
                                  fontSize: AppDimensions.height10 * 1.6,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF5B74A6)),
                            ),
                          ),
                          Container(
                              width: AppDimensions.height10 * 2.4,
                              height: AppDimensions.height10 * 1.39,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/BTN Back.png',
                                  //width: AppDimensions.height10 * 2.6,
                                  //height: AppDimensions.height10 * 2.6,
                                  color: Color(0xff5B74A6),
                                  fit: BoxFit.cover,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 33.4,
                    height: AppDimensions.height10 * 5.0,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10 * 0.1,
                                color: Color(0xff5B74A6)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.6,
                          height: AppDimensions.height10 * 1.9,
                          child: Text(
                            'Messages (00 new)',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF5B74A6)),
                          ),
                        ),
                        Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 1.39,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/BTN Back.png',
                                //width: AppDimensions.height10 * 2.6,
                                //height: AppDimensions.height10 * 2.6,
                                color: Color(0xff5B74A6),
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 33.4,
                    height: AppDimensions.height10 * 5.0,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10 * 0.1,
                                color: Color(0xff5B74A6)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.6,
                          height: AppDimensions.height10 * 1.9,
                          child: Text(
                            'Membership subscription',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF5B74A6)),
                          ),
                        ),
                        Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 1.39,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/BTN Back.png',
                                //width: AppDimensions.height10 * 2.6,
                                //height: AppDimensions.height10 * 2.6,
                                color: Color(0xff5B74A6),
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 33.4,
                    height: AppDimensions.height10 * 5.0,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: AppDimensions.height10 * 0.1,
                                color: Color(0xff5B74A6)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.6,
                          height: AppDimensions.height10 * 1.9,
                          child: Text(
                            'Community (coming soon)',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF5B74A6)),
                          ),
                        ),
                        Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 1.39,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/BTN Back.png',
                                //width: AppDimensions.height10 * 2.6,
                                //height: AppDimensions.height10 * 2.6,
                                color: Color(0xff5B74A6),
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.height10 * 33.4,
                    height: AppDimensions.height10 * 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppDimensions.height10 * 20.6,
                          height: AppDimensions.height10 * 1.9,
                          child: Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: AppDimensions.height10 * 1.6,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF5B74A6)),
                          ),
                        ),
                        Container(
                            width: AppDimensions.height10 * 2.4,
                            height: AppDimensions.height10 * 1.39,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/BTN Back.png',
                                //width: AppDimensions.height10 * 2.6,
                                //height: AppDimensions.height10 * 2.6,
                                color: Color(0xff5B74A6),
                                fit: BoxFit.cover,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
