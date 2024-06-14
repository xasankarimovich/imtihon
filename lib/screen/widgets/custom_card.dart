import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:imtihon/view_model/favorites_view_model.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isLiked1 = false;

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel =
        Provider.of<FavoritesViewModel>(context, listen: false);
    final course = Course(
      imageUrl: 'assets/lamborgini.png',
      title: 'Lamborgini 303',
      price: 493030220,
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 200, // Adjust the width as needed
                child: Image.asset(
                  'assets/lamborgini.png',
                  height: 120, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lamborgini 303',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  '4.6',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(
                  Icons.directions_car,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  '400 hp',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 20,
                ),
                SizedBox(width: 4),
                Text(
                  'Automatic',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '\$493.030.220',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isLiked1 = !isLiked1;
                  });
                  if (isLiked1) {
                    favoritesViewModel.addToFavorites(course);
                  } else {
                    favoritesViewModel.removeFromFavorites(course);
                  }
                },
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: isLiked1 ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
