import 'dart:convert';
import 'package:http/http.dart' as http;
import 'book.dart'; // کلاس Book که خودت ساختی

class ApiService {
  static const String baseUrl = 'https://cwckfjnmocnlxavhkvpb.supabase.co/rest/v1/';
  static const Map<String, String> headers = {
    'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN3Y2tmam5tb2NubHhhdmhrdnBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk2MzAwMzYsImV4cCI6MjA2NTIwNjAzNn0.G_Zp2Bw5U67pkszKWJx8fxu7K6MqSOYYZ1lfqCPQ1rQ',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN3Y2tmam5tb2NubHhhdmhrdnBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk2MzAwMzYsImV4cCI6MjA2NTIwNjAzNn0.G_Zp2Bw5U67pkszKWJx8fxu7K6MqSOYYZ1lfqCPQ1rQ',
  };

  static Future<List<Book>> fetchAllBooks() async {
    final url = Uri.parse('${baseUrl}book_details?select=*');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('خطا در دریافت کتاب‌ها');
    }
  }

  static Future<Book> fetchBookById(int id) async {
    final url = Uri.parse('${baseUrl}book_details?id=eq.$id');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return Book.fromJson(data.first);
    } else {
      throw Exception('کتاب پیدا نشد');
    }
  }

  static Future<List<Book>> fetchNewBooks() async {
    final url = Uri.parse('${baseUrl}new_books?select=*');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('خطا در دریافت کتاب‌های جدید');
    }
  }

  static Future<List<Book>> fetchTop10Books() async {
    final url = Uri.parse('${baseUrl}top10books?select=*');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('خطا در دریافت ۱۰ کتاب برتر');
    }
  }
}