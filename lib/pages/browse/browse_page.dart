import 'package:fix_my_car/pages/browse/map.dart';
//import 'package:fix_my_car/pages/browse/stores.dart';
import 'package:flutter/material.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({Key key}) : super(key: key);

  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapPage(),
    );
  }
}
