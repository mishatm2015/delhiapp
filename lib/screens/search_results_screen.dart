import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/app_config.dart';
import '../models/product_model.dart';

class SearchResultsScreen extends StatefulWidget {
  final String searchQuery;
  
  const SearchResultsScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<Product> _searchResults = [];
  List<Product> _recommendedProducts = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    // Search results based on query
    _searchResults = [
      const Product(
        id: '1',
        name: 'Kerala Banana Chips salt',
        description: 'Crispy and delicious banana chips with salt',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '2',
        name: 'Kerala Banana Chips masala',
        description: 'Crispy and delicious banana chips with masala',
        imagePath: 'assets/images/cocunut.jpg',
        quantity: '500g',
        price: 240.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '3',
        name: 'Kerala Banana Chips pudina',
        description: 'Crispy and delicious banana chips with pudina',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '4',
        name: 'Kerala Banana Chips salt',
        description: 'Crispy and delicious banana chips with salt',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '5',
        name: 'Kerala Banana Chips masala',
        description: 'Crispy and delicious banana chips with masala',
        imagePath: 'assets/images/cocunut.jpg',
        quantity: '500g',
        price: 240.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '6',
        name: 'Kerala Banana Chips pudina',
        description: 'Crispy and delicious banana chips with pudina',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
    ];

    // Recommended products
    _recommendedProducts = [
      const Product(
        id: '7',
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
        id: '10',
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
        id: '8',
        name: 'Extra Virgin Coconut Oil',
        description: 'Pure coconut oil for cooking',
        imagePath: 'assets/images/cocunut.jpg',
        quantity: '100ml',
        price: 240.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
      const Product(
        id: '9',
        name: 'Kerala Banana Chips Chips chip...',
        description: 'Crispy and delicious banana chips',
        imagePath: 'assets/images/bread.png',
        quantity: '500g',
        price: 145.0,
        originalPrice: 150.0,
        category: 'bestsellers',
        isBestseller: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,width: 343,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 16),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: widget.searchQuery),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only( right: 8,bottom: 12),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.0, // line-height: 100%
                            letterSpacing: -0.24, // -2% of 12px
                            color: Colors.black87,
                          ),
                          autofocus: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search results section
              Container(
                width: 85,
                height: 20,
                child: Text(
                  'Search results',
                  style: GoogleFonts.fjallaOne(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.0, // line-height: 100%
                    letterSpacing: -0.32, // -2% of 16px
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildSearchResultsGrid(_searchResults),
              const SizedBox(height: 32),
               // You might also like section
               Container(
                 width: 111,
                 height: 20,
                 child: Text(
                   'You might also like',
                   style: GoogleFonts.fjallaOne(
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                     height: 1.0, // line-height: 100%
                     letterSpacing: -0.32, // -2% of 16px
                     color: Colors.black87,
                   ),
                 ),
               ),
              const SizedBox(height: 16),
              Container(
                width: 375,
                height: 220,
                child: _buildProductGrid(_recommendedProducts),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResultsGrid(List<Product> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.54,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.54, // 106/192 = 0.55 (same as catalog)
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      width: 106,
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 106,
            height: 121,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
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
          const SizedBox(height: 4),
          // Product Details
          Expanded(
            child: Container(
              width: 106,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      const SizedBox(height: 2),
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
                  ),
                  Row(
                    children: [
                      Text(
                        '₹${product.price.toInt()}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
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
