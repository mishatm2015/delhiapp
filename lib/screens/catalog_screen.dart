import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/app_config.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Category> _categories = [];
  List<Product> _products = [];
  String _selectedCategoryId = '';

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    _categories = [
      const Category(
        id: 'bestsellers',
        name: 'Bestsellers',
        imagePath: 'assets/images/bananachips.png',
        isSelected: true,
        productCount: 12,
      ),
      const Category(
        id: 'kerala-banana-chips-1',
        name: 'Kerala Banana Chips',
        imagePath: 'assets/images/bread.png',
        productCount: 8,
      ),
      const Category(
        id: 'kerala-banana-chips-2',
        name: 'Kerala Banana Chips',
        imagePath: 'assets/images/jam.png',
        productCount: 6,
      ),
      const Category(
        id: 'kerala-banana-chips-3',
        name: 'Kerala Banana Chips',
        imagePath: 'assets/images/mixture.png',
        productCount: 4,
      ),
      const Category(
        id: 'kerala-banana-chips-4',
        name: 'Kerala Banana Chips',
        imagePath: 'assets/images/murukk.png',
        productCount: 3,
      ),
      const Category(
        id: 'kerala-banana-chips-5',
        name: 'Kerala Banana Chips',
        imagePath: 'assets/images/pickle.png',
        productCount: 5,
      ),
      const Category(
        id: 'kerala-banana-chips-6',
        name: 'Kerala Banana Chips',
        imagePath: 'assets/images/soap.png',
        productCount: 7,
      ),
    ];

    _products = [
      const Product(
        id: '1',
        name: 'Kerala Banana Chips Chips chip...',
        description: 'Crispy and delicious banana chips',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '2',
        name: 'Extra Virgin Coconut Oil',
        description: 'Pure coconut oil for cooking',
        imagePath: 'assets/images/cocunut.jpg',
        quantity: '100ml',
        price: 240.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '3',
        name: 'Extra Virgin Coconut Oil',
        description: 'Pure coconut oil for cooking',
        imagePath: 'assets/images/cocunut.jpg',
        quantity: '100ml',
        price: 240.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '4',
        name: 'Kerala Banana Chips Chips chip...',
        description: 'Crispy and delicious banana chips',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '5',
        name: 'Kerala Banana Chips Chips chip...',
        description: 'Crispy and delicious banana chips',
        imagePath: 'assets/images/bananachips.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '6',
        name: 'Extra Virgin Coconut Oil',
        description: 'Pure coconut oil for cooking',
        imagePath: 'assets/images/cocunut.jpg',
        quantity: '100ml',
        price: 240.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
    ];

    _selectedCategoryId = _categories.first.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 1),
          child: Container(
            width: 138,
            height: 20,
            child: Text(
              'Catalog of our products',
              style: GoogleFonts.fjallaOne(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.0,
                letterSpacing: -0.32,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/searchicon.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.black87,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Sidebar - Categories
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            color: Colors.white,
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return _buildCategoryItem(category);
              },
            ),
          ),
          // Right Side - Products Grid
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55, // 106/192 = 0.55
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return _buildProductCard(product);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                category.imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image,
                    color: Colors.grey[400],
                    size: 20,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: 64,
            height: 22,
            child: Text(
              category.name,
              style: GoogleFonts.inter(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: category.isSelected 
                    ? AppConfig.primaryColor 
                    : Colors.grey,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      width: 106,
      height: 192,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 106,
            height: 121,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
             // color: Colors.grey[100],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    product.imagePath,
                    width: 106,
                    height: 121,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.image,
                          color: Colors.grey[400],
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                // Add to cart button
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppConfig.primaryColor, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppConfig.primaryColor,
                        size: 12,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //const SizedBox(height: 4),
          // Product Details
          Expanded(
            child: Container(
              width: 106,height: 67,
              //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.0, // line-height: 100%
                          letterSpacing: -0.24, // -2% of 12px
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        product.quantity,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1.0, // line-height: 100%
                          letterSpacing: -0.24, // -2% of 12px
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),const SizedBox(height: 1),
                  Row(
                    children: [
                      Text(
                        '₹${product.price.toInt()}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      if (product.originalPrice != null) ...[
                        const SizedBox(width: 4),
                        Text(
                          '₹${product.originalPrice!.toInt()}',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}