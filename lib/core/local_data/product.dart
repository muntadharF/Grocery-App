class Product {
  final String img;
  final String title;
  final double price;
  final double review;
  final String? weight;
  final String? volume;
  final String description;

  Product({
    required this.img,
    required this.title,
    required this.price,
    required this.review,
    this.weight,
    this.volume,
    required this.description,
  });
}
