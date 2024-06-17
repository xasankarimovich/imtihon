import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class TabBoxScreen extends StatelessWidget {
  const TabBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ConvexAppBar(
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
      TabItem(icon: Icons.map, title: 'Discovery'),
      TabItem(icon: Icons.add, title: 'Add'),
      TabItem(icon: Icons.message, title: 'Message'),
      TabItem(icon: Icons.people, title: 'Profile'),
      ],
      // ignore: avoid_print
      onTap: (int i) => print('click index=$i'),
    );
  }
}
