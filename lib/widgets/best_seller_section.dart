import 'package:flutter/material.dart';
import '../config/app_config.dart';

class BestSellerSection extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/cocunut.jpg",
      "name": "Extra Virgin Coconut Oil",
      "quantity": "100ml",
      "rating": 3.8,
      "price": 240,
      "oldPrice": null,
      "isPreOrder": false,
    },
    {
      "image": "assets/images/candy.png",
      "name": "Coconut Jaggery Candy",
      "quantity": "500g",
      "rating": 4.1,
      "price": 145,
      "oldPrice": 150,
      "isPreOrder": true,
    },
    {
      "image": "assets/images/candy.png",
      "name": "Extra Virgin Coconut Oil",
      "quantity": "500g",
      "rating": 4.1,
      "price": 145,
      "isPreOrder": false,
    },
  ];

  BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length + 1, // +1 for the banner
        itemBuilder: (context, index) {
          // First item is the banner
          if (index == 0) {
            return Container(
              width: 106,
              height: 200,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConfig.defaultRadius),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConfig.defaultRadius),
                child: Image.asset(
                  "assets/images/bestseller.png",
                  width: 106,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 106,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(AppConfig.defaultRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[600],
                            size: 32,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Banner not available',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
          
          // Other items are products
          var product = products[index - 1];
          return Container(
            width: 106,
            height: 200,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppConfig.defaultRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image with Overlays
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product["image"],
                        height: 121,
                        width: 106,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 121,
                            width: 106,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey[600],
                                  size: 32,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Image not found',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Pre-order badge or Add button (top-right)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: product["isPreOrder"] == true
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppConfig.primaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Pre-order',
                                style: TextStyle(
                                  color: AppConfig.primaryColor,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppConfig.primaryColor, width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppConfig.primaryColor,
                                size: 14,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Product Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    product["name"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Rating
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        product["quantity"],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product["rating"].toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: product["rating"] >= 4 ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: product["rating"] >= 4 ? Colors.green : Colors.orange,
                        size: 14,
                      ),
                      const SizedBox(width: 2),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        "₹${product["price"]}",
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          height: 1.0,
                          letterSpacing: -0.28,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 6),
                      if (product["oldPrice"] != null)
                        Text(
                          "₹${product["oldPrice"]}",
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            height: 1.0,
                            letterSpacing: -0.2,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 1.2,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
