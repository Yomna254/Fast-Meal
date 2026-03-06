import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';

class OrderButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const OrderButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Row(
          children: [
            Text(
              text,
              style: AppStyles.buttonTextStyle.copyWith(
                color: AppColors.backgroundLight,
              ),
            ),
            const Spacer(),
            Icon(icon, size: 16, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
