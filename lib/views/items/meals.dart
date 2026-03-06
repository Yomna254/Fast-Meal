import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/items/order_button.dart';

class Meals extends StatelessWidget {
  final String name;
  final String image;

  const Meals({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.grey, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.captionGrey.copyWith(fontSize: 16),
            ),

            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8,
                right: 13,
                left: 13,
              ),
              child: OrderButton(
                text: "اطلب الآن",
                icon: Icons.arrow_forward_ios,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
