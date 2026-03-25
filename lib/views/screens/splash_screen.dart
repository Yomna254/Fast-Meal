import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [AppColors.primaryOrange, AppColors.primaryRed],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Text(
                'Delivary Home',
                style: TextStyle(
                  fontSize: 28.sp,
                  color: AppColors.backgroundLight,
                  fontFamily: 'Fruitz',
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/images/Person on scooter delivering pizza.png',
                height: 332.h,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'و أنت قاعد ببيتك وجبتك المفضلة بتجي لعندك ماعليك إلا تختار الوجبة عندك على ديلفري هوم.',
                  textAlign: TextAlign.center,
                  style: AppStyles.splashText,
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundLight,
                    foregroundColor: AppColors.textGrey,
                    minimumSize: Size(double.infinity, 50.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اطلب الآن',
                        style: AppStyles.bodyBoldWhite.copyWith(
                          color: AppColors.textGrey,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
