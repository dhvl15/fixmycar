import 'package:fix_my_car/services/FadeAnimation.dart';
import 'package:fix_my_car/widgets/animal_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stores extends StatefulWidget {
  @override
  _StoresState createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  int activeClassIndex;
  IconData activeMenuIcon;

  @override
  void initState() {
    super.initState();
    activeClassIndex = 0;
    activeMenuIcon = Icons.home;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    double paddingLeft = ScreenUtil.instance.setWidth(24);

    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color(0xff504944),
              // Color(0xffA28E8F),
              Colors.blueGrey,
              Colors.blueGrey.shade200,
            ],
          ),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: paddingLeft,
                //     vertical: ScreenUtil.instance.setHeight(29),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Icon(
                //         Icons.subject,
                //         size: ScreenUtil.instance.setHeight(35),
                //         color: Colors.white,
                //       ),
                //       Icon(
                //         Icons.search,
                //         size: ScreenUtil.instance.setHeight(35),
                //         color: Colors.white,
                //       ),
                //     ],
                //   ),
                // ),
                FadeAnimation(
                  fadeDirection: FadeDirection.right,
                  delay: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingLeft,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Find Stores',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil.instance.setSp(28),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: ScreenUtil.instance.setHeight(6),
                        ),
                        Text(
                          'Nearest dealers',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(15),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: 5,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    String heroTag = "Store " + (index + 1).toString();
                    return FadeAnimation(
                      fadeDirection: FadeDirection.right,
                      delay: 2 + index / 5,
                      child: AnimalCard(
                        heroTag: heroTag,
                        backgroundurl: "asset/images/carservice.png",
                        foregroundurl: "asset/images/garage2.png",
                        title: "Store $index",
                        subtitle: "Address $index",
                      ),
                    );
                  },
                )
              ],
            )),
            // Container(
            //   height: ScreenUtil.instance.setHeight(70),
            //   width: ScreenUtil.instance.setWidth(375),
            //   padding: EdgeInsets.symmetric(horizontal: paddingLeft),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: listIcon
            //         .map((icon) => GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   activeMenuIcon = icon;
            //                 });
            //               },
            //               child: Container(
            //                 width: ScreenUtil.instance.setWidth(42),
            //                 height: ScreenUtil.instance.setWidth(42),
            //                 decoration: BoxDecoration(
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(10)),
            //                   color: activeMenuIcon == icon
            //                       ? Color(0xFFB9AEAE)
            //                       : Colors.transparent,
            //                   boxShadow: [
            //                     BoxShadow(
            //                         color: activeMenuIcon == icon
            //                             ? Colors.black.withOpacity(0.1)
            //                             : Colors.transparent,
            //                         offset: Offset(5, 5),
            //                         blurRadius: 5)
            //                   ],
            //                 ),
            //                 child: Icon(
            //                   icon,
            //                   color: Colors.white,
            //                   size: ScreenUtil.instance.setWidth(20),
            //                 ),
            //               ),
            //             ))
            //         .toList(),
            //   ),
            // )
          ],
        )),
      ),
    );
  }
}
