import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/view_models/home_view_model.dart';
import 'package:talabat/views/screens/main_screen.dart';
import 'package:talabat/views/widgets/category_chip_card.dart';
import 'package:talabat/views/widgets/custom_header.dart';
import 'package:talabat/views/widgets/custom_bottom_navigation.dart';
import 'package:talabat/views/widgets/search_categories.dart';
import 'package:talabat/views/widgets/wave_clipper.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  int selectedIndex = 3;

  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Column(
        children: [
          CustomHeader(
            height: 274.h,
            isConcaveRight: false,
            content: Container(
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.backgroundLight),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintStyle: AppStyles.captionGrey.copyWith(
                    color: AppColors.backgroundLight,
                  ),
                  hintText: 'ابحث عن وجبتك المفضلة',
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.backgroundLight,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: 8.h,
                    bottom: 8.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                ),
              ),
            ),
            floatingIcons: [
              CustomHeader.buildFloatingIcon(
                'assets/images/pizza.png',
                top: 170.h,
                left: 360.w,
              ),
              CustomHeader.buildFloatingIcon(
                'assets/images/burger.png',
                top: 110.h,
                left: 340.w,
              ),
              CustomHeader.buildFloatingIcon(
                'assets/images/sandwich.png',
                top: 150.h,
                left: 240.w,
              ),
              CustomHeader.buildFloatingIcon(
                'assets/images/pizza.png',
                top: 120.h,
                left: 150.w,
              ),
              CustomHeader.buildFloatingIcon(
                'assets/images/burger.png',
                top: 170.h,
                left: 80.w,
              ),
              CustomHeader.buildFloatingIcon(
                'assets/images/sandwich.png',
                top: 120.h,
                left: 20.w,
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: AppColors.grey),
                      Text(
                        'الموقع الحالي: القاهرة',
                        style: AppStyles.captionGrey.copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),

                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      itemCount: viewModel.searchScreenCategories.length,
                      itemBuilder: (context, index) {
                        return CategoryChip(
                          label: viewModel.searchScreenCategories[index],
                          isSelected: index == 0,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 18.h),
                  Text(
                    'اختار حسب الفئة:',
                    style: AppStyles.captionGrey.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 18.h),

                  SizedBox(
                    height: 140.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SearchCategories(
                          image: 'assets/images/new restaurants.jpg',
                          name: 'المطاعم الجديدة',
                        ),
                        SearchCategories(
                          image: 'assets/images/Family saving.jpg',
                          name: 'توفير عائلي',
                        ),
                        SearchCategories(
                          image: 'assets/images/chicken.jpg',
                          name: 'دجاج',
                        ),
                        SearchCategories(
                          image: 'assets/images/drinks.jpg',
                          name: 'مشروبات و عصائر',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                    child: Text(
                      'الأكثر بحثاً من قبل عملاء ديليفري هوم',
                      style: AppStyles.sectionHeaderGrey.copyWith(fontSize: 16),
                    ),
                  ),

                  Wrap(
                    spacing: 8.sp,
                    runSpacing: 20.sp,
                    alignment: WrapAlignment.start,
                    children: [
                      _buildSearchTag('شاورما'),
                      _buildSearchTag('همبرجر'),
                      _buildSearchTag('بيتزا'),
                      _buildSearchTag('ماكولات بحرية'),
                      _buildSearchTag('فلافل عربي'),
                      _buildSearchTag('مندي'),
                      _buildSearchTag('بروستد'),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTag(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(tag, style: AppStyles.bodyBlack.copyWith(fontSize: 12.sp)),
          SizedBox(width: 4.w),
          Icon(Icons.search, size: 14.sp, color: AppColors.textGrey),
        ],
      ),
    );
  }
}
