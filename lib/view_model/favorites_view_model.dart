import 'package:flutter/material.dart';

class Course {
  final String imageUrl;
  final String title;
  final int price;

  Course({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

class FavoritesViewModel with ChangeNotifier {
  final List<Course> _favorites = [];

  List<Course> get favorites => _favorites;

  void addToFavorites(Course course) {
    _favorites.add(course);
    notifyListeners();
  }

  void removeFromFavorites(Course course) {
    _favorites.remove(course);
    notifyListeners();
  }
}
