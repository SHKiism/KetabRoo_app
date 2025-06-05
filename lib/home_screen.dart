import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff2e9dc),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // بالای صفحه
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "سلام، کاربر عزیز!",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.search),
                  ],
                ),
                const SizedBox(height: 16),

                // فیلد جستجو
                TextField(
                  decoration: InputDecoration(
                    hintText: "نام کتاب، نویسنده یا ISBN",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // دکمه‌های Home / Friends
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("خانه"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("دوستان"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // top 10 books this week
                const Text("۱۰ کتاب برتر این هفته", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "https://picsum.photos/100/140?random=$index",
                              width: 100,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 4),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.black,
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // book by theme
                const Text("کتاب بر اساس موضوع", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    "عاشقانه", "دوستی", "رازآلود", "پلیسی", "هیجانی", "خیال‌پردازانه", "جنایی", "علمی‌تخیلی"
                  ].map((e) {
                    return Chip(
                      label: Text(e),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black12),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // new books
                const Text("کتاب‌های جدید", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "https://picsum.photos/200/300?random=$index",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        // bottom navigation
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          onTap: (index) {
            // ناوبری بین صفحات
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/home.svg", width: 24),
              label: "خانه",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/search.svg", width: 24),
              label: "جستجو",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/profile.svg", width: 24),
              label: "پروفایل",
            ),
          ],
        ),
      ),
    );
  }
}
