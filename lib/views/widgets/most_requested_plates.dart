import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/widgets/details_button.dart';
import 'package:talabat/views/widgets/order_button.dart';

class MostRequestedPlates extends StatelessWidget {
  const MostRequestedPlates({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              child: Image.asset(
                'assets/images/salad.jpg',
                height: 140.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                  style: AppStyles.captionGreen.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

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

          // const SizedBox(height: 8),
          //  const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(
              // top: 8.0,
              bottom: 8.h,
              right: 13.w,
              left: 13.w,
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
