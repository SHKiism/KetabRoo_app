import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const StartScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}
