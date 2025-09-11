import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_config.dart';
import '../models/user_model.dart';
import '../models/address_model.dart';
import '../models/order_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Mock data - in a real app, this would come from a service
  late User _user;
  late List<Order> _orders;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    final now = DateTime.now();
    _user = User(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '99999999999',
      createdAt: now,
      addresses: [
        Address(
          id: '1',
          title: 'Address 1',
          fullAddress: 'Flat 123, Orchid Groove, Shalimar Bagh, Delhi NCR, 122022',
          city: 'Delhi',
          state: 'Delhi NCR',
          pincode: '122022',
          createdAt: now,
        ),
        Address(
          id: '2',
          title: 'Address 2',
          fullAddress: '#12, Begum Mahal, Some random street, Delhi NCR, 122022',
          city: 'Delhi',
          state: 'Delhi NCR',
          pincode: '122022',
          createdAt: now,
        ),
      ],
    );

    _orders = [
      Order(
        id: '1',
        orderNumber: '12344',
        itemCount: 4,
        totalAmount: 490.0,
        status: OrderStatus.enroute,
        orderDate: DateTime.now().subtract(const Duration(days: 1)),
        items: ['Dosa', 'Idli', 'Sambar', 'Chutney'],
      ),
      Order(
        id: '2',
        orderNumber: '12121',
        itemCount: 4,
        totalAmount: 490.0,
        status: OrderStatus.delivered,
        orderDate: DateTime.now().subtract(const Duration(days: 3)),
        deliveryDate: DateTime.now().subtract(const Duration(days: 2)),
        items: ['Dosa', 'Idli', 'Sambar', 'Chutney'],
      ),
      Order(
        id: '3',
        orderNumber: '12121',
        itemCount: 4,
        totalAmount: 490.0,
        status: OrderStatus.cancelled,
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
        items: ['Dosa', 'Idli', 'Sambar', 'Chutney'],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your profile',
              style: GoogleFonts.fjallaOne(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.32, // -2% of 16px
                color: Colors.black87,
              ),
            ),
          IconButton(
               icon: const Icon(Icons.more_horiz, color: Colors.black87),
            onPressed: () {},
               padding: EdgeInsets.zero,
               constraints: const BoxConstraints(),
          ),
        ],
      ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildSavedAddressesSection(),
            const SizedBox(height: 24),
            _buildOrdersSection(),
            const SizedBox(height: 24),
            _buildHelpSupportSection(),
            _buildMarketingFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            _user.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _user.phoneNumber,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedAddressesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Saved addresses',
                style: GoogleFonts.fjallaOne(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.0, // line-height: 100%
                  letterSpacing: -0.32, // -2% of 16px
                  color: Colors.black87,
                ),
              ),
          Container(
                width: 66,
                height: 20,
            decoration: BoxDecoration(
                  border: Border.all(color: AppConfig.primaryColor, width: 0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextButton(
                  onPressed: _addNewAddress,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: AppConfig.primaryColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    '+ Add new',
              style: TextStyle(
                      color: AppConfig.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      height: 1.0,
                      letterSpacing: -0.20,
                    ),
                    textAlign: TextAlign.center,
              ),
            ),
          ),
            ],
          ),
          const SizedBox(height: 12),
          ..._user.addresses.map((address) => _buildAddressCard(address)),
        ],
      ),
    );
  }

  Widget _buildAddressCard(Address address) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      //padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
       // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 10,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address.fullAddress,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _deleteAddress(address),
            icon: const Icon(
              Icons.delete_outline,
              color: AppConfig.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'Your orders',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ..._orders.map((order) => _buildOrderCard(order)),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    Color statusColor;
    switch (order.status) {
      case OrderStatus.enroute:
        statusColor = Colors.orange;
        break;
      case OrderStatus.delivered:
        statusColor = Colors.green;
        break;
      case OrderStatus.cancelled:
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
         border: Border.all(
           color: const Color(0xFFBCBEC1),
           width: 0.5,
         ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
      child: Stack(
        children: [
          // Order details
          Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      'Order #${order.orderNumber}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                        color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                      '${order.itemCount} items',
                          style: TextStyle(
                        fontSize: 14,
                            color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Total paid: ₹${order.totalAmount.toInt()}',
                      style: TextStyle(
                            fontSize: 14,
                        color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
          // Status indicator at top right
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                order.statusDisplayName,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSupportSection() {
    return Container(
      width: 348,
      height: 136,
      //margin: const EdgeInsets.only(left: 16, ),
      padding: const EdgeInsets.only(left: 24,),
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [AppConfig.primaryColor, Color(0xFF6B46C1)],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),

      ),
      child: Row(
        children: [
          Container(
            width: 147,
            height: 82,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Help and support',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    height: 1.0, // line-height: 100%
                    letterSpacing: -0.20, // -2% of 10px
                    color: AppConfig.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 147,
                  height: 30,
                  child: Text(
                    'Our customer support executives are available via Whatsapp',
                    style: GoogleFonts.fjallaOne(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.0, // line-height: 100%
                      letterSpacing: -0.24, // -2% of 12px
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 76,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppConfig.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: _openWhatsApp,
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
          const SizedBox(width: 10),
          Container(
            width: 156,
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
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

  Widget _buildMarketingFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),

      child: Column(
        children: [
          Container(
            width: 343,
            height: 30,
        
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.0, // line-height: 100%
                    letterSpacing: -0.24, // -2% of 12px
                    color: Colors.black87,
                  ),
                  children: [
                    const TextSpan(
                      text: 'For any details regarding how we process your data, you can refer to our ',
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: -0.24,
                        color: AppConfig.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1.0,
                      ),
                    ),
                    const TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: -0.24,
                        color: AppConfig.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'Experience authentic flavours of South India in every bite!',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 1.0, // line-height: 100%
              letterSpacing: -0.20, // -2% of 10px
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
            width: 325,
            height: 12,
           // margin: const EdgeInsets.only(left: 25),
            child: Text(
              'Southside Habits is managed and marketed by Habit of Life',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.0, // line-height: 100%
                letterSpacing: -0.20, // -2% of 10px
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        

        ],
      ),
    );
  }

  void _addNewAddress() {
    // TODO: Implement add new address functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add new address functionality coming soon!')),
    );
  }

  void _deleteAddress(Address address) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text('Are you sure you want to delete this address?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _user = _user.copyWith(
                  addresses: _user.addresses.where((a) => a.id != address.id).toList(),
                );
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Address deleted successfully')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _openWhatsApp() async {
    const phoneNumber = '919999999999'; // Replace with actual support number
    final url = 'https://wa.me/$phoneNumber';
    
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open WhatsApp')),
      );
    }
  }
}