import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  String query = '';
  bool showResults = false;

  List<Book> allBooks = [
    Book("سمفونی مردگان", "عباس معروفی", 5, "assets/symphony_of_dead.jpg"),
    Book("چشمهایش", "بزرگ علوی", 4, "assets/his_eyes.jpg"),
    Book("بوف کور", "صادق هدایت", 4, "assets/the_blind_owl.jpg"),
    Book("روی ماه خداوند را ببوس", "مصطفی مستور", 4, "assets/kiss_god.jpg"),
    Book("زوال کلنل", "محمود دولت‌آبادی", 3, "assets/colonel.jpg"),
    Book("دا", "زهرا حسینی", 5, "assets/da.jpg"),
    Book("من او", "رضا امیرخانی", 5, "assets/man_o.jpg"),
    Book("کلیدر", "محمود دولت‌آبادی", 5, "assets/kelidar.jpg"),
  ];

  List<String> recentSearches = [
    "اطلس پارادوکس",
    "وایکینگ‌ها",
    "آواز ماه",
    "سمفونی مردگان",
    "روی ماه خداوند را ببوس",
    "من او",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Book> suggestions =
        allBooks
            .where(
              (book) =>
                  book.title.toLowerCase().startsWith(query.toLowerCase()) &&
                  query.isNotEmpty,
            )
            .toList();

    final List<Book> results =
        allBooks
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
                            return ListTile(
                              leading: Image.asset(
                                book.image,
                                width: 50,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                              title: Text(book.title),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(book.author),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (i) => Icon(
                                        i < book.rating
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
              ),
            // Recent Searches
            if (!showResults && query.isEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "جستجو های اخیر",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          recentSearches.map((title) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Column(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/${title.toLowerCase().replaceAll(' ', '_')}.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    title,
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final int rating;
  final String image;

  Book(this.title, this.author, this.rating, this.image);
}
