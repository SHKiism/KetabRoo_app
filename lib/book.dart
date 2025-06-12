class Book {
  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String? publisher;        // ناشر
  final String? translator;       // مترجم
  final String? titleEnglish;     // عنوان انگلیسی

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    this.publisher,
    this.translator,
    this.titleEnglish,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // print(json); // if you want to see the api result, just uncomment it.
    return Book(
      id: json['id'],
      title: json['fa_name'] ?? '',
      author: json['author'] ?? '',
      imageUrl: json['image_url'] ?? '',
      description: json['description'] ?? '',
      publisher: json['publisher'],
      translator: json['translator'],
      titleEnglish: json['eng_name'],
    );
  }
}
