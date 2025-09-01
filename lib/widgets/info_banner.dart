import 'package:flutter/material.dart';
import '../config/app_config.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
