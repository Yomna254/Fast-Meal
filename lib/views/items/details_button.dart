import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';

class DetailsButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const DetailsButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: AppColors.grey),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          //textDirection: TextDirection.rtl,
          children: [
            Text(
              text,
              style: AppStyles.captionGrey.copyWith(color: Colors.black),
            ),
            Spacer(),
            Icon(icon, size: 16, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
