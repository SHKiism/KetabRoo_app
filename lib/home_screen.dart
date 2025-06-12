import 'package:flutter/material.dart';
import 'package:ketab_roo_app/book.dart';
import 'package:ketab_roo_app/book_detail_screen.dart';
import 'package:get/get.dart';
import 'package:ketab_roo_app/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Book>> _topBooksFuture;
  late Future<List<Book>> _newBooksFuture;

  @override
  void initState() {
    super.initState();
    _topBooksFuture = ApiService.fetchTop10Books();
    _newBooksFuture = ApiService.fetchNewBooks();
  }

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
                // لیست کتاب‌های برتر
                const Text(
                  "📚 ۱۰ کتاب برتر این هفته",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                FutureBuilder<List<Book>>(
                  future: _topBooksFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text('خطا در دریافت داده‌ها');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('کتابی پیدا نشد.');
                    }

                    final books = snapshot.data!;
                    return SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: books.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final book = books[index];
                          return GestureDetector(
                            onTap:
                                () =>
                                    Get.to(() => BookDetailScreen(book: book)),
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
                    );
                  },
                ),
                const SizedBox(height: 28),

                // موضوعات کتاب
                const Text(
                  "📖 موضوعات کتاب",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      [
                        "عاشقانه",
                        "رازآلود",
                        "پلیسی",
                        "تخیلی",
                        "اجتماعی",
                        "طنز",
                        "معنوی",
                        "ترسناک",
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
                FutureBuilder<List<Book>>(
                  future: _newBooksFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text('خطا در دریافت داده‌ها');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('کتابی پیدا نشد.');
                    }
                    final books = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: books.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 2 / 3,
                          ),
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return GestureDetector(
                          onTap:
                              () => Get.to(() => BookDetailScreen(book: book)),
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
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
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
