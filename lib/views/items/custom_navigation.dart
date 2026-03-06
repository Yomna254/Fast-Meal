import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // الـ Padding ده هو اللي بيخليه "عائم" مش لازق في الشاشة من تحت
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: AppColors.containerGrey,
          borderRadius: BorderRadius.circular(20), // حواف دائرية كبيرة
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.shopping_cart, isSelected: false),
            _buildNavItem(Icons.person, isSelected: false),
            _buildNavItem(Icons.home, isSelected: true),
            _buildNavItem(Icons.search, isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, {required bool isSelected}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 28,

          color: isSelected ? AppColors.primaryOrange : AppColors.textGrey,
        ),
      ],
    );
  }
}
