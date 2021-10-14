import 'package:fix_my_car/pages/browse/browse_page.dart';
import 'package:fix_my_car/pages/home.dart';
import 'package:fix_my_car/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageStage createState() => _MainPageStage();
}

class _MainPageStage extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _widgetOptions = <Widget>[
      Home(),
      BrowsePage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA28E8F),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_sharp),
            label: "Browse",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        //backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Color(0xffA28E8F),
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
