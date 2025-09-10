class Category {
  final String id;
  final String name;
  final String imagePath;
  final bool isSelected;
  final int productCount;

  const Category({
    required this.id,
    required this.name,
    required this.imagePath,
    this.isSelected = false,
    this.productCount = 0,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
      productCount: json['productCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'isSelected': isSelected,
      'productCount': productCount,
    };
  }

  Category copyWith({
    String? id,
    String? name,
    String? imagePath,
    bool? isSelected,
    int? productCount,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      isSelected: isSelected ?? this.isSelected,
      productCount: productCount ?? this.productCount,
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
