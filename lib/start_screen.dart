import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'home.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              // آیکن‌های بالا
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.auto_awesome, size: 24),
                  Icon(Icons.volume_up, size: 24),
                ],
              ),
              // تصویر کتاب و امتیاز
              Column(
                children: [
                  SvgPicture.asset('assets/icons/book.svg', width: 150, height: 150),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("7/10", style: TextStyle(fontSize: 16)),
                      Icon(Icons.favorite_border, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(height: 1, color: Colors.black54),
                ],
              ),
              // متن معرفی
              Column(
                children: const [
                  Text(
                    "شروع جستجو \nدر دنیای کتاب‌ها",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "جستجو، نقد و امتیازدهی به کتاب‌ها",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              // دکمه‌ها
              Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    onPressed: () {
                      Get.offAll(() => const Home());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ورود", style: TextStyle(fontSize: 16, color: Colors.black)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_back, color: Colors.black),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ثبت نام", style: TextStyle(fontSize: 16, color: Colors.white)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_back, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
