import 'package:apptester/widgets/buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../profile/presentations/profile_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List widgetoptions = [
    const Text('Home'),
    const ProfileScreen(), //pageprofile
    const Text('Settings')
  ];

  List<BottomNavigationBarItem> bar_items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  ];

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('HOME SCREEN'),
      ),
      body: widgetoptions[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          items: bar_items,
          currentIndex: currentindex,
          onTap: (index) => setState(() {
                currentindex = index;
              })),
    );
  }
}
