import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book.dart';
import 'book_detail_screen.dart';

class Search extends StatefulWidget {
  final List<Book> allBooks;

  const Search({super.key, required this.allBooks});

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  String query = '';
  bool showResults = false;

  @override
  Widget build(BuildContext context) {
    final List<Book> suggestions =
        widget.allBooks
            .where(
              (book) =>
                  book.title.toLowerCase().startsWith(query.toLowerCase()) &&
                  query.isNotEmpty,
            )
            .toList();

    final List<Book> results =
        widget.allBooks
            .where(
              (book) => book.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return Scaffold(
      backgroundColor: Color(0xfff2e9dc),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  query = value;
                  showResults = false; // only suggestions
                });
              },
              onSubmitted: (value) {
                setState(() {
                  query = value;
                  showResults = true; // show results now
                });
              },
              decoration: InputDecoration(
                hintText: 'عنوان, نویسنده یا ISBN',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (!showResults && query.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children:
                      suggestions.map((book) {
                        return ListTile(
                          title: Text(book.title),
                          onTap: () {
                            setState(() {
                              query = book.title;
                              _controller.text = book.title;
                              showResults = true;
                            });
                          },
                        );
                      }).toList(),
                ),
              ),
            // Results
            if (showResults)
              Expanded(
                child:
                    results.isEmpty
                        ? Center(child: Text("نتیجه ای یافت نشد."))
                        : ListView.separated(
                          itemCount: results.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (context, index) {
                            final book = results[index];
                            return GestureDetector(
                              onTap:
                                  () => Get.to(
                                    () => BookDetailScreen(book: book),
                                  ),
                              child: ListTile(
                                leading: Image.network(
                                  book.imageUrl,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 120,
                                ),
                                title: Text(book.title),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text(book.author)],
                                ),
                              ),
                            );
                          },
                        ),
              ),
          ],
        ),
      ),
    );
  }
}
