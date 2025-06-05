import 'package:flutter/material.dart';
import 'package:ketab_roo_app/profile_setting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileSetting()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Text(
              "@mike34",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/user.jpg'), // عکس پروفایل
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          StatColumn(label: "کتاب ها", value: "730"),
                          StatColumn(label: "دوستان", value: "43"),
                          StatColumn(label: "برای خواندن", value: "38"),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Mike",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Hi, I'm Mike! I love reading books all day long, mainly fantasy and art books...",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            section("در حال خواندن", ["book1.png", "book2.png", "book3.png"]),
            section("می خواهد بخواند", ["book4.png", "book5.png", "book6.png"]),
            section("خوانده شده", ["book7.png", "book8.png", "book9.png"]),
          ],
        ),
      ),
    );
  }

  Widget section(String title, List<String> imageAssets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Text("نمایش همه", style: TextStyle(color: Colors.blueGrey)),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageAssets.length,
            itemBuilder: (context, index) {
              return Container(
                width: 70,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/${imageAssets[index]}'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const StatColumn({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}
