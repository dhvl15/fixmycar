import 'package:fix_my_car/models/car.dart';
import 'package:fix_my_car/models/user.dart';
import 'package:fix_my_car/pages/add_car.dart';
import 'package:fix_my_car/pages/login_screen.dart';
import 'package:fix_my_car/services/FadeAnimation.dart';
import 'package:fix_my_car/services/auth.dart';
import 'package:fix_my_car/services/database.dart';
import 'package:fix_my_car/widgets/carList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeClassIndex;
  IconData activeMenuIcon;
  int itemCount;
  List<String> listCategory = ["My cars"];
  List<IconData> listIcon = [Icons.work, Icons.apps, Icons.home];
  final AuthService _auth = AuthService();
  MyUser currentUser;

  @override
  void initState() {
    super.initState();
    activeClassIndex = 0;
    activeMenuIcon = Icons.home;
    itemCount = listCategory[activeClassIndex].length;
    currentUser = _auth.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    double paddingLeft = ScreenUtil.instance.setWidth(24);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 1.5,
        mini: true,
        onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddCar()),
          );
        },
        child: Icon(Icons.add, color:Colors.white),
      ),
      body: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                //Color(0xff504944),
                //Color(0xffA28E8F),
                Colors.blueGrey,
                Colors.blueGrey.shade200,
              ],
            ),
          ),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 0,
                  child: ListView(
                    shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ImageIcon(
                              //   AssetImage("asset/images/logo2.png"),
                              //   //size: ScreenUtil.instance.setSp(28),
                              // ),
                              Row(
                                children: [
                                  Image.asset(
                                    'asset/images/logo2.png',
                                    height: ScreenUtil.instance.setSp(28),
                                  ),
                                  Text(
                                    'FixMyCar',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(28),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: (){
                                  _auth.signOut().then((value) {
                                  Navigator.popAndPushNamed(context, LoginScreen.id);
                                });
                                }, icon: Icon(Icons.logout))
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil.instance.setHeight(6),
                          ),
                          Text(
                            'Car service and maintenance',
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
                  FadeAnimation(
                    fadeDirection: FadeDirection.right,
                    delay: 1.5,
                    child: Container(
                      height: ScreenUtil.instance.setHeight(108),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listCategory.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeClassIndex = index;
                                  itemCount =
                                      listCategory[activeClassIndex].length;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                margin: EdgeInsets.only(
                                    left: index == 0 ? paddingLeft : 0),
                                height: ScreenUtil.instance.setHeight(31),
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil.instance.setWidth(20)),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index == activeClassIndex
                                        ? Colors.lightBlueAccent
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Text(
                                  listCategory[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: ScreenUtil.instance.setSp(15),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // ListView.builder(
                  //   itemCount: 5,
                  //   physics: ClampingScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     String heroTag = "car " + (index + 1).toString();
                  //     return FadeAnimation(
                  //       fadeDirection: FadeDirection.right,
                  //       delay: 2 + index / 5,
                  //       child: AnimalCard(
                  //         heroTag: heroTag,
                  //         title: "car " + (index + 1).toString(),
                  //         subtitle: "model number",
                  //         foregroundurl: "asset/images/car.png",
                  //         backgroundurl: "asset/images/settings.png",
                  //       ),
                  //     );
                  //   },
                  // )
                ],
              )),
              Expanded(
                child: StreamProvider<List<CarData>>.value(
                    initialData:[],
                    value: DatabaseService(uid: currentUser.uid).car,
                    child: CarList()
                    // Scaffold(
                    //   backgroundColor: Colors.teal.shade100,
                    //   body: Container(
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    //         image: AssetImage('assets/images/empty.jpg'),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //     child: 
                    //   ),
                    // ),
                  ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
