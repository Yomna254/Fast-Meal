import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/widgets/order_button.dart';

class Meals extends StatelessWidget {
  final String name;
  final String image;

  const Meals({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.sp),
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(22.r),
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
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                image,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.captionGrey.copyWith(fontSize: 16.sp),
            ),

            SizedBox(height: 14.h),

            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
                bottom: 8.h,
                right: 13.w,
                left: 13.w,
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
