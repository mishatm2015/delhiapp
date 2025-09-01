import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../config/app_config.dart';
import '../widgets/product_card.dart';
import '../widgets/category_card.dart';
import '../widgets/best_seller_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/bottom_banner.dart';

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
                        width: 375,
                        height: 160,
                        color: AppConfig.primaryColor,
                        child: Column(
                          children: [
                            // Top Address Bar
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 52,
                                left: AppConfig.defaultPadding,
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
                                  Expanded(
                                    child: Text(
                                      "Shalimar Bagh, Delhi NCR, 122022",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
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
                                      size: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // Search Bar
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConfig.defaultPadding,
                                vertical: 8,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                                child: Row(
                                  children: [
                                    Icon(Icons.search, color: Colors.grey[600], size: 20),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Search for products",
                                          hintStyle: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 14,
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      _buildHeroBanner(),
                      const SizedBox(height: 24),
                      _buildBestSellersSection(),
                      const SizedBox(height: 24),
                      _buildInfoBanner(),
                      const SizedBox(height: 24),
                      const CategoriesSection(),
                      const SizedBox(height: 24),
                      const BottomBanner(),
                      const SizedBox(height: 24),
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
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200,
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
        const SizedBox(height: 16),
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

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 16),
      decoration: BoxDecoration(
        color: AppConfig.primaryColor,
       // borderRadius: BorderRadius.circular(AppConfig.defaultRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 14,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'Delivering authentic South Indian taste in Delhi NCR.',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.0,
                letterSpacing: -0.24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
