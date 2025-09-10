class Product {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final String quantity;
  final double price;
  final double? originalPrice;
  final String category;
  final bool isBestseller;
  final bool isAvailable;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.quantity,
    required this.price,
    this.originalPrice,
    required this.category,
    this.isBestseller = false,
    this.isAvailable = true,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      quantity: json['quantity'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null 
          ? (json['originalPrice'] as num).toDouble() 
          : null,
      category: json['category'] as String,
      isBestseller: json['isBestseller'] as bool? ?? false,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'quantity': quantity,
      'price': price,
      'originalPrice': originalPrice,
      'category': category,
      'isBestseller': isBestseller,
      'isAvailable': isAvailable,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? imagePath,
    String? quantity,
    double? price,
    double? originalPrice,
    String? category,
    bool? isBestseller,
    bool? isAvailable,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      category: category ?? this.category,
      isBestseller: isBestseller ?? this.isBestseller,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
