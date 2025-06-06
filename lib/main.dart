import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ketab_roo_app/profile.dart';
import 'package:ketab_roo_app/profile_setting.dart';
import 'package:ketab_roo_app/register_info.dart';
import 'package:ketab_roo_app/start_screen.dart';
import 'package:ketab_roo_app/signup_screen.dart';
import 'package:ketab_roo_app/login_screen.dart';
import 'package:ketab_roo_app/home_screen.dart';

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
      theme: ThemeData(
        fontFamily: 'Vazir',
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
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
      ],
    );
  }
}
