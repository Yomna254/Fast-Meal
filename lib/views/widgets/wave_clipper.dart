import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final double leftCurveRadius;
  final double rightCurveRadius;
  final bool isConcaveRight; // هل الكيرف الأيمن داخل لجوه؟

  WaveClipper({
    this.leftCurveRadius = 50.0,
    this.rightCurveRadius = 50.0,
    required this.isConcaveRight,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    // 1. البداية من أعلى اليسار والنزول
    path.lineTo(0, size.height - 2 * leftCurveRadius);

    //left curve (convex)
    path.quadraticBezierTo(
      0,
      size.height - leftCurveRadius,
      leftCurveRadius,
      size.height - leftCurveRadius,
    );

    // 3. الخط المستقيم في المنتصف
    // نعدل نقطة النهاية بناءً على نوع الكيرف الأيمن
    double middleLineEnd = isConcaveRight
        ? size.width - (rightCurveRadius * 2)
        : size.width - rightCurveRadius;

    path.lineTo(
      size.width - (leftCurveRadius + 20),
      size.height - leftCurveRadius,
    );

    //right curve
    if (isConcaveRight) {
      path.quadraticBezierTo(
        size.width,
        size.height - rightCurveRadius,
        size.width,
        size.height,
      );
    } else {
      path.quadraticBezierTo(
        size.width,
        size.height - rightCurveRadius,
        size.width,
        size.height - 2 * rightCurveRadius,
      );
    }

    // 5. إغلاق الشكل
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true; // جعلناها true للسماح بتغيير الشكل عند تمرير قيم جديدة
}

/*import 'package:flutter/material.dart';

class MyWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double radius = 50.0; // تتحكم هنا في مدى انحناء الزوايا (الكيرف)

    // 1. نبدأ من أعلى اليسار وننزل بخط مستقيم قبل نهاية الارتفاع بمسافة الكيرف
    path.lineTo(0, size.height - 2 * radius);

    // 2. الكيرف الأول (الزاوية اليسرى السفلية)
    // نقطة التحكم هي الزاوية (0, size.height) ونقطة النهاية هي بداية الخط المستقيم السفلي
    path.quadraticBezierTo(
      0,
      size.height - radius,
      radius,
      size.height - radius,
    );

    // 3. الخط المستقيم في المنتصف (يربط بين الكيرفين)
    path.lineTo(size.width - (radius + 20), size.height - radius);

    // 4. الكيرف الثاني (الزاوية اليمنى السفلية)
    // نقطة التحكم هي الزاوية (size.width, size.height) ونقطة النهاية هي الصعود لليمين
    path.quadraticBezierTo(
      size.width,
      size.height - radius,
      size.width,
      size.height,
    );

    // 5. الصعود لأعلى اليمين وإغلاق الشكل
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}*/
