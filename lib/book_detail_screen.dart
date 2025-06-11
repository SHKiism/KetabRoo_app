import 'package:flutter/material.dart';
import 'package:ketab_roo_app/book.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  int rating = 0;
  final commentController = TextEditingController();
  final List<String> comments = [
    "عالی بود، پیشنهاد می‌کنم!",
    "مطالعه این کتاب خیلی برایم مفید بود.",
    "ترجمه بسیار روان و دلنشین.",
  ];

  void addComment() {
    final text = commentController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      comments.insert(0, text);
      commentController.clear();
    });
  }

  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rating = index + 1;
        });
      },
      child: Icon(
        index < rating ? Icons.star : Icons.star_border,
        color: Colors.orange.shade700,
        size: 36,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      backgroundColor: const Color(0xfff9f4ec),
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        elevation: 0,
        title: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('کتاب به کتابخانه شما اضافه شد')),
          );
        },
        label: const Text('افزودن کتاب'),
        icon: const Icon(Icons.bookmark_add),
        backgroundColor: Colors.brown.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // کارت عکس و اطلاعات اصلی کتاب
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        book.imageUrl,
                        width: 130,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.title,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown)),
                          const SizedBox(height: 6),
                          Text(book.titleEnglish,
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.brown.shade400,
                              )),
                          const SizedBox(height: 12),
                          Text('نویسنده: ${book.author}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.brown,
                              )),
                          const SizedBox(height: 6),
                          Text('مترجم: ${book.translator}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.brown,
                              )),
                          const SizedBox(height: 6),
                          Text('ناشر: ${book.publisher}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.brown,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // توضیحات کتاب
              const Text('درباره کتاب',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown)),
              const SizedBox(height: 12),
              Text(book.description,
                  style: const TextStyle(
                      fontSize: 16, height: 1.5, color: Colors.black87)),
              const SizedBox(height: 30),

              // امتیازدهی
              const Text('امتیاز شما',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) => buildStar(index)),
              ),

              const SizedBox(height: 30),

              // نظرات
              const Text('نظرات کاربران',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown)),
              const SizedBox(height: 12),

              Container(
                constraints: const BoxConstraints(maxHeight: 200),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Scrollbar(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    separatorBuilder: (_, __) => const Divider(
                      color: Colors.brown,
                      height: 12,
                    ),
                    itemBuilder: (context, index) {
                      return Text(
                        comments[index],
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // فرم افزودن نظر
              TextField(
                controller: commentController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'نظر خود را بنویسید...',
                  filled: true,
                  fillColor: Colors.brown.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: addComment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('ارسال نظر', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
