import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../config/app_config.dart';

import '../widgets/best_seller_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/bottom_banner.dart';
import '../widgets/info_banner.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> bannerImages = [
    'assets/images/banner1.png',
   // 'assets/images/banner2.jpg',
   // 'assets/images/banner3.jpg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppConfig.backgroundColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Primary color background container for header
                      Container(
                        width: double.infinity,
                        height: 110,
                        color: AppConfig.primaryColor,
                        child: Column(
                          children: [
                            // Status bar space
                            const SizedBox(height: 20),
                            // Top Address Bar
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                left: 16,
                                right: AppConfig.defaultPadding,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Deliver to Home",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Shalimar Bagh, Delhi NCR, 122022 ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                      size: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // Search Bar
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: AppConfig.defaultPadding,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Container(
                                width: 319,
                                height: 40,
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  right: 8,
                                  bottom: 4,
                                  left: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.search, color: Colors.grey[600], size: 18),
                                    const SizedBox(width: 8),
                                    Expanded(
                                                                                                                                                             child: TextField(
                                          decoration: InputDecoration(
                                            hintText: "Search for products",
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              height: 1.0, // line-height: 100%
                                              letterSpacing: -0.24, // -2% of 12px = -0.24
                                              color: Colors.grey[500],
                                            ),
                                            border: InputBorder.none,
                                            contentPadding: const EdgeInsets.symmetric(vertical: 12),
                                            isDense: true,
                                          ),
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),

                      _buildHeroBanner(),
                      const SizedBox(height: 24),
                      _buildBestSellersSection(),
                      const SizedBox(height: 24),
                      const InfoBanner(),
                      const SizedBox(height: 24),
                      const CategoriesSection(),
                      const SizedBox(height: 24),
                      const BottomBanner(),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Column(
      children: [
        Container(
          height: 168,
          child: CarouselSlider(
            options: CarouselOptions(
              height:168,
              viewportFraction: 1.0,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: bannerImages.map((String imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),

        // Dot indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerImages.asMap().entries.map((entry) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: _currentPage == entry.key ? 8 : 4,
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentPage == entry.key
                    ? Colors.grey
                    : Colors.grey.withOpacity(0.5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBestSellersSection() {
    return  BestSellerSection();
  }


}
