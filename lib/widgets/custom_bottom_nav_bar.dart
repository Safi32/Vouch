import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/screens/home_screen.dart';
import 'package:vouch/view/screens/review_screen.dart';
import 'package:vouch/view/screens/saved_screen.dart';
import 'package:vouch/view/screens/dashboard_screen.dart';
import 'package:vouch/view/screens/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const SavedScreen(),
      const DashboardScreen(),
      const ReviewScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                AppImages.homeIcon,
                _selectedIndex == 0,
                isHome: true,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                AppImages.heartIcon,
                _selectedIndex == 1,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                AppImages.trendIcon,
                _selectedIndex == 2,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                AppImages.reviewsIcon,
                _selectedIndex == 3,
              ),
              label: 'Reviews',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                AppImages.profileIcon,
                _selectedIndex == 4,
              ),
              label: 'Profile',
            ),
          ],
        ),
        ),
      ),
    );
  }

  Widget _buildIcon(String iconPath, bool isSelected, {bool isHome = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: isHome
          ? SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : Colors.grey[400]!,
                BlendMode.srcIn,
              ),
            )
          : Image.asset(
              iconPath,
              width: 24,
              height: 24,
              color: isSelected ? Colors.white : Colors.grey[400],
            ),
    );
  }
}
