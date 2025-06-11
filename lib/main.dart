import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketab_roo_app/profile.dart';
import 'package:ketab_roo_app/profile_setting.dart';
import 'package:ketab_roo_app/register_info.dart';
import 'package:ketab_roo_app/search.dart';
import 'package:ketab_roo_app/start_screen.dart';
import 'package:ketab_roo_app/signup_screen.dart';
import 'package:ketab_roo_app/login_screen.dart';
import 'package:ketab_roo_app/home_screen.dart';
import 'book_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },

      // ✅ اینجا تم اپ رو کامل تنظیم کردیم
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff2e9dc), // رنگ پس‌زمینه‌ی کل صفحات
        primaryColor: Colors.brown.shade700,
        fontFamily: 'Vazir',

        // دکمه‌های ElevetedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown.shade700,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),

        // دکمه‌های شناور
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.brown.shade700,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // متن‌ها
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const StartScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register_info', page: () => const RegisterInfo()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/profile', page: () => const Profile()),
        GetPage(name: '/profile_setting', page: () => const ProfileSetting()),
        GetPage(name: '/search', page: () => const Search()),
        GetPage(name: '/book_detail', page: () => BookDetailScreen(book: Get.arguments)),
      ],
    );
  }
}
