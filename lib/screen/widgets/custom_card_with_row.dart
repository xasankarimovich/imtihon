import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/view_model/favorites_view_model.dart';
import 'package:provider/provider.dart';

class CustomCardWithRow extends StatefulWidget {
  const CustomCardWithRow({Key? key}) : super(key: key);

  @override
  State<CustomCardWithRow> createState() => _CustomCardWithRowState();
}

class _CustomCardWithRowState extends State<CustomCardWithRow> {
  bool isLiked2 = false;

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel =
        Provider.of<FavoritesViewModel>(context, listen: false);
    final course = Course(
      imageUrl: 'assets/lamborgini.png',
      title: 'Lamborgini 303',
      price: 493030220,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
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
                  width: 100, // Adjust the width as needed
                  child: Image.asset(
                    'assets/lamborgini.png',
                    height: 120, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lamborgini 303',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
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
                  Row(
                    children: [
                      const Text(
                        '\$493.030.220',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                        width: 60,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked2 = !isLiked2;
                              });
                              if (isLiked2) {
                                favoritesViewModel.addToFavorites(course);
                              } else {
                                favoritesViewModel.removeFromFavorites(course);
                              }
                            },
                            icon: Icon(
                              CupertinoIcons.heart_fill,
                              color: isLiked2 ? Colors.red : Colors.grey,
                            ),
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
      ),
    );
  }
}
