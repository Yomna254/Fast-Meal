import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/widgets/custom_bottom_navigation.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  int counter = 1;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: AppColors.black, size: 24.h),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textGrey,
              size: 24.h,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/delivary of mobile order.png',
                  height: 152.h,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'قائمة طلباتي',
                style: AppStyles.sectionHeader.copyWith(fontSize: 24.sp),
              ),
              SizedBox(height: 10.h),

              // قائمة المنتجات
              _buildCartItem(
                'بيتزا فصول اربعة',
                '40 جنيه',
                'assets/images/pizza order.png',
              ),
              _buildCartItem(
                'شاورما دجاج',
                '40 جنيه',
                'assets/images/pizza order.png',
              ),
              _buildCartItem(
                'تبولة خضار',
                '20 جنيه',
                'assets/images/pizza order.png',
              ),

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0.h),
                child: Text('سعر طلباتي', style: AppStyles.sectionHeader),
              ),
              const Divider(thickness: 1, color: AppColors.textGrey),
              // تفاصيل الفاتورة
              _buildPriceRow('عدد الوجبات الكلي', '3'),
              _buildPriceRow('السعر الكلي', '100 جنيه'),
              _buildPriceRow('قيمة الخصم', '10%'),
              _buildPriceRow('سعر التوصيل', '10 جنيه'),

              Container(
                decoration: BoxDecoration(color: AppColors.containerGrey),
                child: _buildPriceRow('السعر الكلي', '110 جنيه', isTotal: true),
              ),

              SizedBox(height: 20.h),
              Text('وقت التوصيل', style: AppStyles.sectionHeader),
              _buildRadioOption('توصيل سريع', false),
              _buildRadioOption('توصيل لاحق', true),

              SizedBox(height: 20.h),
              Text('وقت التوصيل', style: AppStyles.sectionHeader),
              _buildRadioOption('اتصل بي عندما تصل', true),
              _buildRadioOption('الرجاء عدم قرع الجرس', false),

              SizedBox(height: 30.h),

              // زر تأكيد الطلب
              Container(
                width: double.infinity,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.amber,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('تأكيد الطلب', style: AppStyles.captionGrey),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.textGrey,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h), // مساحة للـ Navigation Bar
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت لعنصر السلة الواحد
  Widget _buildCartItem(String title, String price, String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.grey),
        boxShadow: [BoxShadow(color: AppColors.containerGrey, blurRadius: 8.r)],
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                '$title: $price',
                style: AppStyles.captionGrey.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.primaryOrange,
                      size: 24.sp,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 28.w),
                  _buildQuantityStepper(),
                ],
              ),
            ],
          ),

          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              imagePath,
              width: 108.w,
              height: 75.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت زيادة ونقصان الكمية
  Widget _buildQuantityStepper() {
    return Container(
      height: 32.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            icon: Icon(Icons.remove, size: 16.sp, color: AppColors.textGrey),
          ),
          Text(
            '$counter',
            style: AppStyles.sectionHeaderGrey.copyWith(fontSize: 16.sp),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icon(Icons.add, size: 16.sp, color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }

  // صف السعر
  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: isTotal
                  ? AppStyles.captionGreen.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    )
                  : AppStyles.captionGrey.copyWith(color: AppColors.textGrey),
            ),
            Text(
              value,
              style: isTotal
                  ? AppStyles.captionGreen.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    )
                  : AppStyles.captionGrey.copyWith(color: AppColors.textGrey),
            ),
          ],
        ),
      ),
    );
  }

  // خيارات الـ Radio
  Widget _buildRadioOption(String title, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: isSelected,
          groupValue: true,
          onChanged: (val) {},
          activeColor: Colors.green,
        ),
        Text(
          title,
          style: AppStyles.captionGrey.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
