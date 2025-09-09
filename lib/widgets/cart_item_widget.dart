import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/app_config.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 74,
            height: 84,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(item.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 163,
                  height: 30,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      height: 1.3, // increased line-height for more spacing between lines
                      letterSpacing: -0.24, // -2% of 12px = -0.24
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item.weight} ₹${item.price.toInt()}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                //const SizedBox(height: 8),
                
                // Quantity Controls
                Row(
                  children: [
                    Container(
                      width: 74,
                      height: 24,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppConfig.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: onDecrease,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                          Text(
                            '${item.quantity.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: onIncrease,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    //const Spacer(),
                    IconButton(
                      onPressed: onRemove,
                      icon: SvgPicture.asset(
                        'assets/images/delete.svg',
                        width: 14,
                        height: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Total Price
          Text(
            '₹${item.totalPrice.toInt()}',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              height: 1.0, // line-height: 100%
              letterSpacing: -0.28, // -2% of 14px = -0.28
              color: Colors.black87,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
