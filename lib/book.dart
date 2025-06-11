class Book {
  final String title;
  final String titleEnglish;
  final String author;
  final String translator;
  final String publisher;
  final String imageUrl;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    this.titleEnglish = '',
    this.translator = '',
    this.publisher = '',
  });
}
