import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_config.dart';
import '../models/cart_item.dart';
import '../models/delivery_slot.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/add_on_item_widget.dart';
import '../widgets/delivery_slot_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: 'Kerala Banana Chips Chips chip...',
      description: 'Coconut with Jaggery Candy',
      imagePath: 'assets/images/candy.png',
      price: 145,
      weight: '500g',
      quantity: 1,
    ),
    CartItem(
      id: '2',
      name: 'Kerala Banana Chips Chips chip...',
      description: 'Coconut with Jaggery Candy',
      imagePath: 'assets/images/candy.png',
      price: 145,
      weight: '500g',
      quantity: 1,
    ),
  ];

  List<AddOnItem> addOnItems = [
    AddOnItem(
      id: '1',
      name: 'Kerala Banana Chips Chips chip...',
      description: 'Coconut with Jaggery Candy',
      imagePath: 'assets/images/bread.png',
      price: 145,
      weight: '500g',
      originalPrice: 150,
    ),
    AddOnItem(
      id: '2',
      name: 'Extra Virgin Coconut Oil',
      description: 'Pure coconut oil',
      imagePath: 'assets/images/cocunut.jpg',
      price: 240,
      weight: '100ml',
    ),
    AddOnItem(
      id: '3',
      name: 'Kerala Banana Chips Chips chip...',
      description: 'Coconut with Jaggery Candy',
      imagePath: 'assets/images/bread.png',
      price: 145,
      weight: '500g',
      originalPrice: 150,
    ),
    AddOnItem(
      id: '4',
      name: 'Ker Chi',
      description: 'Coconut with Jaggery Candy',
      imagePath: 'assets/images/bananachips.png',
      price: 14,
      weight: '500g',
    ),
  ];

  List<DeliverySlot> dateSlots = [
    DeliverySlot(id: '1', date: 'AUG', day: 'Today', timeRange: ''),
    DeliverySlot(id: '2', date: 'SEP', day: '01', timeRange: ''),
    DeliverySlot(id: '3', date: 'SEP', day: '02', timeRange: ''),
    DeliverySlot(id: '4', date: 'SEP', day: '03', timeRange: ''),
    DeliverySlot(id: '5', date: 'SEP', day: '04', timeRange: ''),
    DeliverySlot(id: '6', date: 'SEP', day: '05', timeRange: ''),
  ];

  List<String> timeSlots = ['1 to 3 pm', '5 to 8 pm'];
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  double get deliveryCharges => 200;
  double get total => subtotal + deliveryCharges;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/circle_left_arrow.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
          ),
        ),
        title: Container(
          width: 133,
          height: 20,
          child: Text(
            'Your cart',
            style: GoogleFonts.fjallaOne(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.0, // line-height: 100%
              letterSpacing: -0.32, // -2% of 16px = -0.32
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDeliveryAddress(),
                  const SizedBox(height: 14),
                  _buildCartItems(),
                 // const SizedBox(height: 24),
                  _buildSubtotal(),
                  const SizedBox(height: 24),
                  _buildLastMinutePurchases(),
                  const SizedBox(height: 24),
                  _buildDeliverySlots(),
                  const SizedBox(height: 24),
                  _buildQuickerDeliveryPromotion(),
                  const SizedBox(height: 20),
                  _buildBottomButton(),// Reduced space for bottom button
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Container(
      width: 375,
      height: 72,
      decoration: BoxDecoration(
        color: AppConfig.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SvgPicture.asset(
                  'assets/images/location.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: const Text(
                  'Deliver to',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    height: 1.0, // line-height: 100%
                    letterSpacing: -0.28, // -2% of 14px = -0.28
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(width: 24), // Space for location icon
              Expanded(
                child: const Text(
                  '#108, Shalimar Bagh, Delhi NCR, 122022',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/images/vector1.svg',
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PRODUCT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              'TOTAL',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...cartItems.map((item) => CartItemWidget(
          item: item,
          onRemove: () => _removeItem(item),
          onDecrease: () => _decreaseQuantity(item),
          onIncrease: () => _increaseQuantity(item),
        )),
        ],
      ),
    );
  }

  Widget _buildSubtotal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: GoogleFonts.fjallaOne(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.32, // -2% of 16px = -0.32
                color: Colors.black87,
              ),
            ),
            Text(
              '₹${subtotal.toInt()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(), // Empty space on the left
            const Text(
              '+₹200 delivery charges apply',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 10,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.20, // -2% of 10px = -0.20
                color: Colors.grey,
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }

  Widget _buildLastMinutePurchases() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Last minute purchases',
            style: GoogleFonts.fjallaOne(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.0, // line-height: 100%
              letterSpacing: -0.32, // -2% of 16px = -0.32
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: const Text(
            'Add any of the products to lower your delivery fees',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 212,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: addOnItems.length,
            itemBuilder: (context, index) {
              return AddOnItemWidget(
                item: addOnItems[index],
                onAdd: () => _addToCart(addOnItems[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDeliverySlots() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          'Select delivery slot',
          style: GoogleFonts.fjallaOne(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.0, // line-height: 100%
            letterSpacing: -0.32, // -2% of 16px = -0.32
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        // Date Selection
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dateSlots.length,
            itemBuilder: (context, index) {
              return DeliverySlotWidget(
                slot: dateSlots[index].copyWith(
                  isSelected: selectedDateIndex == index,
                ),
                onTap: () => setState(() => selectedDateIndex = index),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        
        // Time Selection
        const Text(
          'What time do you want the delivery?',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 12,
            height: 1.0, // line-height: 100%
            letterSpacing: -0.24, // -2% of 12px = -0.24
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: timeSlots.asMap().entries.map((entry) {
            int index = entry.key;
            String timeSlot = entry.value;
            return TimeSlotWidget(
              timeRange: timeSlot,
              isSelected: selectedTimeIndex == index,
              onTap: () => setState(() => selectedTimeIndex = index),
            );
          }).toList(),
        ),
        ],
      ),
    );
  }

  Widget _buildQuickerDeliveryPromotion() {
    return Container(
      width: 327,
      height: 136,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppConfig.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                  const Text(
                    'Want quicker delivery? ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 10,
                      height: 1.0, // line-height: 100%
                      letterSpacing: -0.20, // -2% of 10px = -0.20
                      color: AppConfig.primaryColor,
                    ),
                  ),
                const SizedBox(height: 10),
                Text(
                  ' Shop for ₹3500 or more and avail our faster delivery service',
                  style: GoogleFonts.fjallaOne(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.0, // line-height: 100%
                    letterSpacing: -0.24, // -2% of 12px = -0.24
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 76,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppConfig.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      minimumSize: Size.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Chat with us',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        height: 1.0, // line-height: 100%
                        letterSpacing: -0.20, // -2% of 10px = -0.20
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Container(
            width: 156,
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/delivery.jpg',
                width: 156,
                height: 136,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.1),
      //       blurRadius: 10,
      //       offset: const Offset(0, -5),
      //     ),
      //   ],
      // ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConfig.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Continue to pay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _removeItem(CartItem item) {
    setState(() {
      cartItems.removeWhere((cartItem) => cartItem.id == item.id);
    });
  }

  void _decreaseQuantity(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        cartItems.removeWhere((cartItem) => cartItem.id == item.id);
      }
    });
  }

  void _increaseQuantity(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void _addToCart(AddOnItem addOnItem) {
    setState(() {
      final existingItem = cartItems.firstWhere(
        (item) => item.id == addOnItem.id,
        orElse: () => CartItem(
          id: addOnItem.id,
          name: addOnItem.name,
          description: addOnItem.description,
          imagePath: addOnItem.imagePath,
          price: addOnItem.price,
          weight: addOnItem.weight,
          originalPrice: addOnItem.originalPrice,
        ),
      );
      
      if (cartItems.contains(existingItem)) {
        existingItem.quantity++;
      } else {
        cartItems.add(existingItem);
      }
    });
  }
}

