import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class TabBoxScreen extends StatelessWidget {
  const TabBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        children: [

        ],
      ),
     bottomNavigationBar:  ConvexAppBar(
       curveSize: 100,
        // curve: Curve,

        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.map, title: 'Discovery'),

          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        // onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

