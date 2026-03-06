import 'package:flutter/material.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/view_models/home_view_model.dart';
import 'package:talabat/views/items/category_chip_card.dart';
import 'package:talabat/views/items/custom_navigation.dart';
import 'package:talabat/views/items/meals.dart';
import 'package:talabat/views/items/new_plates.dart';
import 'package:talabat/views/items/most_popular_restaurants.dart';
import 'package:talabat/views/items/most_requested_plates.dart';
import 'package:talabat/views/items/order_button.dart';
import 'package:talabat/views/items/wave_clipper.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            _buildHeaderWithIcons(),
            _buildOfferBanner(screenWidth),

            //Meals Section
            Padding(
              padding: EdgeInsets.only(right: 8, top: 16, bottom: 16),
              child: Text('وجباتنا:', style: AppStyles.sectionHeader),
            ),
            _buildCategoriesScroll(viewModel),
            _buildMealsGrid(viewModel),

            //Most Requested Plates Section
            Padding(
              padding: EdgeInsets.only(right: 8, top: 16, bottom: 16),
              child: Text(
                'الأطباق الأكثر طلباً:',
                style: AppStyles.sectionHeader,
              ),
            ),
            _buildMostRequestedGrid(),

            // Free Delivery Section
            Padding(
              padding: EdgeInsets.only(right: 8, top: 16, bottom: 16),
              child: Text(
                'عروض التوصيل المجاني:',
                style: AppStyles.sectionHeaderGrey,
              ),
            ),
            _buildFreeDeliveryCard(),

            SizedBox(height: 10),

            //Most Popular Restaurants Sections
            Padding(
              padding: EdgeInsets.only(right: 8, top: 16, bottom: 16),
              child: Text(
                'المطاعم الأكثر رواجاً:',
                style: AppStyles.sectionHeaderGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'توفر هذه المطاعم عروض دائمة و حصلت على تقييم خدمي عالي.',
                style: AppStyles.captionGrey,
              ),
            ),
            SizedBox(height: 10),
            _buildPopularRestaurantsList(),

            //New Plates Section
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 16, bottom: 16),
              child: Text(
                'الأطباق الجديدة:',
                style: AppStyles.sectionHeaderGrey,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'تمتع بتجربة جديدة من الأطباق الشهية من خلال عروضنا الحصرية بمتجرنا.',
                textAlign: TextAlign.right,
                style: AppStyles.captionGrey,
              ),
            ),

            _buildNewPlatesRow(),
            SizedBox(height: 90),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  Widget _buildHeaderWithIcons() {
    return Stack(
      children: [
        ClipPath(
          clipper: MyWaveClipper(),
          child: Container(height: 224, color: AppColors.primaryOrange),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.location_on, color: AppColors.white),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('الموقع الحالي', style: AppStyles.bodyBoldWhite),
                ),
                const Spacer(),
                Icon(Icons.notifications, color: AppColors.white),
              ],
            ),
          ),
        ),
        // الأيقونات الطائرة (Burger, Pizza, etc.) بنفس الـ Positioned بتاعك
        _buildFloatingIcon('assets/images/burger.png', top: 100, left: 350),
        _buildFloatingIcon('assets/images/sandwich.png', top: 130, left: 240),
        _buildFloatingIcon('assets/images/pizza.png', top: 100, left: 150),
        _buildFloatingIcon('assets/images/sandwich.png', top: 120, left: 20),
      ],
    );
  }

  Widget _buildFloatingIcon(
    String path, {
    required double top,
    required double left,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: Opacity(
        opacity: 0.4,
        child: Image.asset(path, width: 32, height: 32),
      ),
    );
  }

  Widget _buildOfferBanner(double width) {
    return Transform.translate(
      offset: const Offset(0, -40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: width * 0.8,
              padding: const EdgeInsets.fromLTRB(16, 8, 35, 8),
              decoration: BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Text(
                'تمتع معنا بخصومات كبيرة على\n اسعار الوجبات و التوصيل\n بنظام النقاط.',
                style: AppStyles.offerText,
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
              left: -40,
              top: -40,
              child: Image.asset(
                'assets/images/Girl with shopping bag.png',
                height: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesScroll(HomeViewModel vm) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
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
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.containerGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/burger2.jpg',
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('همبرغر لحم (50 غرام)', style: AppStyles.captionGreen),
                  Row(
                    children: List.generate(
                      4,
                      (i) => Icon(Icons.star, color: AppColors.amber, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'قيمة التوصيل: 0 جنيه مصري',
                  style: AppStyles.bodyBlack,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
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
      childAspectRatio: 0.65,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: const [MostRequestedPlates(), MostRequestedPlates()],
    );
  }

  // دالة المطاعم الرائجة
  Widget _buildPopularRestaurantsList() {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          MostPopularRestaurants(
            image: 'assets/images/steak.jpg',
            title: 'مطعم هاوس تشيكن -الاسكندرية ',
            subTitle: 'احصل على خصم 10% لكل فاتورة بقيمة 100جنيه',
          ),
          SizedBox(width: 14),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
          const SizedBox(width: 10),
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
