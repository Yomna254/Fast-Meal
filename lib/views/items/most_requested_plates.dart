import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/items/details_button.dart';
import 'package:talabat/views/items/order_button.dart';

class MostRequestedPlates extends StatelessWidget {
  const MostRequestedPlates({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              'assets/images/salad.jpg',
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'فتوش خضار',
                  style: AppStyles.captionGrey.copyWith(color: AppColors.black),
                ),
                Spacer(),
                Text(
                  'السعر',
                  style: AppStyles.captionGreen.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

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

          // const SizedBox(height: 8),
          //  const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(
              // top: 8.0,
              bottom: 8,
              right: 13,
              left: 13,
            ),
            child: DetailsButton(
              text: "التفاصيل",
              icon: Icons.arrow_forward_ios,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
