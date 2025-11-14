import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/widgets/location_selector.dart';
import 'package:vouch/view/screens/popup_verified_screen.dart';
import 'package:vouch/view/screens/filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showLocationSelector = false;
  String selectedLocation = 'Country & City';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImages.headerLogo)
                      ],
                    ),
                    
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Country & City clicked. Current state: $showLocationSelector');
                            setState(() {
                              showLocationSelector = !showLocationSelector;
                            });
                            print('New state: $showLocationSelector');
                          },
                          child: Row(
                            children: [
                              Text(
                                selectedLocation,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                showLocationSelector 
                                    ? Icons.arrow_drop_up 
                                    : Icons.arrow_drop_down, 
                                color: Colors.grey
                              ),
                            ],
                          ),
                        ),
                        
                        Image.asset(AppImages.chatIcon),
                        SizedBox(width: 10),  
                        Image.asset(AppImages.notificationIcon),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Row(
                  children: [
                  Image.asset(AppImages.walletImage),
                    const SizedBox(width: 4),
                    const Text(
                      '850 VC',
                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
 
                Builder(
                  builder: (context) {
                    print('Building conditional widget. showLocationSelector: $showLocationSelector');
                    return showLocationSelector
                        ? LocationSelector(
                            onLocationSelected: (country, city) {
                              setState(() {
                                selectedLocation = '$city, ${country.substring(0, 2)}';
                                showLocationSelector = false;
                              });
                            },
                            onClose: () {
                              setState(() {
                                showLocationSelector = false;
                              });
                            },
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        size: 20,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const FilterScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset(AppImages.filterImage),
                              ),
                            ],
                          );
                  },
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Feature Verified &',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Non-Verified Profiles',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return _buildProfileCard(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(int index) {
    final List<Map<String, dynamic>> profiles = [
      {
        'name': 'Jessica John',
        'age': 23,
        'location': 'Paris, Fr',
        'verified': true,
        'badge': AppImages.subscriptionIcon03,
      },
      {
        'name': 'Jessica John',
        'age': 23,
        'location': 'Paris, Fr',
        'verified': false,
        
        'badge': AppImages.subscriptionIcon04,
      },
      {
        'name': 'Jessica John',
        'age': 23,
        'location': 'Paris, Fr',
        'verified': true,
        'badge': AppImages.subscriptionIcon01,
      },
      {
        'name': 'Jessica John',
        'age': 23,
        'location': 'Paris, Fr',
        'verified': false,
        'badge': AppImages.subscriptionIcon01,
      },
      {
        'name': 'Jessica John',
        'age': 23,
        'location': 'Paris, Fr',
        'verified': true,
        'badge': AppImages.subscriptionIcon02,
      },
      {
        'name': 'Jessica John',
        'age': 23,
        'location': 'Paris, Fr',
        'verified': false,
        'badge': AppImages.subscriptionIcon03,
      },
    ];

    final profile = profiles[index];

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.5),
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: PopupVerifiedScreen(),
          ),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: AssetImage(AppImages.homeScreenImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          profile['badge'],
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (!profile['verified'])
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF636262),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              AppImages.lockIcon,
                              width: 32,
                              height: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Profile Info
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                profile['name'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                profile['verified'] ? AppImages.verifiedIcon : AppImages.unverifiedIcon,
                                width: 12,
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          width: 14,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Image.asset(
                            AppImages.franceflag,
                            width: 14,
                            height: 10,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 14,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Center(
                                  child: Text(
                                    'FR',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${profile['location']} ${profile['age']} ♂',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
