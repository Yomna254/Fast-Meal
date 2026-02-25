import 'package:flutter/material.dart';

class ResturantCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const ResturantCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 236,
      decoration: BoxDecoration(
        color: const Color(0xFFECE8E6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// الصورة
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover, // مهم جداً
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF08741F),
                fontSize: 20,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
