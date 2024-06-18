import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../favorite_screen/favorite_screen.dart';
import '../homePage/home_screen.dart';
import '../messages/views/screens/message_page.dart';
import '../profile_screen/profile_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({Key? key}) : super(key: key);

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MessagePage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Uy'),
          TabItem(icon: Icons.message, title: 'Xabarlar'),
          TabItem(icon: Icons.favorite, title: 'Sevimli'),
          TabItem(icon: Icons.people, title: 'Profil'),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
