import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BottomBanner extends StatefulWidget {
  const BottomBanner({super.key});

  @override
  State<BottomBanner> createState() => _BottomBannerState();
}

class _BottomBannerState extends State<BottomBanner> {
  int _currentPage = 0;
  
  final List<String> bannerImages = [
    'assets/images/bottombanner.png',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 170,
      child: Column(
        children: [
          // Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: 160,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: bannerImages.map((imagePath) {
              return Container(
                width: 375,
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: 375,
                    height: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 375,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[600],
                          size: 48,
                        ),
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          ),
          
          // Dot indicators
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerImages.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 8,
                width: _currentPage == entry.key ? 24 : 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentPage == entry.key 
                    ? const Color(0xFFF717680) 
                    : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
