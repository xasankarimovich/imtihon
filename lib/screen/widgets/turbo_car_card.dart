import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/view_model/favorites_view_model.dart';
import 'package:provider/provider.dart';

class TurbCarCard extends StatefulWidget {
  const TurbCarCard({Key? key}) : super(key: key);

  @override
  State<TurbCarCard> createState() => _TurbCarCardState();
}

class _TurbCarCardState extends State<TurbCarCard> {
  bool isLiked1 = false;
  bool isLiked2 = false;
  bool isLiked3 = false;

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel = Provider.of<FavoritesViewModel>(context, listen: false);
    
    final courses = [
      Course(
        imageUrl: 'assets/classic_car.png',
        title: '1979 Pontiac Firebird Trans Am',
        price: 32900,
      ),
      Course(
        imageUrl: 'assets/ford_bronko.png',
        title: '1979 Ford Bronko',
        price: 32900,
      ),
      Course(
        imageUrl: 'assets/Chrysler.png',
        title: '1955 Chrysler',
        price: 18500,
      ),
    ];

    final List<bool> isLikedList = [isLiked1, isLiked2, isLiked3];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(courses.length, (index) {
            return CarCard(
              course: courses[index],
              isLiked: isLikedList[index],
              onLikeToggle: () {
                setState(() {
                  isLikedList[index] = !isLikedList[index];
                });
                if (isLikedList[index]) {
                  favoritesViewModel.addToFavorites(courses[index]);
                } else {
                  favoritesViewModel.removeFromFavorites(courses[index]);
                }
              },
            );
          }),
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final Course course;
  final bool isLiked;
  final VoidCallback onLikeToggle;

  const CarCard({
    required this.course,
    required this.isLiked,
    required this.onLikeToggle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 100,
                child: Image.asset(
                  course.imageUrl,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '3.9',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.directions_car,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '400 hp',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Hand',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${course.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        onPressed: onLikeToggle,
                        icon: Icon(
                          CupertinoIcons.heart_fill,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}