import 'package:flutter/material.dart';

class BestSellerSection extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/coconut.jpg",
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
      height: 220, // height of section
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length + 1, // +1 for the banner
        itemBuilder: (context, index) {
          // First item is the banner
          if (index == 0) {
            return Container(
              width: 106,
              height: 200,
              margin: const EdgeInsets.only(left: 8, right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage("assets/images/bestseller.png"),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
          
          // Other items are products
          var product = products[index - 1];
          return Container(
            width: 106,
            height: 200,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Product Image with Overlays
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product["image"],
                        height: 121,
                        width: 106,
                        fit: BoxFit.cover,
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
                                border: Border.all(color: Colors.purple, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Pre-order',
                                style: TextStyle(
                                  color: Colors.purple,
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
                                border: Border.all(color: Colors.purple, width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.purple,
                                size: 14,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // ✅ Product Name
                Text(
                  product["name"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),

                // ✅ Rating
                Row(
                  children: [
                    Text(
                      product["quantity"],
                      style: const TextStyle(
                          fontSize: 12, color: Colors.grey),
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

                // ✅ Price
                Row(
                  children: [
                    Text(
                      "₹${product["price"]}",
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700, // Bold
                        fontSize: 14,
                        height: 1.0,                 // line-height: 100%
                        letterSpacing: -0.28,        // -2% of 14px ≈ -0.28
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 6),
                    if (product["oldPrice"] != null)
                      Text(
                        "₹${product["oldPrice"]}",
                        style: const TextStyle(
                          fontFamily: "Inter",                // ✅ Inter font
                          fontWeight: FontWeight.w500,        // ✅ Medium (500)
                          fontSize: 10,                       // ✅ 10px
                          height: 1.0,                        // ✅ line-height: 100%
                          letterSpacing: -0.2,                // ✅ -2% of 10px ≈ -0.2
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough, // ✅ strikethrough
                          decorationThickness: 1.2,           // optional: thickness of line
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
