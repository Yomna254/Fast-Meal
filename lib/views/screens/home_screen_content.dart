import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/view_models/home_view_model.dart';
import 'package:talabat/views/screens/my_order_screen.dart';
import 'package:talabat/views/screens/splash_screen.dart';
import 'package:talabat/views/widgets/category_chip_card.dart';
import 'package:talabat/views/widgets/custom_header.dart';
import 'package:talabat/views/widgets/custom_bottom_navigation.dart';
import 'package:talabat/views/widgets/meals.dart';
import 'package:talabat/views/widgets/new_plates.dart';
import 'package:talabat/views/widgets/most_popular_restaurants.dart';
import 'package:talabat/views/widgets/most_requested_plates.dart';
import 'package:talabat/views/widgets/order_button.dart';
import 'package:talabat/views/widgets/wave_clipper.dart';
import 'package:talabat/views/screens/search_screen.dart';

class HomeScreenContent extends StatefulWidget {
  HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              height: 224.h,
              isConcaveRight: true,
              content: Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.white),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'الموقع الحالي',
                      style: AppStyles.bodyBoldWhite,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.notifications, color: AppColors.white),
                ],
              ),
              floatingIcons: [
                CustomHeader.buildFloatingIcon(
                  'assets/images/burger.png',
                  top: 100.h,
                  left: 350.w,
                ),
                CustomHeader.buildFloatingIcon(
                  'assets/images/sandwich.png',
                  top: 130.h,
                  left: 240.w,
                ),
                CustomHeader.buildFloatingIcon(
                  'assets/images/pizza.png',
                  top: 100.h,
                  left: 150.w,
                ),
                CustomHeader.buildFloatingIcon(
                  'assets/images/sandwich.png',
                  top: 120.h,
                  left: 20.w,
                ),
              ],
            ),

            _buildOfferBanner(screenWidth),

            //Meals Section
            Padding(
              padding: EdgeInsets.only(right: 8.w, top: 16.h, bottom: 16.h),
              child: Text('وجباتنا:', style: AppStyles.sectionHeader),
            ),
            _buildCategoriesScroll(viewModel),
            _buildMealsGrid(viewModel),

            //Most Requested Plates Section
            Padding(
              padding: EdgeInsets.only(right: 8.w, top: 16.h, bottom: 16.h),
              child: Text(
                'الأطباق الأكثر طلباً:',
                style: AppStyles.sectionHeader,
              ),
            ),
            _buildMostRequestedGrid(),

            // Free Delivery Section
            Padding(
              padding: EdgeInsets.only(right: 8.w, top: 16.h, bottom: 16.h),
              child: Text(
                'عروض التوصيل المجاني:',
                style: AppStyles.sectionHeaderGrey,
              ),
            ),
            _buildFreeDeliveryCard(),

            SizedBox(height: 10.h),

            //Most Popular Restaurants Sections
            Padding(
              padding: EdgeInsets.only(right: 8.w, top: 16.h, bottom: 16.h),
              child: Text(
                'المطاعم الأكثر رواجاً:',
                style: AppStyles.sectionHeaderGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                'توفر هذه المطاعم عروض دائمة و حصلت على تقييم خدمي عالي.',
                style: AppStyles.captionGrey,
              ),
            ),
            SizedBox(height: 10.h),
            _buildPopularRestaurantsList(),

            //New Plates Section
            Padding(
              padding: EdgeInsets.only(right: 8.w, top: 16.h, bottom: 16.h),
              child: Text(
                'الأطباق الجديدة:',
                style: AppStyles.sectionHeaderGrey,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Text(
                'تمتع بتجربة جديدة من الأطباق الشهية من خلال عروضنا الحصرية بمتجرنا.',
                textAlign: TextAlign.right,
                style: AppStyles.captionGrey,
              ),
            ),

            _buildNewPlatesRow(),
            SizedBox(height: 90.h),
          ],
        ),
      ),
      // extendBody: true,
    );
  }

  Widget _buildOfferBanner(double width) {
    return Transform.translate(
      offset: const Offset(0, -5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: width * 0.8,
              padding: const EdgeInsets.fromLTRB(16, 8, 35, 8),
              decoration: BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80.r),
                  topRight: Radius.circular(80.r),
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: Text(
                'تمتع معنا بخصومات كبيرة على\n اسعار الوجبات و التوصيل\n بنظام النقاط.',
                style: AppStyles.offerText,
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
              left: -40.w,
              top: -40.h,
              child: Image.asset(
                'assets/images/Girl with shopping bag.png',
                height: 130.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesScroll(HomeViewModel vm) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: vm.categories.length,
        itemBuilder: (context, index) =>
            CategoryChip(label: vm.categories[index], isSelected: index == 0),
      ),
    );
  }

  Widget _buildMealsGrid(HomeViewModel vm) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.sp),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8.r,
      ),
      itemCount: vm.meals.length,
      itemBuilder: (context, index) => Meals(
        name: vm.meals[index]['name']!,
        image: vm.meals[index]['image']!,
      ),
    );
  }

  Widget _buildFreeDeliveryCard() {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.containerGrey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                'assets/images/burger2.jpg',
                height: 170.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('همبرغر لحم (50 غرام)', style: AppStyles.captionGreen),
                  Row(
                    children: List.generate(
                      4,
                      (i) =>
                          Icon(Icons.star, color: AppColors.amber, size: 20.sp),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'قيمة التوصيل: 0 جنيه مصري',
                  style: AppStyles.bodyBlack,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              // استخدام الزرار المتكرر اللي عملناه
              child: OrderButton(
                text: 'اطلب الآن',
                icon: Icons.shopping_cart_outlined,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة الـ Grid للأطباق الأكثر طلباً
  Widget _buildMostRequestedGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.65.sp,
      padding: EdgeInsets.all(16.sp),
      mainAxisSpacing: 12.sp,
      crossAxisSpacing: 12.sp,
      children: const [MostRequestedPlates(), MostRequestedPlates()],
    );
  }

  // دالة المطاعم الرائجة
  Widget _buildPopularRestaurantsList() {
    return SizedBox(
      height: 300.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          MostPopularRestaurants(
            image: 'assets/images/steak.jpg',
            title: 'مطعم هاوس تشيكن -الاسكندرية ',
            subTitle: 'احصل على خصم 10% لكل فاتورة بقيمة 100جنيه',
          ),
          SizedBox(width: 14.w),
          MostPopularRestaurants(
            image: 'assets/images/pasta.jpg',
            title: 'مطعم هاوس تشيكن -الاسكندرية ',
            subTitle: 'احصل على خصم 10% لكل فاتورة بقيمة 100جنيه',
          ),
        ],
      ),
    );
  }

  // دالة الأطباق الجديدة
  Widget _buildNewPlatesRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: const NewPlates(
                image: 'assets/images/pan cake.jpg',
                title: 'بان كيك',
                price: '25',
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, 20),
              child: const NewPlates(
                image: 'assets/images/shrimp.jpg',
                title: 'جمبري',
                price: '40',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
