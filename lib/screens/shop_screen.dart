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
    // Auto-play functionality
    // _startAutoPlay(); // Removed auto-play
  }

  // void _startAutoPlay() { // Removed auto-play
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (mounted) {
  //       if (_currentPage < bannerImages.length - 1) {
  //         _pageController.nextPage(
  //           duration: const Duration(milliseconds: 800),
  //           curve: Curves.easeInOut,
  //         );
  //       } else {
  //         _pageController.animateToPage(
  //           0,
  //           duration: const Duration(milliseconds: 800),
  //           curve: Curves.easeInOut,
  //         );
  //       }
  //       _startAutoPlay();
  //     }
  //   });
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.primaryColor,
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Location and Search
          SliverAppBar(
            expandedHeight: 140,
            floating: false,
            pinned: true,
            backgroundColor: AppConfig.primaryColor,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppConfig.primaryColor,
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildLocationBar(),
                      const SizedBox(height: 16),
                      _buildSearchBar(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Main Content
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppConfig.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroBanner(),
                  const SizedBox(height: 24),
                  _buildBestSellersSection(),
                  const SizedBox(height: 24),
                  _buildInfoBanner(),
                  const SizedBox(height: 24),
                                      CategoriesSection(),
                  const SizedBox(height: 24),
                  const BottomBanner(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

    Widget _buildLocationBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Text(
            'Deliver to Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Shalimar Bagh, Delhi NCR, 122022',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: AppConfig.primaryColor,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[400],
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
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
                      borderRadius: BorderRadius.circular(16),
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
              width: _currentPage == entry.key ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentPage == entry.key
                    ? Color(0xFFF717680)
                    : Colors.grey.withOpacity(0.5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBestSellersSection() {
    return BestSellerSection();
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 16),
      decoration: BoxDecoration(
        color: AppConfig.primaryColor,
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
                fontWeight: FontWeight.w700, // Bold
                fontSize: 12,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.24, // -2% of 12px ≈ -0.24
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
