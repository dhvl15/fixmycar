import 'package:fix_my_car/pages/home.dart';
import 'package:fix_my_car/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixMyCar',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      //home: Home(),
      home: MainPage(),
    );
  }
}
