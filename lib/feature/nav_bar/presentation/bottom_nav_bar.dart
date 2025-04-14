import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vid_move/feature/booking/presentation/screens/booking_screen.dart';
import 'package:vid_move/feature/home/presentation/screens/home_screen.dart';
import 'package:vid_move/feature/message/presentation/screens/message_inbox_screen.dart';
import 'package:vid_move/feature/profile/presentation/screens/profile_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/asset_path.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final RxInt _selectedIndex = 0.obs;

  final List<String> selectedItem = [
    AssetPath.homeIcon,
    AssetPath.documentIcon,
    AssetPath.messageIcon,
    AssetPath.profileIcon,
  ];

  final List<String> unselectedItem = [
    AssetPath.homeIcon,
    AssetPath.documentIcon,
    AssetPath.messageIcon,
    AssetPath.profileIcon,
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    BookingScreen(),
    MessageInboxScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _screens[_selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
          },
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.lightGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
          items: List.generate(_screens.length, (index) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _selectedIndex.value == index
                        ? AppColors.primary
                        : AppColors.lightGrey,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    _selectedIndex.value == index
                        ? selectedItem[index]
                        : unselectedItem[index],
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              label: _getLabel(index),
            );
          }),
        );
      }),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Bookings';
      case 2:
        return 'Message';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}
