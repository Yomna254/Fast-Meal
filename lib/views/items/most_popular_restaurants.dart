import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';

class MostPopularRestaurants extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const MostPopularRestaurants({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      decoration: BoxDecoration(
        color: AppColors.containerGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover, // مهم جداً
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: AppStyles.sectionHeader.copyWith(
                color: AppColors.successGreen,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: AppStyles.buttonTextStyle.copyWith(
                color: AppColors.textGrey,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
