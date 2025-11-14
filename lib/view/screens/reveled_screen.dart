import 'package:flutter/material.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/view/screens/filter_screen.dart';

class ReveledScreen extends StatelessWidget {
  const ReveledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header Row - same as home screen
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
                      Row(
                        children: [
                          Image.asset(AppImages.franceflag, width: 16, height: 16),
                          const SizedBox(width: 4),
                          const Text(
                            'Paris, Fr',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Image.asset(AppImages.chatIcon),
                      const SizedBox(width: 10),  
                      Image.asset(AppImages.notificationIcon),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),
              
              // VC Count Row - same as home screen
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
  

            // Search Bar - same as home screen
            Row(
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
            ),
            const SizedBox(height: 24),

            // Revealed Profiles Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Revealed Profiles',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Revealed Profiles Grid
            SizedBox(
              height: 240,
              child: Row(
                children: [
                  Expanded(
                    child: _buildProfileCard(
                      name: 'Jessica John',
                      location: 'Paris, Fr',
                      age: '23',
                      isVerified: true,
                      hasGoldBadge: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildProfileCard(
                      name: 'Jessica John',
                      location: 'Paris, Fr',
                      age: '23',
                      isVerified: true,
                      hasGoldBadge: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Feature Verified Profiles Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Feature Verified Profiles',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Feature Verified Profiles Grid
            SizedBox(
              height: 240,
              child: Row(
                children: [
                  Expanded(
                    child: _buildProfileCard(
                      name: 'Jessica John',
                      location: 'Paris, Fr',
                      age: '23',
                      isVerified: false,
                      hasGoldBadge: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildProfileCard(
                      name: 'Jessica John',
                      location: 'Paris, Fr',
                      age: '23',
                      isVerified: false,
                      hasGoldBadge: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Second row of Feature Verified Profiles
            SizedBox(
              height: 240,
              child: Row(
                children: [
                  Expanded(
                    child: _buildProfileCard(
                      name: 'Jessica John',
                      location: 'Paris, Fr',
                      age: '23',
                      isVerified: false,
                      hasVBadge: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildProfileCard(
                      name: 'Jessica John',
                      location: 'Paris, Fr',
                      age: '23',
                      isVerified: false,
                      hasVBadge: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildProfileCard({
    required String name,
    required String location,
    required String age,
    bool isVerified = false,
    bool hasGoldBadge = false,
    bool hasVBadge = false,
  }) {
    return Container(
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
          // Image Section
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.grey[200],
              ),
              child: Stack(
                children: [
                  // Profile Image
                  Container(
                    width: double.infinity,
                    height: double.infinity,
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
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          hasGoldBadge 
                              ? AppImages.subscriptionIcon03 
                              : hasVBadge 
                                  ? AppImages.subscriptionIcon01 
                                  : AppImages.subscriptionIcon04,
                          width: 28,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  
                  // Lock overlay for non-verified profiles
                  if (!isVerified)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF636262),
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

          // Profile Info Section
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name and verification
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        isVerified ? AppImages.verifiedIcon : AppImages.unverifiedIcon,
                        width: 12,
                        height: 12,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 2),
                  
                  // Location and age
                  Row(
                    children: [
                      Image.asset(
                        AppImages.franceflag,
                        width: 14,
                        height: 10,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '$location $age ♂',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', true),
          _buildNavItem(Icons.favorite, 'Saved', false),
          _buildNavItem(Icons.analytics, 'Analysis', false),
          _buildNavItem(Icons.rate_review, 'Reviews', false),
          _buildNavItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.amber : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.amber : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}