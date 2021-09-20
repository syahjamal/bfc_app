import 'package:bfc_app/content/homecontent.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeContent(),
    Center(
      child: Text(
        "BROTHERLY Screen 2",
        style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            decoration: TextDecoration.none
        ),
      ),
    ),
    Center(
      child: Text(
        "BROTHERLY Screen 3",
        style: TextStyle(
            fontSize: 24,
            color: Colors.blue,
            decoration: TextDecoration.none
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _pages.elementAt(_selectedIndex),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      iconSize: 30,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
        size: 40,
      ),
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.primary,
      ),
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          label: "Stats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: "Profile",
        ),
      ],
    );
  }
}
