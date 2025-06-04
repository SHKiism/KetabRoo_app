import 'package:flutter/material.dart';
import 'package:ketab_roo_app/start_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const StartScreen(),
      // '/login': (context) => const LoginScreen(), // تعریف این صفحه لازمه
      // '/signup': (context) => const SignUpScreen(), // تعریف این صفحه لازمه
    },
  ));
}

