import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      child: Container(
        height: 65.h,
        decoration: BoxDecoration(
          color: AppColors.containerGrey,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.shopping_cart, 0),
            _buildNavItem(Icons.person, 1),
            _buildNavItem(Icons.home, 2),
            _buildNavItem(Icons.search, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Icon(
        icon,
        size: 28.sp,
        color: currentIndex == index
            ? AppColors.primaryOrange
            : AppColors.textGrey,
      ),
    );
  }
}
