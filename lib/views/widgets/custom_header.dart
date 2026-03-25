import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talabat/utils/colors.dart';
import 'package:talabat/utils/fonts.dart';
import 'package:talabat/views/widgets/wave_clipper.dart';

class CustomHeader extends StatelessWidget {
  final Widget content;
  final List<Widget>? floatingIcons;
  bool isConcaveRight = true;
  double height;
  CustomHeader({
    super.key,
    required this.content,
    this.floatingIcons,
    required this.isConcaveRight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(
            //leftCurveRadius: 50,
            // rightCurveRadius: 50,
            isConcaveRight: isConcaveRight,
          ),
          child: Container(height: height, color: AppColors.primaryOrange),
        ),

        // الأيقونات والعنوان
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: content,
          ),
        ),

        if (floatingIcons != null) ...floatingIcons!,
      ],
    );
  }

  // الفنكشن التانية بقت جزء من الـ Widget ده كـ Private Method
  static Widget buildFloatingIcon(
    String path, {
    required double top,
    required double left,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: Opacity(
        opacity: 0.4,
        child: Image.asset(path, width: 32.w, height: 32.h),
      ),
    );
  }
}
