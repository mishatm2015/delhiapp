import 'package:flutter/material.dart';
import '../config/app_config.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 102,
          height: 20,
          child: const Text(
            'Shop by category',
            style: TextStyle(
              fontFamily: 'Fjalla One',
              fontWeight: FontWeight.w400, // Regular
              fontSize: 16,
              height: 1.0, // line-height: 100%
              letterSpacing: -0.32, // -2% of 16px ≈ -0.32
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
          children: [
            _buildCategoryCard(
              'Kerala Banana Chips',
              'assets/images/bananachips.png',
              AppConfig.accentColor,
            ),
            _buildCategoryCard(
              'Pickles',
              'assets/images/pickle.png',
              Colors.blue,
            ),
            _buildCategoryCard(
              'Vaccuum Fried Products',
              'assets/images/murukk.png',
              Colors.green,
            ),
            _buildCategoryCard(
              'Exotic Cakes',
              'assets/images/soap.png',
              AppConfig.secondaryColor,
            ),
            _buildCategoryCard(
              'Healthy Snacking Options',
              'assets/images/mixture.png',
              Colors.green,
            ),
            _buildCategoryCard(
              'Kerala Special Savouries',
              'assets/images/savouries.png',
              AppConfig.secondaryColor,
            ),
            _buildCategoryCard(
              'Jams',
              'assets/images/jam.png',
              Colors.blue,
            ),
            _buildCategoryCard(
              'Chutney Powders',
              'assets/images/chutney.png',
              AppConfig.accentColor,
            ),
            _buildCategoryCard(
              'Healthy Snacking Options',
              'assets/images/mixture.png',
              Colors.green,
            ),
            _buildCategoryCard(
              'Kerala Special Savouries',
              'assets/images/savouries.png',
              AppConfig.secondaryColor,
            ),
            _buildCategoryCard(
              'Jams',
              'assets/images/jam.png',
              Colors.blue,
            ),
            _buildCategoryCard(
              'Chutney Powders',
              'assets/images/chutney.png',
              AppConfig.accentColor,
            ),

          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String name, String imagePath, Color color) {
    return Container(
      width: 74,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image container
          Container(
            width: 74,
            height: 78,
            child: Stack(
              children: [
                // Image positioned at top: 0px, left: 13px
                Positioned(
                  top: 0,
                  left: 13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      width: 48,
                      height: 78,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[600],
                            size: 24,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Colored container positioned at top: 22px
                Positioned(
                  top: 22,
                  left: 0,
                  child: Container(
                    width: 74,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Category name below the card
          Container(
            width: 74,
            height: 30,
            padding: const EdgeInsets.only(top: 4),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700, // Bold
                  fontSize: 10,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.16, // -2% of 8px ≈ -0.16
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
