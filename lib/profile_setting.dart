import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2e9dc),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: const [
          Text("@mike34", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          MenuItem(icon: Icons.edit, label: "ویرایش نمایه"),
          MenuItem(icon: Icons.lock, label: "تنظیمات و حریم شخصی"),
          MenuItem(icon: Icons.bar_chart, label: "فعالیت ها"),
          MenuItem(icon: Icons.bookmark, label: "ذخیره شده ها"),
          MenuItem(icon: Icons.favorite_border, label: "مورد علاقه ها"),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(label),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
