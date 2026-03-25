import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/view_models/home_view_model.dart';
import 'package:talabat/views/screens/home_screen_content.dart';
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

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 2;
  final List<Widget> _screens = [
    const MyOrderScreen(),
    const SplashScreen(),
    HomeScreenContent(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: _screens[selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
