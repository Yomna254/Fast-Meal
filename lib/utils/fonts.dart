import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';

class AppStyles {
  static TextStyle splashText = TextStyle(
    color: Color(0xFFFFEBEB),
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Alexandria',
  );
  // العناوين الكبيرة (وجباتنا، الأطباق الأكثر طلباً)
  static TextStyle sectionHeader = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Alexandria',
    color: AppColors.black,
  );

  // العناوين الرمادية (عروض التوصيل، المطاعم الرائجة)
  static TextStyle sectionHeaderGrey = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Alexandria',
    color: AppColors.textGrey,
  );

  // نصوص البانر والعناوين الفرعية
  static TextStyle bodyBoldWhite = TextStyle(
    color: AppColors.white,
    fontSize: 16.sp,
    fontFamily: 'Alexandria',
    fontWeight: FontWeight.bold,
  );
  static TextStyle bodyBlack = TextStyle(
    color: AppColors.black,
    fontSize: 16.sp,
    fontFamily: 'Alexandria',
    fontWeight: FontWeight.w400,
  );
  // نصوص الوصف الرمادية الصغيرة
  static TextStyle captionGrey = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Alexandria',
    color: AppColors.textGrey,
  );

  static TextStyle captionGreen = TextStyle(
    color: AppColors.successGreen,
    fontSize: 16.sp,
    fontFamily: 'Alexandria',
    fontWeight: FontWeight.w400,
  );

  // تنسيق نصوص الزراير
  static TextStyle buttonTextStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Alexandria',
    color: AppColors.white,
  );

  // تنسيق نصوص الزراير
  static TextStyle offerText = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Alexandria',
    color: Color(0xFFFFEBEB),
    fontWeight: FontWeight.bold,
  );
}
