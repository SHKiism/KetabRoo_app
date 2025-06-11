import 'package:flutter/material.dart';
import 'package:ketab_roo_app/book.dart';
import 'package:ketab_roo_app/book_detail_screen.dart';
import 'package:ketab_roo_app/search.dart' hide Book;
import 'package:get/get.dart';

final List<Book> books = [
  Book(
    title: 'یلوفیس',
    author: 'ربکا کوانگ',
    imageUrl: 'https://picsum.photos/200/300?random=1',
    description: 'این کتاب داستان زندگی نویسنده‌ای است که...',
  ),
  Book(
    title: 'جزیره‌ مرموز',
    author: 'ژول ورن',
    imageUrl: 'https://picsum.photos/200/300?random=2',
    description: 'ماجراجویی گروهی در جزیره‌ای ناشناخته...',
  ),
  Book(
    title: 'شازده کوچولو',
    author: 'آنتوان دو سنت اگزوپری',
    imageUrl: 'https://picsum.photos/200/300?random=3',
    description: 'سفر شاعرانه و فلسفی شازده کوچولو در سیارات مختلف...',
  ),
  Book(
    title: 'جنایت و مکافات',
    author: 'داستایوفسکی',
    imageUrl: 'https://picsum.photos/200/300?random=4',
    description: 'روایت پیچیده‌ای از اخلاق، قتل و بخشش...',
  ),
  Book(
    title: 'قلعه حیوانات',
    author: 'جرج اورول',
    imageUrl: 'https://picsum.photos/200/300?random=5',
    description: 'تمثیلی سیاسی درباره جامعه و قدرت...',
  ),
  Book(
    title: '1984',
    author: 'جرج اورول',
    imageUrl: 'https://picsum.photos/200/300?random=6',
    description: 'رمانی درباره دنیای تاریک و دیکتاتوری کامل...',
  ),
];

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // جستجو
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/search');
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "جستجوی کتاب یا نویسنده...",
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // برترین‌ها
                const Text(
                  "📚 ۱۰ کتاب برتر این هفته",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BookDetailScreen(book: book),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                book.imageUrl,
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 6),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.brown,
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 28),

                // موضوعات
                const Text(
                  "📖 موضوعات کتاب",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    "عاشقانه", "رازآلود", "پلیسی", "تخیلی",
                    "اجتماعی", "طنز", "معنوی", "ترسناک",
                  ].map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: const Color(0xfffdfdfd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xffdddddd)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),

                // تازه‌ها
                const Text(
                  "📕 تازه‌ها",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: books.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookDetailScreen(book: book),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Image.network(
                              book.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                color: Colors.black.withOpacity(0.4),
                                child: Center(
                                  child: Text(
                                    book.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
