import 'package:flutter/material.dart';
import 'package:talabat/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFF5722),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [Color(0XFFFF8F41), Color(0XFFE53935)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Delivary Home',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xFFFFEBEB),
                  fontFamily: 'Fruitz',
                  //fontFamily: 'Pacifico',
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/images/Person on scooter delivering pizza.png',
                height: 332,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'و أنت قاعد ببيتك وجبتك المفضلة بتجي لعندك ماعليك إلا تختار الوجبة عندك على ديلفري هوم.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFEBEB),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Alexandria',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFEBEB),
                    foregroundColor: Colors.blueGrey,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'اطلب الآن',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alexandria',
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
