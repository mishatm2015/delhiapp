import 'package:flutter/material.dart';
import '../config/app_config.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Shop by category',
              style: TextStyle(
                fontFamily: 'Fjalla One',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.32, // -2% of 16px = -0.32
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
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
                'Vacuum Fried Products',
                'assets/images/murukk.png',
                Colors.green,
              ),
              _buildCategoryCard(
                'Exotic Cakes',
                'assets/images/soap.png',
                AppConfig.secondaryColor,
              ),
              _buildCategoryCard(
                'Healthy Snacking',
                'assets/images/mixture.png',
                Colors.green,
              ),
              _buildCategoryCard(
                'Kerala Savouries',
                'assets/images/chips.png',
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
                'Vacuum Fried Products',
                'assets/images/murukk.png',
                Colors.green,
              ),
              _buildCategoryCard(
                'Exotic Cakes',
                'assets/images/soap.png',
                AppConfig.secondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String name, String imagePath, Color color) {
    return Container(
      width: 70,
      height: 82,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.1),
      //       blurRadius: 5,
      //       offset: const Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: Column(
        children: [
          // Image container
          SizedBox(
            width: 70,
            height: 50,
            child: Stack(
              children: [
                // Colored background container positioned at top: 22px
                Positioned(
                  top: 22,
                  left: 0,
                  child: Transform.rotate(
                    angle: -180 * 3.14159 / 180, // Convert -180 degrees to radians
                    child: Container(
                      width: 74,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                // Image positioned at top: 2px, left: 11px
                Positioned(
                  top: 2,
                  left: 11,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 24,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Category name below the card
          SizedBox(
            width: 70,
            height: 32,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700, // Bold
                  fontStyle: FontStyle.normal,
                  fontSize: 8,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.16, // -2% of 8px = -0.16
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
