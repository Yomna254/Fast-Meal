import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';

class SearchCategories extends StatelessWidget {
  final String name;
  final String image;
  SearchCategories({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
      child: Container(
        width: 90.w,
        height: 132.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          border: Border.all(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              child: Image.asset(
                image,
                height: 86.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.h),
            Text(name, style: AppStyles.captionGrey.copyWith(fontSize: 10.sp)),
          ],
        ),
      ),
    );
  }
}
