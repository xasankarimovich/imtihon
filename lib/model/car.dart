class Car {
  String title;
  double price;
  double rate;
  bool isFavorite;
  int speed;
  bool isAutomatic;

  Car({
    required this.title,
    required this.price,
    required this.rate,
    required this.isFavorite,
    required this.speed,
    required this.isAutomatic,
  });

  
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  @override
  String toString() {
    return 'Car{title: $title, price: $price, rate: $rate, isFavorite: $isFavorite, speed: $speed, isAutomatic: $isAutomatic}';
  }
}
