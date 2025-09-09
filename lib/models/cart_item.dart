class CartItem {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String weight;
  int quantity;
  final double originalPrice; // For showing strikethrough prices

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.weight,
    this.quantity = 1,
    this.originalPrice = 0,
  });

  double get totalPrice => price * quantity;
  bool get hasDiscount => originalPrice > price;
}

class AddOnItem {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String weight;
  final double originalPrice;

  AddOnItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.weight,
    this.originalPrice = 0,
  });

  bool get hasDiscount => originalPrice > price;
}
