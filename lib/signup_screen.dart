import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2e9dc),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Get.toNamed('/login'),
                    child: const Text("ورود", style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "ثبت نام",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "ایمیل",
                    hintText: "example@gmail.com",
                    suffixIcon: Icon(Icons.check),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "رمز عبور",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: confirmController,
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    labelText: "تکرار رمز عبور",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirm = !_obscureConfirm;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    // ثبت‌نام
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  label: const Text("ثبت نام"),
                  icon: const Icon(Icons.arrow_forward),
                ),
                const SizedBox(height: 24),
                const Center(child: Text("یا ورود با حساب‌های اجتماعی")),
                const SizedBox(height: 16),
                _socialButton("Facebook", Icons.facebook, Colors.grey.shade200),
                const SizedBox(height: 8),
                _socialButton("Google", Icons.g_mobiledata, Colors.grey.shade200),
                const SizedBox(height: 8),
                _socialButton("Apple", Icons.apple, Colors.grey.shade200),
                const SizedBox(height: 24),
                const Text(
                  "با ورود به حساب، شرایط و قوانین را پذیرفته‌اید.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String text, IconData icon, Color bgColor) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(text, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
