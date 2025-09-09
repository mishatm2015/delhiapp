import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../models/delivery_slot.dart';

class DeliverySlotWidget extends StatelessWidget {
  final DeliverySlot slot;
  final VoidCallback onTap;

  const DeliverySlotWidget({
    super.key,
    required this.slot,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55,
        height: 66,
        margin: const EdgeInsets.only(left: 16, right: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: slot.isSelected ? AppConfig.primaryColor : Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: slot.isSelected ? AppConfig.primaryColor.withOpacity(0.1) : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // For "Today" slot, show "Today" on top, otherwise show month
            if (slot.day == 'Today') ...[
              Text(
                'Today',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 8,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.16, // -2% of 8px = -0.16
                  color: slot.isSelected ? AppConfig.primaryColor : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                '9',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.28, // -2% of 14px = -0.28
                  color: slot.isSelected ? AppConfig.primaryColor : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                slot.date, // AUG
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.20, // -2% of 10px = -0.20
                  color: slot.isSelected ? AppConfig.primaryColor : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ] else ...[
              // For other slots, show month on top and day below


              Text(
                slot.day, // 01, 02, 03, etc.
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.28, // -2% of 14px = -0.28
                  color: slot.isSelected ? AppConfig.primaryColor : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                slot.date, // SEP, SEP, etc.
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.20, // -2% of 10px = -0.20
                  color: slot.isSelected ? AppConfig.primaryColor : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class TimeSlotWidget extends StatelessWidget {
  final String timeRange;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotWidget({
    super.key,
    required this.timeRange,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84,height: 40,
       
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppConfig.primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppConfig.primaryColor.withOpacity(0.1) : Colors.white,
        ),
        child: Center(
          child: Text(
            timeRange,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              height: 1.0, // line-height: 100%
              letterSpacing: -0.28, // -2% of 14px = -0.28
              color: isSelected ? AppConfig.primaryColor : Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
