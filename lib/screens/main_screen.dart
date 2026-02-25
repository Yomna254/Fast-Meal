import 'package:flutter/material.dart';
import 'package:talabat/items/category_chip_card.dart';
import 'package:talabat/items/custom_navigation.dart';
import 'package:talabat/items/food_card.dart';
import 'package:talabat/items/new_food_card.dart';
import 'package:talabat/items/resturant_card.dart';
import 'package:talabat/items/second_food_card.dart';
import 'package:talabat/items/wave_clipper.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFEBEB),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyWaveClipper(),
                  child: Container(height: 224, color: Color(0xFFFF8F41)),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'الموقع الحالي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Alexandria',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 24,
                          ),
                          Spacer(),
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 350,
                  top: 100,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/burger.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                Positioned(
                  left: 240,
                  top: 120,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/sandwich.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 100,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/pizza.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 120,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/sandwich.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ],
            ),
            // Banner
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xFFE53935),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 35.0,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          'تمتع معنا بخصومات كبيرة على\n اسعار الوجبات و التوصيل\n بنظام النقاط.',
                          style: TextStyle(
                            color: Color(0xFFFFEBEB),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alexandria',
                            fontSize: 14,
                          ),

                          textAlign: TextAlign.right,
                        ),
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
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'وجباتنا:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alexandria',
                ),
              ),
            ),
            // Categories Row
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                //reverse: true, // للبدء من اليمين
                children: [
                  CategoryChip(label: 'مشروبات', isSelected: true),
                  CategoryChip(label: 'وجبات سريعة'),
                  CategoryChip(label: 'حلويات'),
                  CategoryChip(label: 'أكلات بحرية'),
                  CategoryChip(label: 'صندويش'),
                  CategoryChip(label: 'بيتزا'),
                  CategoryChip(label: 'أكلات غربية'),
                  CategoryChip(label: 'أكلات شرقية'),
                ],
              ),
            ),
            // Food Grid/List
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              padding: EdgeInsets.all(10),
              children: [
                FoodCard(name: 'سمك مشوي', image: 'assets/images/fish2.png'),
                FoodCard(name: 'سمك بحري', image: 'assets/images/fish.jpg'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'الأطباق الأكثر طلباً:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alexandria',
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65, // عشان يطلع نفس طول الكارد في الصورة
              padding: const EdgeInsets.all(16),
              children: const [SecondFoodCard(), SecondFoodCard()],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'عروض التوصيل المجاني:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alexandria',
                  color: const Color.fromARGB(255, 117, 117, 117),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 330,
                decoration: BoxDecoration(
                  color: Color(0xFFECE8E6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/burger2.jpg',
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover, // مهم جداً
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'همبرغر لحم (50 غرام)',
                            style: TextStyle(
                              color: Color(0xFF08741F),
                              fontSize: 16,
                              fontFamily: 'Alexandria',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'قيمة التوصيل: 0 جنيه مصري',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE53935),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            // textDirection: TextDirection.rtl,
                            children: const [
                              Text(
                                'اطلب الآن',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Alexandria',
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'المطاعم الأكثر رواجاً:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alexandria',
                  color: const Color.fromARGB(255, 117, 117, 117),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'توفر هذه المطاعم عروض دائمة و حصلت على تقييم خدمي عالي.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Alexandria',
                  color: const Color.fromARGB(255, 117, 117, 117),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ResturantCard(
                      image: 'assets/images/steak.jpg',
                      title: 'مطعم هاوس تشيكن -الاسكندرية ',
                      subTitle: 'احصل على خصم 10% لكل فاتورة بقيمة 100جنيه',
                    ),
                    SizedBox(width: 14),
                    ResturantCard(
                      image: 'assets/images/pasta.jpg',
                      title: 'مطعم هاوس تشيكن -الاسكندرية ',
                      subTitle: 'احصل على خصم 10% لكل فاتورة بقيمة 100جنيه',
                    ),
                  ],
                ),
              ),
            ),

            Text(
              'الأطباق الجديدة:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alexandria',
              ),
            ),

            SizedBox(height: 8),

            /// الوصف
            Text(
              'تمتع بتجربة جديدة من الأطباق الشهية من خلال عروضنا الحصرية بمتجرنا.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Alexandria',
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: NewFoodCard(
                      image: 'assets/images/pan cake.jpg',
                      title: 'بان كيك',
                      price: '25',
                    ),
                  ),
                  SizedBox(width: 10),
                  Transform.translate(
                    offset: const Offset(0, 20),
                    child: NewFoodCard(
                      image: 'assets/images/shrimp.jpg',
                      title: 'جمبري',
                      price: '40',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
