class CoffeeModel {
  final String name;
  final String subtitle;
  final double price;
  final String image;
  final double rating;
  final String description;
  final List<String> sizes;

  CoffeeModel({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    this.rating = 4.5,
    this.description = 'Delicious coffee to boost your day.',
    this.sizes = const ['S', 'M', 'L'],
  });
}
