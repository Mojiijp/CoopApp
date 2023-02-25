import 'package:flutter/material.dart';
import 'package:fruits_and_veggies/presentation/camera/camera_page.dart';
import 'package:fruits_and_veggies/presentation/home/home_page.dart';
import 'package:fruits_and_veggies/presentation/memo/memo_page.dart';
import 'package:fruits_and_veggies/presentation/menu/menu_page.dart';
import 'package:fruits_and_veggies/presentation/profile/profile_page.dart';
import 'package:get/get_core/src/get_main.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({Key? key}) : super(key: key);

  @override
  _ButtomNavBarState createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {

  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const MenuPage(),
    const CameraPage(),
    const MemoPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
          print(value);
        },
        backgroundColor: Colors.white,
        unselectedItemColor: Color(0xffd3d3d3),
        iconSize: 35,
        fixedColor: const Color(0xff7dce13),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.dining_rounded), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.my_library_books), label: 'Memo'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
