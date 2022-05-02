import 'package:fix_my_car/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimalCard extends StatelessWidget {
  final String uid;
  final String heroTag;
  final String backgroundurl, foregroundurl;
  final String title,title2, subtitle;
  final String id;

  const AnimalCard(
      {Key key,
      this.title2,
      this.uid,
      this.heroTag,
      this.backgroundurl,
      this.foregroundurl,
      this.subtitle,
      this.id,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);

    return Center(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //       builder: (context) => DetailPage(
          //             heroTag: heroTag,
          //           )),
          // );
        },
        child: Container(
            height: ScreenUtil.instance.setHeight(210),
            width: ScreenUtil.instance.setWidth(327),
            margin: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(20)),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade200,
                // Color(0xFF9C9288),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(5, 5),
                      blurRadius: 7)
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: ScreenUtil.instance.setHeight(210),
                    width: ScreenUtil.instance.setWidth(150),
                    decoration: BoxDecoration(
                      color: Color(0xFF525145),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            //'asset/map/map_1.png',
                            backgroundurl,
                            height: ScreenUtil.instance.setHeight(210),
                            width: ScreenUtil.instance.setWidth(150),
                            color: Colors.white.withOpacity(0.05),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(16),
                                right: ScreenUtil.instance.setWidth(16),
                                top: ScreenUtil.instance.setHeight(35)),
                            child: Column(
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(20),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  subtitle,
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(12),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: ScreenUtil.instance.setWidth(16),
                                right: ScreenUtil.instance.setWidth(16),
                                bottom: ScreenUtil.instance.setHeight(18)),
                            child: Text(
                              title2 ?? "",
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(12),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        // Positioned(
                        //     left: ScreenUtil.instance.setWidth(80),
                        //     top: ScreenUtil.instance.setWidth(80),
                        //     child: Container(
                        //       height: ScreenUtil.instance.setWidth(40),
                        //       width: ScreenUtil.instance.setWidth(40),
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //           color: Colors.white.withOpacity(0.1),
                        //           shape: BoxShape.circle,
                        //           border: Border.all(
                        //               color: Color(0xFFFDCD00), width: 0.2)),
                        //       child: Container(
                        //         height: ScreenUtil.instance.setWidth(5),
                        //         width: ScreenUtil.instance.setWidth(5),
                        //         alignment: Alignment.center,
                        //         decoration: BoxDecoration(
                        //           color: Color(0xFFFDCD00),
                        //           shape: BoxShape.circle,
                        //         ),
                        //       ),
                        //     ))
                      ],
                    ),
                  ),
                ),
                
                Positioned(
                  top: 0,
                  right: 0,
                  width: ScreenUtil.instance.setWidth(220),
                  child: Hero(
                    tag: heroTag,
                    child: Image.asset(
                      //'asset/animal/humingbird.png',
                      foregroundurl,
                      fit: BoxFit.cover,
                      //height: 100,
                      //width: 100,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   height: ScreenUtil.instance.setHeight(50),
                      //   width: ScreenUtil.instance.setWidth(70),
                      //   decoration: BoxDecoration(
                      //       //color: Colors.white.withOpacity(0.2),
                      //       // borderRadius: BorderRadius.only(
                      //       //     bottomRight: Radius.circular(20),
                      //       //     topLeft: Radius.circular(20))
                      //       ),
                      //   alignment: Alignment.center,
                      //   child: IconButton(
                      //     icon : Icon(Icons.edit,
                      //     size: ScreenUtil.instance.setWidth(28),
                      //     color: Colors.lightBlue),
                      //     onPressed: (){},
                      //   ),
                      // ),
                      Container(
                        height: ScreenUtil.instance.setHeight(50),
                        width: ScreenUtil.instance.setWidth(70),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                                )),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon : Icon(Icons.delete_forever,
                          size: ScreenUtil.instance.setWidth(28),
                          color: Colors.red,),
                          onPressed: (){
                            DatabaseService(uid: uid).deleteData(id: id);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
