import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String image;

  const FoodCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF1F1),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            /// الاسم
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF6D6D6D),
                fontFamily: 'Alexandria',
              ),
            ),

            const SizedBox(height: 14),

            /// زرار اطلب الآن
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 36,
                // width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE53935),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // textDirection: TextDirection.rtl,
                    children: const [
                      Text(
                        'اطلب الآن',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Alexandria',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //SizedBox(width: 6),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
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
    );
  }
}
