import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../models/cart_item.dart';

class AddOnItemWidget extends StatelessWidget {
  final AddOnItem item;
  final VoidCallback onAdd;

  const AddOnItemWidget({
    super.key,
    required this.item,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 192,
      margin: const EdgeInsets.only(top: 10, left: 16, right: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with Add Button
          Stack(
            children: [
              Container(
                width: 106,
                height: 121,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 82,
                child: GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppConfig.primaryColor,
                        width: 0.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppConfig.primaryColor,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Product Name
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          
          // Weight
          Text(
            item.weight,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          
          // Price
          Row(
            children: [
              Text(
                '₹${item.price.toInt()}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.28, // -2% of 14px = -0.28
                  color: Colors.black87,
                ),
              ),
              if (item.hasDiscount) ...[
                const SizedBox(width: 4),
                Text(
                  '₹${item.originalPrice.toInt()}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
